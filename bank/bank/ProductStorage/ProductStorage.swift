
import Foundation

protocol ProductStorage {
    
    func addProduct(user: User, product: Product)
    // func getProducts(user: User) -> [Product]
}

class ProductStorageImpl: ProductStorage {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func addProduct(user: User, product: Product) {
        
        guard let productData = storage.get(key: "products_of_user_\(user.id)") else {
            let array = [product]
            
            do {
                let arrayData = try JSONEncoder().encode(array)
                storage.set(data: arrayData, key: "products_of_user_\(user.id)")
            } catch {
                print("JSONEncoder error \(error)")
            }
            
            return
        }
        
        do {
            var productArray = try JSONDecoder().decode([Product].self, from: productData)
            
            var id = productArray.filter{ $0.id != user.id }
            
            for i in productArray {
                if i.id != product.id {
                    productArray.append(product)
                }
            }
        }
        catch {
            print("JSONDecoder error \(error)")
        }
    }
}


enum CustomError: Error {
    case evenNumber
    case error2(Error)
    case error3
}

func someFunc(arg: Int) throws -> Int  {
    if arg % 2 == 0 {
        throw CustomError.evenNumber
    } else {
        return arg
    }
}

func someFunc1(arg: Int) -> Int? {
    if arg % 2 == 0 {
        return nil
    } else {
        return arg
    }
}


