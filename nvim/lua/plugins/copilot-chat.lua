return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = false
    },
  },
}
