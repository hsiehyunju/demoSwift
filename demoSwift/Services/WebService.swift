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
    func signIn(username: String, password: String, completion: @escaping(Result<UserModel, ServiceError>) -> Void) {
        
        // 組合 API
        let urlString = "https://watch-master-staging.herokuapp.com/api/login?username=\(username)&password=\(password)"
        
        // 建立伺服器請求
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
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
}
