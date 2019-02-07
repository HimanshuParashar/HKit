//
//  MetadataType.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public enum MetadataType: Codable {
    
    case int(Int)
    case double(Double)
    case string(String)

    public var toString: String {
        switch self {
        case .int(let num):
            return String(num)
        case .double(let num):
            return String(num)
        case .string(let num):
            return num
        }
    }
    
    public var toInt: Int {
        switch self {
        case .int(let num):
            return num
        case .double(let num):
            return Int(num)
        case .string(let num):
            return Int(num) ?? 0
        }
    }

    public var toDouble: Double {
        switch self {
        case .int(let num):
            return Double(num)
        case .double(let num):
            return num
        case .string(let num):
            return Double(num) ?? 0
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .int(container.decode(Int.self))
        } catch DecodingError.typeMismatch {
            do {
                self = try .double(container.decode(Double.self))
            } catch DecodingError.typeMismatch {
                do {
                    self = try .string(container.decode(String.self))
                } catch DecodingError.typeMismatch {
                    throw DecodingError.typeMismatch(MetadataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
                }
            }
        } catch DecodingError.dataCorrupted {
            do {
                self = try .double(container.decode(Double.self))
            } catch DecodingError.dataCorrupted {
                do {
                    self = try .string(container.decode(String.self))
                } catch DecodingError.dataCorrupted(let context) {
                    throw DecodingError.dataCorrupted(context)
                }
            }
        } catch DecodingError.keyNotFound(let key, let context) {
            Logger.log("\(key.stringValue) was not found, \(context.debugDescription)")
            throw DecodingError.keyNotFound(key, context)

        } catch DecodingError.valueNotFound(let type, let context) {
            Logger.log("no value was found for \(type), \(context.debugDescription)")
            throw DecodingError.valueNotFound(type, context)

        } catch {
            Logger.log("\(MetadataType.self) I know not this error")
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected value"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let int):
            try container.encode(int)
        case .double(let double):
            try container.encode(double)
        case .string(let string):
            try container.encode(string)
        }
    }
}
