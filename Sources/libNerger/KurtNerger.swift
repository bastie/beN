/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import Foundation

/// The **KurtNerger** algorithm ``FileHeader``.
public struct KurtNergerHeader {
    /// Every valid **KurtNerger** data starts with magic bytes x4B757274
    public let MAGIC = [UInt8] ("Kurt".data(using: .ascii)!)
    /// Subtype is a reserved part
    let subtype = UInt8 (0x20)
    /// In result of recursive algorithm rounds store the times
    public var rounds = Int32 ()
    /// **optional** we can get the size of Data without header and compression
    public var decompressedDataSize : Int64? = 0
    /// To align on compression *MicroBlockchain*-size the fille add some data upto 78 bytes
    private let filler = [UInt32] (repeating: 0x00, count: 50)
    
    public init () {}
}




extension Data {

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
        
        var size : Int64 = header.decompressedDataSize ?? 0
        let sizeArray = [UInt8](Data(bytes: &size, count: MemoryLayout<Int64>.size))
        data  [9] = sizeArray[0]
        data [10] = sizeArray[1]
        data [11] = sizeArray[2]
        data [12] = sizeArray[3]
        data [13] = sizeArray[4]
        data [14] = sizeArray[5]
        data [15] = sizeArray[6]
        data [16] = sizeArray[7]

        return Data (data)
    }
}


// MARK: other extensions

extension KurtNergerHeader : CustomStringConvertible {
    public var description: String {
        get {
            let result = """
            magic bytes: \(Data(MAGIC).hex)h => \(String(data: Data(MAGIC), encoding: .ascii)!)
            subtype    : \(Data([subtype]).hex)h
            rounds     : \(rounds)
            decompress : \(decompressedDataSize ?? 0) bytes
            """
            return result
        }
    }
}


extension Data  {
    public var hex: String {
        return reduce("") {$0 + String(format: "%02x ", $1)}.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    }
}

