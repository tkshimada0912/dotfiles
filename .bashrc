for DIR in ${HOME}/Library/Python/2.7/bin ${HOME}/.local/bin ; do
	if [ -d ${DIR} ] ; then
		PATH=${PATH}:${DIR}
	fi
done

########################################
# GOLANG

export GOPATH="$HOME/.go"
export PATH=$PATH:$HOME/.go/bin


########################################
# powerline
PLDIRS="Library/Python/2.7/lib/python/site-packages .local/lib/python2.7/site-packages"
PLCONF="powerline/bindings/bash/powerline.sh"
for DIR in ${PLDIRS}; do
	if [ -f ${HOME}/${DIR}/${PLCONF} ]; then
		powerline-daemon -q
		. ${HOME}/${DIR}/${PLCONF}
	fi
done

