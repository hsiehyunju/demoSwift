//
//  UserModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

struct UserModel: Codable {
    var objectId: String
    var username: String
    var code: String
    var isVerifiedReportEmail: Bool
    var reportEmail: String
    var createdAt: String
    var updatedAt: String
    var timezone: Int
    var parameter: Int
    var ACL: [String: Permissions]
    var sessionToken: String
    
    struct Permissions: Codable {
        let read: Bool
        let write: Bool
    }
}
