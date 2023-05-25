import Foundation

// https://www.hackerrank.com/challenges/minimum-swaps-2

func minimumSwaps(arr: [Int]) -> Int {

    var array = arr    
    var index = 0
    var swaps = 0
    
    while index < array.count - 1 {
        let correctNumber = index + 1
        if correctNumber != array[index] {
            array.swapAt(index, array[index] - 1)
            swaps += 1
        } else {
            index += 1
        }
    }

    return swaps
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let res = minimumSwaps(arr: arr)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
