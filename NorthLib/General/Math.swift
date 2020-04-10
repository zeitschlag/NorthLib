//
//  Math.swift
//
//  Created by Norbert Thies on 20.12.18.
//  Copyright © 2018 Norbert Thies. All rights reserved.
//
//  This file implements various mathematical operations.
//

import Foundation

infix operator /~ : MultiplicationPrecedence
infix operator =~ : ComparisonPrecedence
infix operator ** : BitwiseShiftPrecedence

public extension BinaryFloatingPoint {
  
  /// Remainder for FloatingPoint values, e.g. 3.6 % 0.5 == 0.1
  static func %(lhs: Self, rhs: Self) -> Self {
    lhs.truncatingRemainder(dividingBy: rhs)
  }
  
  /// Truncating division for FloatingPoint values, e.g. 3.6 /~ 0.5 == 7.0
  static func /~(lhs: Self, rhs: Self) -> Self {
    (lhs/rhs).rounded(.towardZero)
  }
  
  /// Compares two floats with an epsilon of 2*Self.ulpOfOne
  static func =~(lhs: Self, rhs: Self) -> Bool {
    abs(lhs-rhs) < (2*Self.ulpOfOne)
  }
  
  func log<T:BinaryFloatingPoint>(base: T = 10.0) -> Self { 
    Self(Darwin.log(Double(self)/Double(base)))
  }
  
  func pow<T:BinaryFloatingPoint>(exp: T) -> Self {
    Self(Darwin.pow(Double(self), Double(exp)))
  }
  
  static func **(lhs: Self, rhs: Self) -> Self { lhs.pow(exp: rhs) }
  static func **(lhs: Self, rhs: Int) -> Self { lhs.pow(exp: Double(rhs)) }
  
} // extension FloatingPoint
