//
//  Habit.swift
//  NinetyDays
//
//  Created by Diego Martin on 10/24/23.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
