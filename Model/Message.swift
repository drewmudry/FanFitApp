//
//  Message.swift
//  FanFitApp
//
//  Created by Drew Mudry on 06/26/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    let id: String
    let fromId: String
    let toId: String
    let timestamp: Timestamp
    let username: String
    let profileImageUrl: String
    let text: String
    let fullname: String
    
    var chatPartnerId: String { return fromId == Auth.auth().currentUser?.uid ? toId : fromId }
}
