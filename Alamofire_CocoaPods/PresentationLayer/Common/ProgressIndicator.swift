//
//  ProgressIndicator.swift
//  Loader_Test
//
//  Created by Maksim Grebenozhko on 17.04.2020.
//  Copyright © 2020 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

private extension Double {
    static let animationDuration = 0.3
}

private extension CGFloat {
    static let size: CGFloat = 60
    static let cornerRadius: CGFloat = 10
    static let backgroundAlpha: CGFloat = 0.4
}

final class ProgressIndicator: UIView {

    // MARK: - Private properties

    private let activityIndicator = UIActivityIndicatorView()
    private let activityIndicatorBackgroundView = UIView()
	
	// MARK: - Init

	init() {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
		
		setup()
	}
		
	// MARK: - Public functions

	func show() {
		UIView.animate(withDuration: .animationDuration) {
			self.activityIndicatorBackgroundView.alpha = .backgroundAlpha
		}
		activityIndicator.startAnimating()
	}
	
	func hide() {
		UIView.animate(withDuration: .animationDuration) {
			self.activityIndicatorBackgroundView.alpha = 0
		}
		activityIndicator.stopAnimating()
	}

	// MARK: - Private functions

	private func setup() {
		
		snp.makeConstraints {
			$0.size.equalTo(CGFloat.size)
		}
		
		addSubview(activityIndicatorBackgroundView)
		addSubview(activityIndicator)
		
		activityIndicatorBackgroundView.backgroundColor = .black
		activityIndicatorBackgroundView.layer.cornerRadius = .cornerRadius
		activityIndicatorBackgroundView.alpha = 0

		activityIndicator.hidesWhenStopped = true
		
		if #available(iOS 13.0, *) {
			activityIndicator.style = .large
			activityIndicator.color = .systemGray6
		}
		else {
			activityIndicator.style = .whiteLarge
			activityIndicator.color = .lightGray
		}

		activityIndicatorBackgroundView.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.size.equalTo(CGFloat.size)
		}
		
		activityIndicator.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
	}

}
