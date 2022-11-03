	.intel_syntax noprefix # используем синтаксис intel
	.text #объявляем str, substr, indexes
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 1002
str:
	.zero	1002
	.globl	substr
	.align 32
	.type	substr, @object
	.size	substr, 1002
substr:
	.zero	1002
	.globl	indexes
	.align 32
	.type	indexes, @object
	.size	indexes, 4008
indexes:
	.zero	4008
	.text
	.globl	finder
	.type	finder, @function
# функция, которая изменяет массив indexes
finder:
	push	rbp # помещаем rbp на стек
	mov	rbp, rsp # rbp = rsp
	sub	rsp, 32 # rsp -= 32
	lea	rax, str[rip] # rax = &str
	mov	rdi, rax # rdi = rax
	call	strlen@PLT # вызов strlen
	mov	DWORD PTR -16[rbp], eax # lenstr = (-16 на стеке) = eax
	lea	rax, substr[rip] # rax = &substr
	mov	rdi, rax # rdi = rax
	call	strlen@PLT # вызов strlen
	mov	DWORD PTR -20[rbp], eax # lensubstr = (-20 на стеке) = eax
	mov	DWORD PTR -8[rbp], 0 # i = (-8 на стеке) = 0
	jmp	.L2 # преходим на .L2 (условие внешнего цикла)
.L8: # тело внешнего цикла
	mov	eax, DWORD PTR -8[rbp] # eax = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rdx, 0[0+rax*4] 
	lea	rax, indexes[rip]
	mov	DWORD PTR [rdx+rax], -1 # indexes[i] = -1
	mov	BYTE PTR -1[rbp], 116 # ok = 't'
	mov	DWORD PTR -12[rbp], 0 # j = (-12 на стеке) = 0
	jmp	.L3 # идем в .L3 (условие внутреннего цикла)
.L6: # тело внутреннего цикла
	mov	edx, DWORD PTR -8[rbp] # edx = i
	mov	eax, DWORD PTR -12[rbp] # eax = j
	add	eax, edx # eax += edx
	cdqe # расширяем eax до rax
	lea	rdx, str[rip] # rdx = &str
	movzx	edx, BYTE PTR [rax+rdx] # eax = str[i + j]
	mov	eax, DWORD PTR -12[rbp] # eax = j
	cdqe # расширяем eax до rax
	lea	rcx, substr[rip] # rdx = &substr
	movzx	eax, BYTE PTR [rax+rcx] # eax = substr[j]
	cmp	dl, al # сравниваем str[i + j] и substr[j]
	je	.L4 # если равны идем в .L4 
	mov	BYTE PTR -1[rbp], 102 # иначе ok = 'f'
	jmp	.L5 # и выходим из цикла
.L4:
	add	DWORD PTR -12[rbp], 1 # ++j
.L3: # условие внутреннего цикла
	mov	eax, DWORD PTR -20[rbp] # eax = lensubstr
	sub	eax, 1 # eax -= 1
	cmp	DWORD PTR -12[rbp], eax # сравниваем j и eax
	jl	.L6 # если меньше, то идем .L6 (тело внутреннего цикла)
.L5: # тело if
	cmp	BYTE PTR -1[rbp], 116 # сравниваем ok и 't'
	jne	.L7 # если не равно идем .L7
	mov	eax, DWORD PTR -8[rbp] # eax = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rcx, 0[0+rax*4]
	lea	rdx, indexes[rip]
	mov	eax, DWORD PTR -8[rbp] # eax = i
	mov	DWORD PTR [rcx+rdx], eax # indexes[i] = eax = i
.L7:
	add	DWORD PTR -8[rbp], 1 # ++i
.L2: # условие внешнего цикла
	mov	eax, DWORD PTR -16[rbp] # eax = lenstr
	sub	eax, DWORD PTR -20[rbp] # eax -= lensubstr
	cmp	DWORD PTR -8[rbp], eax # сравниваем i с eax
	jle	.L8 # если <= то идем .L8 (тело цикла)
	nop # оптимизация
	nop # оптимизация
	leave # выход
	ret # из функции
	.size	finder, .-finder
	.section	.rodata
.LC0: # "Введите строку: "
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\201\321\202\321\200\320\276\320\272\321\203: "
	.align 8
