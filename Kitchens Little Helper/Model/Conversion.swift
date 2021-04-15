//
//  Conversion.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 15/04/2021.
//

import Foundation
import RealmSwift

class Conversion: Object {
    @objc dynamic var image: String = ""
    @objc dynamic var fromValue: String = ""
    @objc dynamic var fromUnit: String = ""
    @objc dynamic var toUnit: String = ""
    @objc dynamic var result: String = ""
    
}
