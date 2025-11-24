//
//  ContentView.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini   
//

import SwiftUI

struct EmptyStateView: View {
    
    @Binding var addTask: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 16) {
                Image("EmptyState")
                    .imageScale(.large)
                
                VStack(spacing: 8){
                    Text("No tasks yet!")
                        .font(.system(size: 17, weight: .semibold))
                    Text("Add a new task and it will show up here.")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(.secondary)
                }
            }
            
            Button {
                addTask = true
            } label: {
                Text("Add New Task")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()

    }
}

#Preview {
    EmptyStateView(addTask: .constant(false))
}
