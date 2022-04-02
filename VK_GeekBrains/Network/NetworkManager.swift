//
//  NetworkManager.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 17.01.2022.
//

import Foundation
import Alamofire

class VKService {
    // базовый URL сервиса
        let baseUrl = "https://api.vk.com"
        // ключ для доступа к сервису
        let apiKey = Session.instance.token
        
        // метод для загрузки данных
        func loadData(getData: String){
            
    
            let path = "/method/"
            
            let methodName: Parameters = [
                "": getData,
                "access_token": apiKey as Any,
                "v": "5.81"
            ]
            
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
            let url = baseUrl+path
            
        // делаем запрос
            AF.request(url, method: .get, parameters: methodName).responseJSON { repsonse in
                print(repsonse.value as Any)
            }
            
        }
}
