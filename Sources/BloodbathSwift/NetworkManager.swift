import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func request(url: URLConvertible,
                 method: HTTPMethod,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 headers: HTTPHeaders? = nil,
                 completionHandler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON(completionHandler: completionHandler)
    }
}
