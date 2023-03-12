//
//  MazeLocationView.swift
//  hw4
//
//  Created by Andy Huang on 3/3/23.
//

import SwiftUI

/* A view that is presented when a player is somewhere in the maze. */
struct MazeLocationView: View {
    // The previous action taken to get here.
    @State var previous_action: String
    
    // See ContentView for variable descriptions.
    @Binding var navPath: NavigationPath
    @Binding var currentPath: [String]
    @Binding var solutionPath: [String]
    @Binding var solutionPathString: String
    @Binding var currentPathString: String
    
    /* If false, user is moving forward into this location.
     If true, the next time this location is visited, it will be considered a backtrack-move.
     */
    @State var backtrack: Bool = false
    
    
    var body: some View {
        VStack {
            // TODO: Display message that user has entered the maze OR their previous move and current path.
            if (previous_action == "Enter") {
                Text("Welcome to your demise.")
            }
            else {
                Text("You chose to go " + previous_action).padding()
                Text("You have currently gone " + currentPathString)
            }
            
            Spacer()
            
            // TODO: Text that makes player nervious about picking their next move.
            Text("Be careful where you choose to go next.").padding()
            
            // TODO: Explore Up Button + actions
            Button("Up") {
                backtrack = true
                currentPath.append("Up")
                navPath.append("Up")
            }.padding()
            
            HStack {
                // TODO: Explore Left Button
                Button("Left") {
                    backtrack = true
                    currentPath.append("Left")
                    navPath.append("Left")
                }.padding()
                
                // TODO: Explore Right Button
                Button("Right") {
                    backtrack = true
                    currentPath.append("Right")
                    navPath.append("Right")
                }.padding()
            }
            
            // TODO: Explore Down Button
            Button("Down") {
                backtrack = true
                currentPath.append("Down")
                navPath.append("Down")
            }.padding()
            
            Spacer()
            Spacer()
            
            // Display the answer at the bottom for debugging/testing purposes.
            Text(solutionPath.joined(separator: "->"))
        }
        .onAppear {
            // TODO: Implement Backtracking
            if backtrack {
                _ = currentPath.popLast()
                backtrack = false
            }
            
            // Refresh the currentPathString variable to reflect new current path whether visiting or backtracking.
            currentPathString = currentPath.joined(separator: "->")
        }
    }
}

struct MazeLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
