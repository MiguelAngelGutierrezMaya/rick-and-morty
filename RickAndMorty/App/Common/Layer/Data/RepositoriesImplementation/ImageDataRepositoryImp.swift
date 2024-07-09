//
//  ImageDataRepositoryImp.swift
//  RickAndMorty
//
//  Created by Keybe on 23/07/23.
//

import Foundation

struct ImageDataRepositoryImp : ImageDataRepository {
    private(set) var remoteDataService: RemoteImageDataService
    private(set) var localDataCache: LocalDataImageService
    
    func fetchData(url: URL?) async -> Data? {
        let data = await remoteDataService.request(url: url)
        localDataCache.save(key: url?.absoluteString ?? .empty, data: data)
        return data
    }
    
    func getFromCache(url: String?) -> Data? {
        return localDataCache.get(key: url ?? .empty)
    }
}
