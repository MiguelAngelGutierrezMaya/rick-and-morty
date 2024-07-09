//
//  LocationCoordinator.swift
//  RickAndMorty
//
//  Created by Keybe on 13/09/23.
//

import UIKit

final class LocationsCoordinator: Coordinator {
    private let locationFactory: LocationsFactory
    var navigation: UINavigationController
    
    init(locationFactory: LocationsFactory, navigation: UINavigationController) {
        self.locationFactory = locationFactory
        self.navigation = navigation
    }
    
    func start() {
        let controller = locationFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
}
