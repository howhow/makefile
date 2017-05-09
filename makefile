# main makefile
#
#    @File:      makefile
#    @Author:    How.Chen
#    @Version:   1.0
#    @Date:      27h/April/2017
#    @Note:
#                -V1.0
#                - init commit
#

# define useful directory path
TOP_DIR = $(PWD)
MKFILE_DIR = $(TOP_DIR)/sys-make
CFG_DIR = $(MKFILE_DIR)/config
OUTPUT_DIR = $(TOP_DIR)/output

# define useful prefix/postfix
LIB_PREFIX = lib
LIB_POSTFIX = a

# include build configuration
# FEATURE define in it
include $(CFG_DIR)/build.config

# export var, which need be known by sub-makefile
export TOP_DIR MKFILE_DIR OUTPUT_DIR
export LIB_PREFIX LIB_POSTFIX

all: obj link

obj:
	@$(MAKE) -f $(TOP_DIR)/dir1/dir1.mk
	@$(MAKE) -f $(TOP_DIR)/dir2/dir2.mk
	@$(MAKE) -f $(TOP_DIR)/dir3/dir3.mk

# link workaround
# pass link to rules.mk to trigger link
link:
	@$(MAKE) -f $(MKFILE_DIR)/rules.mk link

# check
# to display each module build info
check:
	@$(MAKE) -f $(TOP_DIR)/dir1/dir1.mk check
	@$(MAKE) -f $(TOP_DIR)/dir2/dir2.mk check
	@$(MAKE) -f $(TOP_DIR)/dir3/dir3.mk check

# remove ouyput
clean:
	@$(MAKE) -f $(TOP_DIR)/dir1/dir1.mk clean
	@$(MAKE) -f $(TOP_DIR)/dir2/dir2.mk clean
	@$(MAKE) -f $(TOP_DIR)/dir3/dir3.mk clean
	-rm -r $(OUTPUT_DIR)

