LOCAL_PATH := $(call my_dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := libusb/core.c \
		   libusb/descriptor.c \
		   libusb/io.c \
		   libusb/sync.c \
		   libusb/linux_usbfs.c \
		   libusb/threads_posix.c

LOCAL_C_INCLUDES := external/libusb/libusb \
		   extenal/libusb/libusb/os

LOCAL_CFLAGS += -DLIBUSB_DESCRIBE
LOCAL_MODULE := libusb-lib
LOCAL_MODULES_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := libusb/core.c \
                   libusb/descriptor.c \
                   libusb/io.c \
                   libusb/sync.c \
                   libusb/linux_usbfs.c \
                   libusb/threads_posix.c

LOCAL_C_INCLUDES := external/libusb/libusb \
		    external/libusb/libusb/os

LOCAL_C_FLAGS := -DLIBUSB_DESCRIBE
LOCAL_MODULE := libusb-lib-static
LOCAL_MODULE_TAGS = optional

include $(BUILD_STATIC_LIBRARY)

