# emacs 風キーバインドにする
bindkey -e

# プロンプト
PROMPT=`builtin print '%{\E[33m\E[1;32m%}%n@%m%%%{\E[0m%} '`
RPROMPT=`builtin print '%{\E[33m\E[1;33m%}%2C%{\E[0m%}'`

# 色を使用できるようにする
autoload -Uz colors
colors

# 履歴の定義。
HISTFILE="${HOME}/.history"
HISTSIZE=10000
SAVEHIST=8000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名だけでcdする
setopt auto_cd
 
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# = の後はパス名として補完する
setopt magic_equal_subst
 
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob
setopt transient_rprompt

# dir履歴関連
alias   pd='dirs -v'
alias   bd=popd
 
########################################
# キーバインド
 
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# pecoが入っていたらpecoを使う
if which peco > /dev/null; then
  function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
	awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
   }
   zle -N peco-select-history
   bindkey '^r' peco-select-history
fi

# C-p/C-nで先頭が同じ履歴を探すようにする

bindkey "\C-p" history-beginning-search-backward
bindkey "\C-n" history-beginning-search-forward

########################################
# TMUX
if [ -n "${TMUX_PANE}" ] ; then
    ##PROMPT=`builtin print '%{\E[33m\E[1;36m%}%n@%m:'${TMUX_PANE}'%%%{\E[0m%} '`
    PROMPT=`builtin print '%{\E[33m\E[1;32m%}%n@%m%%%{\E[0m%} '`
fi

########################################
# GOLANG

export GOPATH="$HOME/.go"
export PATH=$PATH:$HOME/.go/bin

