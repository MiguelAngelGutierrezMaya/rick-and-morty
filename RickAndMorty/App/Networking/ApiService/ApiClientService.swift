//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by Keybe on 29/04/23.
//
import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
