import UIKit

let runLoop = RunLoop.main
let subscription = runLoop.schedule(after: runLoop.now,
                                    interval: .seconds(2),
                                    tolerance: .microseconds(100),
                                    options: nil) {
    print("Timer fired")
}

runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
    subscription.cancel()
}
