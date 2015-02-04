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


# Overlay
DEVICE_PACKAGE_OVERLAYS += device/htc/leo/overlay

# Packages
PRODUCT_PACKAGES += \
	sensors.htcleo \
	lights.htcleo \
	leo-reference-ril

# Ramdisk
PRODUCT_COPY_FILES += \
	device/htc/leo/ramdisk/logo.rle:root/logo.rle \
	device/htc/leo/ramdisk/fstab.htcleo:root/fstab.htcleo \
	device/htc/leo/ramdisk/init.rc:root/init.rc \
	device/htc/leo/ramdisk/init.htcleo.rc:root/init.htcleo.rc \
	device/htc/leo/ramdisk/init.htcleo.usb.rc:root/init.htcleo.usb.rc \
	device/htc/leo/ramdisk/init.power.rc:root/init.power.rc \
	device/htc/leo/ramdisk/ueventd.htcleo.rc:root/ueventd.htcleo.rc \
	device/htc/leo/ramdisk/bin/busybox:root/bin/busybox \
	device/htc/leo/ramdisk/bin/e2fsck:root/bin/e2fsck

# GPS
PRODUCT_COPY_FILES += \
	device/htc/leo/configs/gps.conf:system/etc/gps.conf

PRODUCT_PACKAGES += \
	gps.htcleo \
	libgps \
	librpc

# Scripts
PRODUCT_COPY_FILES += \
	device/htc/leo/scripts/init.d/01modules:system/etc/init.d/01modules

# Keylayouts
PRODUCT_COPY_FILES += \
	device/htc/leo/keylayout/htcleo-keypad.kl:system/usr/keylayout/htcleo-keypad.kl \
	device/htc/leo/keylayout/htcleo-keypad.kcm:system/usr/keychars/htcleo-keypad.kcm \
	device/htc/leo/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
	device/htc/leo/keylayout/htcleo-touchscreen.idc:system/usr/idc/htcleo-touchscreen.idc

# cLK
PRODUCT_COPY_FILES += \
	device/htc/leo/clk/default.prop:system/default.prop \
	device/htc/leo/clk/ppp:system/ppp \
	device/htc/leo/clk/etc/init.d/97ppp:system/etc/init.d/97ppp \
	device/htc/leo/clk/etc/ppp/active:system/etc/ppp/active \
	device/htc/leo/clk/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \
	device/htc/leo/clk/etc/ppp/ip-down:system/etc/ppp/ip-down \
	device/htc/leo/clk/etc/ppp/ip-up:system/etc/ppp/ip-up \
	device/htc/leo/clk/etc/ppp/options:system/etc/ppp/options \
	device/htc/leo/clk/etc/ppp/options.smd:system/etc/ppp/options.smd \
	device/htc/leo/clk/etc/ppp/pap-secrets:system/etc/ppp/pap-secrets \
	device/htc/leo/clk/etc/ppp/ppp-gprs.pid:system/etc/ppp/ppp-gprs.pid \
	device/htc/leo/clk/etc/ppp/resolv.conf:system/etc/ppp/resolv.conf

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml 

# Leo uses high-density artwork where available
PRODUCT_LOCALES += hdpi mdpi


# High Density art
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Configs
PRODUCT_COPY_FILES += \
	device/htc/leo/configs/media_codecs.xml:system/etc/media_codecs.xml \
	device/htc/leo/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/htc/leo/configs/audio_policy.conf:system/etc/audio_policy.conf

# Audio
PRODUCT_PACKAGES += \
	audio.usb.default \
	audio.a2dp.default \
	audio.primary.qsd8k \
	audio_policy.qsd8k

# Camera
#PRODUCT_PACKAGES += \
#	camera.qsd8k

# Display
PRODUCT_PACKAGES += \
	copybit.qsd8k \
	gralloc.qsd8k \
	hwcomposer.qsd8k

# Omx
PRODUCT_PACKAGES += \
	libOmxCore \
	libstagefrighthw

# Misc
PRODUCT_PACKAGES += \
	power.qsd8k \
	com.android.future.usb.accessory \
	libnetcmdiface

# Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Additional Propreties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	rild.libpath=/system/lib/libhtc_ril.so \
	ro.ril.gprsclass=12 \
	ro.ril.hsdpa.category=8 \
	ro.ril.hsupa.category=5 \
	ro.ril.hsxpa=2 \
	ro.ril.def.agps.mode=2 \
	ro.ril.disable.power.collapse=0 \
	mobiledata.interfaces=ppp0 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.opengles.version=131072 \
	ro.telephony.default_network=3 \
	ro.ril.enable.prl.recognition=1 \
	ro.ril.enable.managed.roaming=1 \
	ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
	ro.ril.emc.mode=2 \
	ro.telephony.ril.v3=signalstrengthgsm,apptypesim \
	ro.vold.umsdirtyratio=20 \
	persist.sys.root_access=1 \
	persist.sys.purgeable_assets=1 \
	windowsmgr.max_events_per_sec=120 \
	ro.serialno=0123456789ABCDEF \
	debug.sf.hw=1 \
	debug.sf.no_hw_vsync=1 \
	debug.composition.type=mdp \
	ro.zygote.disable_gl_preload=true \
	debug.gr.numframebuffers=2


# Low Mem
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

# Disable jit
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.jit.codecachesize=0

# Scrolling tweaks
PRODUCT_PROPERTY_OVERRIDES += \
	ro.min_pointer_dur=8 \
	ro.max.fling_velocity=12000 \
	ro.min.fling_velocity=8000 \

# Dalvik Properties
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.checkjni=false \
	dalvik.vm.dexopt-data-only=1 \
	dalvik.vm.execution-mode=int:jit \
	dalvik.vm.verify-bytecode=false \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.debug.alloc=0 \
	ro.sys.fw.bg_apps_limit=12 \
	sys.mem.max_hidden_apps=7 \
	ro.config.max_starting_bg=7


# Default heap settings for 512mb device
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	debug.camcorder.disablemeta=1 \
	rw.media.record.hasb=0

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=120

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1

# Permissions
PRODUCT_COPY_FILES += \
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

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Proprietary
$(call inherit-product, device/htc/leo/proprietary.mk)
