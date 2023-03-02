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
    
    let loadButton: RoundButton = RoundButton()
    
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
        
        // MARK: - loadButton
        loadButton.setTitle("Load", for: .normal)
        loadButton.setTitleColor(.systemBackground, for: .normal)
        loadButton.backgroundColor = .systemBlue
        self.addSubview(loadButton)
    }
    
    private func setConstraint() {
        configureLoadImageViewConstraint()
    }
    
    private func configureLoadImageViewConstraint() {
        loadImageView.translatesAutoresizingMaskIntoConstraints = false
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            loadImageView.topAnchor.constraint(equalTo: self.topAnchor),
            loadImageView.widthAnchor.constraint(equalToConstant: loadImageViewSize),
            loadImageView.heightAnchor.constraint(equalToConstant: loadImageViewSize),
            loadImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loadButton.widthAnchor.constraint(equalToConstant: 80),
            loadButton.heightAnchor.constraint(equalToConstant: 50),
            loadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 250),
            loadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
    }
}


