//
//  CharacterDetailRepositoryImp.swift
//  RickAndMorty
//
//  Created by Keybe on 3/08/23.
//

import Foundation

struct CharacterDetailRepositoryImp: CharacterDetailRepository {
    private(set) var remoteService: ApiClientService
    
    func fetchCharacterDetail(urlDetail: String) async throws -> Character {
        let url = URL(string: urlDetail)
        let result = try await remoteService.request(url: url, type: CharactersDTO.self)
        return result.toDomain()
    }
}
