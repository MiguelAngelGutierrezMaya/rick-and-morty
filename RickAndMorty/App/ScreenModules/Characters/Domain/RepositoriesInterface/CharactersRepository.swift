//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

protocol CharactersRepository {
    func fetchCharacters(
        urlList: String
    ) async throws -> (info: Info, character: [Character])
}
