//
//  ImageDataUseCase.swift
//  RickAndMorty
//
//  Created by Keybe on 23/07/23.
//

import Foundation

protocol ImageDataUseCase {
    func getData(url: URL?) async -> Data?
    func getDataFromCache(url: String?) -> Data?
}

struct ImageDataUseCaseImp: ImageDataUseCase {
    private(set) var imageDataRepository: ImageDataRepository
    
    func getData(url: URL?) async -> Data? {
        return await imageDataRepository.fetchData(url: url)
    }
    
    func getDataFromCache(url: String?) -> Data? {
        return imageDataRepository.getFromCache(url: url)
    }
    
    
}
