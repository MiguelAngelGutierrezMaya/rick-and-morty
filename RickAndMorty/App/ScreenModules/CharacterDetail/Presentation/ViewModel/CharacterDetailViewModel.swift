//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 10/08/23.
//

import Foundation
import Combine

protocol CharacterDetailViewModel: BaseViewModel {
    var nameCharacter: String { get }
    var status: String { get }
    var specie: String { get }
    var imageData: Data? { get }
    var origin: String { get }
    var location: String { get }
}

final class CharacterDetailViewModelImp: CharacterDetailViewModel {
    // MARK: - Internal properties
    
    var nameCharacter: String {
        return character?.name ?? .empty
    }
    
    var status: String {
        return character?.status?.description ?? .empty
    }
    
    var specie: String {
        return character?.specie.description ?? .empty
    }
    
    var imageData: Data? {
        dataImageUseCase.getDataFromCache(url: character?.urlImage)
    }
    
    var origin: String {
        return character?.origin.name ?? .empty
    }
    
    var location: String {
        return character?.location.name ?? .empty
    }
    
    var state: PassthroughSubject<StateController, Never>
    
    // MARK: - Private properties
    private let loadCharacterDetailUseCase: LoadCharacterDetailUseCase
    private let dataImageUseCase: ImageDataUseCase
    private var character: Character?
    
    init(
        state: PassthroughSubject<StateController, Never>,
        loadCharacterDetailUseCase: LoadCharacterDetailUseCase,
        dataImageUseCase: ImageDataUseCase
        //character: Character
    ) {
            self.state = state
            self.loadCharacterDetailUseCase = loadCharacterDetailUseCase
            self.dataImageUseCase = dataImageUseCase
            //self.character = character
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            do {
                let result = try await loadCharacterDetailUseCase.execute()
                character = result
                state.send(.success)
            } catch {
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }
    
    
}
