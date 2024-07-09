//
//  LocationsRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 14/09/23.
//

protocol LocationsRepository {
    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location])
}
