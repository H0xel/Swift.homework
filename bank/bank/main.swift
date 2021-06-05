import Foundation

let assembly1 = BankAssembly()
var storageBank = assembly1.storagesAssembly.inMemory.get(key: "clients")
let bank = assembly1.bank

let testclient1 = bank.createClient(name: "John", secondName: "John", lastName: "John", email: "John", phone: Phone(countryCode: 7, numberPhone: 2131241), address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))



let depositProduct = bank.createDepositProduct(user: testclient1)



//if let data1 = assembly1.storagesAssembly.inMemory.get(key: "clients") {
//    let data2 = String(data: data1, encoding: .utf8)
//    print(data2)
//}


//print(storageBank.get(key: "clients"))

print(storageBank)


