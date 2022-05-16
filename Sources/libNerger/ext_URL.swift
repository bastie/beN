/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import Foundation

extension URL {
    
    public var length : UInt64? {
        get {
            let fileManager = FileManager.default
            do {
                let result = try fileManager.attributesOfItem(atPath: self.path)[.size] as! UInt64
                return result
            }
            catch {
                return nil
            }
        }
    }
}
