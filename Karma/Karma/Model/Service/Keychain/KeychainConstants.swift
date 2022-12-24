//
//  KeychainConstants.swift
//  Karma
//
//  Created by efvo on 24.12.2022.
//

import Foundation

public struct KeychainConstants {
    
    public static var accessGroup: String { return toString(kSecAttrAccessGroup) }
    public static var accessible: String { return toString(kSecAttrAccessible) }
    public static var attrAccount: String { return toString(kSecAttrAccount) }
    public static var attrSynchronizable: String { return toString(kSecAttrSynchronizable) }
    public static var klass: String { return toString(kSecClass) }
    public static var matchLimit: String { return toString(kSecMatchLimit) }
    public static var returnData: String { return toString(kSecReturnData) }
    public static var valueData: String { return toString(kSecValueData) }
    public static var returnReference: String { return toString(kSecReturnPersistentRef) }
    public static var returnAttributes: String { return toString(kSecReturnAttributes) }
    public static var secMatchLimitAll: String { return toString(kSecMatchLimitAll) }
    
    static func toString(_ value: CFString) -> String {
        return value as String
    }
    
}
