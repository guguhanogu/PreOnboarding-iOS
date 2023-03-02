//
//  ViewController.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/01.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    static let identifier = "MainViewController"
    
    private let imageLoadView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let loadAllImagesButton: RoundButton = RoundButton()
    var tableView: UITableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageLoadView.dataSource = self
        self.imageLoadView.delegate = self
        self.imageLoadView.register(ImageLoadCell.self, forCellWithReuseIdentifier: ImageLoadCell.identifier)
        
        setup()
        style()
        layout()
        
    }
}

//MARK: - Style & Layouts
extension ViewController {
    
    // MARK: - SetUp
    /// 초기 셋업할 코드들
    private func setup() {
        tableView.dataSource = tableView.dataSource
        tableView.delegate = tableView.delegate
    }
    
    // MARK: - Style
    private func style() {
        // MARK: View
        view.backgroundColor = .systemBackground
        
        // MARK: - Collection View
        imageLoadView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageLoadView)
        
        // MARK: - TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        
        view.addSubview(tableView)
        
        // MARK: - loadAllImagesButton
        loadAllImagesButton.translatesAutoresizingMaskIntoConstraints = false
        loadAllImagesButton.setTitle("Load All Images", for: .normal)
        loadAllImagesButton.setTitleColor(.systemBackground, for: .normal)
        loadAllImagesButton.backgroundColor = .systemBlue
       
        view.addSubview(loadAllImagesButton)
    }
    
    // MARK: - Layout
    private func layout() {
        
        // [label] 기본 중앙 배치
        NSLayoutConstraint.activate([
            
            imageLoadView.topAnchor.constraint(equalTo: view.topAnchor),
            imageLoadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageLoadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageLoadView.heightAnchor.constraint(equalToConstant: 100),
            
            loadAllImagesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadAllImagesButton.widthAnchor.constraint(equalToConstant: 350),
            loadAllImagesButton.heightAnchor.constraint(equalToConstant: 50),
            loadAllImagesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    
    /// 만들 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    /// 만들 셀 정의
    /// 사전에 만든 UICollectionViewCell 지정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageLoadCell.identifier, for: indexPath) as? ImageLoadCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .blue
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    /// 셀 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}




struct PreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
