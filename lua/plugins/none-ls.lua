local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({ -- nul-lsを初期化
    -- sources={}の中に利用したいLinter/Formatterを記載（後述）
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
    },
    debug = false,
})
