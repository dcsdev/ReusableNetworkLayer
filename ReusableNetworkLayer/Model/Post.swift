import Foundation

public struct Post {
    let userId      : Int;
    let id          : Int;
    let title       : String;
    let body        : String;
}

extension Post: Decodable {
    enum PostKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
    public init(from decoder: Decoder) throws {
        let post = try decoder.container(keyedBy: PostKeys.self)
        
        id = try post.decode(Int.self, forKey: .id)
        userId = try post.decode(Int.self, forKey: .userId)
        title = try post.decode(String.self, forKey: .title)
        body = try post.decode(String.self, forKey: .body)
    }
}
