//
//  ViewModel.swift
//  MyWayOrNoWay
//
//  Created by Akshay Nandane on 04/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var responseData: [modelData] = []
    var networkManager = Networking()
    
    func fetchData(url: String, completion: @escaping (Bool) -> Void){
        // Get data from Networking manager
        networkManager.fetchData(url: url) {result in
            print("result - \(result)")
            switch result {
                case .success(let responseData):
                DispatchQueue.main.async {
                    self.responseData = responseData
                }
                print("responseData \(responseData)")
                
                // Notify the view or trigger any necessary updates
                completion(true)
                case .failure(let error):
                    // Handle the error case
                print("Error - \(error)")
                completion(true)
            }
            
            //
        }
    }
}
