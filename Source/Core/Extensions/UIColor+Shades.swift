//
//  UIColor+Shades.swift
//  MLBusinessComponents
//
//  Created by Tomi De Lucca on 5/27/20.
//

import Foundation

extension UIColor {
  func lighter(by percentage: CGFloat = 30.0) -> UIColor {
    return self.adjustBrightness(by: abs(percentage))
  }

  func darker(by percentage: CGFloat = 30.0) -> UIColor {
    return self.adjustBrightness(by: -abs(percentage))
  }
    
  func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {
    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
      if b < 1.0 {
        let newB: CGFloat = max(min(b + (percentage/100.0)*b, 1.0), 0.0)
        return UIColor(hue: h, saturation: s, brightness: newB, alpha: a)
      } else {
        if s == 0 {
            return "f8f8f8".hexaToUIColor()
        }
        let newS: CGFloat = min(max(s - (percentage/100.0)*s, 0.0), 1.0)
        return UIColor(hue: h, saturation: newS, brightness: b, alpha: a)
      }
    }
    return self
  }
}
