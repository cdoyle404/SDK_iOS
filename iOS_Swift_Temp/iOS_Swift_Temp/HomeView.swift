//
//  Untitled.swift
//  iOS_Swift_Temp
//
//  Created by Cathal Doyle on 28/03/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("XFlow")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(systemName: "flowchart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text("Track Your Workflows")
                .font(.headline)
                .padding()
            
            NavigationLink(destination: ProjectsView()) {
                Text("Get Started")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
