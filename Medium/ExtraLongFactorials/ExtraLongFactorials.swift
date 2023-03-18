import Foundation

func multiply(_ a: String, by b: Int) -> String{

    let temp: [Int] = a.map { Int(String($0))! * b}
    var result = ""
    var remainer = 0

    for number in temp.reversed(){
        let total = number + remainer
        remainer = total / 10
        result.insert(Character(String(total % 10)), at: result.startIndex)
    }
    while remainer > 0 {
        result.insert(Character(String(remainer % 10)), at: result.startIndex)
        remainer /= 10
    }

    return result
}

func extraLongFactorials(n: Int) -> Void {
    var result = "1"
    for number in 1...n {
        result = multiply(result, by: number)
    }
    print(result)
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

extraLongFactorials(n: n)