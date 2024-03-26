FLAGS = -Wall -Wextra -Werror

all: s21_grep s21_cat

s21_grep:
	cd grep && gcc $(FLAGS) s21_grep.c -o s21_grep

s21_cat:
	cd cat && gcc $(FLAGS) s21_cat.c -o test_cat/s21_cat

rebuild:
	make clean
	make all

clean:
	cd grep && rm -f s21_grep
	cd cat/test_cat && rm -f s21_cat
