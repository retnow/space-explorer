//
//  DataAdapter.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol DataAdapter {
    func request<T: Endpoint>(
        endpoint: T) -> AnyPublisher<T.ResultType, NASA.Errors>
}
