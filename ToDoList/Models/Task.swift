//
//  Task.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID = UUID()
    var name: String
    var details: String
    var category: TaskCategory
    var isCompleted: Bool
    
    
    init(name:String, details:String, category:TaskCategory, isCompleted:Bool){
        self.name = name
        self.details = details
        self.category = category
        self.isCompleted = isCompleted
    }
}
