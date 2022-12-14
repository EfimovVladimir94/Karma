//
//  Font.swift
//  Karma
//
//  Created by user on 11.12.2022.
//

import Foundation
import SwiftUI

extension Font {
    static func regular(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", fixedSize: size)
    }
    static func bold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", fixedSize: size)
    }
    static func medium(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", fixedSize: size)
    }
    static func light(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Light", fixedSize: size)
    }
}
