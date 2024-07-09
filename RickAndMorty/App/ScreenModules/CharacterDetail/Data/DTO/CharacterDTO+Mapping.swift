//
//  CharacterDTO+Mapping.swift
//  RickAndMorty
//
//  Created by Keybe on 3/08/23.
//

extension CharactersDTO {
    func toDomain() -> Character {
        let status = StatusCharacter(status: status)
        let specie = Specie(specie: species)
        let origin = Origin(name: origin.name, url: origin.url)
        let location = Location(
            name: location.name,
            type: location.type,
            dimension: location.url,
            url: location.url
        )
        
        return Character(
            id: id,
            name: name,
            status: status,
            specie: specie,
            urlCharacter: url,
            urlImage: image,
            origin: origin,
            location: location
        )
    }
}
