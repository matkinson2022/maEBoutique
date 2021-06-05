//
//  Constants.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-18.
//

import Foundation
public let userDefaults=UserDefaults.standard

//convertir les donnes sous forme de clé-valeur
func articleDictionnaryFrom(article: Article) -> [String : Any] {
    return NSDictionary(objects: [article.id,
                               article.name,
                               article.imageName,
                               article.category.rawValue,
                               article.description,
                               article.price
                                ], forKeys: [kID as NSCopying,
                                             kNAME as NSCopying,
                                             kIMAGENAME as NSCopying,
                                             kCATEGORY as NSCopying,
                                             kDESCRIPTION as NSCopying,
                                             kPRICE as NSCopying
    ]) as! [String : Any]
}

//Articles
public let kID="id"
public let kNAME="name"
public let kCATEGORY="category"
public let kIMAGENAME="imagename"
public let kDESCRIPTION="description"
public let kPRICE="price"

//Order
public let kARTICLEIDS="articleIds"
public let kOWNERID="ownerId"
public let kCUSTOMERID="customerId"
public let kAMOUNT="amount"
public let kCUSTOMERNAME="customerName"
public let kISCOMPLETED="isCompleted"
//User

public let kFIRSTNAME="firstname"
public let kLASTNAME="lastname"
public let kFULLNAME="fullname"
public let kEMAIL="email"
public let kCURRENTUSER="currentUser"
public let kFULLADDRESS="fullAddress"
public let kPHONENUMBER="phoneNumber"
public let kONBOARD="onBoard"


//Articles
