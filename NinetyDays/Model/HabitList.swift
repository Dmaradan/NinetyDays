//
//  HabitList.swift
//  NinetyDays
//
//  Created by Diego Martin on 10/24/23.
//

import Foundation

class HabitList: ObservableObject {
    @Published var habits: [Habit]
    
    init(habits: [Habit]) {
        self.habits = habits
    }
}
