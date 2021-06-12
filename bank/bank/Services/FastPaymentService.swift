import Foundation

class FastPaymentsService {
    
    
    var banks = [MoneyReciever & MoneySender]()
    
    
    
    func send(from: Phone, summ: Float, to: Phone) throws {
        
    }
    
    func register(bank: MoneyReciever & MoneySender) {
        banks.append(bank)
    }
}







