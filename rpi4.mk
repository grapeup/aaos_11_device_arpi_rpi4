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
    evs_app \
    v4l2-ctl \
    Gallery2 \
    Camera2

PRODUCT_COPY_FILES += \
    packages/apps/Car/AOSPHost/com.android.car.templates.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.car.templates.host.xml

# EVS v1.1
PRODUCT_PACKAGES += android.automotive.evs.manager.fuzzlib \
                    android.hardware.automotive.evs@1.1-sample \
                    android.hardware.graphics.mapper@4.0 \
                    evs_app

# Automotive display service
PRODUCT_PACKAGES += android.frameworks.automotive.display@1.0-service


# Auto modules
PRODUCT_PACKAGES += \
            android.hardware.automotive.vehicle@2.0-service

# Car init.rc
PRODUCT_COPY_FILES += \
            packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc \
            packages/services/Car/car_product/init/init.car.rc:root/init.car.rc


PRODUCT_COPY_FILES += \
    device/arpi/rpi4/config_override.json:system/etc/automotive/evs/config_override.json \
    device/arpi/rpi4/evs_configuration_override.xml:vendor/etc/automotive/evs/evs_configuration_override.xml


PRODUCT_VENDOR_PROPERTIES += \
    ro.camerax.extensions.enabled=true

ENABLE_CAMERA_SERVICE := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:system/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/car_core_hardware.xml:system/etc/permissions/car_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.type=automotive \
    persist.automotive.evs.mode=0


PRODUCT_NAME := rpi4
PRODUCT_DEVICE := rpi4
PRODUCT_BRAND := arpi
PRODUCT_MODEL := Raspberry Pi 4
PRODUCT_MANUFACTURER := GrapeUp and ARPi

