//
//  File.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

import Combine

extension Publisher {
    func void() -> Publishers.Map<Self, Void> {
        self
            .map { _ in Void() }
    }
}
