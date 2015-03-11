TARGET_SPECIFIC_HEADER_PATH := device/zte/pluto/include

USE_CAMERA_STUB := false

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_SMP := true

# Board
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t114
TARGET_TEGRA_FAMILY := t11x
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := pluto

TARGET_USE_TEGRA_BIONIC_OPTIMIZATION := true
TARGET_USE_TEGRA11_MEMCPY_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
#BOARD_USE_TINYALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/pluto
TARGET_KERNEL_CONFIG := cyanogenmod_pluto_defconfig
#TARGET_PREBUILT_KERNEL := device/zte/pluto/kernel
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# File system
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/zte/pluto/rootdir/etc/fstab.tegra_pluto
RECOVERY_FSTAB_VERSION           := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/backlight/pwm-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -DNEEDS_VECTORIMPL_SYMBOLS

# Graphics
BOARD_EGL_CFG := device/zte/pluto/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USE_SKIA_LCDTEXT := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/zte/pluto/bluetooth/vnd_bt.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/pluto/bluetooth

#Lights
TARGET_PROVIDES_LIBLIGHT := true

# GPS
BOARD_HAVE_GPS_BCM := true

#WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm43341/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm43341/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm43341/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_DEVICE   := bcmdhd

# SELinux
BOARD_SEPOLICY_DIRS += \
   $(COMMON_PATH)/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    app.te \
    bdaddwriter.te \
    device.te \
    drmserver.te \
    init_shell.te \
    file.te \
    sensors_config.te \
    system.te \
    zygote.te \
    healthd.te \
    domain.te \
    ueventd.te

# Assert
TARGET_OTA_ASSERT_DEVICE := pluto,u988s,U988S

# inherit from the proprietary version
-include vendor/zte/pluto/BoardConfigVendor.mk
