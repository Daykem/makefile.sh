#!/bin/bash

SRC=$(ls -R | grep -F ".c")
CFLAG="-Iinclude"

printf "##\n## EPITECH PROJECT, 2018\n## Makefile\n## File description:\n## made by Developper\n##\n\n" >> Makefile

printf "SRC\t=" >> Makefile

for ligne in $SRC; do
	printf "\t\t\t%s %c\n" "`find -name $ligne`" "\\" >> Makefile
done
	printf "\n" >> Makefile

printf "OBJ\t=\t\t \$(SRC:.c=.o)\n\n" >> Makefile

printf "NAME\t=\t\t $1\n\n" >> Makefile

printf "CFLAGS\t+=\t\t%s\n\n" "$CFLAG" >> Makefile

printf "all:\t\t\t\$(NAME)\n\n" >> Makefile

printf "\$(NAME):\t\$(OBJ)\n\tmake -C lib/my\n\tgcc \$(OBJ) -o \$(NAME) -L lib/my/ -lmy\n\n" >> Makefile

printf "clean:\n\trm -f \$(OBJ)\n\n" >> Makefile

printf "fclean:\t\t\tclean\n\trm -f \$(NAME)\n\n" >> Makefile

printf "re:\t\t\tfclean all\n\n" >> Makefile
