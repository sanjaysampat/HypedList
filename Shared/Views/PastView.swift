//
//  PastView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 16/02/21.
//

import SwiftUI

struct PastView: View {
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.pastHypedEvents, noEventsText: "No events of passed yet, you should add some more things!")
        .navigationTitle("Past")
     }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}
