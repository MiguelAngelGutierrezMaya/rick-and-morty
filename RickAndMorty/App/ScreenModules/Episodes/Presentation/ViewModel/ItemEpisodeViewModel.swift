//
//  ItemEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 31/10/23.
//

struct ItemEpisodeViewModel {
    private(set) var episode: Episode
    
    var numberEpisode: String {
        "# \(episode.id)"
    }
    
    var nameEpisode: String {
        episode.name
    }
    
    var airDate: String {
        episode.airDate
    }
    
    var seasonAndEpisode: String {
        episode.episode
    }
}
