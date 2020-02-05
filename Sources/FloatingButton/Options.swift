//
//  Properties.swift
//  FloatingButton
//
//  Created by Illia Khrypunov on 2/5/20.
//  Copyright © 2020 Illia Khrypunov. All rights reserved.
//

import SwiftUI

public struct GradientColors {
  let top: Color
  let bottom: Color
  
  public init(top: Color, bottom: Color) {
    self.top = top
    self.bottom = bottom
  }
}

public struct ButtonIcons {
  let centralButtonIcon: String
  let leftButtonIcon: String
  let rightButtonIcon: String
  let topButtonIcon: String
  
  public init(centralButtonIcon: String,
              leftButtonIcon: String,
              rightButtonIcon: String,
              topButtonIcon: String) {
    self.centralButtonIcon = centralButtonIcon
    self.leftButtonIcon = leftButtonIcon
    self.rightButtonIcon = rightButtonIcon
    self.topButtonIcon = topButtonIcon
  }
}

public struct ButtonColors {
  let centralOpenedButtonColor: GradientColors
  let centralClosedButtonColor: GradientColors
  let leftButtonColor: GradientColors
  let topButtonColor: GradientColors
  let rightButtonColor: GradientColors
  
  public init(centralOpenedButtonColor: GradientColors,
              centralClosedButtonColor: GradientColors,
              leftButtonColor: GradientColors,
              topButtonColor: GradientColors,
              rightButtonColor: GradientColors) {
    self.centralOpenedButtonColor = centralOpenedButtonColor
    self.centralClosedButtonColor = centralClosedButtonColor
    self.leftButtonColor = leftButtonColor
    self.rightButtonColor = rightButtonColor
    self.topButtonColor = topButtonColor
  }
}

public struct Options {
  let centerCoords: CGPoint = .zero
  let buttonsOffset: CGFloat
  let centralButtonSize: CGFloat
  let sideButtonSize: CGFloat
  let buttonIcons: ButtonIcons
  let buttonColors: ButtonColors
  
  public init(buttonsOffset: CGFloat = 80,
       centralButtonSize: CGFloat = 70,
       sideButtonSize: CGFloat = 50,
       buttonIcons: ButtonIcons = .init(centralButtonIcon: "plus",
                                         leftButtonIcon: "checkbox",
                                         rightButtonIcon: "attach",
                                         topButtonIcon: "voice"),
       buttonColors: ButtonColors = .init(centralOpenedButtonColor: GradientColors(top: Color(red: 1.0, green: 0.7, blue: 0.25),
                                                                                   bottom: Color(red: 1.0, green: 0.35, blue: 0.35)),
                                          centralClosedButtonColor: GradientColors(top: Color(red: 0.35, green: 0.77, blue: 1.0),
                                                                                   bottom: Color(red: 0.25, green: 0.42, blue: 1.0)),
                                          leftButtonColor: GradientColors(top: Color(red: 0.35, green: 0.77, blue: 1.0),
                                                                          bottom: Color(red: 0.25, green: 0.42, blue: 1.0)),
                                          topButtonColor: GradientColors(top: Color(red: 0.9, green: 0.25, blue: 1.0),
                                                                         bottom: Color(red: 0.4, green: 0.35, blue: 1.0)),
                                          rightButtonColor: GradientColors(top: Color(red: 0.35, green: 1.0, blue: 0.46),
                                                                           bottom: Color(red: 0.25, green: 0.73, blue: 1.0)))) {
    self.buttonsOffset = buttonsOffset
    self.centralButtonSize = centralButtonSize
    self.sideButtonSize = sideButtonSize
    self.buttonIcons = buttonIcons
    self.buttonColors = buttonColors
  }
}
