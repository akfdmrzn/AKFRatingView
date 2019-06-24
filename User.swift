//
//  User.swift
//  AKFRatingView
//
//  Created by Akif Demirezen on 24.06.2019.
//

import UIKit

public class User {

    public var id : String?
    public var salary : Int?
    
    public init(id : String,s : Int) {
        self.id = id
        self.salary = s
    }
}
