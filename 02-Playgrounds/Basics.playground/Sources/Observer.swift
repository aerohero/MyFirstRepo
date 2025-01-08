//
//  Observer.swift
//  
//
//  Created by Sean on 1/2/25.
//

class Manager {
    var currentUserName: String = "" {
        willSet(newName) { // newValue (기본 매개변수)는 생략 가능
            print("기존 '\(currentUserName)'이 '\(newName)'으로 변경됩니다.")
        }
        didSet { // oldValue 파라미터는 생략 가능 = 기본 매개변수
            print("기존 '\(oldValue)'이 '\(currentUserName)'으로 변경되었습니다.")
        }
    }
    
    init(_ currentUserName: String) {
        self.currentUserName = currentUserName
    }
    
    func changeManage(_ name: String) {
        self.currentUserName = name
    }
}
let manager = Manager("배정만")
manager.changeManage("이재용")


/*----------------------------------
 -----------------------------------*/


enum PoolBallType: String {
    case solid
    case stripe
    case black
}

func poolBallType(forNumber number: Int) -> PoolBallType? {
    if number < 8 && number > 0 {
        return .solid
    } else if number > 8 && number < 16 {
        return .stripe
    } else if number == 8 {
        return .black
    } else {
        return nil
    }
}

func printBallDetails(ofNumber number: Int) {
    let possibleBallType = poolBallType(forNumber: number)
    if let ballType = possibleBallType {
        print("\(number) - \(ballType.rawValue)")
    } else {
        print("\(number) is not a valid pool ball number")
    }
}

let two = poolBallType(forNumber: 2)
let eight = poolBallType(forNumber: 8)
let twelve = poolBallType(forNumber: 12)

let zero = poolBallType(forNumber: 0)
let sixteen = poolBallType(forNumber: 16)

printBallDetails(ofNumber: 2) // 2 - solid
printBallDetails(ofNumber: 8) // 8 - black
printBallDetails(ofNumber: 12) // 12 - stripe
printBallDetails(ofNumber: 0) // 0 is not a valid pool ball number
printBallDetails(ofNumber: 16) // 16 is not a valid pool ball number

print("============================\n")

class PoolFrame {
    var player1BallType: PoolBallType?
    var player2BallType: PoolBallType?
}
class PoolTable {
    var currentFrame: PoolFrame?
}
func printBallTypeOfPlayer1(forTable table: PoolTable) {
    if let frame = table.currentFrame,
       let ballType = frame.player1BallType {
        print(ballType.rawValue)
    } else {
        print("Player 1 has no ball type or there is no current frame")
    }
}
// 진행 중인 프레임이 없는 테이블
let table = PoolTable()
table.currentFrame = nil
printBallTypeOfPlayer1(forTable: table)
// Player 1 has no ball type or there is no current frame
// 진행 중인 프레임이 있지만 넣은 공이 없는 테이블
let frame = PoolFrame()
frame.player1BallType = nil
frame.player2BallType = nil
table.currentFrame = frame
printBallTypeOfPlayer1(forTable: table)
// Player 1 has no ball type or there is no current frame
// 진행 중인 프레임이 있고 공이 넣어진 테이블
frame.player1BallType = .solid
frame.player2BallType = .stripe
printBallTypeOfPlayer1(forTable: table)
// solid
