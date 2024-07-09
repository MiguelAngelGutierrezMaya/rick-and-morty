//
//  LocationDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Keybe on 30/08/23.
//

import UIKit

final class LocationDetailCoordinator: Coordinator {
    private var locationDetailFactory: LocationDetailFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, locationDetailFactory: LocationDetailFactory) {
        self.navigation = navigation
        self.locationDetailFactory = locationDetailFactory
    }
    
    func start() {
        let controller = locationDetailFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
}
