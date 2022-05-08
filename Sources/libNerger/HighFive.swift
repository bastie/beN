//
//  File.swift
//  
//
//  Created by Administrator on 29.04.22.
//

import Foundation

struct HighFive {

    static func five2high (values : [UInt8]) -> UInt64 {
        guard values.count < 13 else {
            #if DEBUG
            print(<#T##self: HighFive##HighFive#>)
        }
        var result = UInt64()
        for (i, value) in values.compactMap({UInt64($0)}).enumerated() {
            result += value
            if i < values.count - 1 {
                result = result << 5
            }
        }
        return result
    }
    
    print(String (result, radix: 2))

    
     tmp = result
    var original : [UInt8] = []
    for _ in 0..<12 { // 12*5bit = 60, mod 4
        let next = (tmp << 59) >> 59
        original.append(UInt8(next))
        tmp = (tmp >> 5)
    }
    original.append(UInt8(tmp))
    
    print(original)
    // end of generic


}
