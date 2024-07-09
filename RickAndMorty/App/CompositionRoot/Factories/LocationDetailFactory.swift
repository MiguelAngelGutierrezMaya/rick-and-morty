//
//  LocationDetailFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 30/08/23.
//

import UIKit

protocol LocationDetailFactory {
    func makeModule() -> UIViewController
}

struct LocationDetailFactoryImp: LocationDetailFactory {
    func makeModule() -> UIViewController {
        let controller = LocationDetailViewController()
        controller.title = "Location detail"
        return controller
    }
}
