//
//  SheetView.swift
//  NinetyDays
//
//  Created by Diego Martin on 10/24/23.
//

import SwiftUI

struct SheetView: View {
    @ObservedObject var habitList: HabitList
    
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var description = ""
    @State private var showingAlert = false
    @State private var alertText = ""
    
    var body: some View {
        VStack {
            Text("New Habit")
            TextField(text: $title, prompt: Text("What is your new habit called?")) {}
                .padding()
            TextField(text: $description, prompt: Text("Describe this habit")) {}
                .padding()

            Button() {
                save()
            } label: {
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
        }
        .alert("Incomplete", isPresented: $showingAlert) {
            Text(alertText)
        }
    }
    
    func save() {
        print("The title is \(title) and the description is \(description)")
        if title != "" {
            if description != "" {
                let newHabit = Habit(title: title, description: description)
                habitList.habits.append(newHabit)
                print("Should dismiss view now")
                dismiss()
            } else {
                alertText = "Give your new habit a description first!"
                showingAlert = true
            }
        } else {
            alertText = "Give your new habit a title first!"
            showingAlert = true
        }
    }
}

#Preview {
    SheetView(habitList: HabitList(habits: []))
}
