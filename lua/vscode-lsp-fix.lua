-- Fix for VSCode/Cursor Neovim Extension LSP sync errors with empty buffers
-- This addresses the "assertion failed" error in vim/lsp/sync.lua:195

if not vim.g.vscode then
  return
end

-- Minimal fix: Only patch the specific error-prone function
-- Wrap the problematic compute_diff that fails on empty buffers
local sync_ok, sync = pcall(require, 'vim.lsp.sync')
if sync_ok and sync and sync.compute_diff then
  local original_compute_diff = sync.compute_diff
  sync.compute_diff = function(...)
    local ok, result = pcall(original_compute_diff, ...)
    if ok then
      return result
    end
    -- On error, return nil to skip the diff (forces full sync for this change)
    return nil
  end
end

