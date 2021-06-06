import Foundation

enum MoneyServiceError: Error {
    
}

typealias MoneyService = MoneySender & MoneyReciever

class MoneyServiceImpl: MoneyService {
    func recieve(summ: Float, phone: Phone) throws {
        <#code#>
    }
    
    func send(from phone: Phone, summ: Float) throws {
        
    }
}

protocol MoneyServic {
    
}

//Логика 1 и 2 пункта будет находиться тут
//Подготовиться к ретро подумать что получилось/не получилось/что нужно улучшить в нашем процессе обучения
