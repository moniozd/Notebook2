//
//  ContentView.swift
//  Notebook
//
//  Created by Monika Ozdoba on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
//    observedObject --> this one is listening to changes from another one
    @ObservedObject var fileManager = MyFileManager()
    // state --> anytime the list changes the list will be updated

    @State var myList = [
        Item(title: "My first note"),
        Item(title: "My second note"),
        Item(title: "My third note"),
        Item(title: "Hello")
    ]

    @State private var color = Color.gray
    @State private var newNoteTitle = ""
    @State private var showAddNote = false
//    @State private var showEditNote = false
//    @State private var selectedNote: Item?
    
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("  NOTEBOOK")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.trailing, -5)
                Spacer()
                Button(action: {
                    self.showAddNote.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 28))
                    
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 10)
            
            NavigationView {
//                $ --> is used in another state
                List($fileManager.items){ item in
                    NavigationLink(destination: DetailView(text: item.title)){
                        Text(item.title.wrappedValue)
                    }
                }
            }
            
            .sheet(isPresented: $showAddNote) {
                VStack {
                    TextField("Enter your note", text: self.$newNoteTitle)
                        .frame(width: 350, height: 50)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 20))
                        
                    Button(action: {
                        fileManager.addItem(text: newNoteTitle)
//                        let newNote = Item(title: self.newNoteTitle)
//                        self.myList.append(newNote)
                        self.newNoteTitle = ""
                        self.showAddNote = false
                    }) {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct Item:Identifiable, Codable{
    var id = UUID()
    var title:String
}

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

