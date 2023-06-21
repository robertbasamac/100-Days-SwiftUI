//
//  DetailView.swift
//  Bookworm
//
//  Created by Robert Basamac on 21.06.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showConfirmationDialog = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing, content: {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            })
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.raiting)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("Delete book?", isPresented: $showConfirmationDialog, presenting: book, actions: { book in
            Button("Delete", role: .destructive) {
                deleteBook()
            }
            
            Button("Cancel", role: .cancel) { }
        }, message: { book in
            Text("Are you sure you want to delete \"\(book.title ?? "Unknown Title")\"?")
        })
        .toolbar {
            ToolbarItem {
                Button {
                    showConfirmationDialog = true
                } label: {
                    Label("Delete this book", systemImage: "trash")
                }
            }
        }
    }
    
    func deleteBook() {
        viewContext.delete(book)
        
        try? viewContext.save()
        
        dismiss()
    }
}

//#Preview {
//    DetailView()
//}
