//
//  LoadEpisodesUseCase.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 22/10/23.
//

protocol LoadEpisodesUseCase {
    mutating func getEpisodes() async throws -> Result<[Episode], Error>
}

struct LoadEpisodesUseCaseImp: LoadEpisodesUseCase {
    private(set) var episodesRepository: EpisodesRepository
    private(set) var urlEpisodes: String
    
    mutating func getEpisodes() async throws -> Result<[Episode], Error> {
        guard !urlEpisodes.isEmpty else {
            return .success([])
        }
        
        do {
            let result = try await episodesRepository.fetch(urlEpisodes: urlEpisodes)
            urlEpisodes = result.info.next ?? ""
            return .success(result.episodes)
        } catch {
            return .failure(error)
        }
    }
}
