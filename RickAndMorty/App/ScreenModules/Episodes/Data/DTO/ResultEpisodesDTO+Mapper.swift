//
//  ResultEpisodesDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 22/10/23.
//

extension ResultEpisodesDTO {
    func toDomain() -> (info: Info, episodes: [Episode]) {
        let info = Info(
            next: info.next
        )
        let episodes = results.map {
            Episode(
                id: $0.id,
                name: $0.name,
                airDate: $0.airDate,
                episode: $0.episode
            )
        }
        return (info, episodes)
    }
}
