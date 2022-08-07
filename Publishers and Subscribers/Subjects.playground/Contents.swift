import UIKit
import Combine

enum MyError: Error {
    case someError
}

class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
}

func createPassthroughSubject() {
    let subscriber = StringSubscriber()
    
    let subject = PassthroughSubject<String, MyError>()
    subject.subscribe(subscriber)
    
    let subscription = subject.sink { completion in
        print("Received completion from sink")
    } receiveValue: { value in
        print("Received value from sink")
    }
    
    subject.send("A")
    
//    subscription.cancel() // to prevent the next value to be sent
    
    subject.send("B")
    subject.send("C") // backpressure won't receive this
}

createPassthroughSubject()
