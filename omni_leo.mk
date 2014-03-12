# Inherit GSM configuration
$(call inherit-product, vendor/omni/config/gsm.mk)
# Inherit Omni Product configuration
$(call inherit-product, vendor/omni/config/common.mk)
# Inherit Leo Product configuration
$(call inherit-product, device/htc/leo/full_leo.mk)

PRODUCT_NAME := omni_leo
PRODUCT_DEVICE := leo
