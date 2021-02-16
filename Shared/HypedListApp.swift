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
            HypedListTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    DataController.shared.loadData()
                }
        }
    }
}
