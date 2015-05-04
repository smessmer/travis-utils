#!/bin/bash

# Install fuse
sudo apt-get install -qq libfuse-dev pkg-config fuse user-mode-linux
sudo mknod /dev/fuse c 10 229
sudo chmod 666 /dev/fuse


# Run the command specified as parameter in a user-mode-linux with fuse kernel module enabled
CURDIR="`pwd`"

cat > umltest.inner.sh <<EOF
#!/bin/sh
(
   export PATH="$PATH"
   set -e
   insmod /usr/lib/uml/modules/\`uname -r\`/kernel/fs/fuse/fuse.ko
   cd "$CURDIR"
   $@
)
echo "\$?" > "$CURDIR"/umltest.status
halt -f
EOF

chmod +x umltest.inner.sh

# Running it with 1G doesn't work due to a bug (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=559622)
#/usr/bin/linux.uml init=`pwd`/umltest.inner.sh mem=1G rootfstype=hostfs rw
/usr/bin/linux.uml init=`pwd`/umltest.inner.sh mem=503M rootfstype=hostfs rw

exit $(<umltest.status)
