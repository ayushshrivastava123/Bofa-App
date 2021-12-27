//
//  SignRequestSignerInput.swift
//  BoxSDK-iOS
//
//  Created by Artur Jankowski on 08/10/2021.
//  Copyright © 2021 box. All rights reserved.
//

import Foundation

/// Represents a type of input.
public enum SignRequestSignerInputType: BoxEnum {
    /// Signature input.
    case signature
    /// Date input.
    case date
    /// Text input.
    case text
    /// Checkbox input.
    case checkbox
    /// Custom value for enum values not yet implemented in the SDK
    case customValue(String)

    public init(_ value: String) {
        switch value {
        case "signature":
            self = .signature
        case "date":
            self = .date
        case "text":
            self = .text
        case "checkbox":
            self = .checkbox
        default:
            self = .customValue(value)
        }
    }

    public var description: String {
        switch self {
        case .signature:
            return "signature"
        case .date:
            return "date"
        case .text:
            return "text"
        case .checkbox:
            return "checkbox"
        case let .customValue(value):
            return value
        }
    }
}

/// Prefill tags are used to prefill placeholders with signer input data. Only none value field can be included.
public class SignRequestSignerInput: BoxModel {

    // MARK: - Properties

    public private(set) var rawData: [String: Any]

    /// Type of input
    public let type: SignRequestSignerInputType?
    /// Index of page that the input is on
    public let pageIndex: Int
    /// This references the ID of a specific tag contained in a file of the sign request
    public let documentTagId: String?
    /// Text prefill value
    public let textValue: String?
    /// Checkbox prefill value
    public let checkboxValue: Bool?
    /// Date prefill value
    public let dateValue: Date?

    /// Initializer.
    ///
    /// - Parameter json: JSON dictionary.
    /// - Throws: Decoding error.
    public required init(json: [String: Any]) throws {
        rawData = json
        type = try BoxJSONDecoder.optionalDecodeEnum(json: json, forKey: "type")
        pageIndex = try BoxJSONDecoder.decode(json: json, forKey: "page_index")
        documentTagId = try BoxJSONDecoder.optionalDecode(json: json, forKey: "document_tag_id")
        textValue = try BoxJSONDecoder.optionalDecode(json: json, forKey: "text_value")
        checkboxValue = try BoxJSONDecoder.optionalDecode(json: json, forKey: "checkbox_value")
        dateValue = try BoxJSONDecoder.optionalDecodeDate(json: json, forKey: "date_value")
    }
}
