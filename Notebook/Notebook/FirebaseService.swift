//
//  FirebaseService.swift
//  Notebook
//
//  Created by Monika Ozdoba on 15/02/2023.
//

import Foundation
import Firebase

class FirebaseService{
    private var db = Firestore.firestore() //gives us a database object
//    collection name
    var collection = "notes"
 
        
        init(){
            addNote(text: "Hello from Xcode")
        }
    
    func addNote(text:String){
//    new firebase document for the collection
        let doc = db.collection(collection).document()
        
//        making the dictionary, like a map in java
        var data = [String:String]()
        data["text"] = text
        doc.setData(data)
        
    }
    
}
