//
//  AddTask.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini
//

import SwiftUI
import SwiftData

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    var task: Task?
    
    @State var name: String = ""
    @State var category: TaskCategory?
    @State var details: String = ""
    
    @State var isCompleted: Bool = false
    
    @State var showAlert: Bool = false
    
    var isEditing: Bool {
        task != nil
    }
    
    var body: some View {
        NavigationStack {
            
            VStack{
                ScrollView {
                    
                    VStack(spacing: 20) {
                                            
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Task")
                                .font(.system(.subheadline, weight: .semibold))
                                .padding(.horizontal)
                            
                            TextField("Your task name here", text: $name)
                                .padding(.horizontal)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 26)
                                        .foregroundStyle(.backgroundTertiary)
                                )
                        }
                        
                        
                        HStack(spacing: 12) {
                            
                            Image(systemName: category?.imageName ?? "list.bullet")
                                .foregroundStyle(.white)
                                .frame(width: 30, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundStyle(.accent)
                                )
                            
                            Text("Category")
                                .padding(.vertical, 11)
                            
                            Spacer()
                            
                            Menu {
                                
                                ForEach(TaskCategory.allCases) { category in
                                    
                                    Button(category.rawValue, systemImage: category.imageName) {
                                        self.category = category
                                    }
                                    
                                }
                                
                            } label: {
                                if isEditing{
                                    HStack {
                                        Text(category?.rawValue ?? "Select")
                                        Image(systemName: "chevron.up.chevron.down")
                                    }
                                }
                                
                                HStack(spacing: 16){
                                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(isCompleted ? .accent : .gray3)
                                        .frame(width: 22, height: 22)
                                    
                                    Text("Status")
                                        .padding(.vertical, 11)
                                    
                                        Spacer()
                                }
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(cornerRadius: 26)
                                        .foregroundStyle(.backgroundTertiary)
                                )
                                .onTapGesture {
                                    isCompleted.toggle()
                                }
                        }
                    }
                            
                }
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(.backgroundTertiary)
                        )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Descripton")
                                .font(.system(.subheadline, weight: .semibold))
                                .padding(.horizontal)
                            
                            TextField("More details about the task", text: $details, axis: .vertical)
                                .lineLimit(5...10)
                                .padding(.horizontal)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 26)
                                        .foregroundStyle(.backgroundTertiary)
                            )
                        }
                    }
            }
            }
        if isEditing{
            Button {
                if let task{
                    
                }
            }label: {
                Text("Delete")
                    .font(.system(.subheadline, weight: .semibold))
                    .foregroundStyle(.error)
                    .padding(.vertical,14)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(.background)
                    )
            }
        
            .padding(.top)
            .padding(.horizontal)
            .background(.backgroundSecondary)
            .navigationTitle(isEditing ? "Task details" : "New task")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Missing infos", isPresented: $showAlert, actions: {
                Button("OK", role: .cancel) {}
            })
            .onAppear {
                    if let task{
                        name = task.name
                        details = task.details
                        category = task.category
                        isCompleted = task.isCompleted
                    }
                }
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isEditing ? "Done" : "Add", systemImage: isEditing ? "checkmark" : "paperplane") {
                        
                        if let category, !name.isEmpty, !details.isEmpty {
                            let newTask = Task(name: name, details: details, category: category, isCompleted: false)
                            modelContext.insert(newTask)
                            try? modelContext.save()
                            dismiss()
                        } else {
                            showAlert = true
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
    }
}

#Preview {
    AddTask()
}
