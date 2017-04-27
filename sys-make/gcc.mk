# compiler makefile
#
#    @File:      gcc.mk
#    @Author:    How.Chen
#    @Version:   1.0
#    @Date:      27h/April/2017
#    @Note:
#                -V1.0
#                - init commit
#

CC :=
CC += gcc

CFLAG :=
CFLAG += -ggdb -Wall
CFLAG += -fprofile-arcs -ftest-coverage

