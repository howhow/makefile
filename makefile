# main makefile
#
#	@File:      makefile
#	@Author:    How.Chen
#	@History:
#	VER		DATE			Change
#	1.0		27/Apr/2017		init commit
#	1.1		12/Oct/2020		change suffix name andadd tools.mk

# define useful directory path
TOP_DIR = $(PWD)
MKFILE_DIR = $(TOP_DIR)/sys-make
CFG_DIR = $(MKFILE_DIR)/config
OUTPUT_DIR = $(TOP_DIR)/output

# define useful prefix/postfix
LIB_PREFIX = lib
LIB_SUFFIX = a

# export var, which need be known by sub-makefile
export TOP_DIR MKFILE_DIR OUTPUT_DIR
export LIB_PREFIX LIB_SUFFIX

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
	-$(RM) -rf $(OUTPUT_DIR)

# include build configuration
# FEATURE define in it
include $(MKFILE_DIR)/tools.mk
include $(CFG_DIR)/build.config
include $(CFG_DIR)/version.config

