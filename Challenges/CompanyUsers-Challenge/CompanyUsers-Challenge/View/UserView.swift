//
//  UserView.swift
//  CompanyUsers-Challenge
//
//  Created by Robert Basamac on 29.06.2023.
//

import SwiftUI

struct UserView: View {
    
    var user: CachedUser
        
    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "building")
                        .symbolVariant(.fill)
                        .frame(width: 30, height: 30)
                    
                    Text(user.company ?? "Unknown company")
                        .font(.footnote)
                    
                }
                
                HStack {
                    Image(systemName: "envelope")
                        .symbolVariant(.fill)
                        .frame(width: 30, height: 30)
                    
                    
                    Text(user.email ?? "Unknown email")
                        .font(.footnote)
                }
                
                HStack {
                    Image(systemName: "house")
                        .symbolVariant(.fill)
                        .frame(width: 30, height: 30)
                    
                    Text(user.address ?? "Unknown address")
                        .font(.footnote)
                }
            } header: {
                Text("Contact")
            }
            
            Section {
                Text(user.about ?? "Unknown description")
            } header: {
                Text("About")
            }
            
            if !user.friendsArray.isEmpty {
                Section {
                    ForEach(user.friendsArray) { friend in
                        Text(friend.wrappedName)
                    }
                } header: {
                    Text("Friends")
                }
            }
        }
        .navigationTitle(user.name ?? "Unkown name")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(user.isActive ? .green : .gray)
            }
        }
    }
}
