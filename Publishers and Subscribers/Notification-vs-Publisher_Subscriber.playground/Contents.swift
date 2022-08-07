import UIKit
import Foundation

/// Notification (imperative)
func oldWay() {
    let notification = Notification.Name("MyNotification")
    let center = NotificationCenter.default

    let observer = center.addObserver(forName: notification, object: nil, queue: nil, using: { notification in
        print("DEBUG: Notification recevied!")
    })

    center.post(name: notification, object: nil)
    center.removeObserver(observer)
}

/// Combine (reactive)
func combineWay() {
    let notification = Notification.Name("MyNotification")
    let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
    
    let subscription = publisher.sink { _ in
        print("DEBUG: Notification received!")
    }
    
    NotificationCenter.default.post(name: notification, object: nil)
    subscription.cancel()
}

/// Run functions here
// oldWay()
// combineWay()
