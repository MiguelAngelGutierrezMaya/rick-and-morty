//
//  ResultLocationDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Keybe on 14/09/23.
//

extension ResultLocationsDTO {
    func toDomain() -> (info: Info, locations: [Location]) {
        let info = Info(next: info.next)
        let locations = results.map {
            return Location(
                name: $0.name,
                type: $0.type,
                dimension: $0.dimension,
                url: $0.url)
        }
        
        return (info: info, locations: locations)
    }
}
