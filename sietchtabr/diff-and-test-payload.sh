PAYLOAD=${1}

if ! [ -f ${PAYLOAD} ]; then
  echo "usage: deploy-payload.sh payload.tgz"
  exit 1
fi

TMP_FAKE_ROOT=`mktemp -d` || exit 1

doas tar -C $TMP_FAKE_ROOT -xzpf $PAYLOAD
cd $TMP_FAKE_ROOT
pwd

for file in $(find ./ -type f|fgrep -v 'tmp/'); do
  doas diff -u $(echo ${file}|sed -e's%^[.][/]%/%g') ${file}
done

if [ -f tmp/test-payload.sh ]; then
  doas sh -ex tmp/test-payload.sh
fi

doas rm -rf $TMP_FAKE_ROOT
