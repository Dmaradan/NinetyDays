//
//  DetailView.swift
//  NinetyDays
//
//  Created by Diego Martin on 10/24/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var habitList: HabitList
    var habit: Habit
    
    @State private var completionHit = false
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.title2)
                .padding()
            Text(habit.description)
                .font(.callout)
            Divider()
            Text("Did you complete this today?")
                .font(.headline.bold())
                .padding(.top)
                .padding(.bottom)
            Button() {
                updateCompletions()
            } label: {
                Text("\(completionHit ? habit.completionCount + 1 : habit.completionCount)")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        }
    }
    
    func updateCompletions() {
        completionHit = true
        var newCompletions = habit.completionCount + 1
        let updatedHabit = Habit(title: habit.title, description: habit.description, completionCount: newCompletions)
        
        let index = habitList.habits.firstIndex(where: {habit.title == $0.title})
        if let foundIndex = index {
            print("Found index at \(foundIndex)")
            habitList.habits[foundIndex] = updatedHabit
        }
    }
}

#Preview {
    DetailView(habitList: HabitList(habits: []), habit: Habit(title: "Husking Corn", description: "Separating the corn from the corn husk"))
}
