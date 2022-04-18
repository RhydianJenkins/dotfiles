" ALE (code linter)
let g:ale_php_phpstan_executable = './vendor/bin/phpstan'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'php': ['php', 'phpstan'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'php': ['php_cs_fixer'],
\   'javascript': ['eslint'],
\}

