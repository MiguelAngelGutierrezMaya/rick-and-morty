//
//  RemoteImageDataService.swift
//  RickAndMorty
//
//  Created by Keybe on 23/07/23.
//

import Foundation

protocol RemoteImageDataService {
    func request(url: URL?) async -> Data?
}
