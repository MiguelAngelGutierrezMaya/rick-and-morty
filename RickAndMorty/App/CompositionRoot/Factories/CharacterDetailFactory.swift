//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 2/08/23.
//

import UIKit
import Combine

protocol CharacterDetailFactory {
    func makeModule(
        coordinator: CharacterDetailViewControllerCoordinator
    ) -> UIViewController
    
    func makeOriginCoordinator(
        navigation: UINavigationController
    ) -> Coordinator
    
    func makeLocationCoordinator(
        navigation: UINavigationController
    ) -> Coordinator
}

struct CharacterDetailFactoryImp: CharacterDetailFactory {
    let urlDetail: String
    let appContainer: AppContainer
    
    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let characterDetailRepository = CharacterDetailRepositoryImp(
            remoteService: appContainer.apiClient)
        let loadCharacterDetailUseCase = LoadCharacterDetailUseCaseImp(
            characterDetailRepository: characterDetailRepository,
            urlDetail: urlDetail)
        let viewModel = CharacterDetailViewModelImp(
            state: state,
            loadCharacterDetailUseCase: loadCharacterDetailUseCase,
            dataImageUseCase: appContainer.getDataImageUseCase())
        let controller = CharacterDetailViewController(
            viewModel: viewModel,
            coordinator: coordinator
        )
        return controller
    }
    
    func makeOriginCoordinator(navigation: UINavigationController) -> Coordinator {
        let factory = OriginFactoryImp()
        let coordinator = OriginCoordinator(
            navigation: navigation,
            originFactory: factory)
        return coordinator
    }
    
    func makeLocationCoordinator(navigation: UINavigationController) -> Coordinator {
        let factory = LocationDetailFactoryImp()
        let coordinator = LocationDetailCoordinator(
            navigation: navigation,
            locationDetailFactory: factory)
        return coordinator
    }
}
