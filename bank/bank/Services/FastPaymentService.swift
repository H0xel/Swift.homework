import Foundation

class FastPaymentsService {
    
    var banks = [MoneyReciever & MoneySender]()
    
    func send(from: Phone, summ: Float, to: Phone) throws {
        
            do {
                try banks.forEach{
                try $0.send(from: from, summ: summ)
                }
            } catch {
                
        }
    }
    func register(bank: MoneyReciever & MoneySender) {
        banks.append(bank)
    }
}
