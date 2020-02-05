//
//  SideButton.swift
//  FloatingButton
//
//  Created by Illia Khrypunov on 2/5/20.
//  Copyright © 2020 Illia Khrypunov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct SideButton: View {
  var size: CGFloat
  var image: String
  var scaleEffect: CGFloat
  var gradientColors: GradientColors
  var rotationAngle: Double
  var offset: CGPoint
  var animationDuration: Double
  var position: CGPoint
  
  var body: some View {
    Circle()
      .fill(LinearGradient(gradient: .init(colors: [gradientColors.top, gradientColors.bottom]), startPoint: .top, endPoint: .bottom))
      .frame(width: size, height: size, alignment: .center)
      .animation(.easeInOut(duration: animationDuration))
      .offset(x: offset.x, y: offset.y)
      .overlay(
        Image(image)
          .scaleEffect(scaleEffect)
          .rotationEffect(.init(degrees: rotationAngle))
          .animation(.easeInOut(duration: animationDuration))
          .offset(x: offset.x, y: offset.y)
    )
  }
}
