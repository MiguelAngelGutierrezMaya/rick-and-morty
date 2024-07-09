//
//  ImageDataRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 23/07/23.
//

import Foundation

protocol ImageDataRepository {
    func fetchData(url: URL?) async -> Data?
    func getFromCache(url: String?) -> Data?
}
