//
//  TabBar.swift
//  ToDoList-Foudations
//
//  Created by Mariana Bianchini
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Tab("Tasks", systemImage: "list.bullet.rectangle.portrait.fill"){
                NavigationStack{
                    Tasks()
                }
            }
            
            
            Tab("Perfil", systemImage: "person.fill"){
                NavigationStack{
                    Profile()
                }
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search){
                NavigationStack{
                    Search()
                }
            }
            
        }
    }
}

#Preview {
    TabBar()
}
