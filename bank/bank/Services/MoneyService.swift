import Foundation

enum MoneyServiceError: Error {
    case productNotFound
}

enum MoneySenderError: Error {
    case userNotFound
    case insuffisentFunds
}

enum MoneyRecieverError: Error {
    case userNotFound
    case noValidProducts
}

protocol MoneyReciever {
    func recieve(summ: Float, phone: Phone) throws
}

protocol MoneySender {
    func send(from: Phone, summ: Float) throws
}


typealias MoneyService = MoneySender & MoneyReciever


class MoneyServiceImpl: MoneyService {
    
    var userStorage: UserStorage
    var productStorage: ProductStorage
    var productService: ProductService
    
    init(userStorage: UserStorage,
         productStorage: ProductStorage,
         productService: ProductService) {
        self.userStorage = userStorage
        self.productStorage = productStorage
        self.productService = productService
    }
    
    func send(from phone: Phone, summ: Float) throws {
        let user = try userStorage.search(phone: phone)
        let productArray = productStorage.get(user: user)
        
        // try productService.remove(money: summ, product: Product)
    }
    
    func recieve(summ: Float, phone: Phone) throws {
        let user = try userStorage.search(phone: phone)
        let productArray = productStorage.get(user: user)
        
        // try productService.add(money: summ, product: <#T##Product#>)
    }
}

//Логика 1 и 2 пункта будет находиться тут
//Подготовиться к ретро подумать что получилось/не получилось/что нужно улучшить в нашем процессе обучения
