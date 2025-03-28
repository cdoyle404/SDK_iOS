//
//  ProjectsView.swift
//  iOS_Swift_Temp
//
//  Created by Cathal Doyle on 28/03/2025.
//

import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    var name: String
    var description: String
}

struct ProjectsView: View {
    @State private var projects = [
        Project(name: "Marketing Campaign", description: "Q2 Marketing Strategy"),
        Project(name: "Product Launch", description: "New feature development"),
        Project(name: "Customer Support", description: "Workflow optimization")
    ]
    
    var body: some View {
        List {
            ForEach(projects) { project in
                NavigationLink(destination: ProjectDetailView(project: project)) {
                    VStack(alignment: .leading) {
                        Text(project.name)
                            .font(.headline)
                        Text(project.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete(perform: deleteProject)
        }
        .navigationTitle("Projects")
        
            Button(action: {
                let newProject = Project(name: "New Project", description: "Add description")
                projects.append(newProject)
            }) {
                Image(systemName: "plus")
            }
        
    }
    
    func deleteProject(at offsets: IndexSet) {
        projects.remove(atOffsets: offsets)
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectsView()
        }
    }
}
