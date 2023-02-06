//
//  MainScreenViewController.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import UIKit

protocol IMainScreenViewController: AnyObject {
    func update(with model: MainScreenViewModel)
}

final class MainScreenViewController: UIViewController, IMainScreenViewController {

    // MARK: - Public

    var presenter: IMainScreenPresenter?

    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    // Mark: - Outlets

    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    // Mark: - Actions

    @IBAction private func didTapButton(_ sender: Any) {
        presenter?.didTapButton()
    }

    // MARK: - Public

    func update(with model: MainScreenViewModel) {
        codeLabel.text = model.codeText
        valueLabel.text = model.valueText
        descLabel.text = model.descriptionText

        var image: UIImage? = nil
        if let model = model.imageData {
            image = UIImage(data: model)
        }
        imageView.image = image
    }
}
