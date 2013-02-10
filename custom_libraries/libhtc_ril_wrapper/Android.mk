LOCAL_PATH:= $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),htcleo)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := libhtc_ril_wrapper.c

LOCAL_SHARED_LIBRARIES := liblog libdl libnetutils libcutils

LOCAL_CFLAGS := -std=c99
LOCAL_CFLAGS += -DRIL_SHLIB

#build shared library
LOCAL_MODULE:= libhtc_ril_wrapper
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOOTLOADER_NAME
