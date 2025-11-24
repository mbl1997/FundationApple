//
//  TaskView.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini
//

import SwiftUI

struct TaskView: View {
    
    var task: Task
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(task.isCompleted ? .accent : .gray3)
                    .frame(width: 22, height: 22)
            }
            
            Text(task.name)
                .foregroundStyle(.labelPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 11)
            
        }
        .padding(.leading)
    }
    
}

#Preview {
    TaskView(task:Task(name: "almocar", details: "no RU", category: .fitness, isCompleted: true))
}
