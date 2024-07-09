//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Keybe on 30/04/23.
//

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
