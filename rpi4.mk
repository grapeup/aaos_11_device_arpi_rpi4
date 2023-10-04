PRODUCT_SUPPORTS_CAMERA = true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/arpi/rpi4/android_rpi4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/generic/car/common/car.mk)


DEVICE_PACKAGE_OVERLAYS += device/arpi/rpi4/overlay \
    device/generic/car/car_x86_64/overlay \
    device/generic/car/common/overlay


# Default permission grant exceptions
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/build/default-car-permissions.xml:system/etc/default-permissions/default-car-permissions.xml \
    packages/services/Car/car_product/build/preinstalled-packages-product-car-base.xml:system/etc/sysconfig/preinstalled-packages-product-car-base.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml

PRODUCT_PACKAGES += \
    CarAOSPHost \

PRODUCT_COPY_FILES += \
    packages/apps/Car/AOSPHost/com.android.car.templates.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.car.templates.host.xml

# PRODUCT_PACKAGES += \
    # v4l2-ctl \
    # gralloc.gbm \
    # libGLES_mesa \
    # hwcomposer.drm \
    # gralloc.rpi4 \
    # vulkan.rpi4 \
    # memtrack.rpi4 \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.type=automotive \
    # ro.hardware.camera=v4l2 \

# USE_CAMERA_V4L2_HAL := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:system/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/car_core_hardware.xml:system/etc/permissions/car_core_hardware.xml \

# PRODUCT_PROPERTY_OVERRIDES += \
#     debug.sf.early_phase_offset_ns=1500000
# PRODUCT_PROPERTY_OVERRIDES += \
#     debug.sf.early_app_phase_offset_ns=1500000
# PRODUCT_PROPERTY_OVERRIDES += \
#     debug.sf.early_gl_phase_offset_ns=3000000
# PRODUCT_PROPERTY_OVERRIDES += \
#     debug.sf.early_gl_app_phase_offset_ns=15000000

PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/init/init.bootstat.rc:system/etc/init/init.bootstat.car.rc \
    packages/services/Car/car_product/init/init.car.rc:system/etc/init/init.car.rc

# PRODUCT_COPY_FILES += \
    # device/arpi/rpi4/media_codecs_2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_2.xml \
    # device/generic/goldfish/camera/media_codecs_google_video_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_default.xml \
    # device/generic/goldfish/camera/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    # frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \

# TARGET_USES_CAR_FUTURE_FEATURES := true
# EVS v1.1
PRODUCT_PACKAGES += evs_app \
                    android.hardware.automotive.evs@1.1-sample \
                    v4l2-ctl
                    # camera.v4l2 \
                    # evs_app_default_resources \
                    # evs_app_support_lib \
                    # android.hardware.automotive.sv@1.0 \
                    # android.hardware.camera.provider@2.6 \
                    # android.hardware.camera.device@3.4


PRODUCT_PRODUCT_PROPERTIES += persist.automotive.evs.mode=0


PRODUCT_COPY_FILES += \
    device/arpi/rpi4/config_override.json:system/etc/automotive/evs/config_override.json \
    device/arpi/rpi4/evs_configuration_override.xml:vendor/etc/automotive/evs/evs_configuration_override.xml \

PRODUCT_NAME := rpi4
PRODUCT_DEVICE := rpi4
PRODUCT_BRAND := arpi
PRODUCT_MODEL := Raspberry Pi 4
PRODUCT_MANUFACTURER := GrapeUp and ARPi

