return {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitCurrentFile', 'LazyGitConfig', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open Lazygit' },
  },
}
