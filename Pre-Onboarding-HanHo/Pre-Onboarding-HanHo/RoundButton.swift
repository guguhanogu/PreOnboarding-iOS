//
//  RoundButton.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/02.
//

import UIKit

public class RoundButton: UIButton {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
