//
//  ResultCharactersDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

extension ResultsCharactersDTO {
    private func mapResult() -> [Character] {
        return results.map {
            let statusCharacter = StatusCharacter(status: $0.status)
            let specie = Specie(specie: $0.species)
            let origin = Origin(
                name: $0.origin.name,
                url: $0.origin.name
            )
            let location = Location(
                name: $0.location.name,
                type: $0.location.type,
                dimension: $0.location.dimension,
                url: $0.location.url)
            return Character(
                id: $0.id,
                name: $0.name,
                status: statusCharacter,
                specie: specie,
                urlCharacter: $0.url,
                urlImage: $0.image,
                origin: origin,
                location: location
            )
        }
    }
    
    func toDomain() -> (info: Info, character: [Character]) {
        let characterModel = mapResult()
        let info = Info(next: info.next)
        return (info: info, character: characterModel)
    }
}
