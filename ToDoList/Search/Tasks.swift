//
//  Tasks.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini
//

import SwiftUI
import SwiftData

struct Tasks: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var tasks: [Task]
    
    @State var addTask: Bool = false
    @State var editTask: Task? = nil
    
    var groupedTasks: [TaskCategory: [Task]] {
        Dictionary(grouping: tasks, by: { $0.category})
    }
    
    var sortedCategories: [TaskCategory] {
        groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue } )
    }
    
    var body: some View {
        
        VStack {
            if tasks.isEmpty {
                EmptyStateView(addTask: $addTask)
            } else {
                
                List(sortedCategories) { category in
                    
                    HeaderView(taskCategory: category)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden, edges: .top)
                        .padding(.top, 20)
                    
                    if let categoryTasks = groupedTasks[category] {
                        ForEach(categoryTasks) { task in
                            Button{
                                editTask = task
                            } label:{
                                TaskView(task: task)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(task.id == categoryTasks.last?.id ? .hidden : .visible, edges: .bottom)
                                    .swipeActions(edge: .trailing) {
                                        Button("Delete" ,systemImage: "trash", role: .destructive) {
                                            modelContext.delete(task)
                                            try? modelContext.save()
                                        }
                                    }
                            }
                            
                        }
                        .listStyle(.plain)
                        
                    }
                }
                .sheet(isPresented: $addTask, content: {
                    AddTask(task: editTask)
                        .presentationDragIndicator(.visible)
                })
                .sheet(item: $editTask, content: { task in
                    AddTask()
                        .presentationDragIndicator(.visible)
                })
                .toolbar {
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus") {
                            addTask = true
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
                .navigationTitle("Tasks")
            }
        }
        
    }
}
    
    #Preview {
        TabBar()
    }

