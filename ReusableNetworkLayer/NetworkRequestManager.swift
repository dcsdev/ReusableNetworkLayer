import Foundation
import SwiftyJSON

public typealias PostResponseCompletion = (Post?)->();
public typealias PhotoResponseCompletion = (Photo?)->();

struct NetworkRequestManager {
    
    private let networkRouter = NetworkRouter<JSONPlaceHolderAPI>()
    
    func getPhoto (with itemID: Int, completion: @escaping PhotoResponseCompletion) {
        networkRouter.request(route: .photos(id: itemID)) { (json, error) in
            do {
                let decodedPhoto = try JSONDecoder().decode(Photo.self, from: (json.rawData()))
                completion(decodedPhoto);
            } catch {
                print(error)
            }
        }
    }
    
    func getPost(with itemID: Int, completion: @escaping PostResponseCompletion) {        
        networkRouter.request(route: .posts(id: itemID)) { (json, error) in
            do {
                let decodedPost = try JSONDecoder().decode(Post.self, from: (json.rawData()))
                completion(decodedPost);
            } catch {
                print(error)
            }
        }
    }
}
