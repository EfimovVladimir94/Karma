//
//  KeychainAccessType.swift
//  Karma
//
//  Created by efvo on 24.12.2022.
//

import Foundation

public enum KeychainAccessType {
    
    case accessibleWhenUnlocked
    case accessibleWhenUnlockedThisDeviceOnly
    case accessibleAfterFirstUnlock
    case accessibleAfterFirstUnlockThisDeviceOnly
    case accessibleWhenPasscodeSetThisDeviceOnly
    
    public static var defaultOption: KeychainAccessType {
        return .accessibleWhenUnlocked
    }
    
    var value: String {
        switch self {
        case .accessibleWhenUnlocked:
            return toString(kSecAttrAccessibleWhenUnlocked)
        case .accessibleWhenUnlockedThisDeviceOnly:
            return toString(kSecAttrAccessibleWhenUnlockedThisDeviceOnly)
        case .accessibleAfterFirstUnlock:
            return toString(kSecAttrAccessibleAfterFirstUnlock)
        case .accessibleAfterFirstUnlockThisDeviceOnly:
            return toString(kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly)
        case .accessibleWhenPasscodeSetThisDeviceOnly:
            return toString(kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly)
        }
    }
    
    func toString(_ value: CFString) -> String {
        return KeychainConstants.toString(value)
    }
    
}

