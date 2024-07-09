//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 10/07/23.
//
import Combine

protocol CharartersViewModel: BaseViewModel {
    var itemCharactersCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel
    func getUrlDetail(row: Int) -> String
}

final class CharactersViewModelImp: CharartersViewModel {
    var state: PassthroughSubject<StateController, Never>
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }
    var itemCharactersCount: Int {
        characters.count
    }
    
    private var characters: [Character] = []
    private let loadCharactersUseCase: LoadCharacterUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase
    private var imageDataUseCase: ImageDataUseCase
    
    init(
        loadCharactersUseCase: LoadCharacterUseCase,
        state: PassthroughSubject<StateController, Never>,
        lastPageValidationUseCase: LastPageValidationUseCase,
        imageDataUseCase: ImageDataUseCase
    ) {
        self.loadCharactersUseCase = loadCharactersUseCase
        self.state = state
        self.lastPageValidationUseCase = lastPageValidationUseCase
        self.imageDataUseCase = imageDataUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            await loadCharactersUseCase()
        }
    }
    
    private func loadCharactersUseCase() async {
        let resultUseCase: Result<[Character], Error> = await loadCharactersUseCase.execute()
        updateStateUI(resultUseCase: resultUseCase)
    }
    
    private func updateStateUI(resultUseCase: Result<[Character], Error>) {
        switch resultUseCase {
        case .success(let charactersArray):
            lastPageValidationUseCase.updateLastPage(itemsCount: charactersArray.count)
            characters.append(contentsOf: charactersArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel {
        checkAndLoadMoreCharacters(row: row)
        return makeItemCharacterViewMode(row: row)
    }
    
    private func checkAndLoadMoreCharacters(row: Int) -> Void {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: itemCharactersCount,
            action: viewDidLoad
        )
    }
    
    private func makeItemCharacterViewMode(row: Int) -> ItemCharacterViewModel {
        let character = characters[row]
        return ItemCharacterViewModel(
            character: character,
            dataImageUseCase: imageDataUseCase)
    }
    
    func getUrlDetail(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
    
    
}
