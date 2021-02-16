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

class HypedEvent:ObservableObject, Identifiable, Codable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case url
        case color
        case imageData
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(date, forKey: CodingKeys.date)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(url, forKey: CodingKeys.url)
        try container.encode(CommonUtils.HexStringFromUicolor(theUicolor: UIColor(color)), forKey: CodingKeys.color)
        try container.encode(imageData, forKey: CodingKeys.imageData)

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        let colorHex = try values.decode(String.self, forKey: .color)
        color = Color(CommonUtils.uicolorFromHexString(theHexString: colorHex) ?? UIColor.clear)
        imageData = try? values.decode(Data.self, forKey: .imageData)

    }
    
    init() {
        
    }
    
    func image() -> Image? {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        if date.compare(.isThisYear) {
            formatter.dateFormat = "MMM d"
        } else {
            formatter.dateFormat = "MMM d yyyy"
        }
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
    hypedEvent.date = Date() + 4.days + 1.years
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
