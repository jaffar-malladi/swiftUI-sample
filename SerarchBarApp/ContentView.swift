//
//  ContentView.swift
//  SerarchBarApp
//
//  Created by Jaffar Malladi on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    @State private var rating: Int?
    let names = ["Jaffar","Malladi","chandu","Nambiar"]
    let posters = [
        "https://cdn.pixabay.com/photo/2018/04/26/16/39/beach-3352363_1280.jpg",
        "https://cdn.pixabay.com/photo/2018/04/26/16/39/beach-3352363_1280.jpg",
        "https://cdn.pixabay.com/photo/2018/04/26/16/39/beach-3352363_1280.jpg"
        
    ]
    var body: some View {
        List {
            
            SearchBar(text: $searchTerm)
            ForEach(self.names.filter({
                self.searchTerm.isEmpty ? true: $0.localizedCaseInsensitiveContains(self.searchTerm)
            }), id: \.self) { name in
                Text(name)
            }
        }
        
        List(self.posters, id: \.self) { poster in
            URLImage(url: poster)
                .aspectRatio(contentMode: .fit)
        }
        
        VStack {
            RatingView(rating: $rating)
            Text(rating != nil ? "Your rating: \(rating!)" : "")

        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
