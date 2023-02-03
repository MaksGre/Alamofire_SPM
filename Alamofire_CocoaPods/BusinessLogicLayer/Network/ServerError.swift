//
//  ServerError.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

public struct ServerError: Decodable {
    public let error: String
    public let errno: Int
}
