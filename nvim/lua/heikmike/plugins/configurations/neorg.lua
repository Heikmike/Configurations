require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = { -- Format: <name_of_workspace> = <path_to_workspace_root>
                    az_france_chunk_scoring = "~/neorg/chunk-scoring/",
                },
                index = "index.norg", -- The name of the main (root) .norg file
                default_workspace = "az_france_chunk_scoring"
            }
        },
        ["core.summary"] = {},
        ["core.integrations.treesitter"] = {},
    }
}
