#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

OPENWRT_BRANCH=23.05

cd "$ROOTDIR/build"

# clone stangri repo
rm -rf stangri_repo
mkdir stangri_repo
cd stangri_repo
# stick to version 1.1.6 of pbr for now
git clone -b 1.1.6 https://github.com/stangri/pbr.git
git clone https://github.com/stangri/luci-app-pbr.git
#git clone https://github.com/stangri/source.openwrt.melmac.net stangri_repo
cd ..

# clone luci-app-dockerman repo
rm -rf luci-app-dockerman-repo
mkdir luci-app-dockerman-repo
cd luci-app-dockerman-repo
# clone lisaac/luci-app-dockerman repo
#rm -rf luci-app-dockerman-repo
git clone https://github.com/lisaac/luci-app-dockerman
#git clone https://github.com/lisaac/luci-app-dockerman luci-app-dockerman-repo
cd ..

# clone wrtbwmon repo
rm -rf wrtbwmon_repo
mkdir wrtbwmon_repo
cd wrtbwmon_repo
# clone brvphoenix/wrtbwmon repo
git clone -b v1.2.1-3 https://github.com/brvphoenix/wrtbwmon.git
# clone brvphoenix/luci-app-wrtbwmon repo
git clone -b release-2.0.13 https://github.com/brvphoenix/luci-app-wrtbwmon.git
cd ..

# install feeds
cd openwrt
./scripts/feeds update -a

# replace pbr packages
rm -rf feeds/packages/net/pbr/
cp -R ../stangri_repo/pbr feeds/packages/net/
rm -rf feeds/luci/applications/luci-app-pbr
cp -R ../stangri_repo/luci-app-pbr feeds/luci/applications/

# replace adguardhome with prebuilt latest version
rm -rf feeds/packages/net/adguardhome
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/adguardhome feeds/packages/net/

# replace luci-app-dockerman with latest version
rm -rf feeds/luci/applications/luci-app-dockerman
cp -R ../luci-app-dockerman-repo/applications/luci-app-dockerman feeds/luci/applications/

# replace pbr packages
rm -rf feeds/packages/net/wrtbwmon/
cp -R ../wrtbwmon_repo/wrtbwmon feeds/packages/net/
rm -rf feeds/luci/applications/luci-app-wrtbwmon
cp -R ../wrtbwmon_repo/luci-app-wrtbwmon feeds/luci/applications/

./scripts/feeds update -i && ./scripts/feeds install -a

# Time stamp with $Build_Date=$(date +%Y.%m.%d)
MANUAL_DATE="$(date +%Y.%m.%d) (manual build)"
BUILD_STRING=${BUILD_STRING:-$MANUAL_DATE}
echo "Write build date in openwrt : $BUILD_DATE"
echo -e '\nNK Build@'${BUILD_STRING}'\n'  >> package/base-files/files/etc/banner
#sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
#echo "DISTRIB_REVISION='${BUILD_STRING}'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='NK Build@${BUILD_STRING}'" >> package/base-files/files/etc/openwrt_release
#sed -i '/luciversion/d' feeds/luci/modules/luci-base/luasrc/version.lua

rm -rf .config
