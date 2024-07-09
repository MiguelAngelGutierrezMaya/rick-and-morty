//
//  LocationFactory.swift
//  RickAndMorty
//
//  Created by Keybe on 13/09/23.
//

import UIKit
import Combine

protocol LocationsFactory {
    func makeModule() -> UIViewController
}

struct LocationsFactoryImp: LocationsFactory {
    private(set) var urlLocations: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let locationsRepository = LocationsRepositoryImp(
            remoteServices: appContainer.apiClient
        )
        let loadLocationsUseCase = LoadLocationsUseCaseImp(
            locationsRepository: locationsRepository,
            urlLocations: urlLocations
        )
        let lastPageUseCase = LastPageValidationUseCaseImp()
        
        let viewModel = LocationViewModelImp(
            loadLocationsUseCase: loadLocationsUseCase,
            lastPageUseCase: lastPageUseCase,
            state: state
        )
        
        let controller = LocationsViewController(viewModel: viewModel)
        controller.title = AppLocalized.locations
        return controller
    }
}
