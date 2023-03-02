//
//  ImageCell.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/02.
//

import UIKit

class ImageLoadCell: UICollectionViewCell {
    
    static let identifier = "ImageLoadCell"
    
    private let loadImageViewSize: CGFloat = 100
    
    private let loadImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .systemCyan
        imageView.layer.cornerRadius = 50
       
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setConstraint()
    }
    
    private func setUI() {
        self.addSubview(loadImageView)
    }
    
    private func setConstraint() {
        configureLoadImageViewConstraint()
    }
    
    private func configureLoadImageViewConstraint() {
        loadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadImageView.topAnchor.constraint(equalTo: self.topAnchor),
            loadImageView.widthAnchor.constraint(equalToConstant: loadImageViewSize),
            loadImageView.heightAnchor.constraint(equalToConstant: loadImageViewSize),
            loadImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
