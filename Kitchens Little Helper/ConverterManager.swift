//
//  ConverterManager.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 07/04/2021.
//

struct ConverterManager {
    var converter: Converter?
    
    var ounceToGram = 28.3495231
    
    mutating func convertUnits(value: String, unitOne: String, unitTwo: String) {
        var convertedValue: Double = 0
        switch unitOne {
        case "oz":
            switch unitTwo {
            case "g":
                convertedValue = Double(value) ?? 0 * ounceToGram
                converter = Converter(value: convertedValue)
            default:
                converter = Converter(value: 0)
            }
        default:
            converter = Converter(value: 0)
        }
        
        
    }
    
    func getConversionValue() -> String {
        let convertedValueFormatted =  String(format: "%.1f", converter?.value ?? 0)
        return convertedValueFormatted
    }
    
    
}
