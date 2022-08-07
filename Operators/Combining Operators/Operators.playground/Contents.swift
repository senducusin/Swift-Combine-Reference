import UIKit
import Combine

// MARK: - Prepend
private func prepend() {
    let numbers = (1...5).publisher
    
    numbers
        .prepend(100, 101)
        .sink {
        print($0)
    }
}

// MARK: - Append
private func append() {
    let numbers = (1...10).publisher
    
    numbers
        .append(11...20)
        .sink {
            print($0)
        }
}

// MARK: - Switch to Latest
private func switchToLatest() {
    let publisher1 = PassthroughSubject<String, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
    
    publishers.switchToLatest()
        .sink {
            print($0)
        }
    
    publishers.send(publisher1)
    publisher1.send("Publisher 1 - Value 1")
    
    publishers.send(publisher2)
    publisher2.send("Publisher 2 - Value 2")
}

// MARK: - Merge
private func merge() {
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<Int, Never>()
    
    publisher1.merge(with: publisher2)
        .sink {
            print($0)
        }
    
    publisher1.send(10)
}

// MARK: - Combine latest
private func combineLatest() {
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    /// Waits for both value before doing sink
    publisher1.combineLatest(publisher2)
        .sink {
            print("P1: \($0), P2: \($1)")
        }
    
    publisher1.send(1)
    publisher2.send("Yo")
}

private func zip() {
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    /// Waits for both value before doing sink
    publisher1.zip(publisher2)
        .sink {
            print("P1: \($0), P2: \($1)")
        }
    
    publisher1.send(1)
    publisher1.send(2)
    publisher2.send("3")
    publisher2.send("Four")
}

// MARK: - Switch to latest practical example
//var index = 0
//
//private func getImage() -> AnyPublisher<UIImage?, Never> {
//    let images = ["keyboard", "airtag", "printer"]
//
//    return Future<UIImage?, Never> { promise in
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
//            print(index)
//            promise(.success(UIImage(systemName:images[index])))
//        }
//    }.map { $0 }
//        .receive(on: RunLoop.main)
//        .eraseToAnyPublisher()
//}
//
//    let taps = PassthroughSubject<Void, Never>()
//
//    let subscription = taps.map { _ in getImage() }
//        .switchToLatest().sink {
//            print($0)
//        }
//
//    taps.send()
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
//        index += 1
//        taps.send()
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
//        index += 1
//        taps.send()
//    }


// MARK: - Results
//prepend()
//append()
//switchToLatest()
//merge()
//combineLatest()
//zip()
