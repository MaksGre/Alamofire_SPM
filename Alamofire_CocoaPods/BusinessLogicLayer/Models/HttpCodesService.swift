//
//  HttpCodesService.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 06.02.2023.
//  Copyright © 2023 MaksSoft. All rights reserved.
//

protocol IHttpCodesService: AnyObject {
    func getRandomCode() -> Int
    func getCodeDesc(_ code: Int) -> HttpCodesDesc
}

/// Используется статья https://ru.wikipedia.org/wiki/Список_кодов_состояния_HTTP#Обзорный_список
final class HttpCodesService: IHttpCodesService {

    func getRandomCode() -> Int {
        let randomStateClass = Int.random(in: 1...5)
        switch randomStateClass {
        case 1: return Int.random(in: 100...103)
        case 2: return Int.random(in: 200...226)
        case 3: return Int.random(in: 300...308)
        case 4: return Int.random(in: 400...499)
        case 5: return Int.random(in: 500...526)
        default: return 404
        }
    }

    func getCodeDesc(_ code: Int) -> HttpCodesDesc {
        getHttpCodesDesc(code: code)
    }

    // MARK: - Private

    private func getHttpCodesDesc(code: Int) -> HttpCodesDesc {
        let unknownCodeResult = HttpCodesDesc(eng: "Forbidden", ru: "запрещено (не уполномочен)")

        switch code {
        case 100: return HttpCodesDesc(eng: "Continue", ru: "«продолжай»")
        case 101: return HttpCodesDesc(eng: "Switching", ru: "переключение протоколов")
        case 102: return HttpCodesDesc(eng: "Processing", ru: "идёт обработка")
        case 103: return HttpCodesDesc(eng: "Early", ru: "ранняя метаинформация")

        case 200: return HttpCodesDesc(eng: "OK", ru: "хорошо")
        case 201: return HttpCodesDesc(eng: "Created", ru: "создано")
        case 202: return HttpCodesDesc(eng: "Accepted", ru: "принято")
        case 203: return HttpCodesDesc(eng: "Non-Authoritative Information", ru: "информация не авторитетна")
        case 204: return HttpCodesDesc(eng: "No Content", ru: "нет содержимого")
        case 205: return HttpCodesDesc(eng: "Reset Content", ru: "сбросить содержимое")
        case 206: return HttpCodesDesc(eng: "Partial Content", ru: "частичное содержимое")
        case 207: return HttpCodesDesc(eng: "Multi-Status", ru: "многостатусный")
        case 208: return HttpCodesDesc(eng: "Already Reported", ru: "уже сообщалось")
        case 226: return HttpCodesDesc(eng: "IM Used", ru: "использовано IM")

        case 300: return HttpCodesDesc(eng: "Multiple Choices", ru: "множество выборов")
        case 301: return HttpCodesDesc(eng: "Moved Permanently", ru: "перемещено навсегда")
        case 302: return HttpCodesDesc(eng: "Moved Temporarily", ru: "перемещено временно")
        case 303: return HttpCodesDesc(eng: "See Other", ru: "смотреть другое")
        case 304: return HttpCodesDesc(eng: "Not Modified", ru: "не изменялось")
        case 305: return HttpCodesDesc(eng: "Use Proxy", ru: "использовать прокси")
        case 306: return HttpCodesDesc(eng: "Reserved", ru: "код использовался только в ранних спецификациях")
        case 307: return HttpCodesDesc(eng: "Temporary Redirect", ru: "временное перенаправление")
        case 308: return HttpCodesDesc(eng: "Permanent Redirect", ru: "постоянное перенаправление")

        case 400: return HttpCodesDesc(eng: "Bad Request", ru: "неправильный, некорректный запрос")
        case 401: return HttpCodesDesc(eng: "Unauthorized", ru: "не авторизован (не представился)")
        case 402: return HttpCodesDesc(eng: "Payment Required", ru: "необходима оплата")
        case 403: return HttpCodesDesc(eng: "Forbidden", ru: "запрещено (не уполномочен)")
        case 404: return unknownCodeResult
        case 405: return HttpCodesDesc(eng: "Method Not Allowed", ru: "метод не поддерживается")
        case 406: return HttpCodesDesc(eng: "Not Acceptable", ru: "неприемлемо")
        case 407: return HttpCodesDesc(eng: "Proxy Authentication Required", ru: "необходима аутентификация прокси")
        case 408: return HttpCodesDesc(eng: "Request Timeout", ru: "истекло время ожидания")
        case 409: return HttpCodesDesc(eng: "Conflict", ru: "конфликт")
        case 410: return HttpCodesDesc(eng: "Gone", ru: "удалён")
        case 411: return HttpCodesDesc(eng: "Length Required", ru: "необходима длина")
        case 412: return HttpCodesDesc(eng: "Precondition Failed", ru: "условие ложно")
        case 413: return HttpCodesDesc(eng: "Payload Too Large", ru: "полезная нагрузка слишком велика")
        case 414: return HttpCodesDesc(eng: "URI Too Long", ru: "URI слишком длинный")
        case 415: return HttpCodesDesc(eng: "Unsupported Media Type", ru: "неподдерживаемый тип данных")
        case 416: return HttpCodesDesc(eng: "Range Not Satisfiable", ru: "диапазон не достижим")
        case 417: return HttpCodesDesc(eng: "Expectation Failed", ru: "ожидание не удалось")
        case 418: return HttpCodesDesc(eng: "I’m a teapot", ru: "я — чайник")
        case 419: return HttpCodesDesc(eng: "Authentication Timeout", ru: "обычно ошибка проверки CSRF")
        case 421: return HttpCodesDesc(eng: "Misdirected Request", ru: "")
        case 422: return HttpCodesDesc(eng: "Unprocessable Entity", ru: "необрабатываемый экземпляр")
        case 423: return HttpCodesDesc(eng: "Locked", ru: "заблокировано")
        case 424: return HttpCodesDesc(eng: "Failed Dependency", ru: "невыполненная зависимость")
        case 425: return HttpCodesDesc(eng: "Too Early", ru: "слишком рано")
        case 426: return HttpCodesDesc(eng: "Upgrade Required", ru: "необходимо обновление")
        case 428: return HttpCodesDesc(eng: "Precondition Required", ru: "необходимо предусловие")
        case 429: return HttpCodesDesc(eng: "Too Many Requests", ru: "слишком много запросов")
        case 431: return HttpCodesDesc(eng: "Request Header Fields Too Large", ru: "поля заголовка запроса слишком большие")
        case 449: return HttpCodesDesc(eng: "Retry With", ru: "повторить с")
        case 451: return HttpCodesDesc(eng: "Unavailable For Legal Reasons", ru: "недоступно по юридическим причинам")
        case 499: return HttpCodesDesc(eng: "Client Closed Request", ru: "клиент закрыл соединение")

        case 500: return HttpCodesDesc(eng: "Internal Server Error", ru: "внутренняя ошибка сервера")
        case 501: return HttpCodesDesc(eng: "Not Implemented", ru: "не реализовано")
        case 502: return HttpCodesDesc(eng: "Bad Gateway", ru: "плохой, ошибочный шлюз")
        case 503: return HttpCodesDesc(eng: "Service Unavailable", ru: "сервис недоступен")
        case 504: return HttpCodesDesc(eng: "Gateway Timeout", ru: "шлюз не отвечает")
        case 505: return HttpCodesDesc(eng: "HTTP Version Not Supported", ru: "версия HTTP не поддерживается")
        case 506: return HttpCodesDesc(eng: "Variant Also Negotiates", ru: "вариант тоже проводит согласование")
        case 507: return HttpCodesDesc(eng: "Insufficient Storage", ru: "переполнение хранилища")
        case 508: return HttpCodesDesc(eng: "Loop Detected", ru: "обнаружено бесконечное перенаправление")
        case 509: return HttpCodesDesc(eng: "Bandwidth Limit Exceeded", ru: "исчерпана пропускная ширина канала")
        case 510: return HttpCodesDesc(eng: "Not Extended", ru: "не расширено")
        case 511: return HttpCodesDesc(eng: "Network Authentication Required", ru: "требуется сетевая аутентификация")
        case 520: return HttpCodesDesc(eng: "Unknown Error", ru: "неизвестная ошибка")
        case 521: return HttpCodesDesc(eng: "Web Server Is Down", ru: "веб-сервер не работает")
        case 522: return HttpCodesDesc(eng: "Connection Timed Out", ru: "соединение не отвечает")
        case 523: return HttpCodesDesc(eng: "Origin Is Unreachable", ru: "источник недоступен")
        case 524: return HttpCodesDesc(eng: "A Timeout Occurred", ru: "время ожидания истекло")
        case 525: return HttpCodesDesc(eng: "SSL Handshake Failed", ru: "квитирование SSL не удалось")
        case 526: return HttpCodesDesc(eng: "Invalid SSL Certificate", ru: "недействительный сертификат SSL")

        default: return unknownCodeResult
        }
    }
}
