//
//  ConverterManager.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 07/04/2021.
//

struct ConverterManager {
    var converter: Converter?
    
    var ounceToGram: Double = 28.3495231
    var poundToGram: Double = 453.59237
    
    var gramToOunce: Double = 0.0352739619
    var gramToPound: Double = 0.00220462262
//    var ounceToKilogram: Double = 0.0283495231
    
    mutating func convertUnits(value: Double, unitOne: String, unitTwo: String) {
        print(value)
        var convertedValue: Double = 0
        switch unitOne {
        //Dry Ingredients
        case "oz", "lbs":
            switch unitTwo {
            case "g":
                if unitOne == "oz" {
                    convertedValue = value * ounceToGram
                } else if unitOne == "lbs" {
                    convertedValue = value * poundToGram
                }
                
                converter = Converter(fromValue: value, fromUnit: unitOne, toUnit: unitTwo, result: convertedValue)
            case "kg":
                if unitOne == "oz" {
                    convertedValue = value * (ounceToGram / Double(1000))
                } else if unitOne == "lbs" {
                    convertedValue = value * (poundToGram / Double(1000))
                }
                
                converter = Converter(fromValue: value, fromUnit: unitOne, toUnit: unitTwo, result: convertedValue)
            default:
                converter = Converter(fromValue: 0, fromUnit: "", toUnit: "", result: 0)
            }

        case "g", "kg":
            switch unitTwo {
            case "oz":
                if unitOne == "g" {
                    convertedValue = value * gramToOunce
                } else if unitOne == "kg" {
                    convertedValue = value * (gramToOunce * Double(1000))
                }
                
                converter = Converter(fromValue: value, fromUnit: unitOne, toUnit: unitTwo, result: convertedValue)
            case "lbs":
                if unitOne == "g" {
                    convertedValue = value * gramToPound
                } else if unitOne == "kg" {
                    convertedValue = value * (gramToPound * Double(1000))
                }
                
                converter = Converter(fromValue: value, fromUnit: unitOne, toUnit: unitTwo, result: convertedValue)
            default:
                converter = Converter(fromValue: 0, fromUnit: "", toUnit: "", result: 0)
            }
        
            
        
        default:
            converter = Converter(fromValue: 0, fromUnit: "", toUnit: "", result: 0)
        }
        
        
    }
    
    func getConversionValue() -> String {
        let convertedValueFormatted =  String(format: "%.2f", converter?.result ?? 0)
        return convertedValueFormatted
    }
    
    func getFromValue() -> String {
        print(converter?.fromValue)
        
        let fromValueFormatted = String(converter?.fromValue ?? 0)
        print(fromValueFormatted)
        return fromValueFormatted
    }
    
    func getFromUnit() -> String {
        if let fromUnit = converter?.fromUnit {
            return fromUnit
        }
        return ""
    }
    
    func getToUnit() -> String {
        if let toUnit = converter?.toUnit {
            return toUnit
        }
        return ""
    }
    
    func getUnitNameOf(_ unit: String) -> String {
        switch unit {
        case "g":
            return "grams"
        case "kg":
            return "kilograms"
        case "oz":
            return "ounces"
        case "lbs":
            return "pounds"
        default:
            return ""
        }
    }
    
    
}
