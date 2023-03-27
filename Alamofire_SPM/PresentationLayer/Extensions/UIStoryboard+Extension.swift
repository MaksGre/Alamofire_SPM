//
//  UIStoryboard+Extension.swift
//  Alamofire_SPM
//
//  Created by m.grebenozhko on 06.02.2023.
//

import UIKit

extension UIStoryboard {

    static let main = UIStoryboard(name: R.string.storyBoards.main(), bundle: nil)

    func instantiateViewController<T: UIViewController>(_ ControllerClass: T.Type) -> T {
        let controllerClassName = String(describing: T.self)
        return instantiateViewController(withIdentifier: controllerClassName) as! T
    }
}
