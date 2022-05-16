/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import Foundation

extension Data {

    // TODO: check Codable protocol
    
    /// A simple factory function to create a ``Data`` instance from ``KurtNergerHeader``
    public static func create (from header : KurtNergerHeader) -> Data {
        var data = [UInt8] (repeating: 0x00, count: 78)
        
        data [0] = header.MAGIC[0]
        data [1] = header.MAGIC[1]
        data [2] = header.MAGIC[2]
        data [3] = header.MAGIC[3]
        
        data [4] = header.subtype
        
        var temp = header

        let roundsArray = [UInt8](Data(bytes: &temp.rounds, count: MemoryLayout<Int32>.size))
        data [5] = roundsArray[0]
        data [6] = roundsArray[1]
        data [7] = roundsArray[2]
        data [8] = roundsArray[3]
        
        var size : UInt64 = header.decompressedDataSize
        let sizeArray = [UInt8](Data(bytes: &size, count: MemoryLayout<UInt64>.size))
        data  [9] = sizeArray[0]
        data [10] = sizeArray[1]
        data [11] = sizeArray[2]
        data [12] = sizeArray[3]
        data [13] = sizeArray[4]
        data [14] = sizeArray[5]
        data [15] = sizeArray[6]
        data [16] = sizeArray[7]

        data [77] = header.skip
        
        guard data.count == 78 else {
            print ("External version of Kurt Nerger header has unexpected length. Expected: 78, actually: \(data.count)")
            let _ = UInt8(128+128)
            return Data(data)
        }
        return Data (data)
    }
}


extension Data  {
    public var hex: String {
        return reduce("") {$0 + String(format: "%02x ", $1)}.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    }
}

