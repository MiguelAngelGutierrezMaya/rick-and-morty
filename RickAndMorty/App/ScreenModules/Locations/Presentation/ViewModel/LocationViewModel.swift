//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 2/10/23.
//

import Combine

protocol LocationViewModel: BaseViewModel {
    var itemsLocationCount: Int { get }
    var lastPage: Bool { get }
    func getItemLocationViewModel(row: Int) -> ItemLocationViewModel
}

final class LocationViewModelImp: LocationViewModel {
    // MARK: - Internal Properties
    var itemsLocationCount: Int {
        return locations.count
    }
    
    var lastPage: Bool {
        return lastPageUseCase.lastPage
    }
    
    var state: PassthroughSubject<StateController, Never>
    
    // MARK: - Private Properties
    private var loadLocationsUseCase: LoadLocationsUseCase
    private var lastPageUseCase: LastPageValidationUseCase
    private var locations: [Location] = []
    
    // MARK: - Life Cycle
    
    init(loadLocationsUseCase: LoadLocationsUseCase,
         lastPageUseCase: LastPageValidationUseCase, state: PassthroughSubject<StateController, Never>) {
        self.loadLocationsUseCase = loadLocationsUseCase
        self.lastPageUseCase = lastPageUseCase
        self.state = state
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task { [weak self] in
            let result = await self?.loadLocationsUseCase.execute()
            switch result {
            case .success(let locations):
                self?.lastPageUseCase.updateLastPage(itemsCount: locations.count)
                self?.locations.append(contentsOf: locations)
                
                self?.state.send(.success)
            case .failure(let error):
                self?.state.send(.fail(error: error.localizedDescription))
                
            case .none:
                print("none")
            }
        }
    }
    
    
    // MARK: - Helpers
    
    func getItemLocationViewModel(row: Int) -> ItemLocationViewModel {
        checkAndLoadMoreItems(row: row)
        let location = locations[row]
        let itemLocationViewModel = ItemLocationViewModel(location: location)
        return itemLocationViewModel
    }
    
    private func checkAndLoadMoreItems(row: Int) {
        lastPageUseCase.checkAndLoadMoreItems(row: row, actualItems: locations.count, action: viewDidLoad)
    }
    
    // MARK: - Actions
    
    // MARK: - Extensions here
    
    
    
    
    
}
