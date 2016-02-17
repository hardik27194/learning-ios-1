//: Playground - noun: a place where people can play

import UIKit

// 变量
var str = "Hello, playground"
str = "Hello, Swift"

// 常量（不可修改）
let constStr = str

// 指定变量类型
var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

// 数组
var arrayOfInts: Array<Int> = [1, 2, 3]
var arrayOfInts2: [Int] = []

// Map
var dictOfCapitalsByCountry: Dictionary<String, String> = ["k1":"v1", "k2":"v2"]
var dictOfCapitalsByCountry2: [String:String] = [:]

// 集合
var winningLotteryNumbers: Set<Int>

// 根据字面量推导变量类型
let number = 42
let fmStation = 91.1

// 数组支持下标操作（如果索引出界会导致运行错误）
let countingUp = ["one", "two"]
let secondElement = countingUp[1]

// 词典也支持下标操作
let nameByParkingSpace = [13:"Alice", 27:"Bob"]
let nameOfParkingSpace13 = nameByParkingSpace[13]

// Initializer
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)
let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// Properties
countingUp.count
emptyString.isEmpty

// Optional
var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]?

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7
//let avgReading = (reading1 + reading2 + reading3) / 3  // Value of optional type 'Float?' not unwrapped.
let avgReading = (reading1! + reading2! + reading3!) / 3

if let r1 = reading1, r2 = reading2, r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil"
}

// subscripting dictionary
let space13Assignee: String? = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]

if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary")
}

// loop
for var i = 0; i < countingUp.count; i++ {
    let str = countingUp[i]
}

let range = 0..<countingUp.count
for i in range {
    let str = countingUp[i]
}

for str in countingUp {
    print(str)
}

for (i, str) in countingUp.enumerate() {
    print(i, str)
}

for (space, name) in nameByParkingSpace {
    let permit = "Space \(space) : \(name)"
}

// enum and switch
enum PieType {
    case Apple
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

let name: String
switch favoritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}

let osxVersion: Int = 0
switch osxVersion {
case 0...8:
    print("A big cat")
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
default:
    print("Greetings, people of the future! What's new in 10.\(osxVersion)?")
}