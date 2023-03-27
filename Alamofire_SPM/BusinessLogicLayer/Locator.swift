//
//  Locator.swift
//  Alamofire_SPM
//
//  Created by m.grebenozhko on 03.02.2023.
//

final class Locator {

    static let networkService: INetworkService = NetworkService()
    static let httpCodesService: IHttpCodesService = HttpCodesService()
    static let mainScreenAssembly: IMainScreenAssembly = MainScreenAssembly()
}
