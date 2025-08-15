set -e

REMOTE_TMP=$(ssh sietchtabr mktemp -d) || exit 1

scp sietchtabr-payload.tgz diff-and-test-payload.sh sietchtabr:${REMOTE_TMP}/
ssh -t sietchtabr "cd ${REMOTE_TMP}; ./diff-and-test-payload.sh sietchtabr-payload.tgz"

ssh sietchtabr "rm -rf ${REMOTE_TMP}"
