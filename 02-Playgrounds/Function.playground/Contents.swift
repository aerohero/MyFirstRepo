
// 함수 선언 부분
func sayHello() {
    print("Hello")
// return 없다. = 이를 void라 한다.
}

// 함수 실행 부분
sayHello()

func buildMessageFor(name: String, count: Int) -> String {
    return "\(name) has bought \(count) books"
}

let message0 = buildMessageFor(name: "Apple", count: 3)
print(message0)

func buildMessageFor(userName name: String, userCount count: Int) -> String {
    return "\(name), you are customer number \(count)"
}

let message1 = buildMessageFor(userName: "John", userCount: 100)

func buildMessageFor(_ name: String = "Customer", count: Int) -> String {
    return "\(name), you are customer number \(count)"
}

let message3 = buildMessageFor(count: 100)

let message4 = buildMessageFor("아무개", count: 100)
print(message3)
print(message4)

func displayStrings(_ strings: String...) {
    for string in strings { // strings [String]
        print(string)
    }
}

displayStrings("Hello", "World", "Swift", "Programming")

func displayStrings(_ strings: String..., counts: Int...) {
    for string in strings { // strings [String]
        print(string)
    }
    print("count: \(counts)")
}

displayStrings("Hello", "World", "Swift", "Programming", counts: 1, 2, 3)

// inout 키워드: 파라미터 값을 외부에도 적용해주는 키워드
func doubleValue(_ value: inout Int) /* -> Void */ {
    value *= 2 // value = value * 2
    print(value)
}

var myValue: Int = 10
doubleValue(&myValue)
print(myValue) // 10이 아니라, 20인 점이 포인트이다.

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let mathFunction: (Int, Int) -> Int = add
print(mathFunction(2, 3)) // 5

let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}
print(multiply(2, 3))


func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result = performOperation(4, 5, operation: multiply)
print(result)
print(performOperation(4, 5) { $0 * $1 })

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount   // 스위프트에는, 동일 단계에 있는 변수로서, 클로저 외부에 존재하는 변수는, 값이 저장되는 기능이 제공된다.
        return total
    }
    return incrementer
}

let incrementByTen = makeIncrementer(incrementAmount: 10)
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30
// 스위프트에는, 동일 단계에 있는 변수로서, 클로저 외부에 존재하는 변수는, 값이 저장되는 기능이 제공된다.
