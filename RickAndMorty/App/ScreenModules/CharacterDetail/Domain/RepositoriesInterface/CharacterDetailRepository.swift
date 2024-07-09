//
//  CharacterDetailRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 3/08/23.
//

protocol CharacterDetailRepository {
    func fetchCharacterDetail(urlDetail: String) async throws -> Character
}
