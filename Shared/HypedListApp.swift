//
//  HypedListApp.swift
//  Shared
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

@main
struct HypedListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
