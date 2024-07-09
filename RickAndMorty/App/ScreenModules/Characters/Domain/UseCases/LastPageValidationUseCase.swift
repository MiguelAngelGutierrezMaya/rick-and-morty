//
//  LastPageValidationUseCase.swift
//  RickAndMorty
//
//  Created by Keybe on 12/07/23.
//

protocol LastPageValidationUseCase {
    var lastPage: Bool { get }
    mutating func updateLastPage(itemsCount: Int)
    func checkAndLoadMoreItems(
        row: Int,
        actualItems: Int,
        action:() -> Void
    )
}

struct LastPageValidationUseCaseImp: LastPageValidationUseCase {
    private var threshold: Int = 5
    var lastPage: Bool = false
    
    mutating func updateLastPage(itemsCount: Int) {
        if itemsCount == Int.zero {
            lastPage = true
        }
    }
    
    func checkAndLoadMoreItems(
        row: Int,
        actualItems: Int,
        action:() -> Void
    ) -> Void {
        guard !lastPage else {
            return
        }
        let limit = actualItems - threshold
        if limit == row {
            action()
        }
    }
    
    
}
