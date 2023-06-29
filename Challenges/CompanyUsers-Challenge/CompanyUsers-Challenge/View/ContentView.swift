//
//  ContentView.swift
//  CompanyUsers-Challenge
//
//  Created by Robert Basamac on 29.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(user.isActive ? .green : .gray)
                        
                        Text(user.name ?? "Unknown name")
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: CachedUser.self) { user in
                UserView(user: user)
            }
        }
//        .task {
//            if viewModel.users.isEmpty {
//                await viewModel.fetchUsers()
//            }
//        }
    }
}

#Preview {
    ContentView()
}
