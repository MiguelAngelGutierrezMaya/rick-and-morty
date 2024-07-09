//
//  HomeCoordinator.swift
//  RickAndMorty
//
//  Created by Keybe on 20/03/23.
//
import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        switch model.title {
        case ScreenRoutes.characters:
            goToCharacters(urlList: model.url)
        case ScreenRoutes.episodes:
            goToEpisodes(urlEpisodes: model.url)
        case ScreenRoutes.locations:
            goToLocations(urlLocations: model.url)
        default:
            break
        }
    }
    
    private func goToCharacters(urlList: String) {
        let charactersCoordinator = homeFactory.makeCharactersCoordinator(
            navigation: navigation,
            urlList: urlList)
        charactersCoordinator.start()
    }
    
    private func goToLocations(urlLocations: String) {
        let locationsCoordinator = homeFactory
            .makeLocationsCoordinator(
            navigation: navigation,
            urlLocations: urlLocations)
        locationsCoordinator.start()
    }
    
    private func goToEpisodes(urlEpisodes: String) {
        let episodesCoordinator = homeFactory
            .makeEpisodesCoordinator(
            navigation: navigation,
            urlEpisodes: urlEpisodes)
        episodesCoordinator.start()
    }
}
