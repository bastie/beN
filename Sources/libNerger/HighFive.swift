/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */


import Foundation

public struct HighFive {

    /// Store 5-bit numeric values into a UInt64
    public static func five2high (values : [UInt8]) -> UInt64 {
        #if DEBUG
            if values.count > 12 {
                print("I-@HF-#001 § loseless max. 12 values with 5bits are less than 64 bits")
            }
            for (i, value) in values.enumerated() {
                switch i {
                case 0...12 :
                    if value > 31 {
                        print("I-@HF-#002 § loseless max. value of 31 is less than 5bits")
                    }
                case 13 :
                    if value > 15 {
                        print("I-@HF-#003 § loseless max. value of 15 is less than 4bits at last")
                    }
                default : break
                }
                
            }
        #endif
        var result = UInt64()
        for (i, value) in values.compactMap({UInt64($0)}).enumerated() {
            result += value
            if i < values.count - 1 {
                result = result << 5
            }
        }
        return result
    }
    /// Load 5-bit numeric values (incl. last 4 bit) into a [UInt8] with "The 13 Element"
    public static func high2five (value : UInt64) -> [UInt8] {
        var internValue = value
        var result : [UInt8] = []
        for _ in 0..<12 { // 12*5bit = 60, mod 4
            let next = (internValue << 59) >> 59
            result.append(UInt8(next))
            internValue = (internValue >> 5)
        }
        result.append(UInt8(internValue)) // the mod 4
        
        return result.reversed()
    }

    /// return a numeric array - at UInt64 example [0,0,0,255,255,255,255,255] for fiveHigh(31,31,31,31,31,31,31,31)
    public static func byteArray<T>(from value: T) -> [UInt8] where T: FixedWidthInteger {
        withUnsafeBytes(of: value.bigEndian, Array.init)
    }
    

}
