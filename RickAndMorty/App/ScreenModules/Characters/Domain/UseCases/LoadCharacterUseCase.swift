//
//  LoadCharacterUseCase.swift
//  RickAndMorty
//
//  Created by Keybe on 10/07/23.
//

protocol LoadCharacterUseCase {
    func execute() async -> Result<[Character], Error>
}

final class LoadCharacterUseCaseImp: LoadCharacterUseCase {
    private let characterRepository: CharactersRepository
    private var url: String
    private var result: (info: Info, character: [Character])?
    
    init(characterRepository: CharactersRepository, url: String) {
        self.characterRepository = characterRepository
        self.url = url
    }
    
    func execute() async -> Result<[Character], Error> {
        guard !url.isEmpty else {
            return .success([])
        }
        do {
            let repositoryResult: (info: Info, character: [Character]) = try await characterRepository.fetchCharacters(urlList: url)
            url = repositoryResult.info.next ?? .empty
            return .success(repositoryResult.character)
        } catch {
            return .failure(error)
        }
    }
}
