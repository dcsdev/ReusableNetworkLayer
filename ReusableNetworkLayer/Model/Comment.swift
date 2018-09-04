import Foundation

public struct Comment {
    let postId      : Int;
    let id          : Int;
    let name        : String;
    let email       : String;
    let body        : String;
}

extension Comment: Decodable {
    enum CommentKeys: String, CodingKey {
        case postId
        case id
        case name
        case email
        case body
    }
    
    public init(from decoder: Decoder) throws {
        let comment = try decoder.container(keyedBy: CommentKeys.self)
        
        id = try comment.decode(Int.self, forKey: .id)
        name = try comment.decode(String.self, forKey: .name )
        email = try comment.decode(String.self, forKey: .email)
        body = try comment.decode(String.self, forKey: .body)
        postId = try comment.decode(Int.self, forKey: .postId)
    }
}
