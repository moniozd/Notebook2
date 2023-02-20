//
//  DetailView.swift
//  Notebook
//
//  Created by Monika Ozdoba on 08/02/2023.
//

import SwiftUI

//binding --> value that goes both directions, updating parent from the child
//state --> one direction, from variable to the gui

struct DetailView: View {
    @Binding var text: String
    var body: some View {
        TextField("", text: $text)
    }
}
    struct DetailView_Previews: PreviewProvider{
        static var previews: some View{
            DetailView(text: .constant("hi from preview"))
        }
    }

