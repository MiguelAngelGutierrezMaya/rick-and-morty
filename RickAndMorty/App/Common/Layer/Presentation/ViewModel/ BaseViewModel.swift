//
//   BaseViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 10/07/23.
//

import Combine

protocol BaseViewModel {
    var state: PassthroughSubject<StateController, Never> {get}
    func viewDidLoad()
}
