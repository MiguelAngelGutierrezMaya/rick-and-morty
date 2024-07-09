//
//  CustomPaddingLabel.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 31/10/23.
//
import UIKit

final class CustomPaddingLabel: UILabel {
    var edgeInset: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(
            top: edgeInset.top,
            left: edgeInset.left,
            bottom: edgeInset.bottom,
            right: edgeInset.right
        )
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + edgeInset.left + edgeInset.right,
            height: size.height + edgeInset.top + edgeInset.bottom
        )
    }
}
