//
//  FirebaseReference.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-18.
//

import Foundation
import FirebaseFirestore
enum FCollectionReference : String{
    case User
    case Menu
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) ->
CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
