//
//  DataController.swift
//  HypedList
//
//  Created by Sanjay Sampat on 16/02/21.
//

import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
    
    @Published var hypedEvents: [HypedEvent] = []
    
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
}
