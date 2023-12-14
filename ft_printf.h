/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lilizarr <lilizarr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/20 11:22:17 by lilizarr          #+#    #+#             */
/*   Updated: 2022/12/29 16:13:52 by lilizarr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H
# include <stdio.h>
# include <stdarg.h>
# include <unistd.h>
# include <stdlib.h>
# include "./lib/libft/libft.h"

/* struct t_printf
**	f_width	->	field width		%5f 
**	presc 	->	precision 		%5.2f
**	prd		->	period
**	zero	->	zero padding	# printf("%07d", 012);
**	dash	-> -
**	sign	->	pos or neg number
**	n_zero	->	is number 	zero
**	perc	->	%
**	c_spc	-> character specifier
**	c_space	->	space flag ' ' 
**	c_hash	->	# flag
*/
/* cspdiuxX%
** %[flags][width][.precision][length]specifier
** struct content, specifier, len
** ft_strchr(" +-\t\n\r\v\f", *(sp + 1))
** 55 + remainder for uppercase
*/
typedef struct s_printf
{
	va_list		args;
	char		c_spc;
	const void	*ptr;
}	t_printf;

int		ft_printf(const char *format, ...);
void	ft_printf_str(t_printf **content, int *ret);
void	ft_printf_int(t_printf **content, int *ret);
void	ft_printf_char(t_printf **content, int *ret);
void	ft_printf_upx(t_printf **content, int *ret, int base);
int		ft_get_strsize(unsigned long num, int base);
void	ft_convert2base(char *str, int str_size, int base, unsigned long num);
void	ft_putstr(char *s);
void	ft_putchar(char c);
#endif