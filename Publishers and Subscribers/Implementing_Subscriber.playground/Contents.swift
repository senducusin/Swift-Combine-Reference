import UIKit
import Combine

class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("Received Subscription")
        
        subscription.request(.max(3)) // backPressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
}

func useStringSubscriber() {
    let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
    let subsciber = StringSubscriber()
    
    publisher.subscribe(subsciber)
}

useStringSubscriber()
