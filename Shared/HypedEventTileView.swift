//
//  HypedEventTileView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 10/02/21.
//

import SwiftUI

struct HypedEventTileView: View {
    
    var hypedEvent: HypedEvent
    
    var body: some View {
        VStack(spacing:0) {
            if let image = hypedEvent.image() {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Rectangle()
                .foregroundColor(hypedEvent.color)
                .frame(height:15)
            
            HStack {
                Text(hypedEvent.title)
                    .font(.title)
                    .padding()
                Spacer()
            }
            .background(Color.white)

            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.red)
                Text(hypedEvent.dateAsString())
                    .font(.body)
                Spacer()
                Text(hypedEvent.timeFromNow())
                Image(systemName:"clock.fill")
                    .foregroundColor(.blue)
            }
            .font(.title3)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            
            //Circle().foregroundColor(hypedEvent.color)
        }
        .cornerRadius(10)
        .shadow(radius:10)
        .padding()
        
    }
}

struct HypedEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventTileView(hypedEvent: testHypedEvent1)
            .previewLayout(.sizeThatFits)
    }
}
