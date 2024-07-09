//
//  HomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 19/04/23.
//

import Combine
import Foundation

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuItem
}

final class HomeMenuViewModelImp: HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var menuItemsCount: Int {
        menuItems.count
    }
    
    private let loadMenuUseCase: LoadMenuUseCase
    private var menuItems: [MenuItem] = []
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result: Result<[MenuItem], Error> = await loadMenuUseCase.execute()
            updateUI(result: result)
        }
    }
    
    // This config below is used for put in main execution the request and avoid errors
    // it's only used if .receive(on: RunLoop.main) is not defined in HomeMenuController
    // @MainActor private func updateUI(result: Result<[MenuItem], Error>) {
    private func updateUI(result: Result<[MenuItem], Error>) {
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel {
        let menuItem = menuItems[indexPath.row]
        return ItemHomeMenuViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuItem {
        menuItems[indexPath.row]
    }
    
    
}
