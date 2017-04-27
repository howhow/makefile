# Sub-folder makefile
#
#    @File:      dir1.mk
#    @Author:    How.Chen
#    @Version:   1.0
#    @Date:      27h/April/2017
#    @Note:
#                -V1.0
#                - init commit
#                - remove system print and customized
#

MODULE = dir1

MOD_LIB = lib$(MODULE).a

SRC_FILES =
SRC_FILES += a1.c
SRC_FILES += b1.c
SRC_FILES += c1.c

INC_PATH =
INC_PATH += $(TOP_DIR)/common

SRC_PATH =
SRC_PATH += $(TOP_DIR)/$(MODULE)
SRC_PATH += $(TOP_DIR)/$(MODULE)/sub_dir1

vpath %.c $(SRC_PATH)

include $(MKFILE_DIR)/gcc.mk
include $(MKFILE_DIR)/rules.mk

