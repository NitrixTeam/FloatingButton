//
//  CentralButton.swift
//  FloatingButton
//
//  Created by Illia Khrypunov on 2/5/20.
//  Copyright © 2020 Illia Khrypunov. All rights reserved.
//

import SwiftUI

struct CentralButton: View {
  var size: CGFloat
  var image: String
  var scaleEffect: CGFloat
  var gradientColors: GradientColors
  var rotationAngle: Double
  var position: CGPoint
  
  var body: some View {
    Circle()
      .fill(LinearGradient(gradient: .init(colors: [gradientColors.top, gradientColors.bottom]), startPoint: .top, endPoint: .bottom))
      .frame(width: size, height: size, alignment: .center)
      .animation(.default)
      .rotationEffect(.init(degrees: rotationAngle))
      .overlay(
        Image(image)
          .scaleEffect(scaleEffect)
          .rotationEffect(.init(degrees: rotationAngle))
          .animation(.default)
    )
  }
}
