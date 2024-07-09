//
//  LocationsRepositoryImp.swift
//  RickAndMorty
//
//  Created by Keybe on 14/09/23.
//

import Foundation

struct LocationsRepositoryImp: LocationsRepository {
    private(set) var remoteServices: ApiClientService
    
    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location]) {
        let url = URL(string: urlLocations)
        return try await remoteServices.request(
            url: url,
            type: ResultLocationsDTO.self)
        .toDomain()
    }
    
    
}
