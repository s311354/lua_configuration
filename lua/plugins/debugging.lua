return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("dapui").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- dap.adapters.lldb = {
    --   type = 'executable',
    --   command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
    --   args = { "-s", "dap" },
    --   name = 'lldb'
    -- }

    -- dap.configurations.cpp = {
    --   {
    --     name = 'Launch',
    --     type = 'lldb',
    --     request = 'launch',
    --     program = function()
    --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --     args = {},
    --   },
    -- }

    -- dap.configurations.c = dap.configurations.cpp

    -- dap.adapters.gdb = {
    --   type = "executable",
    --   -- command = "gdb",
    --   -- args = { "-i", "dap" }
    -- }

    -- dap.configurations.c = {
    --   {
    --     name = "Launch",
    --     type = "gdb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopAtBeginningOfMainSubprogram = false,
    --   },
    -- }

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end
}
