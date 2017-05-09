MODULE = dir2

MOD_LIB = lib$(MODULE).a

CC_DEFS :=
ifeq '$(filter FEATURE_2, $(FEATURE))' 'FEATURE_2'
	CC_DEFS += dir2_DEF_1
	CC_DEFS += dir2_DEF_2
	CC_DEFS += dir2_DEF_3
endif

SRC_FILES =
SRC_FILES += a2.c
SRC_FILES += b2.c
SRC_FILES += c2.c

INC_PATH =
INC_PATH += $(TOP_DIR)/common

SRC_PATH =
SRC_PATH += $(TOP_DIR)/$(MODULE)
SRC_PATH += $(TOP_DIR)/$(MODULE)/sub_dir2

vpath %.c $(SRC_PATH)

include $(MKFILE_DIR)/gcc.mk
include $(MKFILE_DIR)/rules.mk

