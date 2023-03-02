//
//  ImageCell.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/02.
//

import UIKit

class LoadImageCell: UITableViewCell {
    
    lazy var stackView: UIStackView = UIStackView(arrangedSubviews: [loadImageView, progressBar, loadButton])
    lazy var loadImageView: UIImageView = UIImageView(image: UIImage(systemName: "photo"))
    lazy var progressBar: UIProgressView = UIProgressView()
    lazy var loadButton: RoundButton = RoundButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    private func setStyle() {
        
        // MARK: stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        
        contentView.addSubview(stackView)
        
        // MARK: loadImageView
        loadImageView.translatesAutoresizingMaskIntoConstraints = false
        loadImageView.contentMode = .scaleToFill
        
        // MARK: progressBar
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressViewStyle = .default
        progressBar.trackTintColor = .systemGray3
        progressBar.progressTintColor = .systemBlue
        progressBar.progress = 0.6
        
        // MARK: loadButton
        loadButton.setTitle("Load", for: .normal)
        loadButton.backgroundColor = .systemBlue
        loadButton.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
    }
    
    // MARK: - Layout
    private func setLayout() {
        NSLayoutConstraint.activate([
            
            // MARK: stackView
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            // MARK: loadImageView
            loadImageView.widthAnchor.constraint(equalToConstant: 120),
            loadImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // MARK: loadButton
            loadButton.widthAnchor.constraint(equalToConstant: 100),
            loadButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - FUNC: loadImage
    @objc func loadImage(sender: UIButton!) {
        self.loadImageView.image = UIImage(systemName: "photo")
        
        let url = URL(string: "https://item.kakaocdn.net/do/a1866850b14ae47d0a2fd61f409dfc057154249a3890514a43687a85e6b6cc82")!
        
        URLSession.shared.downloadTask(with: url, completionHandler: { (location, reponse, error) -> Void in
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.loadImageView.image = image
                }
            }
        }).resume()
    }
}
