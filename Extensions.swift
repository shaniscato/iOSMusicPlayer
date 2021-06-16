//
//  Extensions.swift
//  MusicPlayer
//
//  Created by student on 16/06/2021.
//  Copyright © 2021 swen. All rights reserved.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let primaryColor = Color.rgb(r: 87, g: 31, b:89)
    static let backgroundColor = Color.rgb(r: 227, g:227, b:227)
}
