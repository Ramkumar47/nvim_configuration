-- This file contains custom lua functions for python---------------------------

-- initialization function
local function python_initializeScript()
    -- removing any previous entries
    vim.cmd("normal! ggVGd")
    vim.cmd("normal! i#!/bin/python3")

    -- writing header section
    vim.cmd("normal! o\"\"\"")
    vim.cmd("normal! 100A=")
    vim.cmd("normal! 0")
    vim.cmd("normal! 79lD")
    vim.cmd("normal! o")
    vim.cmd("normal! I<>")
    vim.cmd("normal! o")
    vim.cmd("normal! o")
    vim.cmd("normal! iRamkumar")
    vim.cmd(":r!date")
    vim.cmd("normal! o")
    vim.cmd("normal! 76A=")
    vim.cmd("normal! A\"\"\"")

    -- writing include modules section
    vim.cmd("normal! o")
    vim.cmd("normal! o# importing needed modules")
    vim.cmd("normal! oimport numpy as np")
    vim.cmd("normal! oimport pandas as pd")
    vim.cmd("normal! oimport matplotlib.pyplot as plt")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o#")
    vim.cmd("normal! 78A=")
    vim.cmd("normal! o")

    -- writing insert stamp
    vim.cmd("normal! o")
    vim.cmd("normal! I<>")
    vim.cmd("normal! o")

    -- writing horizontal line
    vim.cmd("normal! o")
    vim.cmd("normal! o")
    vim.cmd("normal! I#")
    vim.cmd("normal! 78A=")
    vim.cmd("normal! gg0")
end
vim.api.nvim_create_user_command('PythonInitializeScript',python_initializeScript,{})

-- initializing plotting section
local function python_initializePlot()

    vim.cmd("normal! mA")

    -- setting plot font size
    vim.cmd("normal! oplt.rcParams.update({\"font.size\":15})")

    -- defining main figure
    vim.cmd("normal! oplt.figure(figsize=(16,9))")
    vim.cmd("normal! oplt.plot(<>)")
    vim.cmd("normal! o")
    vim.cmd("normal! Iplt.grid()")
    vim.cmd("normal! o")
    vim.cmd("normal! Iplt.xlabel(<>)")
    vim.cmd("normal! o")
    vim.cmd("normal! Iplt.ylabel(<>)")
    vim.cmd("normal! o")
    vim.cmd("normal! Iplt.title(<>)")
    vim.cmd("normal! o")
    vim.cmd("normal! I# plt.legend(loc=(1.01,0.75))")
    vim.cmd("normal! o# plt.savefig(<>,dpi=150,bbox_inches=\"tight\")")
    vim.cmd("normal! oplt.show()")
    vim.cmd("normal! o")

    vim.cmd("normal! 'A")
end
vim.api.nvim_create_user_command('PythonInitializePlot',python_initializePlot,{})


-- ============================================================
-- Manim utilities for Neovim
-- ============================================================

-- local function render_manim()
--     vim.cmd("write")
--
--     local file = vim.fn.expand("%:p")
--
--     -- Find the Scene class surrounding the cursor
--     local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
--     local lines = vim.api.nvim_buf_get_lines(
--         0,
--         0,
--         cursor_line,
--         false
--     )
--
--     local scene = nil
--
--     for i = #lines, 1, -1 do
--         local match = lines[i]:match("^class%s+(%w+)%s*%(")
--
--         if match then
--             scene = match
--             break
--         end
--     end
--
--     if not scene then
--         vim.notify(
--             "Could not find a Manim Scene class",
--             vim.log.levels.ERROR
--         )
--         return
--     end
--
--     vim.notify(
--         "Rendering " .. scene .. "...",
--         vim.log.levels.INFO
--     )
--
--     vim.fn.jobstart({
--         "manim",
--         "-pql",
--         file,
--         scene,
--     }, {
--         stdout_buffered = true,
--
--         on_exit = function(_, exit_code)
--             if exit_code == 0 then
--                 vim.notify(
--                     "Manim render complete: " .. scene,
--                     vim.log.levels.INFO
--                 )
--             else
--                 vim.notify(
--                     "Manim render failed",
--                     vim.log.levels.ERROR
--                 )
--             end
--         end,
--     })
-- end

local function get_current_scene()
    local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

    local lines = vim.api.nvim_buf_get_lines(
        0,
        0,
        cursor_line,
        false
    )

    for i = #lines, 1, -1 do
        local scene = lines[i]:match("^%s*class%s+(%w+)%s*%(")

        if scene then
            return scene
        end
    end

    return nil
end

local function render_manim()
    vim.cmd("write")

    local file = vim.fn.expand("%:p")
    local scene = get_current_scene()

    if not scene then
        vim.notify(
            "No Manim Scene class found above cursor",
            vim.log.levels.ERROR
        )
        return
    end

    vim.notify(
        "Rendering " .. scene .. "...",
        vim.log.levels.INFO
    )

    vim.fn.jobstart({
        "manim",
        "-pql",
        file,
        scene,
    }, {
        stdout_buffered = true,

        on_exit = function(_, exit_code)
            if exit_code == 0 then
                vim.notify(
                    "Manim render complete: " .. scene,
                    vim.log.levels.INFO
                )
            else
                vim.notify(
                    "Manim render failed",
                    vim.log.levels.ERROR
                )
            end
        end,
    })
end
vim.api.nvim_create_user_command('RenderManim',render_manim,{})

-- ============================================================
-- Open already-rendered scene under cursor
-- ============================================================

vim.api.nvim_create_user_command("ManimLatest", function()
-- local function view_manim_scene()
    local file = vim.fn.expand("%:p")
    local scene = get_current_scene()

    if not scene then
        vim.notify(
            "No Manim Scene class found above cursor",
            vim.log.levels.ERROR
        )
        return
    end

    -- Directory containing the Python file
    local project_dir = vim.fn.getcwd()

    -- Manim video directory
    local video_dir = project_dir .. "/media/videos"

    -- Search for the MP4 corresponding to this Scene
    local cmd = string.format(
        "find %s -type f -name '%s.mp4' -print -quit",
        vim.fn.shellescape(video_dir),
        scene
    )

    local handle = io.popen(cmd)
    local video = handle:read("*a")
    handle:close()

    video = video:gsub("%s+$", "")

    if video == "" then
        vim.notify(
            "No rendered video found for: " .. scene,
            vim.log.levels.WARN
        )
        return
    end

    vim.notify(
        "Opening " .. scene .. ".mp4",
        vim.log.levels.INFO
    )

    vim.fn.jobstart({
        "mpv",
        "--keep-open=yes",
        video,
    }, {
        detach = true,
    })
end, {
    desc = "Open latest Manim video",
})
