//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by Keybe on 18/04/23.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
