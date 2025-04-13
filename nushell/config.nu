# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
alias gcan! = git commit --am -a --no-edit
alias gcam = git commit -am
alias gswc = git switch -c
alias gsw = git switch
alias gpn = git push origin (git branch --show-current) --no-verify
alias g = git
alias cat = bat

$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'
