MODULE = dir2

MOD_LIB = lib$(MODULE).a

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

