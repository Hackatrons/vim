-- load vscode style snippets from any package.json defined in our runtime path
-- friendly-snippet has a packages.json file that this will consume
require("luasnip.loaders.from_vscode").lazy_load()
