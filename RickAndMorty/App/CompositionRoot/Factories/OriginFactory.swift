//
//  OriginFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 30/08/23.
//

import UIKit

protocol OriginFactory {
    func makeModule() -> UIViewController
}

struct OriginFactoryImp: OriginFactory {
    func makeModule() -> UIViewController {
        let controller = OriginViewController()
        controller.title = "Origin"
        return controller
    }
}
