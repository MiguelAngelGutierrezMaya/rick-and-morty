//
//  EpisodesRepository.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 22/10/23.
//

protocol EpisodesRepository {
    func fetch(urlEpisodes: String) async throws -> (info: Info, episodes: [Episode])
}
