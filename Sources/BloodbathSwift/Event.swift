import Foundation
import Alamofire

public class Event {
    let config: Configuration

    public init(config: Configuration) {
        self.config = config
    }

    public func schedule(args: [String: Any], completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "\(config.apiBase)/events"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(config.apiKey ?? "")"]
        NetworkManager.shared.request(url: url, method: .post, parameters: args, headers: headers) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func list(completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "\(config.apiBase)/events"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(config.apiKey ?? "")"]
        NetworkManager.shared.request(url: url, method: .get, headers: headers) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

        public func find(id: String, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "\(config.apiBase)/events/\(id)"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(config.apiKey ?? "")"]
        NetworkManager.shared.request(url: url, method: .get, headers: headers) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func cancel(id: String, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "\(config.apiBase)/events/\(id)"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(config.apiKey ?? "")"]
        NetworkManager.shared.request(url: url, method: .delete, headers: headers) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
