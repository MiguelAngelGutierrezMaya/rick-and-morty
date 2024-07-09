//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Keybe on 13/06/23.
//

import UIKit

final class CharactersCoordinator: Coordinator {
    var navigation: UINavigationController
    private var characterFactory: CharactersFactory
    
    init(navigation: UINavigationController, charactersFactory: CharactersFactory) {
        self.navigation = navigation
        self.characterFactory = charactersFactory
    }
    
    func start() {
        let controller = characterFactory.makeModule(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
    
    
}

extension CharactersCoordinator: CharactersViewControllerCoordinator {
    func didSelectCell(urlDetail: String) {
        let coordinator = characterFactory
            .makeCharacterDetailCoordinator(
            navigation: navigation,
            urlDetail: urlDetail)
        coordinator.start()
    }
    
    
}
