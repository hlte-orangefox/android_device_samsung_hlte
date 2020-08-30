FDEVICE="klte"
if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TARGET_ARCH=arm
	export FOX_RECOVERY_INSTALL_PARTITION=/dev/block/platform/msm_sdcc.1/by-name/recovery
	export FOX_RECOVERY_SYSTEM_PARTITION=/dev/block/platform/msm_sdcc.1/by-name/system
	export TW_DEFAULT_LANGUAGE="en"

        export OF_VANILLA_BUILD=1
    	export OF_SKIP_ORANGEFOX_PROCESS=1
    	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
    	export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1	
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

	#export OF_USE_MAGISKBOOT=1
	#export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_USE_TWRP_SAR_DETECT=0
	export OF_FLASHLIGHT_ENABLE=0
	unset FOX_REPLACE_BUSYBOX_PS
	
	export OF_DISABLE_KEYMASTER2=1
	export OF_LEGACY_SHAR512=1
	export OF_DEVICE_WITHOUT_PERSIST=1
	
	export FOX_REMOVE_AAPT=1; # doesn't work
	export FOX_USE_NANO_EDITOR=0
	export FOX_USE_TAR_BINARY=0
	#

        # -- add settings for R11 --
        export FOX_R11=1
        export FOX_ADVANCED_SECURITY=1
        export OF_QUICK_BACKUP_LIST="/boot;/data;/system;"
        # -- end R11 settings --

        #export PLATFORM_VERSION="16.1.0"
   	export PLATFORM_SECURITY_PATCH="2099-12-31"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	fi
	add_lunch_combo omni_"$FDEVICE"-eng
	add_lunch_combo omni_"$FDEVICE"-userdebug
fi
#
