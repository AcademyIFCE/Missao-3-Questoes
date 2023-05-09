import Foundation

// https://www.hackerrank.com/challenges/crush

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var temporary = [Int](repeating: 0, count: n+1)

    for i in 0..<queries.count {
        temporary[queries[i][0] - 1] = temporary[queries[i][0] - 1] + queries[i][2]
        temporary[queries[i][1]] = temporary[queries[i][1]] - queries[i][2]
    }

    var memory = Int.min
    var add = 0
    for time in temporary {
        add = add + time
        memory = max(memory, add)
    }

    return memory
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

var queries = [[Int]]()

for _ in 1...m {
    guard let queriesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let queriesRow: [Int] = queriesRowTemp.split(separator: " ").map {
        if let queriesItem = Int($0) {
            return queriesItem
        } else { fatalError("Bad input") }
    }

    guard queriesRow.count == 3 else { fatalError("Bad input") }

    queries.append(queriesRow)
}

guard queries.count == m else { fatalError("Bad input") }

let result = arrayManipulation(n: n, queries: queries)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
