# Sub-folder makefile
#
#	@File:      dir1.mk
#	@Author:    How.Chen
#	@History:
#	VER		DATE			Change
#	1.0		27/May/2017		init version
#	1.1		12/Oct/2020		update suffix

# define module name for compile use
MODULE = dir1

# define expected lib
MOD_LIB = $(LIB_PREFIX)$(MODULE).$(LIB_SUFFIX)


CC_DEFS :=
# modify sys-make/config/build.config to control 
ifeq '$(filter FEATURE_1, $(FEATURE))' 'FEATURE_1'
	CC_DEFS += dir1_DEF_1
	CC_DEFS += dir1_DEF_2
	CC_DEFS += dir1_DEF_3
endif

# add srouce files, which would like to compile
SRC_FILES =
SRC_FILES += a1.c
SRC_FILES += b1.c
# modify sys-make/config/build.config to control 
ifeq '$(filter FEATURE_1, $(FEATURE))' 'FEATURE_1'
	SRC_FILES += c1.c
endif

# add include search path
INC_PATH =
INC_PATH += $(TOP_DIR)/common

# add source file search path together with vpath
SRC_PATH =
SRC_PATH += $(TOP_DIR)/$(MODULE)
SRC_PATH += $(TOP_DIR)/$(MODULE)/sub_dir1

vpath %.c $(SRC_PATH)

# use general tools setting, compiler and compile rules
include $(MKFILE_DIR)/tools.mk
include $(MKFILE_DIR)/gcc.mk
include $(MKFILE_DIR)/rules.mk

