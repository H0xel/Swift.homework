import Foundation



let assembly = BankAssembly()

let bank = assembly.bank
let bank2 = assembly.bank

let serviceAssembly = ServicesAssembly()
let fastPaymentService = serviceAssembly.fastPaymentService


let client1 = bank.createClient(name: "John",
                                    secondName: "John",
                                    lastName: "John",
                                    email: "John",
                                    phone: Phone(countryCode: 7, numberPhone: 998_123_45_67),
                                    address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))

let client2 = bank2.createClient(name: "Ivan",
                                    secondName: "Ivanovich",
                                    lastName: "Ivanovich",
                                    email: "test",
                                    phone: Phone(countryCode: 7, numberPhone: 999_123_45_67),
                                    address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))

var depositProduct1 = bank.createDepositProduct(user: client1)
var depositProduct2 = bank2.createDepositProduct(user: client2)

try bank.add(phone: Phone(countryCode: 7, numberPhone: 998_123_45_67), product: depositProduct1, money: 3000)

try fastPaymentService.send(from: Phone(countryCode: 7, numberPhone: 998_123_45_67),
                            summ: 100,
                            to: Phone(countryCode: 7, numberPhone: 999_123_45_67))

printData(key: "products_of_user_\(client1.id)", type: [Product].self)
printData(key: "products_of_user_\(client2.id)", type: [Product].self)
