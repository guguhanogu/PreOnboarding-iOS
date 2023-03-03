//
//  ViewController.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/01.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private var tableView: UITableView = UITableView()
    private let loadAllImagesButton: RoundButton = RoundButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    // MARK: - SetUp
    /// 초기 셋업할 코드들
    private func setup() {
        
    }
    
    // MARK: - Style
    private func style() {
        // MARK: View
        view.backgroundColor = .systemBackground
        
        
        // MARK: - TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView = UITableView(frame: CGRect(x: 0, y: 60, width: view.bounds.width, height: 500))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(LoadImageCell.self, forCellReuseIdentifier: "imageCell")
        
        view.addSubview(tableView)
        
        // MARK: - loadAllImagesButton
        loadAllImagesButton.translatesAutoresizingMaskIntoConstraints = false
        loadAllImagesButton.setTitle("Load All Images", for: .normal)
        loadAllImagesButton.setTitleColor(.systemBackground, for: .normal)
        loadAllImagesButton.backgroundColor = .systemBlue
        loadAllImagesButton.addTarget(self, action: #selector(loadAllImage), for: .touchUpInside)
       
        view.addSubview(loadAllImagesButton)
    }
    
    // MARK: - Layout
    private func layout() {
        
        NSLayoutConstraint.activate([
            loadAllImagesButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -240),
            loadAllImagesButton.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loadAllImagesButton.widthAnchor.constraint(
                equalToConstant: 360),
            loadAllImagesButton.heightAnchor.constraint(
                equalToConstant: 40),
        ])
    }
    
    @objc func loadAllImage(sender: UIButton!) {
        for index in 0..<5 {
            guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? LoadImageCell else { return }
            cell.loadImage(sender: sender)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? LoadImageCell else { return .init() }
        cell.selectionStyle = .none
        
        return cell
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
