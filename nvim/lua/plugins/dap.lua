-- This file configures nvim-dap for Go debugging with delve.
-- Assumes you have installed delve: go install github.com/go-delve/delve/cmd/dlv@latest

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Creates a beautiful UI for DAP
    "rcarriga/nvim-dap-ui",

    -- Required for nvim-dap
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    --================================================================
    -- Adapter and Configuration for Go (delve)
    --================================================================

    -- This tells nvim-dap how to launch the delve debugger.
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    -- This tells nvim-dap how to debug a Go program.
    -- You can add more configurations here, for example, to attach to a running process.
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug (Launch current package)",
        request = "launch",
        program = "main.go", -- Debug the package in the current file's directory
        args = { "-c", "./config.yaml", "query", "log", "-i", "splunk-app-logs" },

      },
      {
        type = "delve",
        name = "Debug test (current file)",
        request = "launch",
        mode = "test",
        program = "${file}", -- Debug the current test file
      },
      {
        type = "delve",
        name = "Debug test (current package)",
        request = "launch",
        mode = "test",
        program = "${fileDirname}", -- Debug all tests in the current file's directory
      },
    }

    --================================================================
    -- DAP UI Configuration
    --================================================================

    dapui.setup({
      -- Set icons for different UI elements
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      -- Layout of the UI windows
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },
    })

    -- Automatically open and close the DAP UI when a session starts/ends
    dap.listeners.after.event_
