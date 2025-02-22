# Copyright (C) 2018 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifneq ($(findstring lineage, $(TARGET_PRODUCT)),)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
endif

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2960
TARGET_SCREEN_WIDTH := 1440

# Init
PRODUCT_PACKAGES += \
    fstab.samsungexynos9810 \
    init.samsung.rc \
    init.samsungexynos9810.rc \
    init.samsungexynos9810.usb.rc \
    init.baseband.rc \
    ueventd.samsungexynos9810.rc

# SP-NDK
PRODUCT_PACKAGES += \
    libvulkan

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_gains.xml:system/etc/mixer_gains.xml \
    $(LOCAL_PATH)/audio/mixer_paths_r02.xml:system/etc/mixer_paths_r02.xml \
    $(LOCAL_PATH)/audio/mixer_gains_r02.xml:system/etc/mixer_gains_r02.xml \
    $(LOCAL_PATH)/audio/mixer_paths_r08.xml:system/etc/mixer_paths_r08.xml \
    $(LOCAL_PATH)/audio/mixer_gains_r08.xml:system/etc/mixer_gains_r08.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    com.android.nfc_extras \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service.9810

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.9810

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.exynos5

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.9810

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio_keys.kl:system/usr/keylayout/gpio_keys.kl

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/universal9810-common/universal9810-common-vendor.mk)
