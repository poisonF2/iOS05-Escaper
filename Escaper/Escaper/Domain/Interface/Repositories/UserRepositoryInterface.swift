//
//  UserRepositoryInterface.swift
//  Escaper
//
//  Created by shinheeRo on 2021/11/22.
//

import Foundation

protocol UserRepositoryInterface {
    func query(userEmail: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func confirm(userEmail: String, userPassword: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func add(user: User)
}