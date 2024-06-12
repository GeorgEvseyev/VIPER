//
//  MainPresenter.swift
//  VIPER
//
//  Created by Георгий Евсеев on 14.05.24.
//

import UIKit

protocol IMainPresenter: AnyObject {
    func parse(data: Data)
    func buttonPressed()
    var view: IMainViewController? { get set }
}

final class MainPresenter {
    weak var view: IMainViewController?
    
    var router: IMainRouter?
    var interactor: IMainInteractor = MainInteractor()
}

extension MainPresenter: IMainPresenter {
    func buttonPressed() {
        interactor.request()
        interactor.presenter = self
    }

    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
            DispatchQueue.main.async {
                self.view?.setLabelText("json: \(json)")
                print(json)
            }
        }
    }
}
