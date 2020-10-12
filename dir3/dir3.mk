MODULE = dir3

MOD_LIB = $(LIB_PREFIX)$(MODULE).$(LIB_SUFFIX)

CC_DEFS :=
ifeq '$(filter FEATURE_3, $(FEATURE))' 'FEATURE_3'
	CC_DEFS += dir3_DEF_1
	CC_DEFS += dir3_DEF_2
	CC_DEFS += dir3_DEF_3
endif

SRC_FILES =
SRC_FILES += a3.c
SRC_FILES += b3.c
SRC_FILES += c3.c

INC_PATH =
INC_PATH += $(TOP_DIR)/common

SRC_PATH =
SRC_PATH += $(TOP_DIR)/$(MODULE)
SRC_PATH += $(TOP_DIR)/$(MODULE)/sub_dir3

vpath %.c $(SRC_PATH)

include $(MKFILE_DIR)/tools.mk
include $(MKFILE_DIR)/gcc.mk
include $(MKFILE_DIR)/rules.mk

