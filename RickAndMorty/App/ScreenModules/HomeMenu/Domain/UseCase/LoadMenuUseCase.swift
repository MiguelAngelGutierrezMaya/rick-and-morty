//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by Keybe on 18/04/23.
//

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch let error {
            return .failure(error)
        }
    }
    
    
}
