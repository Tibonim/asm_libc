CC		= gcc

CFLAGS		= -O0 -shared -fno-builtin -o

ASM		= nasm

ASFLAGS		= -f elf64

NAME		= libasm.so

SOURCES		= src/strlen.S		\
		  src/strchr.S		\
		  src/memset.S		\
		  src/strcmp.S		\
		  src/strncmp.S		\
		  src/strcasecmp.S	\
		  src/rindex.S		\
		  src/strpbrk.S		\
		  src/strcspn.S		\
		  src/memcpy.S		\
		  src/memmove.S		\
		  src/strstr.S

OBJECTS		= $(SOURCES:.S=.o)

all:		$(NAME)

$(NAME):	$(OBJECTS)
		$(CC) $(CFLAGS) $(NAME) $(OBJECTS)

.SUFFIXES:
.SUFFIXES: .S .o
.S.o:
	$(ASM) $(ASFLAGS) $<


clean:
		rm -f $(OBJECTS)

fclean:		clean
		rm -f $(NAME)

re:		fclean all
