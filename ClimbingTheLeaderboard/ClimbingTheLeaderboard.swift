import Foundation
func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    // Write your code here
    var set = Set(ranked)
    var currentLeaderboard = set.sorted(by: {return $0 > $1})
    var rank: [Int] = []

    for item in player{
            while !currentLeaderboard.isEmpty && currentLeaderboard[currentLeaderboard.count - 1] <= item {
                currentLeaderboard.removeLast()
            }
        rank.append(currentLeaderboard.count + 1)
        }
    return rank
}

let leaderboard = [100,100,50,40,40,20,10]
let player = [5,25,50,120]
print(climbingLeaderboard(ranked: leaderboard, player: player))
