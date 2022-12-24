//
//  NetworkError.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import Foundation
import Moya

public final class NetworkResponse {
    
    // MARK: - Properties
    
    public enum StatusCode {
        case info, success, redirect
        case client(error: NetworkError)
        case server(error: NetworkError)
        case unknown(error: NetworkError)
    }
    public private(set) var statusCode: StatusCode
    
    // MARK: - Initial methods
    
    public init(withResponse response: Response) {
        let statusCode = response.statusCode
        let error = NetworkError(withResponse: response)
        switch statusCode {
        case 100..<200: self.statusCode = .info
        case 200..<300: self.statusCode = .success
        case 300..<400: self.statusCode = .redirect
        case 400..<500: self.statusCode = .client(error: error)
        case 500..<600: self.statusCode = .server(error: error)
        default: self.statusCode = .unknown(error: error)
        }
    }
    
}

public struct NetworkError: Error {
    
    // MARK: - Properties
    
    public enum ErrorType {
        
        // MARK: - 4xx Client Error
        
        case badRequest, unauthorized,
             paymentRequired, forbidden,
             notFound, methodNotAllowed,
             notAcceptable, proxyAuthenticationRequired,
             requestTimeout, conflict,
             gone, lengthRequired,
             preconditionFailed, payloadTooLarge,
             urlTooLong, unsupportedMediaType,
             rangeNotSatisfiable, expectationFailed,
             iAmTeapot, authenticationTimeout,
             misdirectedRequest, unprocessableEntity,
             locked, failedDependency,
             tooEarly, upgradeRequired,
             preconditionRequired, tooManyRequests,
             requestHeaderFieldsTooLarge,
             retryWith, unavailableForLegalReasons,
             clientClosedRequest, unknown
        
        // MARK: - 5xx Server Error
        
        case serverError
        
        // MARK: - Custom error
        
        case parsingError
        case customError(error: Error?)
        
        public init(withCode code: Int) { // swiftlint:disable:this cyclomatic_complexity
            switch code {
            case 400: self = .badRequest
            case 401: self = .unauthorized
            case 402: self = .paymentRequired
            case 403: self = .forbidden
            case 404: self = .notFound
            case 405: self = .methodNotAllowed
            case 406: self = .notAcceptable
            case 407: self = .proxyAuthenticationRequired
            case 408: self = .requestTimeout
            case 409: self = .conflict
            case 410: self = .gone
            case 411: self = .lengthRequired
            case 412: self = .preconditionFailed
            case 413: self = .payloadTooLarge
            case 414: self = .urlTooLong
            case 415: self = .unsupportedMediaType
            case 416: self = .rangeNotSatisfiable
            case 417: self = .expectationFailed
            case 418: self = .iAmTeapot
            case 419: self = .authenticationTimeout
            case 420: self = .misdirectedRequest
            case 421: self = .unprocessableEntity
            case 422: self = .locked
            case 423: self = .failedDependency
            case 424: self = .tooEarly
            case 425: self = .upgradeRequired
            case 426: self = .preconditionRequired
            case 427: self = .tooManyRequests
            case 428: self = .requestHeaderFieldsTooLarge
            case 429: self = .retryWith
            case 431: self = .unavailableForLegalReasons
            case 499: self = .clientClosedRequest
            case 500..<600: self = .serverError
            default: self = .unknown
            }
        }
        
        public var code: Int {
            switch self {
            case .badRequest: return 400
            case .unauthorized: return 401
            case .paymentRequired: return 402
            case .forbidden: return 403
            case .notFound: return 404
            case .methodNotAllowed: return 405
            case .notAcceptable: return 406
            case .proxyAuthenticationRequired: return 407
            case .requestTimeout: return 408
            case .conflict: return 409
            case .gone: return 410
            case .lengthRequired: return 411
            case .preconditionFailed: return 412
            case .payloadTooLarge: return 413
            case .urlTooLong: return 414
            case .unsupportedMediaType: return 415
            case .rangeNotSatisfiable: return 416
            case .expectationFailed: return 417
            case .iAmTeapot: return 418
            case .authenticationTimeout: return 419
            case .misdirectedRequest: return 420
            case .unprocessableEntity: return 421
            case .locked: return 422
            case .failedDependency: return 423
            case .tooEarly: return 424
            case .upgradeRequired: return 425
            case .preconditionRequired: return 426
            case .tooManyRequests: return 427
            case .requestHeaderFieldsTooLarge: return 428
            case .retryWith: return 429
            case .unavailableForLegalReasons: return 431
            case .clientClosedRequest: return 499
            case .serverError: return 500
            default: return -1
            }
        }
    }
    public var type: ErrorType
    public var code: Int {
        return type.code
    }
    public var description: String? {
        return errorInfo?["error"] as? String
    }
    private var errorInfo: JSON? {
        guard
            let data = responseData,
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
        else {
            return nil
        }
        
        return json
    }
    private var responseData: Data?
    
    // MARK: - Initial methods
    
    public init(withResponse response: Response) {
        let statusCode = response.statusCode
        type = ErrorType(withCode: statusCode)
        responseData = response.data
    }
    
    public init(withType type: ErrorType) {
        self.type = type
    }
    
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch type {
        case .badRequest: return description ?? "Некорректный запрос"
        case .unauthorized: return description ?? "Неверный логин или пароль"
        case .paymentRequired: return description ?? "Необходима оплата"
        case .forbidden: return description ?? "Нет прав"
        case .notFound: return description ?? "Не найдено"
        case .methodNotAllowed: return description ?? "Метод устарел"
        case .notAcceptable: return description ?? "Неприемлимо"
        case .proxyAuthenticationRequired: return description ?? "Необходима аутентификация прокси"
        case .requestTimeout: return description ?? "Истекло время ожидания"
        case .conflict: return description ?? "Конфликт"
        case .gone: return description ?? "Удалён"
        case .lengthRequired: return description ?? "Необходима длина"
        case .preconditionFailed: return description ?? "Условие ложно"
        case .payloadTooLarge: return description ?? "Полезная нагрузка слишком велика"
        case .urlTooLong: return description ?? "URL слишком длинный"
        case .unsupportedMediaType: return description ?? "Неподдерживаемый тип данных"
        case .rangeNotSatisfiable: return description ?? "Диапозон не достижим"
        case .expectationFailed: return description ?? "Ожидание не удалось"
        case .iAmTeapot: return description ?? "Я - чайник"
        case .authenticationTimeout: return description ?? "Ошибка проверки CSRF"
        case .misdirectedRequest:
            return description ?? "Запрос был перенаправлен на сервер, не способный дать ответ"
        case .unprocessableEntity: return description ?? "Необрабатываемый экземпляр"
        case .locked: return description ?? "Заблокировано"
        case .failedDependency: return description ?? "Невыполненная зависимость"
        case .tooEarly: return description ?? "Слишком рано"
        case .upgradeRequired: return description ?? "Необходимо обновление"
        case .preconditionRequired: return description ?? "Необходимо предусловие"
        case .tooManyRequests: return description ?? "Cлишком много запросов"
        case .requestHeaderFieldsTooLarge:
            return description ?? "Поля заголовка запроса слишком большие"
        case .retryWith: return description ?? "Повторить с"
        case .unavailableForLegalReasons: return description ?? "Недоступно по юридическим причинам"
        case .clientClosedRequest: return description ?? "Клиент закрыл соединение"
        case .unknown: return description ?? "Неизвестная ошибка"
        case .serverError: return description ?? "Ошибка сервера"
        case .parsingError: return description ?? "Ошибка обработки данных"
        case .customError(let error): return error?.localizedDescription
        }
    }
    
}
