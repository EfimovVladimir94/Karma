//
//  KeyChainManager.swift
//  Karma
//
//  Created by efvo on 24.12.2022.
//

import Foundation
import Security

public final class KeychainManager {
    
    // MARK: - Properties
    
    public private(set) var lastResultCode: OSStatus = noErr
    public var keyPrefix = ""
    public var accessGroup: String?
    public var synchronizable = false
    public var allKeys: [String] {
        var query: JSON = [KeychainConstants.klass: kSecClassGenericPassword,
                           KeychainConstants.returnData: true,
                           KeychainConstants.returnAttributes: true,
                           KeychainConstants.returnReference: true,
                           KeychainConstants.matchLimit: KeychainConstants.secMatchLimitAll]
        
        query = addAccessGroupWhenPresent(query)
        query = addSynchronizableIfRequired(query, addingItems: false)
        
        var result: AnyObject?
        
        let lastResultCode = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if lastResultCode == noErr {
            return (result as? [JSON])?.compactMap {
                $0[KeychainConstants.attrAccount] as? String } ?? []
        }
        
        return []
    }
    private let lock = NSLock()
    
    // MARK: - Initial methods
    
    public init() {
        
    }
    
    // MARK: - Save methods
    
    @discardableResult
    public func set(_ value: String, forKey key: String,
                    withAccess access: KeychainAccessType = KeychainAccessType.defaultOption) -> Bool {
        if let value = value.data(using: .utf8) {
            return set(value, forKey: key, withAccess: access)
        }
        
        return false
    }
    
    @discardableResult
    public func set(_ value: Data, forKey key: String,
                    withAccess access: KeychainAccessType = KeychainAccessType.defaultOption) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        deleteNoLock(key)
        let accessible = access.value
        let prefixedKey = keyWithPrefix(key)
        var query: JSON = [KeychainConstants.klass: kSecClassGenericPassword,
                           KeychainConstants.attrAccount: prefixedKey,
                           KeychainConstants.valueData: value,
                           KeychainConstants.accessible: accessible]
        query = addAccessGroupWhenPresent(query)
        query = addSynchronizableIfRequired(query, addingItems: true)
        
        lastResultCode = SecItemAdd(query as CFDictionary, nil)
        
        return lastResultCode == noErr
    }
    
    @discardableResult
    public func set(_ value: Bool, forKey key: String,
                    withAccess access: KeychainAccessType = KeychainAccessType.defaultOption) -> Bool {
        let bytes: [UInt8] = value ? [1] : [0]
        let data = Data(bytes)
        
        return set(data, forKey: key, withAccess: access)
    }
    
    // MARK: - Get methods
    
    public func get(_ key: String) -> String? {
        if let data = getData(key) {
            if let currentString = String(data: data, encoding: .utf8) {
                return currentString
            }
            lastResultCode = -67853
        }
        
        return nil
    }
    
    public func getData(_ key: String, asReference: Bool = false) -> Data? {
        lock.lock()
        defer { lock.unlock() }
        
        let prefixedKey = keyWithPrefix(key)
        var query: JSON = [KeychainConstants.klass: kSecClassGenericPassword,
                           KeychainConstants.attrAccount: prefixedKey,
                           KeychainConstants.matchLimit: kSecMatchLimitOne]
        if asReference {
            query[KeychainConstants.returnReference] = kCFBooleanTrue
        } else {
            query[KeychainConstants.returnData] =  kCFBooleanTrue
        }
        
        query = addAccessGroupWhenPresent(query)
        query = addSynchronizableIfRequired(query, addingItems: false)
        
        var result: AnyObject?
        
        lastResultCode = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if lastResultCode == noErr {
            return result as? Data
        }
        
        return nil
    }
    
    public func getBool(_ key: String) -> Bool? {
        guard
            let data = getData(key),
            let firstBit = data.first
        else {
            return nil
        }
        
        return firstBit == 1
    }
    
    // MARK: - Delete methods
    
    @discardableResult
    public func delete(_ key: String) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        return deleteNoLock(key)
    }
    
    @discardableResult
    private func deleteNoLock(_ key: String) -> Bool {
        let prefixedKey = keyWithPrefix(key)
        var query: JSON = [KeychainConstants.klass: kSecClassGenericPassword,
                           KeychainConstants.attrAccount: prefixedKey]
        query = addAccessGroupWhenPresent(query)
        query = addSynchronizableIfRequired(query, addingItems: false)
        
        lastResultCode = SecItemDelete(query as CFDictionary)
        
        return lastResultCode == noErr
    }
    
    @discardableResult
    public func clear() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        var query: JSON = [kSecClass as String: kSecClassGenericPassword]
        query = addAccessGroupWhenPresent(query)
        query = addSynchronizableIfRequired(query, addingItems: false)
        
        lastResultCode = SecItemDelete(query as CFDictionary)
        
        return lastResultCode == noErr
    }
    
    // MARK: - Helper methods
    
    private func keyWithPrefix(_ key: String) -> String {
        return "\(keyPrefix)\(key)"
    }
    
    private func addAccessGroupWhenPresent(_ items: JSON) -> JSON {
        guard let accessGroup = accessGroup else { return items }
        
        var result = items
        result[KeychainConstants.accessGroup] = accessGroup
        
        return result
    }
    
    private func addSynchronizableIfRequired(_ items: JSON, addingItems: Bool) -> JSON {
        if !synchronizable {
            return items
        }
        var result = items
        result[KeychainConstants.attrSynchronizable] = addingItems == true ? true : kSecAttrSynchronizableAny
        
        return result
    }
    
}

