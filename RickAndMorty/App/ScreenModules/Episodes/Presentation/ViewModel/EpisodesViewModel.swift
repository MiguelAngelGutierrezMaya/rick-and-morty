//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 3/11/23.
//

import Combine

protocol EpisodesViewModel: BaseViewModel {
    var itemsEpisodesCount: Int {get}
    var lastPage: Bool {get}
    func getItemEpisodeViewModel(row: Int) -> ItemEpisodeViewModel
}

final class EpisodesViewModelImp: EpisodesViewModel {
    
    // MARK: - Public Properties
    var itemsEpisodesCount: Int {
        episodes.count
    }
    
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }
    
    var state: PassthroughSubject<StateController, Never>
    
    // MARK: - Private Properties
    private var loadEpisodesUseCase: LoadEpisodesUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase
    private var episodes: [Episode] = []
    
    // MARK: - Life Cycle
    init(
        state: PassthroughSubject<StateController, Never>,
        loadEpisodesUseCase: LoadEpisodesUseCase,
        lastPageValidationUseCase: LastPageValidationUseCase
    ) {
        self.state = state
        self.loadEpisodesUseCase = loadEpisodesUseCase
        self.lastPageValidationUseCase = lastPageValidationUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = try await loadEpisodesUseCase.getEpisodes()
            switch result {
            case .success(let episodesResult):
                lastPageValidationUseCase.updateLastPage(itemsCount: episodesResult.count)
                episodes.append(contentsOf: episodesResult)
                state.send(.success)
            case .failure(let error):
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }
    
    // MARK: - Helpers
    func getItemEpisodeViewModel(row: Int) -> ItemEpisodeViewModel {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: episodes.count,
            action: viewDidLoad
        )
        
        let episode = episodes[row]
        return ItemEpisodeViewModel(episode: episode)
    }
    
    // MARK: - Actions
    
    
    
}
