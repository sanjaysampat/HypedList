//
//  HypedEvent.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import Foundation
import SwiftUI
import SwiftDate

// Data model for HypedEvent 

class HypedEvent:ObservableObject, Identifiable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
    func image() -> Image? {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }
    
    func timeFromNow() -> String {
        return date.toRelative()
    }
    
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    if let image = UIImage(named: "img-0"), let data = image.pngData() {
        hypedEvent.imageData = data
    }
    hypedEvent.title = "appointment with Sanjay and his friends at a restaurent."
    hypedEvent.color = .green
    hypedEvent.url = "https://github.com/sanjaysampat"
    hypedEvent.date = Date() + 4.days
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    hypedEvent.title = "visit to Dentist"
    hypedEvent.color = .red
    hypedEvent.url = "https://en.wikipedia.org/wiki/Dentist"
    hypedEvent.date = Date() + 2.hours + 23.minutes
    return hypedEvent
}
