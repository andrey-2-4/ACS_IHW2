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
