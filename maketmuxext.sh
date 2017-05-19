#!/bin/bash

TMUXEXT=${HOME}/.tmux.ext.conf
rm -f ${TMUXEXT} && touch ${TMUXEXT}

# powerline
PLUDIRS=$(echo ${HOME}/Library/Python/2.{1..9}/lib/python/site-packages ${HOME}/.local/lib/python2.{1..9}/site-packages)
PLSDIRS=$(echo /usr/local/lib/python2.{1..9}/{site,dist}-packages)
PLCONF="powerline/bindings/tmux/powerline.conf"
for DIR in ${PLUDIRS} ${PLSDIRS}; do
        if [ -f ${DIR}/${PLCONF} ]; then
                echo source \"${DIR}/${PLCONF}\" >> ${TMUXEXT}
		break
        fi
done
