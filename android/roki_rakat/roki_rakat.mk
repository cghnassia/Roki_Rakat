$(call inherit-product, device/linaro/pandaboard/pandaboard.mk)

DEVICE_PACKAGE_OVERLAYS := \
	device/linaro/roki_rakat/overlay

PRODUCT_PACKAGES += libusb-lib \
		    libusb-lib-static \
		    libbmp-lib \
		    native_ hellow \
		    libbmp-lib-static \
		    native-bmp \
            libbmp_Jni \
		    com.android.utbm.lo52.test \
		    RokiRakat

PRODUCT_NAME := roki_rakat
PRODUCT_DEVICE := roki_rakat
PRODUCT_BRAND :=  Android
PRODUCT_MODEL := Full Android on roki_rakat

PRODUCT_COPY_FILES += system/media/bootanimation.zip:system/media/bootanimation.zip

include $(call all-subdir-makefiles)
