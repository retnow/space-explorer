//
//  MarsRoverManifest.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

struct MarsRoverManifest: Codable {
    let photoManifest: PhotoManifest

    enum CodingKeys: String, CodingKey {
        case photoManifest = "photo_manifest"
    }
}

// MARK: - PhotoManifest
struct PhotoManifest: Codable {
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let photos: [MarsRoverPhotoManifestDetail]

    enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case photos
    }
}

struct MarsRoverPhotoManifestDetail: Codable {
    let sol: Int
    let earthDate: String
    let totalPhotos: Int
    let cameras: [MarsRoverCamera]

    enum CodingKeys: String, CodingKey {
        case sol
        case earthDate = "earth_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

enum MarsRoverCameraType: String, Codable {
    case chemcam = "CHEMCAM"
    case fhaz = "FHAZ"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case mast = "MAST"
    case navcam = "NAVCAM"
    case rhaz = "RHAZ"
}
