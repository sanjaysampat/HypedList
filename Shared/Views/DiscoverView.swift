//
//  DiscoverView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 16/02/21.
//

import SwiftUI

struct DiscoverView: View {
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.discoverHypedEvents.sorted {
            $0.date < $1.date
        }, noEventsText: "Loading some awesome stuff for ya!")
        .navigationTitle("Discover")
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
