-- don't spellcheck urls
-- regex description
-- 1. match one or more word characters
-- 2. until a ':'
-- 3. then match all remaining non-whitespace characters
vim.cmd.syn([[match UrlNoSpell '\w\+:\/\/\S\+' contains=@NoSpell]])
