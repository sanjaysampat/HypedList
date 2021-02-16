//
//  DataController.swift
//  HypedList
//
//  Created by Sanjay Sampat on 16/02/21.
//

import Foundation
import SwiftUI
import SwiftDate

class DataController: ObservableObject {
    static var shared = DataController()
    
    @Published var hypedEvents: [HypedEvent] = []
    @Published var discoverHypedEvents: [HypedEvent] = []

    
    var upcomingHypedEvents: [HypedEvent] {
        return hypedEvents.filter {
            $0.date > Date().dateAt(.startOfDay)
        }.sorted {
            $0.date < $1.date
        }
    }
    
    var pastHypedEvents: [HypedEvent] {
        return hypedEvents.filter {
            $0.date < Date().dateAt(.endOfDay)
        }.sorted {
            $0.date > $1.date
        }
    }

    func saveData() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.hypedEvents) {
                UserDefaults.standard.setValue(encoded, forKey: "hypedEvents")
                UserDefaults.standard.synchronize()
            }
            
        }
    }
    
    func loadData() {
        DispatchQueue.global().async {
            if let data = UserDefaults.standard.data(forKey: "hypedEvents") {
                let decoder = JSONDecoder()
                if let jsonHypedEvents = try? decoder.decode([HypedEvent].self, from: data) {
                    DispatchQueue.main.async {
                        self.hypedEvents = jsonHypedEvents
                    }
                }
            }
        }
    }
    
    // create new webcontroller class if more api's
    func getDiscoverEvents() {
        if let url = URL(string: "https://api.jsonbin.io/b/5f7e1e0565b18913fc5c408c/latest") {
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let webData = data {
                    // [[String:Any]] is JSON Dict. of Key and Values of String
                    if let json = try? JSONSerialization.jsonObject(with: webData, options: []) as? [[String:String]] {
                        
                        var hypedEventsToAdd: [HypedEvent] = []
                        
                        for jsonHpedEvent in json {
                            let hypedEvent = HypedEvent()
                            if let id = jsonHpedEvent["id"] {
                                hypedEvent.id = id
                            }
                            if let dateString = jsonHpedEvent["date"] {
                                if let dateInRegion = dateString.toDate() {
                                    hypedEvent.date = dateInRegion.date
                                }
                            }
                            if let title = jsonHpedEvent["title"] {
                                hypedEvent.title = title
                            }
                            if let url = jsonHpedEvent["url"] {
                                hypedEvent.url = url
                            }
                            if let colorHex = jsonHpedEvent["color"] {
                                hypedEvent.color = Color( CommonUtils.uicolorFromHexString(theHexString: colorHex) ?? UIColor.clear )
                            }
                            if let imageURL = jsonHpedEvent["imageURL"] {
                                //hypedEvent.id = id
                            }
                            hypedEventsToAdd.append(hypedEvent)
                        }
                        DispatchQueue.main.async {
                            self.discoverHypedEvents = hypedEventsToAdd
                        }
                    }
                }
                
            }.resume()
        }
        // https://api.jsonbin.io/b/5f7e1e0565b18913fc5c408c/latest
    }
}
