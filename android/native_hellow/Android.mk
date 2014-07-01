LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := hellow.c
LOCAL_C_INCLUDES += external/libusb/libusb \
		   $(JNI_H_INCLUDE)
LOCAL_SHARED_LIBRARIES := libusb-lib \
			  libutils \
			  libCutils

LOCAL_MODULE := native_hellow
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
include $(BUILD_EXECUTABLE)
