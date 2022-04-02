//
//  GroupService.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 01.04.2022.
//

import Foundation

enum GroupsError: Error {
    case parseError
    case requestError(Error)
}

fileprivate enum TypeMethods: String {
    case groupsGet = "/method/groups.get"
    case groupsSearch = "/method/groups.search"
    case groupsJoin = "/method/groups.join"
    case groupsLeave = "/method/groups.leave"
}

fileprivate enum TypeRequests: String {
    case get = "GET"
    case post = "POST"
}

class GroupService {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    private let scheme = "https"
    private let host = "api.vk.com"
    
    private let decoder = JSONDecoder()

    func loadGroups(complition: @escaping (Result<[Group], GroupsError>) -> Void) {
        guard let token = Session.instance.token else { return }
        let params: [String: String] = ["extended": "1"]
        let url = configureUrl(token: token,
                               method: .groupsGet,
                               httpMethod: .get,
                               params: params)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return complition(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try self.decoder.decode(SearchGroup.self, from: data)
                return complition(.success(result.response.items))
            } catch {
                complition(.failure(.parseError))
            }
            
        }
        task.resume()
    }
    
    func loadGroupSearch (searchText: String, completion: @escaping(Result<[Group], GroupsError>) -> Void) {
        guard let token = Session.instance.token else { return }
        let params: [String: String] = ["extended": "1",
                                        "q": searchText,
                                        "count": "40"]
        let url = configureUrl(token: token,
                               method: .groupsSearch,
                               httpMethod: .get,
                               params: params)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try self.decoder.decode(SearchGroup.self, from: data)
                return completion(.success(result.response.items))
            } catch {
                return completion(.failure(.parseError))
            }
            
        }
        task.resume()
    }
    
    func addGroup(idGroup: Int, completion: @escaping(Result<JoinOrLeaveGroup, GroupsError>) -> Void) {
        guard let token = Session.instance.token else { return }
        let params: [String: String] = ["group_id": "\(idGroup)"]
        let url = configureUrl(token: token,
                               method: .groupsJoin,
                               httpMethod: .post,
                               params: params)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try self.decoder.decode(JoinOrLeaveGroup.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    func deleteGroup(id: Int, completion: @escaping(Result<JoinOrLeaveGroup, GroupsError>) -> Void) {
        guard let token = Session.instance.token else { return }
        let params: [String: String] = ["group_id": "\(id)"]
        let url = configureUrl(token: token,
                               method: .groupsJoin,
                               httpMethod: .post,
                               params: params)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try self.decoder.decode(JoinOrLeaveGroup.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
}

private extension GroupService {
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
