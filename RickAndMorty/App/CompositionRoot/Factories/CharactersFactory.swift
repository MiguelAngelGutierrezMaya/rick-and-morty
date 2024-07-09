//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 13/06/23.
//

import UIKit
import Combine

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
    func makeCharacterDetailCoordinator(navigation: UINavigationController, urlDetail: String) -> Coordinator
}

struct CharactersFactoryImp: CharactersFactory {
    let appContainer: AppContainer
    let urlList: String
    
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = appContainer.apiClient
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharactersUseCase = LoadCharacterUseCaseImp(characterRepository: characterRepository, url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharactersViewModelImp(
            loadCharactersUseCase: loadCharactersUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase, imageDataUseCase: appContainer.getDataImageUseCase()
        )
        let controller = CharactersViewController(
            viewModel: viewModel,
            coordinator: coordinator)
        controller.title = "Characters"
        return controller
    }
    
    func makeCharacterDetailCoordinator(
        navigation: UINavigationController,
        urlDetail: String) -> Coordinator {
        let characterDetailFactory = CharacterDetailFactoryImp(
            urlDetail: urlDetail,
            appContainer: appContainer
        )
        let coordinator = CharacterDetailCoordinator(
            navigation: navigation,
            characterDetailFactory: characterDetailFactory)
        return coordinator
    }
}
