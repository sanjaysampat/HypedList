//
//  UpcomingView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    //var hypedEvents: [HypedEvent] = [testHypedEvent2, testHypedEvent1] // []
    
    var body: some View {
        HypedEventListView(hypedEvents: data.hypedEvents, noEventsText: "Nothing to look forward to 😞\nCreate an event or check out the Discover tab!")
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
        Text("")
        //UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
    }
}
