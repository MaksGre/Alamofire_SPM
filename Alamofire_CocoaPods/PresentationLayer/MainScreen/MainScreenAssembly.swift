//
//  MainScreenAssembly.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import UIKit

protocol IMainScreenAssembly: AnyObject {
    func assembly() -> UIViewController
}

final class MainScreenAssembly: IMainScreenAssembly {

    // MARK: - Private

    private lazy var networkService: INetworkService = Locator.networkService
    private lazy var httpCodesService: IHttpCodesService = Locator.httpCodesService

    // MARK: - Public

    func assembly() -> UIViewController {
        let viewController = UIStoryboard.main.instantiateViewController(MainScreenViewController.self)
        let presenter = MainScreenPresenter(viewController: viewController,
                                            networkService: networkService,
                                            httpCodesService: httpCodesService)

        viewController.presenter = presenter

        return viewController
    }
}
