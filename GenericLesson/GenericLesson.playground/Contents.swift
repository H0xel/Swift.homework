import UIKit

var anyArray = [Any]()

anyArray.append("something")
anyArray.append(5)
anyArray.append(2.2)

print(anyArray)

let x = anyArray[0] as? Int
let y = anyArray[1]

print(x)

// NewStroage - generic constaint

protocol NewStorage {
    associatedtype Element
    func set(_ element: Element, key: String)
    func get(key: String) -> Element?
}

extension NewStorage where Element: Equatable {
    func key(for: Element) -> String? {
        nil
    }
}

typealias StorageKey = String

protocol OldStorage {
    func set(data: Data, _ key: StorageKey)
    func get(key: StorageKey) -> Data?
}

struct OldService {
    var storage: OldStorage!
}

struct NewServcie {
    var storage: IntStorage!
}

class IntStorage: NewStorage {
    
    var dictionary: [String : Int] = [:]
    
    func set(_ element: Int, key: String) {
        dictionary[key] = element
    }
    func get(key: String) -> Int? {
        return dictionary[key]
    }
    func key(for element: Element) -> String? {
        for (key, value) in dictionary {
            if value == element {
                return key
            }
        }
        return nil
    }
}

struct SomeStruct {
    
}

//class SomeStructStorage: NewStorage {
//
//    var dictionary: [String : SomeStruct] = [:]
//
//    func set(_ element: SomeStruct, key: String) {
//        dictionary[key] = element
//    }
//    func get(key: String) -> SomeStruct? {
//        return dictionary[key]
//    }
//    func key(for element: Element) -> String? {
//        for (key, value) in dictionary {
//            if value == element {
//                return key
//            }
//        }
//        return nil
//    }
//
//}

func printSmth<T>(type: T.Type){
    print("this is type \(type)")
}

printSmth(type: Int.self)
printSmth(type: String.self)

// Почитать про статические/динамические типы и про метод dispatch, попробовать подмменить какую-нибудь assembly на assembly EasyDI

struct TestStruct<Element> {
    var array = [Element]()
}

enum MyOptional<Element> {
    case some(Element)
    case none
}

struct NewService2 {
    var storage: MyOptional<IntStorage> = .some(IntStorage())
    var storage2: Optional<IntStorage> = .some(IntStorage())
    var storage3: IntStorage? = IntStorage()
}

protocol NewestStorage {
    func set<T: Codable>(_ data: T, key: String)
    func get<T: Codable>(key: String) -> T?
}

struct NewestService {
    var storage: NewestStorage!
}

class UserDefaultsStorage: NewestStorage {
    
    let userDefaults = UserDefaults.standard
    
    func set<T: Codable>(_ data: T, key: String) {
        let data = try! JSONEncoder().encode(data)
        userDefaults.setValue(data, forKey: key)
    }
    
    func get<T: Codable>(key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        let obj = try? JSONDecoder().decode(T.self, from: data)
        return obj
    }
}

//class InMemoryStorage: NewestStorage {
//    func set<T>(_ data: T, key: String) where T : Decodable, T : Encodable {
//        <#code#>
//    }
//
//    func get<T>(key: String) -> T? where T : Decodable, T : Encodable {
//        <#code#>
//    }
//
//    var dictionary: [String:Data]
//}

struct NewestStruct: Codable, Equatable {
    let id: String
}

let struct1 = NewestStruct(id: "NewId")

UserDefaultsStorage().set(struct1, key: "struct")
let str: NewestStruct? = UserDefaultsStorage().get(key: "struct")
print(str)

let array = [1,2,3,4,5]
array.contains(3)

let array2 = [NewestStruct(id: "newId"), NewestStruct(id: "anotherID")]

enum GenericStorageError: Error {
    case valueNotFound
}

protocol GenericStorage {
    func set(data: Data, key: String)
    func get(key: String) throws -> Data
}

extension GenericStorage {
    
    func set<T: Codable>(value: T, key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data: data, key: key)
    }
    
    func value<T: Codable>(key: String) throws -> T {
        let data = try get(key: key)
        let value = try JSONDecoder().decode(T.self, from: data)
        return value
    }
}

class NewUserDefaultStorage: GenericStorage {
    func set(data: Data, key: String) {
        UserDefaults.standard.setValue(data, forKey: key)
    }
    
    func get(key: String) throws -> Data {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            throw GenericStorageError.valueNotFound
        }
        return data
    }
}

let storage = NewUserDefaultStorage()

let newStruct = NewestStruct(id: "AnotherNewId")

try storage.set(value: newStruct, key: "AnotherNewKey")
let anotherStruct: NewestStruct = try storage.value(key: "AnotherNewKey")
print(anotherStruct)
