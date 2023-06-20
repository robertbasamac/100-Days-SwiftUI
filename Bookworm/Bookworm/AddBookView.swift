//
//  AddBookView.swift
//  Bookworm
//
//  Created by Robert Basamac on 19.06.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var raiting: Int = 3
    @State private var genre: String = ""
    @State private var review: String = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mistery", "Poetry", "Romance"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $raiting)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: viewContext)
                        
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.raiting = Int16(raiting)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? viewContext.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
