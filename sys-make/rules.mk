# rules makefile
#
#    @File:      rules.mk
#    @Author:    How.Chen
#    @Version:   1.0
#    @Date:      27h/April/2017
#    @Note:
#                -V1.0
#                - init commit
#                - add rule for obj
#                - add rule for depend
#                - add rule for lib
#

# define general path and output for each sub module
OUTS = $(OUTPUT_DIR)/$(MODULE)
OBJS = $(addprefix $(OUTS)/,$(SRC_FILES:.c=.o))
DEPS = $(addprefix $(OUTS)/,$(SRC_FILES:.c=.d))

# workaround for link
FULL_O=$(shell find $(OUTS) -name "*.o")

.PHONY: link clean

# generate lib file
$(OUTS)/$(MOD_LIB): $(OBJS)
	@ar cr $@ $^
	@echo "ar $(notdir $@)"

# compile from source to objs include for dependence
$(OUTS)/%.o: %.c
	@mkdir -p $(OUTS)
#	@$(CC) $(CFLAG) $(CC_DEFS) -I$(INC_PATH) -c $<
#	@$(CC) $(CFLAG) $(CC_DEFS) -I$(INC_PATH) -MM $< > $*.d 
#	@$(CC) $(CFLAG) $(CC_DEFS) -I$(INC_PATH) -MM -MF  $(patsubst %.o,%.d,$@) -o $@ $< 
#	@$(CC) $(CFLAG) $(CC_DEFS) -I$(INC_PATH) -MMD -MF $(patsubst %.o,%.d,$@) -MT $@ -o $@ $< 
	@$(CC) $(CFLAG) $(CC_DEFS) -I$(INC_PATH) -MMD -c $< -o $@
	@echo "cc $(notdir $<)"

# workaround for link
link:
	@echo "Link executable"
#	@echo $(FULL_O)
	@gcc -ggdb -Wall -fprofile-arcs -ftest-coverage $(FULL_O) -Wl,-Map=$(OUTPUT_DIR)/test.map -o $(OUTPUT_DIR)/test

# remove output for each sub module
clean:
	-@rm -r $(OUTS)

# include dependence if has
-include $(DEPS)

