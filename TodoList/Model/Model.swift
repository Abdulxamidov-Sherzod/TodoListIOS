//
//  Model.swift
//  Project
//
//  Created by Sherzod on 08/03/22.
//

import Foundation
import UIKit
import RealmSwift
import SwiftUI



struct UserDM {
    
    var name: String
    var surName: String
    var gender: String
}

enum Color {
    
    
    case yellow
    case green
    case red
    case purple
}


class TaskDM: Object {
    
    @objc dynamic var title: String?
    @objc dynamic var date: String?
    @objc dynamic var isDone = false
    @objc dynamic var isBell = false
    var uiColor: Color?
    
}
