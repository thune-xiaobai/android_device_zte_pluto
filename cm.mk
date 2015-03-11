## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := pluto

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CyanogenMod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/zte/pluto/device_pluto.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := pluto
PRODUCT_NAME := cm_pluto
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := U988S
PRODUCT_MANUFACTURER := ZTE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=pluto

# Enable Torch
PRODUCT_PACKAGES += Torch

