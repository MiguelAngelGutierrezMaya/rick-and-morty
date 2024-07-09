//
//  AppFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 18/03/23.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigator: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    
    let appContainer = AppContainerImp()
    
    func makeHomeCoordinator(navigator: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp(appContainer: appContainer)
        let homeCoordinator = HomeCoordinator(navigation: navigator, homeFactory: homeFactory)
        return homeCoordinator
    }
}
