# Inherit AOSP device configuration
$(call inherit-product, device/htc/leo/full_leo.mk)

# Release name
PRODUCT_RELEASE_NAME := Leo

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := leo
PRODUCT_NAME := cm_leo
PRODUCT_BRAND := htc
PRODUCT_MODEL := HD2
PRODUCT_MANUFACTURER := HTC
