# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lilizarr <lilizarr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/30 13:32:36 by lilizarr          #+#    #+#              #
#    Updated: 2022/12/29 15:33:06 by lilizarr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
# ft_printf library
SRC =	ft_printf.c				\
		ft_print_type.c			\
		ft_printf_utils.c

OBJS_DIR = ./obj/
OBJS = $(addprefix $(OBJS_DIR), $(SRC:.c=.o))

# libft library
LIBFT_DIR = lib/libft/
LIBFT = $(LIBFT_DIR)libft
FLAGS = -Wall -Wextra -Werror

all: $(LIBFT) $(OBJS_DIR) $(NAME)

$(NAME): $(OBJS)
	cp $(LIBFT_DIR)libft.a .
	mv libft.a $(NAME)
	ar -rcs $@ $^
	ar -t $@

$(LIBFT):
	make -C $(LIBFT_DIR)

$(OBJS_DIR): 
	mkdir -p $@
	echo -L$(LIBFT_DIR)

$(addprefix $(OBJS_DIR), %.o): %.c
	cc -c $(FLAGS) $^ -o $@ 
#-I$(LIBFT_DIR)
#-L/usr/lib -lmylibrary

clean:
	make -C $(LIBFT_DIR) clean
	rm -rf $(OBJS_DIR)

fclean:	clean
	make -C $(LIBFT_DIR) fclean
	rm -f $(NAME)

re: fclean all

test: re
	@echo "******** RUN TEST ************"
	@gcc ./main_test/main.c libftprintf.a
	@mv a.out ./main_test/a.out
	./main_test/a.out
	@echo "********************"
	leaks --atExit -- ./main_test/a.out
#	@rm ./main_test/a.out
.PHONY: all clean fclean re