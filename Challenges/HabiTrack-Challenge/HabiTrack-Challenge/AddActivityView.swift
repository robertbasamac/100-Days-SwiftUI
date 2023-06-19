//
//  AddActivityView.swift
//  HabiTrack-Challenge
//
//  Created by Robert Basamac on 07.06.2023.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var activityManager: ActivityManager

    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)

                } header: {
                    Text("Title")
                }

                Section {
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                } header: {
                    Text("Description")
                }
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        activityManager.addActivity(title: title, description: description)
                        dismiss()
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}


struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
