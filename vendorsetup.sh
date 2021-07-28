#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="klte"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
		export ALLOW_MISSING_DEPENDENCIES=true
		export LC_ALL="C"
		export OF_USE_GREEN_LED=0 # Not for us
		export FOX_REMOVE_BASH=1 # Size problem
		export FOX_REMOVE_AAPT=1 # doesn't work
		export FOX_REMOVE_ZIP_BINARY=1 # Reduce recovery size amap
		export OF_VANILLA_BUILD=1
		export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
		export OF_SKIP_ORANGEFOX_PROCESS=1
		export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
		export FOX_USE_LZMA_COMPRESSION=1
		export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
		export OF_USE_MAGISKBOOT=1
		export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
		export OF_USE_TWRP_SAR_DETECT=1
		export OF_DISABLE_KEYMASTER2=1
		export OF_LEGACY_SHAR512=1
		export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
		export OF_DISABLE_EXTRA_ABOUT_PAGE=1    # Issues with 6.0 sources
		export OF_CHECK_OVERWRITE_ATTEMPTS=1
		export OF_SUPPORT_PRE_FLASH_SCRIPT=1

		export FOX_R11=1
		export FOX_ADVANCED_SECURITY=1
		export OF_QUICK_BACKUP_LIST="/boot;/data;/system;"

		# maximum permissible splash image size (in kilobytes); do *NOT* increase!
		export OF_SPLASH_MAX_SIZE=104

		# run a process after formatting data to work-around MTP issues
		export OF_RUN_POST_FORMAT_PROCESS=1

		# Naming stuff
		export FOX_VERSION="R11.1"
		export FOX_BUILD_TYPE="Beta"
		export TARGET_ARCH="arm"
		export OF_MAINTAINER="Yillié"

		# let's see what are our build VARs
		if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
		fi
fi

add_lunch_combo omni_klte-eng
add_lunch_combo omni_klte-userdebug

