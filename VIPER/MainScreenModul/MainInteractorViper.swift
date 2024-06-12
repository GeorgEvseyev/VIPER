//
//  MainInteractor.swift
//  VIPER
//
//  Created by Георгий Евсеев on 14.05.24.
//

import UIKit

protocol IMainInteractor: AnyObject {
    func request()
    var presenter: IMainPresenter? { get set }
}

class MainInteractor {
    var networkManager: INetworkManager = NetworkManager()

    weak var presenter: IMainPresenter?
}

extension MainInteractor: IMainInteractor {
    
    func request() {
        networkManager.sendRequest(adress: UrlString().baseUrlString) { data, _ in
            if let data = data {
                self.presenter?.parse(data: data)
            }
        }
    }
}
