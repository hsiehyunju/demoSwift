//
//  UserModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

struct UserModel: Codable {
    let objectId: String
    let username: String
    let code: String
    let isVerifiedReportEmail: Bool
    let reportEmail: String
    let createdAt: String
    let updatedAt: String
    let timezone: Int
    let parameter: Int
    let ACL: [String: Permissions]
    let sessionToken: String
    
    struct Permissions: Codable {
        let read: Bool
        let write: Bool
    }
}
