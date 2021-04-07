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
}

func square(arg: Circle) -> Double {
    let circleSquare = Double.pi * pow(circleObject.radius, 2)
    return circleSquare
}

var circleObject = Circle(radius: 3)

square(arg: circleObject)

//HW 5.3 Создать структуру Human с 2 свойствами - имя и возраст. Создать массив из 20 людей. Написать функцию, принимающую на вход этот массив и печатающую имена людей


struct Human {
    var name: String
    var age: Int
}

var humanArray = [Human(name: "Vasya", age: 25),
                  Human(name: "Victor", age: 30),
                  Human(name: "Oleg", age: 44),
                  Human(name: "Igor", age: 25),
                  Human(name: "Nikita", age: 28),
                  Human(name: "Stepan", age: 12),
                  Human(name: "Aleksei", age: 14),
                  Human(name: "Aleksandr", age: 15),
                  Human(name: "Vasya", age: 18),
                  Human(name: "Ivan", age: 67),
                  Human(name: "John", age: 87),
                  Human(name: "James", age: 12),
                  Human(name: "Johnatan", age: 7),
                  Human(name: "Ivi", age: 4),
                  Human(name: "Olga", age: 6),
                  Human(name: "Svetlana", age: 55),
                  Human(name: "Nikita", age: 21),
                  Human(name: "Ruslan", age: 78),
                  Human(name: "Ilya", age: 12),
                  Human(name: "Magomed", age: 35)]

func printNames(array: [Human]){
    for i in array {
        print(i.name)
    }
}



//HW 5.4СЛОЖНА Написать функцию, печатающую имя самого старшего человека из п.3



func printOldestName(array: [Human]){
    var variable = humanArray[0].age
    var oldsetName = humanArray[0].name
    for i in array {
        if i.age >= variable {
            variable = i.age
            oldsetName = i.name
        }
    }
    print(oldsetName)
}



printOldestName(array: humanArray)

//HW 5.5 Решить задачу из предыдущей домашки - п.7 с помощью структур

// HW 4.7 На вход функции 2 массива. Первый - имена [“Петя”, “Гриша”, “Никола”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Петя - за 10 минут, Гриша - 6 минут, Никола - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.

struct HumanRunTime {
    var name: String
    var time: Int
}

var arrayHuman = [HumanRunTime(name: "Петя", time: 10),
            HumanRunTime(name: "Гриша", time: 6),
            HumanRunTime(name: "Никола", time: 25),]

func speed(array: [HumanRunTime])  {
    var speed = arrayHuman[0].time
    var name = arrayHuman[0].name
    for slow in array {
        if slow.time >= speed {
            speed = slow.time
            name = slow.name
        }
    }
    print("Самый медленный \(name) с времнем \(speed)")
    
    for fast in array {
        if fast.time <= speed {
            speed = fast.time
            name = fast.name
        }
    }
    print("Самый быстрый \(name) с времнем \(speed)")
}

speed(array: arrayHuman)
