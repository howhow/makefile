# rules makefile
#
#	@File:     rules.mk
#	@Author:   How.Chen
#	@History:
#	VER		DATE			Change
#	1.0		08/May/2017		init version
#	2.0		09/May/2017		add debug print
#	2.1		12/Oct/2020		add version string

# define general path and output for each sub module
OUTS = $(OUTPUT_DIR)/$(MODULE)
OBJS = $(addprefix $(OUTS)/,$(SRC_FILES:.c=.o))
DEPS = $(addprefix $(OUTS)/,$(SRC_FILES:.c=.d))

CC_DEFINE = $(addprefix -D, $(CC_DEFS))
CC_INC_PATH = $(addprefix -I , $(INC_PATH))

TARGET_NAME = test_makefile_$(MAJOR_VER).$(MINOR_VER)

# workaround for link, need all objs at once
FULL_O=$(shell find $(OUTS) -name "*.o")

.PHONY: link clean check 

# generate lib file
$(OUTS)/$(MOD_LIB): $(OBJS)
	@$(ARCHIVE) cr $@ $?
	@$(ECHO) "Generate lib: $(notdir $@)"

# compile from source to objs include for dependence
# $< means each %.c, $@ means each $(OUTS)/%.o
$(OUTS)/%.o: %.c
	@$(MKDIR) -p $(OUTS)
	@$(CC) $(CFLAG) $(CC_DEFINE) $(CC_INC_PATH) -MMD -c $< -o $@
	@$(ECHO) "CC: $(notdir $<)"

# workaround for link
# $(CFLAG) does not exported
link:
	@$(ECHO) "Link executable: $(TARGET_NAME)"
	@$(ECHO) "full objs: $(FULL_O)"
ifeq '$(DEBUG)' 'YES'
	@gcc -ggdb -Wall -fprofile-arcs -ftest-coverage $(FULL_O) -Wl,-Map=$(OUTPUT_DIR)/$(TARGET_NAME).map -o $(OUTPUT_DIR)/$(TARGET_NAME)
else
	@gcc $(FULL_O) -Wl,-Map=$(OUTPUT_DIR)/$(TARGET_NAME).map -o $(OUTPUT_DIR)/$(TARGET_NAME)
endif

check:
	@$(ECHO) "mod: $(MODULE)"
	@$(ECHO) "libs: $(MOD_LIB)"
	@$(ECHO) "src_path: $(SRC_PATH)"
	@$(ECHO) "inc_path: $(INC_PATH)"
	@$(ECHO) "srcs: $(SRC_FILES)"
	@$(ECHO) "outs: $(OUTS)"
	@$(ECHO) "objs: $(OBJS)"
	@$(ECHO) "dpes: $(DEPS)"
	@$(ECHO) "flag: $(CFLAG)"
	@$(ECHO) "targ: $@"
	@$(ECHO) "enabled features: $(FEATURE)"
	@$(ECHO) "cc defines: $(CC_DEFINE)"
	@$(ECHO) "cc include: $(CC_INC_PATH)"
	@$(ECHO) "full objs: $(FULL_O)"
	@$(ECHO) ""

# remove output for each sub module
clean:
	-@rm -rf $(OUTS)

# include dependence if has
-include $(DEPS)

include $(MKFILE_DIR)/tools.mk
