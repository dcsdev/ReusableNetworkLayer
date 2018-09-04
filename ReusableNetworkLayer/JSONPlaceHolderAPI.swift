import Foundation

public enum JSONPlaceHolderAPI {
    case posts(id:Int);
    case comments(page:Int);
    case albums(page:Int);
    case photos(id:Int);
    case todos(id:Int);
    case users(id:Int);
}

extension JSONPlaceHolderAPI: NetworkEndPoint {
    var url: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }

    var path: String {
        switch self {
        case .posts(let id):
            return "posts/\(id)"
        case .albums(let id):
            return "albums/\(id)"
        case .comments(let id):
            return "comments/\(id)"
        case .photos(let id):
            return "photos/\(id)"
        case .users(let id):
            return "users/\(id)"
        case .todos(let id):
            return "todos/\(id)"
        }
    }
}
