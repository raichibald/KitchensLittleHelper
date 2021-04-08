//
//  Protocols.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 07/04/2021.
//

protocol ConversionDelegate: class {
    func converterSettingsWasSet(value: String, unitOne: String, unitTwo: String)
}
