//
//  ItemCharacterViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 10/07/23.
//
import Foundation

struct ItemCharacterViewModel {
    // The property set allow avoid init function like direct injectable
    private(set) var character: Character
    private(set) var dataImageUseCase: ImageDataUseCase
    
    var name: String {
        character.name
    }
    
    var specie: String {
        character.specie.description
    }
    
    var status: String {
        character.status?.description ?? ""
    }
    
    var imageData: Data? {
        dataImageUseCase.getDataFromCache(url: character.urlImage)
    }
    
    // TODO: create the URL in the Data layer not in presentation layer
    func getImageData() async -> Data? {
        let url = URL(string: character.urlImage ?? .empty)
        return await dataImageUseCase.getData(url: url)
    }
}
