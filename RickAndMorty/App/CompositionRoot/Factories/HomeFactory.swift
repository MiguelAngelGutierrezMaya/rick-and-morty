//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 20/03/23.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
    func makeCharactersCoordinator(navigation: UINavigationController, urlList: String)  -> Coordinator
    func makeLocationsCoordinator(
        navigation: UINavigationController,
        urlLocations: String
    ) -> Coordinator
    func makeEpisodesCoordinator(
        navigation: UINavigationController,
        urlEpisodes: String
    ) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    let appContainer: AppContainer
    
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            viewModel: homeMenuViewModel,
            layout: makeLayout(),
            coordinator: coordinator
        )
        homeMenuController.title = AppLocalized.appName
        return homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalPadding,
            bottom: .zero,
            right: ViewValues.normalPadding
        )
        return layout
    }
    
    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String) -> Coordinator {
        let charactersFactory = CharactersFactoryImp(
            appContainer: appContainer,
            urlList: urlList)
        let characterCoordinator = CharactersCoordinator(
            navigation: navigation,
            charactersFactory: charactersFactory)
        return characterCoordinator
    }
    
    func makeLocationsCoordinator(
        navigation: UINavigationController,
        urlLocations: String
    ) -> Coordinator {
        let locationsFactory = LocationsFactoryImp(
            urlLocations: urlLocations,
            appContainer: appContainer)
        let locationCoordinator = LocationsCoordinator(locationFactory: locationsFactory, navigation: navigation)
        return locationCoordinator
    }
    
    func makeEpisodesCoordinator(
        navigation: UINavigationController,
        urlEpisodes: String
    ) -> Coordinator {
        let episodesFactory = EpisodesFactoryImp(
            urlEpisodes: urlEpisodes,
            appContainer: appContainer)
        let episodesCoordinator = EpisodesCoordinator(
            episodesFactory: episodesFactory,
            navigation: navigation
        )
        return episodesCoordinator
    }
    
}
