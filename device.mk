#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Audio
TARGET_ENABLE_AUDIO_ULL := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-derp

PRODUCT_PACKAGES += \
    SettingsProviderM2012K11AC \
    SettingsProviderM2012K11AG \
    SettingsProviderM2012K11AI

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Screen density
TARGET_SCREEN_DENSITY := 440

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_SHIPPING_API_LEVEL := 30

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# RRO Overlays
PRODUCT_PACKAGES += \
    HbmSVManagerGourami

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/camera_cnf.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_cnf.txt

# Display config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946736638489729.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946736638489729.xml

# Shims
PRODUCT_PACKAGES += \
    lib-watermarkshim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)
