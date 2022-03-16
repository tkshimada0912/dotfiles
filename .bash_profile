for DIR in ${HOME}/Library/Python/{2,3}.{1..9}/bin ${HOME}/.local/bin ; do
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
PLDIRS=`echo Library/Python/{2,3}.{1..9}/lib/python/site-packages .local/lib/python3.{1..9}/site-packages`
PLCONF="powerline/bindings/bash/powerline.sh"

### macOS LANG setting
if [ X${LANG} == 'X' -a `uname -s` == 'Darwin' ]; then export LANG='ja_JP.UTF-8' ;fi
###

for DIR in ${PLDIRS}; do
	if [ -f ${HOME}/${DIR}/${PLCONF} ]; then
		powerline-daemon -q
		. ${HOME}/${DIR}/${PLCONF}
	fi
done

