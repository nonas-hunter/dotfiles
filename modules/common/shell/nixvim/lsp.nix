{ inputs, config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.nixvim.enable) {
    home-manager.users.${config.user} = {
      programs.nixvim = {
        
        plugins.cmp-nvim-lsp = {
          enable = true;
        };

        plugins.fidget = {
          enable = true;
        };

        extraPlugins = with pkgs.vimPlugins; [
          neodev-nvim
        ];

        extraConfigLuaPre = ''
          require('neodev').setup {}
        '';

        autoGroups = {
          "kickstart-lsp-attach" = {
            clear = true;
          };
        };
        
        plugins.lsp = {
          enable = true;
          servers = {
            clangd.enable = true;
            pyright.enable = true;
            cmake.enable = true;
          };

          onAttach = ''
            -- NOTE: Remember that Lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
            end

            -- The following two autocommands are used to highlight references of the
            -- word under the cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            if client and client.server_capabilities.documentHighlightProvider then
              local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
              })
            end

            -- The following autocommand is used to enable inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
              end, '[T]oggle Inlay [H]ints')
            end
          '';
        };
      };
    };
  };
}


