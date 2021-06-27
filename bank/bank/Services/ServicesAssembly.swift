import Foundation

class ServicesAssembly {
    
    private let storage = StoragesAssembly()
    
    var productService: ProductService {
        return ProductServiceImpl()
    }
    
    var fastPaymentService: FastPaymentService {
        let fastPaymentServiceImpl = FastPaymentsServiceImpl()
        fastPaymentServiceImpl.moneyService = moneyService
        return fastPaymentServiceImpl
    }
    
    var preferencesService: PreferencesService {
        let preferencesService = PreferencesServiceImpl()
        preferencesService.storage = storage.inMemory
        return preferencesService
    }
    
    var moneyService: MoneyService {
        let moneyService = MoneyServiceImpl(userStorage: storage.userStorage,
                                            productStorage: storage.productStorage,
                                            productService: productService,
                                            preferencesService: preferencesService)
        return moneyService
    }
}

