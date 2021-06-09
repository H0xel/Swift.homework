import Foundation

class ServicesAssembly {
    
    var productService: ProductService {
        return ProductServiceImpl()
    }
    
    var fastPaymentService: FastPaymentsService {
        return FastPaymentsService()
    }
}


var services = ServicesAssembly()

//services.fastPaymentService.register(bank: bank1)
//services.fastPaymentService.register(bank: bank2)
//
//services.fastPaymentService.send(from: Phone(countryCode: 7, numberPhone: 999999), summ: 200, to: Phone(countryCode: 7, numberPhone: 222222222))

/*
 
 if array.containt phone from, phone to
 
 
 
 */
