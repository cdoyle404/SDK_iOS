//
//  ProjectDetailView.swift
//  iOS_Swift_Temp
//
//  Created by Cathal Doyle on 28/03/2025.
//

import SwiftUI

struct ProjectDetailView: View {
    var project: Project
    @State private var taskName = ""
    @State private var tasks = [String]()
    
    var body: some View {
        VStack {
            Text(project.name)
                .font(.title)
                .padding()
            
            Text(project.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            
            HStack {
                TextField("Enter Task", text: $taskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: addTask) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                }
                .padding()
            }
            
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: deleteTasks)
            }
        }
        .navigationTitle("Project Details")
    }
    
    func addTask() {
        guard !taskName.isEmpty else { return }
        tasks.append(taskName)
        taskName = ""
    }
    
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Project(name: "Marketing Campaign", description: "Q2 Marketing Strategy"))
    }
}
