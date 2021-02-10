//
//  UpcomingView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    var hypedEvents: [HypedEvent] = [testHypedEvent2, testHypedEvent1] // []
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text("Nothing to look forward to 😞\nCreate an event or check out the Discover tab!")
                        .bold()
                        .multilineTextAlignment(.center)
                        
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
                    }
                }
            }
        }
        .navigationTitle("Upcoming")
        .navigationBarItems(trailing:
                                Button(action: {
                                    showingCreateView = true
                                }) {
                                    Image(systemName: "calendar.badge.plus")
                                        .font(.title)
                                }
            .sheet(isPresented: $showingCreateView) {
                CreateHypedEventView()
            }
        )
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
    }
}
