# compiler settings

CC = cc0
CFLAGS = -d -w

# repo settings
INIT = README.txt
SRC_PATH = src
C0_UTIL_PATH = libs/c0-utils

# modules

SRC_MISC = $(SRC_PATH)/utils.c1 $(SRC_PATH)/file_io.c1

# build settings

LIBS = \
	$(C0_UTIL_PATH)/vector.c1 \
	$(C0_UTIL_PATH)/ordered_map.c1 \
	$(C0_UTIL_PATH)/regex.c1
SRC = $(SRC_MISC)
OBJ = ccc0

# targets

.PHONY: clean init

all: $(OBJ)

$(OBJ): init
	echo "Building (TODO: remove this)"

clean:
	rm -f $(INIT)

init: clean
	echo "% $(CC) $(CFLAGS) -o $(OBJ) $(LIBS) $(SRC)" > README.txt
