//
//  FriendService.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 08.02.2022.
//
/*
import Foundation

fileprivate enum TypeMethods: String {
    case friendsGet = "/method.friends.get"
}

fileprivate enum TypeRequests: String {
    case get = "GET"
    case post = "POST"
}

final class FriendService {
    private let scheme = "https"
    private let host = "api.vk.com"
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    func loadFriend() {
        guard let token = Session.shared.token else {
            return
        }
        let params: [String: String] = ["acsess_token": token,
                                        "fields": "photo_50"
        ]
        
        let url = configureUrl(token: token,
                               method: .friendsGet,
                               httpMethod: .get,
                               params: params)
        
        let task = session.dataTask(with: url) { data, respons, error in
            if error != nil {
                fatalError(" Error ")
            }
            guard data != nil else{
                return
            }
            
        }
        task.resume()
    }
}

private extension FriendService {
    func configureUrl(token: String,
                      method: TypeMethods,
                      httpMethod: TypeRequests,
                      params: [String: String]) -> URL {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "access_token", value: token))
        queryItems.append(URLQueryItem(name: "v", value: "5.131"))
        
        for (param, value) in params {
            queryItems.append(URLQueryItem(name: param, value: value))
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = method.rawValue
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            fatalError("URL is invalid")
        }
        return url
      }
    }
*/
