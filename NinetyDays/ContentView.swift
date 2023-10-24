//
//  ContentView.swift
//  NinetyDays
//
//  Created by Diego Martin on 10/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitList = HabitList(habits: [Habit(title: "Check Habits List", description: "See what habits I should continue")])
    @State private var isSheetPresenting = false
    
    var body: some View {
        NavigationStack {
            List(habitList.habits) { habit in
                VStack(alignment: .leading) {
                    Text(habit.title)
                        .font(.headline)
                    Text(habit.description)
                        .font(.callout)
                }
            }
            .toolbar {
                Button {
                    isSheetPresenting.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isSheetPresenting) {
                SheetView(habitList: habitList)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
