# ACS_IHW2

# АВС ИДЗ№2 ВАРИАНТ№24

24. Разработать программу, которая ищет в ASCII-строке заданную
подстроку и возвращает список индексов первого символа для
всех вхождений подстроки в строке. Подстрока вводится как параметр.

На ввод подаются строки до 1000 символов. (в противном случае программа завершает работу)

tests.md - файл с тестами (входные данные и ожидаемый результат)

Ход работы:

1. Программа на C (hw2.c)

2. Программа на ассемблере (hw2.s) с использованием флагов gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./hw2.c -S hw2.s
    
    И вручную убраны строки:
    
    	.file	"hw2.c"
            .size	main, .-main
        .ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
        .section	.note.GNU-stack,"",@progbits
        .section	.note.gnu.property,"a"
        .align 8
        .long	1f - 0f
        .long	4f - 1f
        .long	5
        0:
            .string	"GNU"
        1:
            .align 8
            .long	0xc0000002
            .long	3f - 2f
        2:
            .long	0x3
        3:
            .align 8
        4:



3. Результат компиляции hw2.s (s1.out) и hw2.c (c.out)

4. Тестирование c.out и s1.out (в файле tests.md). Результаты совпали

5. Добавлены комментарии в программу на ассемблере (hw2withcomments.s) и убраны "endbr64"

6. Результат компиляции hw2withcomments.s (s2.out)

7. Тестирование s2.out (в файле tests.md). Результаты совпали

8. Изменение кода для максимального использовния регистров (hw1registers.s):

т.к. в программе только несколько чисел (индексаторы), которые можно засунуть в регистры (массивы в регистры не засунуть) - особо ничего не поменялось в плане регистров (только для i теперь используется rbx: DWORD PTR -8[rbp] -> rbx в finder и DWORD PTR -4[rbp] -> rbx в main)

дополнительные изменения:

    - lea	rax, str[rip] # rax = &str
	- mov	rdi, rax # rdi = rax
    + lea	rdi, str[rip] # rdi = &str
    
    - lea	rax, substr[rip] # rax = &substr
	- mov	rdi, rax # rdi = rax
    + lea	rdi, substr[rip] # rdi = &substr
    
    - lea	rax, .LC0[rip] #rax = &("Введите строку: ")
	- mov	rdi, rax # rdi = rax = &("Введите строку: ")
    + lea	rdi, .LC0[rip] #rdi = &("Введите строку: ")
    
    - lea	rax, str[rip] # rax = &str
	- mov	rdi, rax # rdi = rax
    + lea	rdi, str[rip] # rdi = &str
    
    - lea	rax, .LC1[rip] # rax = &("Введите подстроку: ")
	- mov	rdi, rax # rdi = rax = &("Введите подстроку: ")
    + lea	rdi, .LC1[rip] # rdi = &("Введите подстроку: ")
    
    - lea	rax, substr[rip] # rax = &substr
	- mov	rdi, rax # rdi = rax
    + lea	rdi, substr[rip] # rdi = &substr
    
    - lea	rax, str[rip] # rax = &str
	- mov	rdi, rax # rdi = rax
    + lea	rdi, str[rip] # rdi = &str
    
    - lea	rax, substr[rip] # rax = &substr
	- mov	rdi, rax # rdi = rax
    + lea	rdi, substr[rip] # rdi = &substr

    - lea	rax, .LC3[rip] # rax = &("%d")
	- mov	rdi, rax # rdi = rax
    + lea	rdi, .LC3[rip] # rdi = &("%d")
    
    - mov	eax, DWORD PTR [rdx+rax] # eax = indexes[i]
	- mov	esi, eax # esi = eax
    + mov	esi, DWORD PTR [rdx+rax] # esi = indexes[i]


0_0

ожидаемая оценка 6 
