//
//  FloatingButton.swift
//  FloatingButton
//
//  Created by Illia Khrypunov on 2/5/20.
//  Copyright © 2020 Illia Khrypunov. All rights reserved.
//

import SwiftUI

public struct FloatingButton: View {
  
  private let options: Options
  
  private var leftButtonAction: (() -> Void)? = nil
  private var rightButtonAction: (() -> Void)? = nil
  private var topButtonAction: (() -> Void)? = nil
  
  @State private var isOpened: Bool = false
  @State private var leftButtonOffset: CGPoint = .zero
  @State private var rightButtonOffset: CGPoint = .zero
  @State private var topButtonOffset: CGPoint = .zero
  @State private var rotationAngle: Double = 165
  @State private var centralButtonRotationAngle: Double = 0
  @State private var centralButtonGradientColors: GradientColors = GradientColors(top: .red, bottom: .orange)
  
  public init(options: Options) {
    self.options = options
    leftButtonOffset = options.centerCoords
    rightButtonOffset = options.centerCoords
    topButtonOffset = options.centerCoords
    centralButtonGradientColors = options.buttonColors.centralClosedButtonColor
  }
  
  public var body: some View {
    ZStack {
      SideButton(size: options.sideButtonSize,
                 image: options.buttonIcons.leftButtonIcon,
                 scaleEffect: CGFloat(0.35),
                 gradientColors: options.buttonColors.leftButtonColor,
                 rotationAngle: rotationAngle,
                 offset: leftButtonOffset,
                 animationDuration: 0.3,
                 position: leftButtonOffset)
        .onTapGesture {
          if let action = self.leftButtonAction {
            action()
          }
      }
      
      SideButton(size: options.sideButtonSize,
                 image: options.buttonIcons.rightButtonIcon,
                 scaleEffect: CGFloat(0.35),
                 gradientColors: options.buttonColors.rightButtonColor,
                 rotationAngle: rotationAngle,
                 offset: rightButtonOffset,
                 animationDuration: 0.3,
                 position: rightButtonOffset)
        .onTapGesture {
          if let action = self.rightButtonAction {
            action()
          }
      }
      
      SideButton(size: options.sideButtonSize,
                 image: options.buttonIcons.topButtonIcon,
                 scaleEffect: CGFloat(0.35),
                 gradientColors: options.buttonColors.topButtonColor,
                 rotationAngle: rotationAngle,
                 offset: topButtonOffset,
                 animationDuration: 0.3,
                 position: topButtonOffset)
        .onTapGesture {
          if let action = self.topButtonAction {
            action()
          }
      }
      
      CentralButton(size: options.centralButtonSize,
                    image: options.buttonIcons.centralButtonIcon,
                    scaleEffect: CGFloat(0.5),
                    gradientColors: centralButtonGradientColors,
                    rotationAngle: centralButtonRotationAngle,
                    position: options.centerCoords)
        .onTapGesture {
          self.onCentralButtonPress()
      }
    }
  }
}

extension FloatingButton {
  public func onLeftButtonPress(perform action: @escaping () -> Void) -> FloatingButton {
    var floatingButton: FloatingButton = self
    floatingButton.leftButtonAction = action
    return floatingButton
  }
  
  public func onRightButtonPress(perform action: @escaping () -> Void) -> FloatingButton {
    var floatingButton: FloatingButton = self
    floatingButton.rightButtonAction = action
    return floatingButton
  }
  
  public func onTopButtonPress(perform action: @escaping () -> Void) -> FloatingButton {
    var floatingButton: FloatingButton = self
    floatingButton.topButtonAction = action
    return floatingButton
  }
  
  private func onCentralButtonPress() {
    if !self.isOpened {
      self.topButtonOffset = CGPoint(x: self.options.centerCoords.x, y: -1 * self.options.buttonsOffset + self.options.centerCoords.y)
      self.leftButtonOffset = CGPoint(x: -1 * self.options.buttonsOffset + self.options.centerCoords.x, y: self.options.centerCoords.y - 25)
      self.rightButtonOffset = CGPoint(x: self.options.buttonsOffset + self.options.centerCoords.x, y: self.options.centerCoords.y - 25)
      self.rotationAngle = 0
      self.centralButtonRotationAngle = -135
      self.centralButtonGradientColors = self.options.buttonColors.centralOpenedButtonColor
      self.isOpened = true
    } else {
      self.topButtonOffset = self.options.centerCoords
      self.leftButtonOffset = self.options.centerCoords
      self.rightButtonOffset = self.options.centerCoords
      self.rotationAngle = 165
      self.centralButtonRotationAngle = 0
      self.centralButtonGradientColors = self.options.buttonColors.centralClosedButtonColor
      self.isOpened = false
    }
  }
}

