//
//  UserModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

struct UserModel {
    var objectId: String
    var username: String
    var code: String
    var isVerifiedReportEmail: Bool
    var createdAt: Date
    var updateAt: Date
    var sessionToken: String
}
