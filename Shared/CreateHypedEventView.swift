//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Sanjay Sampat on 09/02/21.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        Form {
            Section {
                FormLabelView(labelText: "Title", systemImageName: "keyboard", backgroundColor:Color.green)
                TextField("Family Vacation", text: $hypedEvent.title)
                    .autocapitalization(.words)
            }
            
            Section {
                FormLabelView(labelText: "Date", systemImageName: "calendar", backgroundColor:Color.blue)
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime){
                    FormLabelView(labelText: "Time", systemImageName: "clock.fill", backgroundColor:Color.blue)
                }
            }
            
            Section {
                
                HStack(alignment: .center) {
                    FormLabelView(labelText: "Image", systemImageName: "camera", backgroundColor:Color.purple)
                    
                    Spacer()
                    
                    if let _ = hypedEvent.image() {
                        
                        Button(action: {
                            hypedEvent.imageData = nil
                        }) {
                            Text("Remove Image")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                    } else {
                        
                        Button(action: {
                            showImagePicker = true
                        }) {
                            Text("Pick Image")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                    }
                }
                
                if let image = hypedEvent.image() {
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    // SSNote: when there are multiple buttons in a section in the form, when we click a button, it also takes click of the nearby button. So add some spacing between them.
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(10)
                    
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageData: $hypedEvent.imageData)
            }
            
            Section {
                ColorPicker(selection: $hypedEvent.color) {
                    FormLabelView(labelText: "Color", systemImageName: "eyedropper", backgroundColor:Color.yellow)
                }
            }
            
            Section {
                FormLabelView(labelText: "URL", systemImageName: "link", backgroundColor:Color.orange)
                TextField("www.tourmyindia.com", text: $hypedEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
