//
//  ContentView.swift
//  Biography
//
//  Created by Enya Do on 3/7/23.
//

import SwiftUI

let brown = Color(red: 0.671, green: 0.475, blue: 0.329)
let green = Color(red: 0.675, green: 0.729, blue: 0.678)
let white = Color(red: 0.918, green: 0.918, blue: 0.918)
let rose = Color(red: 0.78, green: 0.631, blue: 0.608)

struct ContentView: View {

    //PART 2B - Create booleans to track your sheet visibility
    @State private var showingSleep = false
    @State private var showingFood = false
    @State private var showingEnergy = false
    @State private var showingWeird = false
    
    var body: some View {
        ZStack {
            green.ignoresSafeArea()
            
            //PART1A - Design your header
            VStack {
                Text("Say Hello To").foregroundColor(brown).font(.title)
                Text("Yuzu").foregroundColor(brown).font(.title)
                Image("YUZU").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                Spacer()
            }
        }
        
        //PART1B - Add your form containing your buttons
        Form() {
            Button("Sleeping") {
                showingSleep.toggle()
            }.sheet(isPresented: $showingSleep) {
                Sleep() }.foregroundColor(rose).padding()
            Button("More Sleeping") {
                showingEnergy.toggle()
            }.sheet(isPresented: $showingEnergy) {
                MoreSleep() }.foregroundColor(rose).padding()
            Button("FOOD") {
                showingFood.toggle()
            }.sheet(isPresented: $showingFood) {
                Food() }.foregroundColor(rose).padding()
            Button("???") {
                showingWeird.toggle()
            }.sheet(isPresented: $showingWeird) {
                Weird() }.foregroundColor(rose).padding()
        }.background(green).scrollContentBackground(.hidden)
        
    }
}

//PART2A - Creating a sheet
struct Sleep: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        ZStack {
            green.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }.foregroundColor(white).padding()
                    Spacer()
                }
                
                Text("No hour of the day is safe from sleepytime!").foregroundColor(brown).font(.headline).padding()
                Image("Sleep1").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                HStack {
                    Image("Sleep3").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                    Image("Sleep6").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                }
                Text("Truly her favorite sleeping position").foregroundColor(brown).font(.headline).padding()
                Spacer()
            }
        }
        
    }
}

struct Food: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        ZStack {
            green.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }.foregroundColor(white).padding()
                    Spacer()
                }
                
                Text("For the 10% of the day she isn't sleeping, food consumes her mind").foregroundColor(brown).font(.headline).padding()
                Text("Fiend for mousse treats").foregroundColor(brown).font(.headline).padding()
                Image("Food").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                Spacer()
            }
        }
    }
}

struct MoreSleep: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        ZStack {
            green.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }.foregroundColor(white).padding()
                    Spacer()
                }
                
                Text("Her favorite activity deserves more attention").foregroundColor(brown).font(.headline).padding()
                Text("This time, featuring some more unique sleeping positions").foregroundColor(brown).font(.headline).padding()
                Image("Sleep2").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                HStack {
                    Image("Sleep4").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                    Image("Sleep5").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                }
                
                Spacer()
            }
        }
    }
}

struct Weird: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        ZStack {
            green.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }.foregroundColor(white).padding()
                    Spacer()
                }
                
                Text("Some cat activities").foregroundColor(brown).font(.headline).padding()
                Text("So weird but so cute").foregroundColor(brown).font(.headline).padding()
                HStack {
                    Image("Weird1").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                    Image("Weird2").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                }
                HStack {
                    Image("Weird3").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                    Image("Weird4").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center).clipShape(Circle())
                }
                
                Spacer()
            }
        }
    }
}

// As a reminder the code below displays a live preview of your app, feel free to comment out or delete it!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
