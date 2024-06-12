//
//  NetworkManager.swift
//  VIPER
//
//  Created by Георгий Евсеев on 14.05.24.
//

import UIKit

protocol INetworkManager {
    func sendRequest(adress: String, completion: @escaping(Data?, Error?) -> Void)

}

class NetworkManager: INetworkManager {

    func sendRequest(adress: String, completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: adress) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
