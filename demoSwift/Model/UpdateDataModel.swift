//
//  UpdateDataModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

struct UpdateDataModel: Codable {
    let updatedAt: String
    let role: Role
    
    struct Role: Codable {
        let op: String
        
        enum CodingKeys: String, CodingKey {
            case op = "__op"
        }
    }
}
