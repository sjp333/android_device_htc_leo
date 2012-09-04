#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/init.htcleo.rc:root/init.htcleo.rc \
	device/htc/leo/prebuilt/init.htcleo.usb.rc:root/init.htcleo.usb.rc \
	device/htc/leo/prebuilt/ueventd.htcleo.rc:root/ueventd.htcleo.rc \
	device/htc/leo/prebuilt/logo.rle:root/logo.rle \

# Add the postrecoveryboot.sh so that the recovery.fstab can be changed
PRODUCT_COPY_FILES += \
    device/htc/leo/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/leo/leo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/leo/overlay
PRODUCT_LOCALES := fr_BE

# make fallback to mdpi possible
# e.g. for maintaining crisp assets on 160dpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# General properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=192 \
	rild.libpath=/system/lib/libhtc_ril.so \
	ro.ril.ecc.HTC-ELL=92,93,94 \
	ro.ril.ecc.HTC-WWE=999 \
	ro.ril.enable.a52.HTC-ITA=1 \
	ro.ril.enable.a53.HTC-ITA=1 \
	ro.ril.enable.a52=0 \
	ro.ril.enable.a53=1 \
	ro.ril.enable.dtm=1 \
	ro.ril.gprsclass=12 \
	ro.ril.hsdpa.category=8 \
	ro.ril.hsupa.category=5 \
	ro.ril.hsxpa=2 \
	ro.ril.def.agps.mode=2 \
	ro.ril.disable.power.collapse=0 \
	windowsmgr.max_events_per_sec=120 \
	mobiledata.interfaces=rmnet0,rmnet1,rmnet2,ppp0 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.opengles.version=131072 \
	ro.telephony.default_network=3 \
	ro.ril.enable.prl.recognition=1 \
	ro.ril.enable.managed.roaming=1 \
	ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
	ro.ril.emc.mode=2 \
	ro.telephony.ril.v3=signalstrength,singlepdp,skipbrokendatacall \
	ro.vold.umsdirtyratio=20
	

# Set usb type
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage \
	persist.service.adb.enable=1 


PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=45


# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	com.qc.hardware=1 \
	dev.pm.dyn_samplingrate=1 \
	ro.vendor.extension_library=/system/lib/libqc-opt.so



PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.composition.type=mdp \
	hwui.render_dirty_regions=false \
	hwui.disable_vsync=true \
	debug.sf.no_hw_vsync=1 \
	hwui.print_config=choice \
	debug.enabletr=false

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	dalvik.vm.checkjni=false \
	dalvik.vm.heapsize=128m \
	dalvik.vm.heapgrowthlimit=48m \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.dexopt-data-only=1 \
	dalvik.vm.verify-bytecode=false \

PRODUCT_TAGS += dalvik.gc.type-precise




# media config xml file
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Configs
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/qsd8k-common/audio_policy.conf:system/etc/audio_policy.conf


# This file is used to install the enable RMNET and corresponding modules which dont get activated by normal module script, mount cache so that downloads work correctly
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/init.d/01modules:system/etc/init.d/01modules \
	device/htc/leo/prebuilt/init.d/02usb_tethering:system/etc/init.d/02usb_tethering \
	device/htc/leo/prebuilt/init.d/10mic_level:system/etc/init.d/10mic_level \
	device/htc/leo/prebuilt/init.d/97ppp:system/etc/init.d/97ppp



# Audio
PRODUCT_PACKAGES += \
	audio.usb.default \
	audio.a2dp.default \
	audio.primary.qsd8k \
	audio_policy.qsd8k

# Sensors
PRODUCT_PACKAGES += \
	sensors.htcleo \
	lights.htcleo \
 	gps.htcleo

# GPU
PRODUCT_PACKAGES += \
	copybit.qsd8k \
	gralloc.qsd8k \
	hwcomposer.qsd8k 

# Omx
PRODUCT_PACKAGES += \
	libOmxCore \
	libOmxVdec \
	libstagefrighthw

# htcleo misc
PRODUCT_PACKAGES += \
	libgps \
	leo-reference-ril \
	libhtc_ril_wrapper

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Misc
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory
	


	
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/vold.fstab:system/etc/vold.fstab

# Keylayouts
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/keylayout/htcleo-keypad.kl:system/usr/keylayout/htcleo-keypad.kl \
	device/htc/leo/prebuilt/keylayout/htcleo-keypad.kcm:system/usr/keychars/htcleo-keypad.kcm \
	device/htc/leo/prebuilt/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Touchscreen
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/htcleo-touchscreen.idc:system/usr/idc/htcleo-touchscreen.idc

# PPP files
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/ppp/ip-up:system/etc/ppp/ip-up \
	device/htc/leo/prebuilt/ppp/ip-down:system/etc/ppp/ip-down \
	device/htc/leo/prebuilt/ppp/ppp:system/ppp \
	device/htc/leo/prebuilt/ppp/options:system/etc/ppp/options


# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
	device/htc/leo/prebuilt/gps_eu.conf:system/etc/gps.conf

# stuff common to all HTC phones
# Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Init post-boot script
PRODUCT_COPY_FILES += \
    device/htc/leo/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh 

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distict.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


PRODUCT_NAME := htc_leo
PRODUCT_DEVICE := leo
