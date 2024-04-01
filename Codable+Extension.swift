//
//  Codable+Extension.swift
//  Loan4
//
//  Created by liufei on 2023/9/20.
//

import Foundation

extension Encodable {
    
    var toJsonData: Data? {
        return try? JSONEncoder().encode(self.self)
    }
}

extension Data {
    
    func decoded<T: Decodable>(type: T.Type) -> T? {
        return try? JSONDecoder().decode(type, from: self)
    }
}

extension Encodable {
    
    var jsonString: String? {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(self)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
            return nil
        } catch {
            return nil
        }
    }
}

extension [String: Any] {
    
    var jsonString: String? {
        guard JSONSerialization.isValidJSONObject(self) else {
            assertionFailure("invalid json object: \(self)")
            return nil
        }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
}

