//: [Previous](@previous)

import Foundation

// HW 3.1 Функция принимает на вход 2 катета прямоугольного треугольника. Вернуть в tuple ( кортеж ) длину гипотенузы и площадь

func count(a: Double, b: Double) -> (Double, Double) {
    var tuple: (hypoth: Double, square: Double)
    tuple.hypoth = sqrt(a*a + b*b)
    tuple.square = (a*b) / 2
    
    
    return tuple
}

count(a: 5, b: 5)

// HW 3.2 Функция принимает на вход целое число. Если оно двузначное - вернуть массив всех нечетных чисел, не больше этого числа кроме 12,23 и 91. Если оно однозначное - вернуть массив всех целых чисел, не больше этого числа.

func argument(arg: Int) -> [Int]{
    var array = [Int]()
        if arg >= 10{
            for i in 0..<arg{
                if i > 10, i % 2 != 0, i != 23, i != 12, i != 91 {
                    array.append(i)
                }
            }
        } else if arg <= 9 {
            for i in 0..<arg{
                if i < 10 {
                    array.append(i)
                }
            }
        }
    return array
}

argument(arg: 100)


// HW 3.3 Функция принимает на вход неотсортированный массив целых чисел. Вернуть минимальное и максимальное число в tuple.

func function(array: [Int]) -> (min: Int, max: Int){
    var tuple = (array[0], array[0])
    for i in array {
        if tuple.0 >= i {
            tuple.0 = i
        } else if tuple.1 <= i {
            tuple.1 = i
        }
    }
    return tuple
}

function(array: [6,5,7,10,12])

// HW 3.4 Функция принимает на вход массив целых чисел. Напечатать все числа, находящиеся на нечетных позициях.

func count(array: [Int]) -> Void {
    var position = 1
    while position < array.count {
        print(array[position])
        position = position + 2
    }
}


count(array: [2,7,12,40,15,35,10])

// HW 3.5 Написать функцию, принимающую на вход 2 целых числа. Вернуть факториал первого аргумента, если значение факториала меньше или равно второму аргументу. Иначе вернуть второй аргумент

func function(arg: Int, arg2: Int) -> Int{
    var factorial = 1
        for i in 1...arg{
            factorial *= i
        }
            if factorial <= arg2 {
                return factorial
                } else {
                    return arg2
                    }
}

function(arg: 3, arg2: 10)

// HW 3.6 Написать функцию, печатающую входной массив в обратном порядке (reversed())

func array(array: [Int]) -> [Int]{
    return array.reversed()
}

array(array: [1,2,3,4,5])

// HW 3.7 На вход функции 2 массива целых чисел. Первый - исследуемый, второй - фильтрующий. Вернуть из функции массив чисел, не входящих в исследуемый массив.  ( у массива есть функция contains() - вызывается так же, как append() )

func arrays(research: [Int], filter: [Int]) -> [Int]{
    var arr: [Int] = []
    for i in filter{
        if !research.contains(i){
            arr.append(i)
        }
    }
    return arr
}

arrays(research: [4,5,6,7,3], filter: [4,5,6,7,8])


// HW 3.8 То же, но вернуть массив чисел, не входящих в фильтрующий массив

func array(research: [Int], filter: [Int]) -> [Int]{
    var arr: [Int] = []
    for i in research{
        if !filter.contains(i){
            arr.append(i)
        }
    }
    return arr
}

array(research: [4,5,6,7,3], filter: [4,5,6,7,8])

// HW 3.9 Написать функцию-оболочку функций из 7 и 8 задачи. Она принимает на вход 2 массива (исследуемый и фильтрующий) и третий аргумент - строка String, задающий режим работы. Если режим работы - “new” - вызываем функцию из п.7 и возвращаем массив. Если режим работы - “outdated” - вызываем функцию из 8 пункта. Подумать над сложностью ( O(1), O(n) и т д )

func arrayFunc(research: [Int], filter: [Int], string: String) {
    if string == "new" {
        arrays(research: research, filter: filter)
    } else if string == "outdated" {
        array(research: research, filter: filter)
    }
}

arrayFunc(research: [1,2,3,4,5], filter: [5,6,7,8,9], string: "new")



// HW 3.10 Числа Фибоначчи . Первое - 0, второе - 1. Третье - 0+1 = 1 Четвертое - 0 +1 + 1 = 2 Пятое - 0 + 1 + 1 + 2 = 4 и т д. Написать функцию, принимающую на вход N - целое число, номер числа фибоначчи. Вернуть из функции найденное число. ( используйте цикл от 0...N ). СЛОЖНА - подумайте и погуглите рекурсивную реализацию.


func fibonachi(arg: Int) -> Int{
    
    var num1 = 0
    var num2 = 1
    
    for _ in 0...arg{
        
    let num = num1 + num2
        num1 = num2
        num2 = num
    }
    return num2
}

fibonachi(arg: 7)
