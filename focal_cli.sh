./compile.sh SHOW_DEBUG=yes NO_APT_CACHER=yes OFFLINE_WORK=no DOWNLOAD_MIRROR=ustc SKIP_ARMBIAN_REPO=yes USE_TORRENT=yes CLEAN_LEVEL=make,debs,alldebs,oldcache BOARD=$1 BRANCH=$2 RELEASE=focal BUILD_MINIMAL=no BUILD_DESKTOP=no BUILD_ONLY=default KERNEL_GIT=full KERNEL_CONFIGURE=no INSTALL_HEADERS=yes COMPRESS_OUTPUTIMAGE=sha,xz BUILD_TYPE=$3
