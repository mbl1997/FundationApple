//
//  ToDoList_FoudationsApp.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini
//

import SwiftUI
import SwiftData

@main
struct ToDoList_FoudationsApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }.modelContainer(for: Task.self)
    }
}
