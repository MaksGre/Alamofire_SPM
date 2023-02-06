//
//  MainScreenViewController.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import UIKit

protocol IMainScreenViewController: AnyObject {}

final class MainScreenViewController: UIViewController, IMainScreenViewController {

    // MARK: - Public

    var presenter: IMainScreenPresenter?

    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        getData()
    }

//    func getData() {
//        let dataRequest = AF.request("https://dummy.restapiexample.com/api/v1/employees")
//        print(dataRequest)
//    }
}
