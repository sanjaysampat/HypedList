//
//  HypedEvent.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import Foundation
import SwiftUI

// Data model for HypedEvent 

class HypedEvent:ObservableObject {
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
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    if let image = UIImage(named: "img-0"), let data = image.pngData() {
        hypedEvent.imageData = data
    }
    hypedEvent.title = "appointment with Sanjay"
    hypedEvent.color = .green
    hypedEvent.url = "https://github.com/sanjaysampat"
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    hypedEvent.title = "visit to Dentist"
    hypedEvent.color = .red
    hypedEvent.url = "https://en.wikipedia.org/wiki/Dentist"
    return hypedEvent
}
