//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by Dani rica on 05/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
