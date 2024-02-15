# compiler settings

CC = cc0
CFLAGS = -d -w

# repo settings
INIT = README.txt
SRC_PATH = src
C0_UTIL_PATH = libs/c0-utils

# modules

SRC_MISC = \
	$(SRC_PATH)/utils.c1 $(SRC_PATH)/file_io.c1 $(SRC_PATH)/error.c1 \
	$(SRC_PATH)/ast.c1 $(SRC_PATH)/file_repr.c1 $(SRC_PATH)/ast_utils.c1
SRC_FRONTEND = \
	$(SRC_PATH)/lexer.c1 $(SRC_PATH)/semantics.c1 $(SRC_PATH)/ast_visitor.c1 \
	$(SRC_PATH)/type_check.c1 $(SRC_PATH)/parser.c1
SRC_MAIN = $(SRC_PATH)/compile.c1 $(SRC_PATH)/main.c1

# build settings

LIBS = \
	$(C0_UTIL_PATH)/vector.c1 \
	$(C0_UTIL_PATH)/ordered_map.c1 \
	$(C0_UTIL_PATH)/regex.c1
SRC = $(SRC_MISC) $(SRC_FRONTEND) $(SRC_MAIN)
OBJ = ccc0

# targets

.PHONY: clean init

all: $(OBJ)

$(OBJ): init
	$(CC) $(CFLAGS) -o $(OBJ) $(LIBS) $(SRC)

clean:
	rm -f $(INIT)

init: clean
	echo "% $(CC) $(CFLAGS) -o $(OBJ) $(LIBS) $(SRC)" > README.txt
