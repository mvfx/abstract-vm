NAME =				avm

CC =				g++

FLAGS =				-Wall -Werror -Wextra

HEADERS =			-I ./include

SRC_DIR =			./src/

OBJ_DIR =	obj
OBJ_DIR_PATH =		./$(OBJ_DIR)/

SRCS =              main

COMPILED_PATHS :=	$(addsuffix .o,$(SRCS))
COMPILED_PATHS :=	$(addprefix $(OBJ_DIR_PATH),$(COMPILED_PATHS))

all: $(NAME)

$(NAME): $(COMPILED_PATHS)
	$(CC) -o $(NAME) $(FLAGS) $(HEADERS) $(COMPILED_PATHS)

$(COMPILED_PATHS): $(OBJ_DIR_PATH)%.o: $(SRC_DIR)%.cpp
	@/bin/mkdir -p $(OBJ_DIR_PATH)
	$(CC) -c $(FLAGS) $(HEADERS) $< -o $@

clean:
	@-/bin/rm -f $(COMPILED_PATHS)
	@/usr/bin/find . -name "$(OBJ_DIR)" -maxdepth 1 -type d -empty -delete

fclean: clean
	@-/bin/rm -f $(NAME)

re: fclean all