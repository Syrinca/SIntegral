section .data
    prompt db "Enter a function f(x): ", 0
    result_msg db "The derivative of the function is: ", 0
    newline db 13, 10, 0

section .bss
    function resb 256  ; Резервируем место для хранения введенной функции
    derivative resb 256  ; Резервируем место для хранения производной

section .text
    global _start

_start:
    ; Выводим приглашение для ввода функции f(x)
    mov edx, prompt
    call StdOut

    ; Читаем функцию f(x), введенную пользователем
    mov edx, 256
    lea ecx, [function]
    call ReadString

    ; Парсинг и вычисление производной функции
    lea esi, [function]  ; Указатель на начало введенной строки
    lea edi, [derivative]  ; Указатель на начало строки для производной

parse_loop:
    lodsb  ; Загрузка байта из строки в AL и увеличение указателя
    cmp al, 0  ; Проверка на конец строки
    je end_parse  ; Если конец строки, завершаем парсинг
    ; Здесь можно добавить логику парсинга и формирования производной
    stosb  ; Сохраняем байт в строку для производной
    jmp parse_loop  ; Переходим к следующему байту

end_parse:
    mov byte [edi], 0  ; Добавляем нулевой символ в конец строки для производной

    ; Выводим результат
    mov edx, result_msg
    call StdOut

    mov edx, derivative
    call StdOut

    ; Переход на новую строку
    mov edx, newline
    call StdOut

    ; Завершение программы
    call ExitProcess

; Функция для вывода строки на экран
StdOut:
    ; (код функции StdOut остается без изменений)

; Функция для чтения строки из ввода пользователя
ReadString:
    ; (код функции ReadString остается без изменений)

; Функция для завершения процесса
ExitProcess:
    ; (код функции ExitProcess остается без изменений)