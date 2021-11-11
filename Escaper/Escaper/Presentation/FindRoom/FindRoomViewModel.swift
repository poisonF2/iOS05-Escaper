//
//  FindRoomViewModel.swift
//  Escaper
//
//  Created by TakHyun Jung on 2021/11/13.
//

import Foundation

protocol FindRoomViewModelInput {
    func fetch(name: String)
}

protocol FindRoomViewModelOutput {
    var rooms: Observable<[Room]> { get }
}

class FindRoomViewModel: FindRoomViewModelInput, FindRoomViewModelOutput {
    private let usecase: RoomListUseCaseInterface
    private(set) var rooms: Observable<[Room]>

    init(usecase: RoomListUseCaseInterface) {
        self.usecase = usecase
        self.rooms = Observable([])
    }

    func fetch(name: String) {
        self.usecase.fetch(name: name) { result in
            switch result {
            case .success(let rooms):
                self.rooms.value = rooms
            case .failure(let error):
                print(error)
            }
        }
    }
}