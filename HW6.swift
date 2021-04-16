import Foundation

/* Есть структура Документ.
 У него id, текст, дата ( Date() ) помещения на подпись, дата подписания и флаг isSigned: Bool;
 
 Есть структура Sap , которая принимает на вход массив документов.
 
 У Sap есть метод "подписать", принимающий на вход идентификатор документа на подпись.
 
 Метод ищет нужный документ по идентификатору и ставит ему дату подписания, ставя isSigned = true.
 
 Нужно написать у Sap 2 метода - получение подписанных документов и получение неподписанных документов
 
 */




struct Document {
    let id: Int
    var text: String
    let date = Date()
    var signedDate: Date? = nil
    var isSigned: Bool = false
}

struct Sap {
    var docsArray: [Document]
    
    mutating func sign(_ id: Int){
            for i in 0..<docsArray.count {
                if docsArray[i].id == id {
                    docsArray[i].isSigned = true
                    docsArray[i].signedDate = Date()
            }
        }
    }
    func getSigned(){
        for i in docsArray where i.isSigned == true {
            print(i)
        }
    }
    func getUnsigned(){
        for i in docsArray where i.isSigned == false {
            print(i)
        }
    }
}

var array = [Document(id: 47, text: "blablabla"), Document(id: 43, text: "lalala"),
            Document(id: 54, text: "blablabla"),Document(id: 35, text: "blablabla")]






/* Структра вклад. У нее 2 поля - количество рублей и количество копеек.
 Определить руками init(), который передаются рубли и копейки. Внимание - копеек можно передать любое количество, потому если там больше 100, количество рублей увеличиваем.

 Структура банк;

- метод завести вклад - передаем туда вклад
- метод добавить бабки на вклад - к текущему вкладу добавляем еще вклад ( определить правила суммирования вкладов так, как мы делали с дробями)
- метод, вычисляющий размер вклада через n лет при m процентов годовых ( m, n - аргументы метода )
- у вклада написать метод print(), который печатает красиво вклад - 10000 руб. 34 коп.

*/

struct Deposit {
    
    var amountRubles: Int
    var amountCents: Int
    init(rubles: Int, penny: Int) {
        amountRubles = rubles + penny / 100
        amountCents = penny % 100
    }
    
    func amount() {
        print("У вклада \(amountRubles) руб. \(amountCents) коп.")
    }
}

struct Bank {
    
    var deposit: Deposit
    
    mutating func addMoney(add: Deposit){
        deposit.amountRubles = deposit.amountRubles + add.amountRubles + (deposit.amountCents + add.amountCents) / 100
        
        deposit.amountCents = (deposit.amountCents + add.amountCents) % 100
        
    }
    
    mutating func countProcent(years: Double, percent: Double){
        
        let per = pow(1 + percent / 100, years)
        let amountPenny = Int(Double(deposit.amountRubles * 100 + deposit.amountCents) * per)
        deposit.amountRubles = amountPenny / 100
        deposit.amountCents = amountPenny % 100
    }
    
    mutating func amount() {
        print("На счету \(deposit.amountRubles) руб. \(deposit.amountCents) коп.")
    }
}

var addDepo = Deposit(rubles: 140, penny: 80)

var depo = Deposit(rubles: 40, penny: 50)


var bank = Bank(deposit: depo)
bank.amount()
bank.addMoney(add: addDepo)
bank.amount()
bank.countProcent(years: 2, percent: 10)
bank.amount()


/*
 Пускай есть класс Фабрика. И ее продукция - классы стол, стул и диван.
 Фабрика имеет метод createProduct и он принимает на вход строку - «chair”, “table”,  “sofa” (или enum).  Внутри она имеет 3 свойства -  массив столов, массив стульев и массив диванов и добавляет туда соотвествующую структуру, исходя из строки в аргументе метода createProduct
 */



class Fabric {
    
    enum Product {
        case chair
        case table
        case sofa
    }
    
    var arrayTable = [Table]()
    var arrayChair = [Chair]()
    var arraySofa = [Sofa]()
    
    func createProduct(_ name: Product){
       
        if name == .chair {
            arrayChair.append(Chair())
        } else if name == .table {
            arrayTable.append(Table())
        } else {
            arraySofa.append(Sofa())
        }
    }
}

class Table {
    var material = "leather"
    var size = 100
}

class Chair {
    var material = "wood"
    var size = 50
}

class Sofa {
    var material = "cloth"
    var size = 30
}

var arrTble = [Table]()
var arrChr = [Chair]()
var arrSofa = [Sofa]()

var fabric = Fabric()

fabric.createProduct(.chair)
fabric.createProduct(.chair)
fabric.arrayChair


/*
 1. Класс "папка". В ней массив файлов.
 2. Класс файл - имеет 2 свойства - имя и текст внутри
 3. Класс "директория" имеет 2 массива - массив файлов и массив папок
 4. У директории написать метод, принимающий на вход имя файла и печатающий текст файла
 */

class Folder {
    
    var foldArray = [File]()
    init(foldArr: [File]) {
        foldArray = foldArr
    }
    
}

class File {
    
    var name: String
    var text: String
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
}

class Direction {
    
    var fileArray = [File]()
    var folderArray = [Folder]()
    
    init(fileArr: [File], foldArr: [Folder] ) {
        fileArray = fileArr
        folderArray = foldArr
    }
    
    func textPrint(fileName: String) {
        
        for i in 0..<fileArray.count{
                    if fileName == fileArray[i].name {
                        print(fileArray[i].text)
                }
            }
        
        for i in 0..<folderArray.count {
            for b in 0..<folderArray[i].foldArray.count  {
                if fileName == folderArray[i].foldArray[b].name {
                    print(folderArray[i].foldArray[b].text)
                }
            }
        }
    }
}

var fileArray = [File(name: "random", text: "asyouwish"), File(name: "random2", text: "asyouwish"),
                 File(name: "random3", text: "asyouwish"), File(name: "random4", text: "asyouwish"),
                 File(name: "random5", text: "asyouwish"), File(name: "random6", text: "asyouwish"),]

var fileArray2 = [File(name: "ran", text: "blablabla"), File(name: "ran2", text: "asyouwish"),
                 File(name: "random3", text: "asyouwish"), File(name: "random4", text: "asyouwish"),
                 File(name: "random5", text: "asyouwish"), File(name: "random6", text: "asyouwish"),]

var folder = [Folder(foldArr: fileArray), Folder(foldArr: fileArray2)]


var direction = Direction(fileArr: fileArray, foldArr: folder)

direction.textPrint(fileName: "ran")
