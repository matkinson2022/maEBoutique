//
//  Article.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-18.
//

import Foundation
import SwiftUI

enum Category: String,CaseIterable,Codable,Hashable {
    case carrot
    case cucumber
    case tomato
}
//Fonction pour parcourir le tableau et transférer les données dans Firebase
func createMenu(){
    for article in articleData{
        FirebaseReference( .Menu).addDocument(data: articleDictionnaryFrom(article: article))
    }
}

struct Article: Identifiable,Hashable {
    var id: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double
}

let articleData = [
    //BAGUES
    Article(id: UUID().uuidString, name: "Metro Cucumber", imageName: "m-cucumber", category: Category.cucumber, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur bibendum turpis et sagittis. Suspendisse potenti. Vestibulum vitae pellentesque est, at consequat dui.", price: 139.50),
    
    Article(id: UUID().uuidString, name: "Loblaws cucumber", imageName: "l-cucumber", category: Category.cucumber, description: "Donec sit amet tellus pretium ante interdum facilisis. Maecenas at tortor egestas, suscipit ex pharetra, ullamcorper velit. Quisque vel leo sit amet dui suscipit consectetur. Aliquam pulvinar sem a arcu porttitor, sed imperdiet sem bibendum..", price: 120.00),
    
    Article(id: UUID().uuidString, name: "No frills cucumber", imageName: "n-cucumber", category: Category.cucumber, description: "Nullam ac cursus augue. Donec malesuada massa a libero feugiat, id rhoncus nunc posuere. Suspendisse nec luctus ipsum. Nullam et aliquet enim. Etiam vel ante blandit, volutpat sapien vitae, placerat turpis.", price: 140.50),
    
    Article(id: UUID().uuidString, name: "Metro carrot", imageName: "m-carrot", category: Category.carrot, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 90.50),
    
    Article(id: UUID().uuidString, name: "loblaws carrot", imageName: "l-carrot", category: Category.carrot, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 138.50),
    Article(id: UUID().uuidString, name: "nofrills carrot", imageName: "n-carrot", category: Category.carrot, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 100.50),
    Article(id: UUID().uuidString, name: "tomato metro", imageName: "m-tomato", category: Category.tomato, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 200.50),
    Article(id: UUID().uuidString, name: "tomato loblaws", imageName: "l-tomato", category: Category.tomato, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 180.50),
        
    Article(id: UUID().uuidString, name: "tomato nofrills", imageName: "n-tomato", category: Category.tomato, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 450.00),
    
    
]


