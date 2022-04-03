/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import Foundation
import libNerger

@main
struct beNerger {
    
    /// Application entry point over @main attribute
    static func main () {
        // where I am?
        print ("\(CommandLine.arguments[0])")
        
        // create a new header
        let header = KurtNergerHeader()
        
        // print human readable header like toString in other programming languages
        print("\(header)")
        // create a (saveable) Data instance
        let binaryHeader = Data.create(from: header)
        // print some information over the data object
        print ("Header size : \(binaryHeader.count)")
        print ("Header value: \(binaryHeader.hex)")
    }
}

