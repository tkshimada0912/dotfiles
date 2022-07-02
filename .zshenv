for DIR in ${HOME}/Library/Python/{2,3}.{1..9}/bin ${HOME}/.local/bin /opt/homebrew/bin ; do
	if [ -d ${DIR} ] ; then
		PATH=${PATH}:${DIR}
	fi
done
