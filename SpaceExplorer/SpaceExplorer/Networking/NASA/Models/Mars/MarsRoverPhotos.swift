//
//  MarsRoverPhotos.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation

struct MarsRoverPhotos: Codable {
    let photos: [MarsRoverPhoto]
}

struct MarsRoverPhoto: Codable, Identifiable {
    let id: Int
    let sol: Int
    let camera: MarsRoverCamera
    let imgSrc: String
    let earthDate: String
    let rover: MarsRover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct MarsRoverCamera: Codable, Identifiable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

struct MarsRover: Codable, Identifiable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let cameras: [MarsRoverCameraName]

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

// MARK: - CameraElement
struct MarsRoverCameraName: Codable {
    let name: String
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}
