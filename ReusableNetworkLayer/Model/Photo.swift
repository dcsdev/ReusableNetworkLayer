import Foundation

public struct Photo {
    let albumId         : Int;
    let id              : Int;
    let title           : String;
    let url             : String;
    let thumbnailUrl    : String;
}

extension Photo: Decodable {
    enum PhotoKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
    
    public init(from decoder: Decoder) throws {
        let photo = try decoder.container(keyedBy: PhotoKeys.self)
        
        albumId = try photo.decode(Int.self, forKey: .id)
        id = try photo.decode(Int.self, forKey: .id )
        title = try photo.decode(String.self, forKey: .title)
        url = try photo.decode(String.self, forKey: .url)
        thumbnailUrl = try photo.decode(String.self, forKey: .thumbnailUrl)
    }
}
