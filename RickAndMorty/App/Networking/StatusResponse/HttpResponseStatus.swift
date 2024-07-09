//
//  HttpResponseStatus.swift
//  RickAndMorty
//
//  Created by Keybe on 30/04/23.
//

enum HttpResponseStatus {
    static let ok = 200...209
    static let clientError = 400...499
    static let serverError = 500...599
}
