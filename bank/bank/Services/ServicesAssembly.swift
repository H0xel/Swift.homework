import Foundation

class ServicesAssembly {
    var moneyService: ProductService {
        return ProductServiceImpl()
    }
    
    var fastPaymentService: FastPaymentsService {
        return FastPaymentsService()
    }
}
