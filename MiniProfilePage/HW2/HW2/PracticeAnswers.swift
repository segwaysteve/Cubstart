//
//  PracticeAnswers.swift
//  HW2
//
//  Created by Abinaya on 2/14/23.
//

import Foundation
import SwiftUI

let polar_bear = Animal(id: UUID(), name: "Polar Bear", color: "white", geography: "Arctic", domesticated: false, favFood: "rocks", lifespan: 15)
let kangaroo = Animal(id: UUID(), name: "Kangaroo", color: "white", geography: "Fashion Runway", domesticated: true, favFood: "human bones", lifespan: 13)
var heading = "This is a project made by {your name}"


struct AnswerView: View {
    let animals = [polar_bear, kangaroo]
    var body: some View {
            ScrollView{
                VStack {
                    ForEach(animals) { animal in
                        Text("\(heading)").font(.subheadline)
                        Text(animal.name).font(.title).bold().foregroundColor(.red)
                        Group {
                          Text("this animal is usually") +
                            Text(animal.color).foregroundColor(.gray)
                        }
                    }
                }
            }
}
}
