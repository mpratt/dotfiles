return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = false
    },
  },
}
