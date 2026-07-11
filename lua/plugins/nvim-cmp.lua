return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version  = '1.*',
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'default',

                -- String returns - feedkeys() with 't' flag (remap enabled)
                -- User mappings take precedence over built-in behavior
                ['<C-n>'] = { 'select_next' },
                ['<C-j>'] = { function(cmp) return '<C-n>' end },

                 -- Chained commands
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-K>'] = { function(cmp) return '<C-p>' end },

                -- Multi-key sequences
                ['<C-x><C-o>'] = { 'show', 'fallback' },
                ['jk'] = { 'hide' },

                -- Key equivalences (for terminals that support them)
                ['<C-i>'] = { 'accept', 'snippet_forward', 'fallback' },
                ['<Tab>'] = { 'select_and_accept', 'fallback' },

                -- Override preset key
                ['<C-y>'] = { 'select_and_accept' },

                -- Disable preset key
                ['<C-e>'] = false, -- or {}

                -- Function calling blink.cmp method
                ['<C-Space>'] = { 'show' }, -- This is equivalent as above

                -- Actions with parameters require functions
                ['<C-space>S'] = { function(cmp) return cmp.show({ providers = { 'snippets' } }) end },
           },
           appearance = {
               -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
               -- Adjusts spacing to ensure icons are aligned
               nerd_font_variant = 'mono'
           },

       },
    }
}
