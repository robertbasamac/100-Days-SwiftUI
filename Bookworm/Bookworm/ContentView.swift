//
//  ContentView.swift
//  Bookworm
//
//  Created by Robert Basamac on 19.06.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.raiting)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, content: {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            })
                        }
                    }

                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddScreen.toggle()
                    }, label: {
                        Label("Add Book", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showAddScreen, content: {
                AddBookView()
            })
        }
    }
}

#Preview {
    ContentView()
}
