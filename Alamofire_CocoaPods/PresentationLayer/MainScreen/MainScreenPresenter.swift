//
//  MainScreenPresenter.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

protocol IMainScreenPresenter: AnyObject {
    
}

final class MainScreenPresenter: IMainScreenPresenter {

    // MARK: - Private

    private weak var viewController: IMainScreenViewController!
    private var networkService: INetworkService

    // MARK: - Init

    init(viewController: IMainScreenViewController,
         networkService: INetworkService) {
        self.viewController = viewController
        self.networkService = networkService
    }
}
