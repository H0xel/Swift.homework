import Foundation

protocol FastPaymentService {
    func send(from: Phone, summ: Float, to: Phone) throws
}


class FastPaymentsServiceImpl: FastPaymentService {
    
    var moneyService: MoneyService! // инъекция через свойство
    
    func send(from: Phone, summ: Float, to: Phone) throws {
        try moneyService.send(from: from, summ: summ)
        try moneyService.recieve(summ: summ, phone: to)
    }
}







