//
//  FormLabelView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

struct FormLabelView: View {
    var labelText = ""
    var systemImageName = ""
    var backgroundColor = Color.blue
    
    var body: some View {
        Label{
            Text(labelText)
        } icon: {
            Image(systemName: systemImageName)
                .padding(5)
                .background(backgroundColor)
                .cornerRadius(7)
                .foregroundColor(.white)
                
        }
    }
}

struct FormLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(labelText: "Title", systemImageName: "keyboard", backgroundColor:Color.blue)
    }
}
