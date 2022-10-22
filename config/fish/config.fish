# sudo pacman -S fish fisher
# fisher install pure-fish/pure
# fisher install jorgebucaran/nvm.fish

# set -g pure_color_primary green

fish_add_path /opt/homebrew/bin

set -Ux EDITOR nvim
alias vim="nvim -p"
alias vi="nvim -p"

alias edit-cfg="vim ~/.config/fish/config.fish"
alias load-cfg="source ~/.config/fish/config.fish"
alias thisbranch="git branch --show-current"
alias remake="make clean && make"
alias modified="git status|grep modified|sed 's/\(\s*modified:\s*\)\(.*\)/\2/'|xargs"
alias python="python3"

function agf --wraps ag
	find . | ag $argv
end

function agt --wraps ag
	ag '((interface)|(type)) '{$argv}
end

alias up="cd ~/Documents/ForumMagnum && yarn ea-start"
alias up-test="cd ~/Documents/ForumMagnum && yarn ea-start-testing-db"
alias unit="cd ~/Documents/ForumMagnum && yarn unit -t"
alias unit-watch="cd ~/Documents/ForumMagnum && yarn unit-watch -t"
alias int="cd ~/Documents/ForumMagnum && yarn integration -t"
alias e2e="cd ~/Documents/ForumMagnum && yarn ea-cypress-run"
alias dev-settings="vim ~/Documents/ForumCredentials/settings-dev.json"
alias mode-lw="perl -pi -w -e 's/EAForum/LessWrong/g;' ~/Documents/ForumCredentials/settings-dev.json"
alias mode-ea="perl -pi -w -e 's/LessWrong/EAForum/g;' ~/Documents/ForumCredentials/settings-dev.json"
alias db="yarn ea-mongo"
alias pg="psql postgres://eaforum@127.0.0.1:5432/eaforum2"
alias todo="vim ~/Documents/TODO"

alias ga="git add"
alias gs="git status"
alias gsh="git show"
alias gd="git diff"
alias gps="git push -u origin (thisbranch)"
alias gpl="git pull"
alias gf="git fetch"
alias gcm="git commit"
alias gck="git checkout"
alias gm="git merge"
alias gr="git rebase"

alias fm="cd ~/Documents/ForumMagnum"
alias fc="cd ~/Documents/ForumCredentials"
alias lyra="cd ~/Documents/lyra"
