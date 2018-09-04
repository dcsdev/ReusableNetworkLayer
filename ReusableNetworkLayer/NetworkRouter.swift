import Foundation
import Alamofire
import SwiftyJSON

class NetworkRouter<EndPoint: NetworkEndPoint> : NetworkRouting {
    func request(route : EndPoint, completion: @escaping NetworkRoutingCompletion) {
        do {
            Alamofire.request(route.url.appendingPathComponent(route.path)).responseJSON { response in
                
                if let json = response.result.value {
                    let jsonResponse = JSON(json);
                    completion(jsonResponse, nil);
                }
            }
        }
    }
}
