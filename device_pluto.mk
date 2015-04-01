$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/pluto/pluto-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/pluto/overlay

LOCAL_PATH := device/zte/pluto
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

#$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_pluto
PRODUCT_DEVICE := pluto

# Ramdisk
PRODUCT_PACKAGES += \
    ueventd.tegra_pluto.rc \
    init.modem_icera.rc \
    init.modem_rmc.rc \
    init.icera_tegra_pluto.rc \
    init.nv_dev_board.usb.rc \
    init.tegra_pluto.rc \
    init.tegra_pluto.usb.rc \
    fstab.tegra_pluto

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    device/zte/pluto/permissions/com.broadcom.bt.xml:system/etc/permissions/com.broadcom.bt.xml \
    device/zte/pluto/permissions/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml \
    device/zte/pluto/permissions/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml \
    device/zte/pluto/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    device/zte/pluto/permissions/com.nvidia.nvstereoutils.xml:system/etc/permissions/com.nvidia.nvstereoutils.xml \

# idc
PRODUCT_COPY_FILES += \
  device/zte/pluto/idc/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
  device/zte/pluto/idc/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
  device/zte/pluto/idc/Synaptics_RMI4.idc:system/usr/idc/Synaptics_RMI4.idc

# icu
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/icu/icudt48l.dat:system/usr/icu/icudt48l.dat 

# Power
PRODUCT_COPY_FILES += \
    device/zte/pluto/power.tegra_pluto.rc:system/etc/power.tegra_pluto.rc

#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/system,system)

# Media config
PRODUCT_COPY_FILES += \
    device/zte/pluto/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/zte/pluto/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/zte/pluto/media/enctune.conf:system/etc/enctune.conf

# Audio
PRODUCT_COPY_FILES += \
    device/zte/pluto/audio/asound.conf:system/etc/asound.conf \
    device/zte/pluto/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/zte/pluto/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    device/zte/pluto/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libaudio-resampler \
    tinycap \
    tinymix \
    tinyplay

# GPS
PRODUCT_COPY_FILES += \
    device/zte/pluto/gps/gps.conf:system/etc/gps.conf \
    device/zte/pluto/gps/gpsconfigftm.xml:system/etc/gpsconfigftm.xml \
    device/zte/pluto/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml 

# Bluetooth
PRODUCT_COPY_FILES += \
    device/zte/pluto/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_COPY_FILES += \
    device/zte/pluto/camera/model_frontal.xml:system/etc/model_frontal.xml \
    device/zte/pluto/camera/nvcamera.conf:system/etc/nvcamera.conf \
    device/zte/pluto/camera/libztebitmaputils.so:system/lib/libztebitmaputils.so \
    device/zte/pluto/camera/libztecamerafilterfw.so:system/lib/libztecamerafilterfw.so \
    device/zte/pluto/camera/libztecamerafilterpack_imageproc.so:system/lib/libztecamerafilterpack_imageproc.so

# Wifi
PRODUCT_COPY_FILES += \
    device/zte/pluto/wifi/bcm43341/fw_bcm43341_mfg.bin:system/vendor/firmware/bcm43341/fw_bcm43341_mfg.bin \
    device/zte/pluto/wifi/bcm43341/fw_bcmdhd.bin:system/vendor/firmware/bcm43341/fw_bcmdhd.bin \
    device/zte/pluto/wifi/bcm43341/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm43341/fw_bcmdhd_apsta.bin \
    device/zte/pluto/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/pluto/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/zte/pluto/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

#misc
PRODUCT_COPY_FILES += \
    device/zte/pluto/misc/init.tegra_pluto.post_fs.sh:system/etc/init.tegra_pluto.post_fs.sh

PRODUCT_COPY_FILES += \
    device/zte/pluto/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    device/zte/pluto/modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
    device/zte/pluto/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/zte/pluto/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/zte/pluto/modules/gps_drv.ko:system/lib/modules/gps_drv.ko \
    device/zte/pluto/modules/lib80211.ko:system/lib/modules/lib80211.ko \
    device/zte/pluto/modules/mac80211.ko:system/lib/modules/mac80211.ko \
    device/zte/pluto/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/zte/pluto/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/zte/pluto/modules/tcrypt.ko:system/lib/modules/tcrypt.ko

PRODUCT_COPY_FILES += \
    device/zte/pluto/app/CameraZte.apk:system/priv-app/CameraZte.apk \
    device/zte/pluto/app/NvCPLSvc.apk:system/priv-app/NvCPLSvc.apk

PRODUCT_PACKAGES += \
    libnetcmdiface \
    libhealthd.tegra_pluto

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# NFC packages
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480 \
    drm.service.enabled=true

#chat
PRODUCT_PACKAGES += \
    chat
