//
//  MainScreenViewController.swift
//  Alamofire_SPM
//
//  Created by m.grebenozhko on 30.01.2023.
//

import UIKit
import SnapKit

protocol IMainScreenViewController: AnyObject {
    func update(with model: MainScreenViewModel)
    func updateProgressIndicatorState(isHidden: Bool)
}

final class MainScreenViewController: UIViewController, IMainScreenViewController {

    // MARK: - Private

    private let progressIndicator = ProgressIndicator()

    // MARK: - Public

    var presenter: IMainScreenPresenter?

    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupProgressIndicator()
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

    func updateProgressIndicatorState(isHidden: Bool) {
        isHidden
        ? progressIndicator.hide()
        : progressIndicator.show()
    }

    // MARK: - Private

    private func setupProgressIndicator() {
        view.addSubview(progressIndicator)

        progressIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
