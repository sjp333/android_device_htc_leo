LOCAL_PATH:= $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),htcleo)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libgps

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)

LOCAL_SHARED_LIBRARIES := libutils libcutils librpc

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/librpc

LOCAL_SRC_FILES := \
		leo-gps.c \
		leo-gps-rpc.c \
		time.cpp \

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOOTLOADER_NAME
