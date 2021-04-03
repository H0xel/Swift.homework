import Foundation

// HW 4.1 На вход функции массив целых чисел. Напечатать количество чётных, нечётных, двузначных и однозначных чисел ( Не сделано)

func array1(array: [Int]) {
    
    var unOdd = 0
    var odd = 0
    var low10 = 0
    var upper9 = 0
    
    for i in array{
        if i > 9{
            upper9 += 1
        } else if i < 10 {
           low10 += 1
        }
        if i % 2 != 0 {
            odd += 1
        } else if i % 2 == 0{
            unOdd += 1
        }
    }
    print("\(odd) нечетных чисел")
    print("\(unOdd) четных чисел")
    print("\(low10) однозначных чисел")
    print("\(upper9) двузначных чисел")
}
array1(array: [2,8,7,9,10,13])

// HW 4.2 На вход функции массив чисел. Верните этот же массив, но с увеличенными на 10% элементами

func array(array: [Double]) -> [Double] {
    return array.map{$0 * 1.1}
}

array(array: [5,2,4,3,6])


// HW 4.3 Простое число - число, которое делится без остатка на само себя и на 1. Напишите функцию, принимающую на вход целое число и определяющее, простое оно или нет.  ( 7 - простое, 9 - не простое )

func value(arg: Int) -> Bool{
    var match = 0
    for i in 1...arg {
        if arg % i == 0{
            match += 1
        }
    }
    if match == 2 {
        return true
    } else {
        return false
    }
}



// HW 4.4 Напишите функцию, принимающую на вход массив целых чисел. Используя функцию из п.3 верните массив простых чисел из массива. Оценить сложность поиска простых чисел в массиве таким способом

func simpleArray(array:[Int]) -> [Int] {
    var arr = [Int]()
    for i in array {
        if value(arg: i) == true{
            arr.append(i)
        }
    }
    return arr
}

simpleArray(array: [2,7,6,4,12])

// Hw 4.5 То же, но верните массив не простых чисел.

func unsimpleArray(array:[Int]) -> [Int] {
    var arr = [Int]()
    for i in array {
        if value(arg: i) == false{
            arr.append(i)
        }
    }
    return arr
}

unsimpleArray(array: [2,7,6,4,12])


// Hw 4.6 Напишите функцию, возвращающую среднее арифметическое элементов массива

func countMidle(array: [Double]) -> Double {
    var variable = 0.0
    for i in array{
        variable += i
    }
    variable = variable / Double(array.count)
    return variable
}

countMidle(array: [5,5,4,3])


// HW 4.7 На вход функции 2 массива. Первый - имена [“Петя”, “Гриша”, “Никола”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Петя - за 10 минут, Гриша - 6 минут, Никола - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого. (НЕ сделано)

func arrays(array1: [String], array2:[Int]){
//    var tuple: (nameMin: String, timeMin: Int, nameMax: String, timeMax: Int)
//
    var max = array2[0]
    var min = array2[0]

    for i in array2{
        if i >= max {
            max = i
        }
    }
    for b in array2{
        if b <= min {
            min = b
        }
    }
    
print("Самый медленный \(array1[0]) - \(min) минут, самый быстрый = \(array1[2]) - \(max)")
    
}

arrays(array1: ["Петя", "Гриша", "Никола"], array2: [10,6,25])

// HW 4,8 На вход функции 2 аргумента - искомое число и массив целых чисел. Вернуть true, если искомое число находится на первом или на последнем месте в массиве

func function(arg: Int, array: [Int]) -> Bool {
    if arg == array.first || arg == array.last {
        return true
    } else {
        return false
    }
}



// HW 4.9 На вход функции массив целых чисел. Вернуть true, если массив длины 1 или у него равны последний и первый элементы

func array2(array: [Int]) -> Bool {
    if array.count == 1 || array.first == array.last {
        return true
    } else {
        return false
    }
}



// Hw 4.10 На вход функции 2 массива целых чисел. Вернуть true, если у них одинаковые последние ИЛИ первые элементы. Длина массивов произвольная и не обязательно одинаковая

func array3(array1: [Int], array2: [Int]) -> Bool {
    if array1.first == array2.first || array1.last == array2.last {
        return true
    } else {
        return false
    }
}

// HW 4.11 СЛОЖНА На вход функции - массив целых чисел. Вернуть его циклически сдвинутую копию на 1 элемент влево. Пример: [1,2,3,4,5] -> [5,1,2,3,4]

func cycle(array: [Int]) -> [Int] {
    var array1 = array
    array1.insert(array1.last!, at: 0)
    array1.removeLast()
    return array1
}

cycle(array: [1,2,3,4,5])
 
// HW 4.12 ОЧЕНЬ СЛОЖНА Усложнить функцию из п.11 - добавить в функцию еще аргумент - показывающий, на сколько элементов циклически надо сдвинуть элементы массива.

func cycle1(array1: [Int], num: Int) -> [Int] {
    var emptyArray = array1
    for _ in 1...num{
        emptyArray = cycle(array: emptyArray)
    }
    
    return emptyArray
}

cycle1(array1: [1,2,3,4,5], num: 3)

// HW 4.13 Средняя скорость транспорта - Y km/h Расход топлива - M литров на 100км. Написать функцию, рассчитывающую расход топлива за Т часов работы. Как водится - Y, M, T - аргументы функции

func count(speed: Double, hours: Double, volume: Double) -> Double {
    var result: Double
    result = ((speed * hours) * volume) / 100
    
    return result
}

count(speed: 80, hours: 6, volume: 10)

// HW 4.14 На вход функции массив целых чисел. Вернуть целое число - разницу между максимальным и минимальным элементом массива

func array4(array: [Int]) -> Int {
    var a = array[0]
    var b = array[0]
    for i in array {
        if i >= a {
            a = i
            print(a)
        } else if i <= b {
            b = i
        }
    }
    return a - b
}

array4(array: [2,14,4,5,1])
