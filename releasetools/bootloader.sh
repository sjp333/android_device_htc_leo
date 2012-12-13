#!/bin/sh
#
# Copyright (C) 2012 Sportsstar89
#

echo "updater-script: Making Compatible Update script"
cd $REPACK/ota/META-INF/com/google/android

awk '{if (match($0,"0.200000, 10")) exit; print > "head"}' updater-script
awk '/0.200000, 10/ {p=1}; p==1 {print > "tail"}' updater-script
rm -rf updater-script

cat head > updater-script
rm -rf head

echo 'package_extract_file("kernel/checksys.sh","/tmp/checksys.sh");' >> updater-script
echo 'set_perm(0, 0, 755, "/tmp/checksys.sh");' >> updater-script
echo 'run_program("/tmp/checksys.sh");' >> updater-script
echo 'if file_getprop("/tmp/nfo.prop","clk") == "true" ' >> updater-script
echo 'then' >> updater-script
echo '  ui_print("cLK, Good data connection");' >> updater-script
echo '  package_extract_dir("kernel/clk-ppp-patch", "/system");' >> updater-script
echo '	set_perm(0, 0, 0777, "/system/etc/init.d/97ppp");' >> updater-script
echo '	set_perm_recursive(0, 2000, 0755, 0750, "/system/etc/init.d");' >> updater-script
echo '	set_perm(0, 0, 0755, "/system/etc/init.d");' >> updater-script
echo '	set_perm_recursive(0, 1001, 0755, 0775, "/system/etc/ppp");' >> updater-script
echo '	set_perm(0, 0, 04755, "/system/bin/pppd");' >> updater-script
echo 'else' >> updater-script
echo '  ui_print("MAGLDR, rmnet bad data connection");' >> updater-script
echo '  delete("/system/ppp");' >> updater-script
echo '  delete("/system/etc/init.d/97ppp");' >> updater-script
echo 'endif;' >> updater-script

cat tail >> updater-script
rm -rf tail

echo "updater-script: copying checksys.sh"
mkdir $REPACK/ota/kernel
cp $ANDROID_BUILD_TOP/device/htc/leo/releasetools/checksys.sh $REPACK/ota/kernel/checksys.sh
