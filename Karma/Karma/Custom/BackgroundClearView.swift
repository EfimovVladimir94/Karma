//
//  BackgroundClearView.swift
//  Karma
//
//  Created by efvo on 08.02.23.
//

import Foundation
import SwiftUI

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        ClearSuperView()
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

class ClearSuperView: UIView {
    override func layoutSubviews() {
        guard let parentView = superview?.superview else { return }
        parentView.backgroundColor = .clear
    }
}
