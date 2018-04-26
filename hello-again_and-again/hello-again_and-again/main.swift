
import Foundation

let currntVersionDescription = "hello-again_and-again 0.0.1"

enum How {
    case print
    case fputs
}

func sayHello(how: How, again: Bool, date: Date) {
    let hello = "Hello"

    let prefix: String
    switch how {
    case .print:
        prefix = "(print)"
    case .fputs:
        prefix = "(fputs)"
    }
    let word = ([hello] + (again ? ["again"] : [])).joined(separator: " ") + "."
    let dateText = DateFormatter.localizedString(from: date,
                                                 dateStyle: .medium,
                                                 timeStyle: .medium)
    let line = [prefix, word, "_", dateText].joined(separator: " ")
    switch how {
        case .print:
        print(line)
        case .fputs:
        fputs((line + "\n"), stderr)
    }
}

let interval: TimeInterval = 5.0
var isFirstTime = true
Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { (_) in
    let date = Date()
    sayHello(how: .print, again: !isFirstTime, date: date)
    sayHello(how: .fputs, again: !isFirstTime, date: date)
    isFirstTime = false
}).fire()
RunLoop.main.run()
