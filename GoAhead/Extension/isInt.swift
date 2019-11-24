//
//  isInt.swift
//  GoAhead
//
//  Created by Maged on 6/1/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
