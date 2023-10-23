alias sudo='sudo '
alias vim='nvim'
alias pacman='sudo pacman'
alias fasterd=' sudo reflector --verbose --sort rate -l 50 -p https -c France -c Germany -c Italy --save /etc/pacman.d/mirrorlist'


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias rm='rm -i'

alias update="yay -Syy"
alias upgrade="yay -Syu"
alias cleanall="yay -Rcus $(yay -Qdtq)"

alias wtf='echo "What the fuck!!!!!!"'

# protonvpn "shorthands"
alias plogin='protonvpn-cli login luther0101'
alias pconnect='protonvpn-cli connect'
alias pstatus='protonvpn-cli status'
alias pdisconnect='protonvpn-cli disconnect'

# full-stack-development
alias pa='php artisan'
alias pas='php artisan serve'
alias pat='php artisan tinker'
# database
alias pam='php artisan migrate'
alias pamf='php artisan migrate:fresh'
alias pamfs='php artisan migrate:fresh --seed'
alias pamr='php artisan migrate:rollback'
alias pads='php artisan db:seed'

# creating new laravel project
alias nlaravel='composer create-project laravel/laravel'
alias pamm='php artisan make:model'
# creating new livewire project
alias nwire='composer require livewire/livewire'
alias ncomponent='php artisan livewire:make'
alias palm='php artisan livewire:make'
# setting up breeze (for login forms)
alias nbreeze='composer require laravel/breeze --dev'
alias nblade='php artisan breeze:install blade'
alias nrd='npm run dev'
# create livewire.php in config and change layouts path
alias palp='php artisan livewire:publish --config'

#git related
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gcm='git commit -m'
alias gpom='git push origin main'
