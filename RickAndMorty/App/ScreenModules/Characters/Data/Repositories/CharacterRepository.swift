//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

import Foundation

struct CharacterRepositoryImp: CharactersRepository  {
    let apiClient: ApiClientService
    
    func fetchCharacters(urlList: String) async throws -> (info: Info, character: [Character]) {
        let url = URL(string: urlList)
        return try await apiClient.request(url: url, type: ResultsCharactersDTO.self).toDomain()
    }
}
