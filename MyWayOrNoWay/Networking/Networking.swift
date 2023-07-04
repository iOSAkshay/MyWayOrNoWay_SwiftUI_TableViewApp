//
//  File.swift
//  MyWayOrNoWay
//
//  Created by Akshay Nandane on 04/07/23.
//

import Foundation

class Networking: Codable{
    
    func fetchData(url: String, completion: @escaping (Result<[modelData], Error>) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            print("Data : \(data)")
            print("Response  : \(response)")
            print("error  : \(error)")
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseData = try decoder.decode([modelData].self, from: data)
                    completion(.success(responseData))
                } catch {
                    completion(.failure(error))
                }
            } else {
                // Handle no data case
            }
        }.resume()
        
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            let jsonDecoder = JSONDecoder()
//            let responseModel = try jsonDecoder.decode(modelData.self, from: data!)
//            print(responseModel)
//            completion("", false)
//        }.resume()
        
    }
}

