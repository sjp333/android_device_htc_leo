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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from qsd8k-common
-include device/htc/qsd8k-common/BoardConfigCommon.mk

# general 
USE_CAMERA_STUB := false

# Board
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := htcleo
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NEEDS_NON_PIE_SUPPORT := true
TARGET_DISABLE_ARM_PIE := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/htc/leo
TARGET_KERNEL_CONFIG := htcleo_defconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x11800000
BOARD_KERNEL_NEW_PPPOX := true

# Display
HWUI_COMPILE_FOR_PERF := true

#Bottanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_HALF_RES := true

# Camera/Media
TARGET_USES_SUBMIT_ONE_INPUT_BUFFER := true
TARGET_NEEDS_PRELINK_SUPPORT := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_PMEM_ADSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Audio
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# GPS
BOARD_USES_GPSSHIM := true
BOARD_GPS_LIBRARIES := libgps

# Legacy
BOARD_USE_LEGACY_TRACKPAD := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

# ART
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true
TARGET_CPU_SMP := false
MALLOC_IMPL := dlmalloc

# Recovery
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20485760 # 20M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1027604480 # 400M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1027604480 # 400M
BOARD_FLASH_BLOCK_SIZE := 4096

#Use our own init.rc that mounts cache under data/cache
TARGET_PROVIDES_INIT_RC := true

# Ril
BOARD_USES_LEGACY_RIL := true
LEGACY_RIL := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"

# Recovery
TARGET_RECOVERY_FSTAB = device/htc/leo/ramdisk/fstab.htcleo
RECOVERY_FSTAB_VERSION := 2
