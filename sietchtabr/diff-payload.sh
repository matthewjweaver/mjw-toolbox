PAYLOAD=${1}

if ! [ -f ${PAYLOAD} ]; then
  echo "usage: deploy-payload.sh payload.tgz"
  exit 1
fi

TMP_FAKE_ROOT=`mktemp -d` || exit 1

doas tar -C $TMP_FAKE_ROOT -xzpf $PAYLOAD
cd $TMP_FAKE_ROOT
for file in $(find ./ -type f); do
  doas diff -u $(echo ${file}|sed -e's%^[.][/]%/%g') ${file}
done

doas rm -rf $TMP_FAKE_ROOT
