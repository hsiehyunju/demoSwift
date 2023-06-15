//
//  WebService.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

enum ServiceError: Error {
    case decodingError
    case serializationError
    case domainError
}


class WebService {
    
    func getApiBaseURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "watch-master-staging.herokuapp.com"
        return components
    }
    
    /**
     透過 API 登入取得使用者資料
     */
    func signIn(username: String, password: String, completion: @escaping(Result<UserModel, ServiceError>) -> Void) {
        
        // 建立 URLComponents 來組合 API
        var components = getApiBaseURL()
        components.path = "/api/login"
            
        // 建立查詢參數
        let usernameItem = URLQueryItem(name: "username", value: username)
        let passwordItem = URLQueryItem(name: "password", value: password)
        components.queryItems = [usernameItem, passwordItem]
        
        // 建立伺服器請求
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        
        // 增加自訂義標頭
        request.addValue("vqYuKPOkLQLYHhk4QTGsGKFwATT4mBIGREI2m8eD", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("", forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        // 發送使用者登入
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(.domainError))
            }
            
            if let data = data {
                do {
                    
                    // 印出 Server 回傳的 json
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("伺服器回傳: \(jsonString)")
                    } else {
                        print("無法將伺服器回傳的 data 轉為字串")
                        completion(.failure(.decodingError))
                    }
                    
                    // 將 json 轉為 UserModel
                    let decoder = JSONDecoder()
                    let userModel = try decoder.decode(UserModel.self, from: data)
                    completion(.success(userModel))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
    /**
     透過 API 更新使用者資料
     */
    func update(userModel: UserModel, param: Dictionary<String, Any>, completion: @escaping(Result<String, ServiceError>) -> Void) {
        
        // 建立 URLComponents 來組合 API
        var components = getApiBaseURL()
        components.path = "/api/users/\(userModel.objectId)"
        
        // 建立伺服器請求
        var request = URLRequest(url: components.url!)
        request.httpMethod = "PUT"
        
        // 建立查詢參數
        let queryItems = param.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        components.queryItems = queryItems
        
        // 增加自訂義標頭
        request.addValue("vqYuKPOkLQLYHhk4QTGsGKFwATT4mBIGREI2m8eD", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("", forHTTPHeaderField: "X-Parse-REST-API-Key")
        request.addValue(userModel.sessionToken, forHTTPHeaderField: "X-Parse-Session-Token")
        
        // 發送使用者資料更新
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(.domainError))
            }
            
            if let data = data {
                do {
                    
                    // 印出 Server 回傳的 json
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("伺服器回傳: \(jsonString)")
                        completion(.success(jsonString))
                    } else {
                        print("無法將伺服器回傳的 data 轉為字串")
                        completion(.failure(.decodingError))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
        
        
    }
}
