#!/bin/bash

today=$(date +"%a %d %b %Y")

if [ -e $1 ]; then
	echo "Directory $1 already exists!"
else
	mkdir $1
	cat <<EOC >> $1/$1.c
/*
 * file:    $1.c
 * author:  Darren Rawlings (d.rawlings@student.rug.nl)
 * date:    $today
 * version: 1.0
 *
 * Description:
 * Please type here a description of 
 * what this program is supposed to do
 * 
 * input:
 * output:
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
	/* here you place your own code */
	return 0;
}

EOC
	cat <<EOM >> $1/Makefile
# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
CFLAGS  = -std=c99 -Wall -pedantic

# the build target executable:
TARGET = $1

all: \$(TARGET)

\$(TARGET): \$(TARGET).c
	\$(CC) \$(CFLAGS) -o \$(TARGET) \$(TARGET).c

clean:
	\$(RM) \$(TARGET)
EOM
fi
