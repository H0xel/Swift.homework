import Foundation

struct Address: Codable {
    var country: String
    let city: String
    let street: String
    let house: String
    let flat: Int
    let floor: Int
    
//    enum CodingKeys: String, CodingKey {
//        case country
//        case city
//        case street
//        case house
//        case flat
//        case floor
//    }
//
//    func encode(from encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(country, forKey: .country)
//        try container.encode(city, forKey: .city)
//        try container.encode(street, forKey: .street)
//        try container.encode(house, forKey: .house)
//        try container.encode(flat, forKey: .flat)
//        try container.encode(floor, forKey: .floor)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        country = try container.decode(String.self, forKey: .country)
//        city = try container.decode(String.self, forKey: .city)
//        street = try container.decode(String.self, forKey: .street)
//        house = try container.decode(String.self, forKey: .house)
//        flat = try container.decode(Int.self, forKey: .flat)
//        floor = try container.decode(Int.self, forKey: .floor)
//    }
}

struct Phone: Codable {
    let countryCode: Int
    let numberPhone: Int
    
//    enum CodingKeys: String, CodingKey {
//        case countryCode
//        case numberPhone
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var conatiner = encoder.container(keyedBy: CodingKeys.self)
//        try conatiner.encode(countryCode, forKey: .countryCode)
//        try conatiner.encode(numberPhone, forKey: .numberPhone)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        countryCode = try container.decode(Int.self, forKey: .countryCode)
//        numberPhone = try container.decode(Int.self, forKey: .numberPhone)
//    }
//
}

    
struct User: Codable {
    let id: String
    let name: String
    let secondName: String
    let lastName: String
    let email: String
    let phone: Phone
    let address: Address
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case secondName
//        case lastName
//        case email
//        case phone
//        case adress
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(secondName, forKey: .secondName)
//        try container.encode(lastName, forKey: .lastName)
//        try container.encode(email, forKey: .email)
//        try container.encode(phone, forKey: .phone)
//        try container.encode(address, forKey: .adress)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        secondName = try container.decode(String.self, forKey: .secondName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        email = try container.decode(String.self, forKey: .email)
//        phone = try container.decode(Phone.self, forKey: .phone)
//        address = try container.decode(Address.self, forKey: .adress)
//    }
}



var phone2 = Phone(countryCode: 7, numberPhone: 9167654367)

var address2 = Address(country: "Russia", city: "Moscow", street: "blabla", house: "44", flat: 5, floor: 3)

var user = User(id: "45",
                name: "James",
                secondName: "Johnson",
                lastName: "Ivanov",
                email: "asda@adsad.com",
                phone: phone2,
                address: address1)


