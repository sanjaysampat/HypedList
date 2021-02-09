//
//  HypedListTabView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

struct HypedListTabView: View {
    var body: some View {
        TabView {
            Text("Hello 1")
                .tabItem {
                    Text("Upcoming")
                }
            Text("Hello 2")
                .tabItem {
                    Text("Discover")
                }
            Text("Hello 3")
                .tabItem {
                    Text("Past")
                }
        }
    }
}

struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}