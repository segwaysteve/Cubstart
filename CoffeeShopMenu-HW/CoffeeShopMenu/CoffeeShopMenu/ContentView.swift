//
//  ContentView.swift
//  CoffeeShopMenu
//
//  Created by Enya Do on 2/22/23.
//

import SwiftUI

//PART 1A: Uncomment the section below

class Coffee: ObservableObject, Identifiable {
    var itemNum: Int
    
    var drinkName: String
        
    var drinkType: String
    
    var price: Double
    
    @Published var quantity: Int
    
    //Complete the class constructor
    init(itemNum: Int, drinkName: String, drinkType: String, price: Double) {
        self.itemNum = itemNum
        self.drinkName = drinkName
        self.drinkType = drinkType
        self.price = price
        self.quantity = 0
    }
}


struct ContentView: View {
    //PART 1B: Initialize objects of the Coffee class aka "menu items" below
    @StateObject var c9 = Coffee(itemNum: 1, drinkName: "Cloud Nine", drinkType: "Vanilla Latte", price: 4)
    @StateObject var sd = Coffee(itemNum: 2, drinkName: "Sweet Dreams", drinkType: "Caramel Macchiato", price: 5)
    @StateObject var wu = Coffee(itemNum: 3, drinkName: "Wake Up", drinkType: "Pure Espresso", price: 4.5)
    @StateObject var ti = Coffee(itemNum: 4, drinkName: "The Introduction", drinkType: "Iced Americano", price: 4.75)
    
    //PART 4A - Instantiate variables that will help us calculate and display the total price
    @State private var totalPrice = 0.0
    @State private var currentPrice = 0.0
    @State private var showPrice = false

    //PART 2A  - Uncomment the section below
    @State private var coffeeList: [Coffee] = []
    
    //Helpter Function to be called when body is run that will add objects to coffeeList
    func addListItems() {
        coffeeList = [c9, sd, wu, ti] //Add your objects to your list here!
    }
    
    // PART 3D: Helper function that updates currentPrice
    func updateCurrentPrice() {
        currentPrice = totalPrice
    }
    
    let lavender = Color(red: 177 / 255, green: 159 / 255, blue: 249 / 255)
    let lilac = Color(red: 200 / 255, green: 157 / 255, blue: 216 / 255)
    let ivory = Color(red: 230 / 255, green: 222 / 255, blue: 211 / 255)
    let black = Color(red: 33 / 255, green: 21 / 255, blue: 34 / 255)
    
    var body: some View {
        VStack {
            //PART 2C: EDIT THE TITLE AND ADD A SUBTITLE BELOW
            Text("Cool Beans").foregroundColor(lilac).font(.largeTitle).bold()
            Text("For the Basics").foregroundColor(lilac).padding(.bottom).italic()
            
            VStack {
                //PART 2C: ADD SOME MENU HEADERS IN THE HSTACK BELOW
                 HStack {
                     Text("Drink Name").foregroundColor(lilac)
                     Spacer()
                     Text("Quantity").foregroundColor(lilac)
                 }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 70))
                     .bold()
                
                //PART2B: DISPLAYING OUR MENU ITEMS
                ForEach(coffeeList) {i in
                    HStack {
                        VStack(alignment: .leading) {
                  
                            //Formats the price to a double containing 2 digits after the decimal point
                            let formattedPrice = String(format: "%.2f", i.price)
                            
                            //Display itemNum and drinkName
                            Text(String(i.itemNum) + ". " + i.drinkName).foregroundColor(lavender)
                            
                            //Display drinkType and
                            Text("    " + i.drinkType + ", $" + formattedPrice).foregroundColor(lavender).italic()
                        }.padding(.bottom, 10)
                        Spacer()
                        
                        //PART 3A: Decrement Buttom - Uncomment the section below
                        Button("-", action: {
                            if (i.quantity > 0) {
                                i.quantity -= 1
                                //3C: Add a line of code to update the totalPrice variable below
                                totalPrice -= i.price
                            }
                        }).foregroundColor(ivory).padding(.bottom, 20)
                        
                        //PART 2B: Display the quantity of each item
                        VStack(alignment: .leading) {
                            Text(String(i.quantity)).foregroundColor(lavender)
                        }.padding(.bottom, 20)
                
                        //PART 3A: IMPLEMENT YOUR INCREMENT BUTTON IN THE SPACE BELOW
                        Button("+", action: {
                            i.quantity += 1
                            //3C: Add a line of code to update the totalPrice variable below
                            totalPrice += i.price
                        }).foregroundColor(ivory).padding(.bottom, 20)
                
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 70))
                }.padding(.bottom, 15)
                
                //PART 3D - Implement totalPrice displaying button, Uncomment the section below
                VStack {
                    Button("Calculate Total Price", action: {
                        //IMPLEMENT THE FUNCTIONALITY OF THE BUTTON NELOW
                        updateCurrentPrice()
                        showPrice = true
                    }).buttonStyle(.automatic)
                        .foregroundColor(lilac)
                        .font(.system(size: 20))
                        .padding(.bottom, 5)
                        .bold()
                 
                    //Formats the currentPrice to a double containing 2 digits after the decimal point
                    let formattedTotalPrice = String(format: "%.2f", currentPrice)
                    
                    if showPrice {
                        //UPDATE THE EMPTY TEXT TO DISPLAY THE TOTAL PRICE WHEN SHOWPRICE IS TRUE
                        Text(String(formattedTotalPrice)).foregroundColor(lavender)
                    }
                }.padding(.top, 30)
            }
            Spacer()
        }.background(black)
            .onAppear(perform: addListItems)
    }
}


// This code generates a live content preview, feel free to delete it and use build instead to view your app!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