.LC1: # "Введите подстроку: "
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\277\320\276\320\264\321\201\321\202\321\200\320\276\320\272\321\203: "
.LC2: # "Индексы: "
	.string	"\320\230\320\275\320\264\320\265\320\272\321\201\321\213: "
.LC3:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp # помещаем rbp на стек
	mov	rbp, rsp # rbp = rsp
	sub	rsp, 16 # rsp -= 18
	lea	rax, .LC0[rip] #rax = &("Введите строку: ")
	mov	rdi, rax # rdi = rax = &("Введите строку: ")
	mov	eax, 0 # eax = 0
	call	printf@PLT # вывод строки
	mov	rax, QWORD PTR stdin[rip] # 3 параметр для fgets - stdin
	mov	rdx, rax # rdx = rax
	mov	esi, 1002 # esi = N = 1002
	lea	rax, str[rip] # rax = &str
	mov	rdi, rax # rdi = rax
	call	fgets@PLT # вызов fgets
	lea	rax, .LC1[rip] # rax = &("Введите подстроку: ")
	mov	rdi, rax # rdi = rax = &("Введите подстроку: ")
	mov	eax, 0 # eax = 0
	call	printf@PLT # вывод строки
	mov	rax, QWORD PTR stdin[rip] # 3 параметр для fgets - stdin
	mov	rdx, rax # rdx = rax
	mov	esi, 1002 # esi = N = 1002
	lea	rax, substr[rip] # rax = &substr
	mov	rdi, rax # rdi = rax
	call	fgets@PLT # вызов fgets
	lea	rax, str[rip] # rax = &str
	mov	rdi, rax # rdi = rax
	call	strlen@PLT # вызов strlen
	mov	DWORD PTR -8[rbp], eax # eax (длину) помещаем в (-8 на стеке)
	lea	rax, substr[rip] # rax = &substr
	mov	rdi, rax # rdi = rax
	call	strlen@PLT # вызов strlen
	mov	DWORD PTR -12[rbp], eax # eax (длину) помещаем в (-12 на стеке)
	lea	rax, .LC2[rip] # rax = &("Индексы: ")
	mov	rdi, rax # rdi = rax
	mov	eax, 0 # eax = 0
	call	printf@PLT # вывод строки
	mov	eax, DWORD PTR -12[rbp] # eax = lensubstr
	cmp	eax, DWORD PTR -8[rbp] # сравниваем eax и lenstr
	jle	.L10 # если <= то идем .L10 (пропускаем тело if)
	mov	edi, 10 # edi = 10
	call	putchar@PLT # вывод переноса строки
	mov	eax, 0 # eax = 0
	jmp	.L11 # переходим к завершению программы .L11
.L10:
	mov	eax, 0 # eax = 0
	call	finder # вызываем finder
	mov	DWORD PTR -4[rbp], 0 # (-4 на стеке) = i = 0
	jmp	.L12 # переходим в .L12 (условие цикла)
.L14: # тело цикла
	mov	eax, DWORD PTR -4[rbp] # eax = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rdx, 0[0+rax*4] 
	lea	rax, indexes[rip]
	mov	eax, DWORD PTR [rdx+rax] # eax = indexes[i]
	cmp	eax, -1 # сравниваем eax и -1
	je	.L13 # если равны то идем .L13
	mov	eax, DWORD PTR -4[rbp] # eax = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rdx, 0[0+rax*4] 
	lea	rax, indexes[rip]
	mov	eax, DWORD PTR [rdx+rax] # eax = indexes[i]
	mov	esi, eax # esi = eax
	lea	rax, .LC3[rip] # rax = &("%d")
	mov	rdi, rax # rdi = rax
	mov	eax, 0 # eax = 0
	call	printf@PLT # печатаем indexes[i]
	mov	edi, 32 # edi = 32
	call	putchar@PLT # печатаем " "
.L13:
	add	DWORD PTR -4[rbp], 1 # ++i
.L12: # условие цикла
	mov	eax, DWORD PTR -8[rbp] # eax = lenstr
	sub	eax, DWORD PTR -12[rbp] # eax -= lensubstr
	cmp	DWORD PTR -4[rbp], eax # сравниваем i и eax
	jle	.L14 # если <= то идем в тело цикла
	mov	edi, 10 # edi = 10
	call	putchar@PLT # вывод переноса строки
	mov	eax, 0 # eax = 0
.L11:
	leave # завершение
	ret # программы
