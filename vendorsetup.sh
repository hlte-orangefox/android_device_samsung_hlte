#OFox Specific Build Vars by @Yilliee


export FOX_REMOVE_AAPT=1; # doesn't work
export OF_VANILLA_BUILD=1
export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
export OF_SKIP_ORANGEFOX_PROCESS=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
export FOX_USE_LZMA_COMPRESSION=1
export OF_FLASHLIGHT_ENABLE=0
export TARGET_DEVICE_ALT=klteduos
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_USE_TWRP_SAR_DETECT=1
export OF_DISABLE_KEYMASTER2=1
export OF_LEGACY_SHAR512=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_DISABLE_EXTRA_ABOUT_PAGE=1
export OF_ALLOW_DISABLE_NAVBAR=1
export FOX_VERSION=R11.0
export FOX_BUILD_TYPE=Beta
export TARGET_ARCH=arm

# -- add settings for R11 --
export FOX_R11=1
export FOX_ADVANCED_SECURITY=1
export OF_QUICK_BACKUP_LIST="/boot;/data;/system;"
# -- end R11 settings --

add_lunch_combo omni_klte-eng
add_lunch_combo omni_klte-userdebug

