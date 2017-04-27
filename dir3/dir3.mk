MODULE = dir3

MOD_LIB = lib$(MODULE).a

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

include $(MKFILE_DIR)/gcc.mk
include $(MKFILE_DIR)/rules.mk

