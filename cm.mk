# Inherit AOSP device configuration for leo.
$(call inherit-product, device/htc/leo/device_leo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)


## Device identifier. This must come after all inclusions
PRODUCT_MODEL := HTC HD2
PRODUCT_MANUFACTURER := HTC
PRODUCT_BRAND := htc
PRODUCT_DEVICE := leo
PRODUCT_NAME := cm_leo
PRODUCT_CODENAME := leo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=leo BUILD_ID=JRO03L BUILD_DISPLAY_ID=JRO03L BUILD_FINGERPRINT="google/htc_leo/leo:4.1.1/JRO03L/239410:user/release-keys" PRVIATE_BUILD_DESC="full_leo-user 4.1.1 JRO03L 239410 release-keys"

