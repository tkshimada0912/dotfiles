#!/bin/bash

TMUXEXT=${HOME}/.tmux.ext.conf
touch ${TMUXEXT}

# powerline
PLUDIRS=(${HOME}/Library/Python/2.{1..9}/lib/python/site-packages ${HOME}/.local/lib/python2.{1..9}/site-packages)
PLSDIRS=(/usr/local/lib/python2.{1..9}/{site,dist}-packages)
PLCONF="powerline/bindings/tmux/powerline.conf"
for DIR in ${PLUDIRS} ${PLSDIRS}; do
        if [ -f ${DIR}/${PLCONF} ]; then
		echo ${DIR}/${PLCONF}
                echo source \"${DIR}/${PLCONF}\" >> ${TMUXEXT}
        fi
done
