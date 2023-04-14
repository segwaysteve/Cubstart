//
//  ContentView.swift
//  hw8
//
//  Created by Andy Huang on 3/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                q1().tabItem {
                    Image(systemName: "circle")
                    Text("Circle")
                }
                
                q2().tabItem {
                    Image(systemName: "square")
                    Text("Square")
                }
                
                q3().tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Coinflip")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
