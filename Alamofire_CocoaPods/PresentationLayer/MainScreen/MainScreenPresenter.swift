//
//  MainScreenPresenter.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import Foundation

protocol IMainScreenPresenter: AnyObject {
    func viewDidLoad()
    func didTapButton()
}

final class MainScreenPresenter: IMainScreenPresenter {

    // MARK: - Private

    private weak var viewController: IMainScreenViewController!
    private let networkService: INetworkService
    private let httpCodesService: IHttpCodesService

    // MARK: - Init

    init(viewController: IMainScreenViewController,
         networkService: INetworkService,
         httpCodesService: IHttpCodesService) {
        self.viewController = viewController
        self.networkService = networkService
        self.httpCodesService = httpCodesService
    }

    // MARK: - Public

    func viewDidLoad() {
        let code = httpCodesService.getRandomCode()
        networkService.getImage(code: code) { [weak self] result in
            guard let self = self else { return }
            let model: MainScreenViewModel
            switch result {
            case .success(let data):
                model = self.buildMainScreenViewModelSuccessCase(code: code, imageData: data)
            case .failure(let error):
                model = self.buildMainScreenViewModelFailureCase(code: code, error: error)
            }
            DispatchQueue.main.async {
                self.viewController.update(with: model)
            }
        }
    }

    func didTapButton() {
        viewDidLoad()
    }

    // MARK: - Private

    private func buildMainScreenViewModelSuccessCase(code: Int, imageData: Data) -> MainScreenViewModel {
        let httpCodesDesc = httpCodesService.getCodeDesc(code)
        let codeText = R.string.texts.httpCode() + code.description
        let valueText = R.string.texts.codeValue() + httpCodesDesc.eng
        let descriptionText = R.string.texts.codeDesc() + httpCodesDesc.ru

        return MainScreenViewModel(imageData: imageData,
                                   codeText: codeText,
                                   valueText: valueText,
                                   descriptionText: descriptionText)
    }

    private func buildMainScreenViewModelFailureCase(code: Int, error: Error) -> MainScreenViewModel {
        let codeText = R.string.texts.httpCode() + code.description
        let descriptionText = R.string.texts.error() + error.localizedDescription

        return MainScreenViewModel(imageData: nil,
                                   codeText: codeText,
                                   valueText: "",
                                   descriptionText: descriptionText)
    }
}
