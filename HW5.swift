import Foundation

//HW 5.1 Создать структуру Rectangle с 2 свойствами - длина и ширина. Написать методы вычисления периметра и площади

struct Rectangle {
    var width: Int
    var lenght: Int
    func square() -> Int {
        let square = width * lenght
        return square
    }
    func perimeter() -> Int {
        let perimeter = 2 * (lenght + width)
        return perimeter
    }
}

var count = Rectangle(width: 5, lenght: 4).perimeter()


//HW 5.2 Создать структуру Circle с 1 свойством - радиус. Написать функцию, принимающую на вход объект Circle и вычисляющую площадь окружности

struct Circle {
    var radius: Double
    func square() -> Double {
        let circleSquare = Double.pi * pow(radius, 2)
        return circleSquare
    }
}

var square = Circle(radius: 3).square()

//HW 5.3 Создать структуру Human с 2 свойствами - имя и возраст. Создать массив из 20 людей. Написать функцию, принимающую на вход этот массив и печатающую имена людей



//HW 5.4СЛОЖНА Написать функцию, печатающую имя самого старшего человека из п.3



//HW 5.5 Решить задачу из предыдущей домашки - п.7 с помощью структур
