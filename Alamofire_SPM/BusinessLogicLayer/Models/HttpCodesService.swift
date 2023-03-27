//
//  HttpCodesService.swift
//  Alamofire_SPM
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
        let unknownCodeResult = HttpCodesDesc(eng: "Forbidden", rus: "запрещено (не уполномочен)")

        switch code {
        case 100: return HttpCodesDesc(eng: "Continue", rus: "«продолжай»")
        case 101: return HttpCodesDesc(eng: "Switching", rus: "переключение протоколов")
        case 102: return HttpCodesDesc(eng: "Processing", rus: "идёт обработка")
        case 103: return HttpCodesDesc(eng: "Early", rus: "ранняя метаинформация")

        case 200: return HttpCodesDesc(eng: "OK", rus: "хорошо")
        case 201: return HttpCodesDesc(eng: "Created", rus: "создано")
        case 202: return HttpCodesDesc(eng: "Accepted", rus: "принято")
        case 203: return HttpCodesDesc(eng: "Non-Authoritative Information", rus: "информация не авторитетна")
        case 204: return HttpCodesDesc(eng: "No Content", rus: "нет содержимого")
        case 205: return HttpCodesDesc(eng: "Reset Content", rus: "сбросить содержимое")
        case 206: return HttpCodesDesc(eng: "Partial Content", rus: "частичное содержимое")
        case 207: return HttpCodesDesc(eng: "Multi-Status", rus: "многостатусный")
        case 208: return HttpCodesDesc(eng: "Already Reported", rus: "уже сообщалось")
        case 226: return HttpCodesDesc(eng: "IM Used", rus: "использовано IM")

        case 300: return HttpCodesDesc(eng: "Multiple Choices", rus: "множество выборов")
        case 301: return HttpCodesDesc(eng: "Moved Permanently", rus: "перемещено навсегда")
        case 302: return HttpCodesDesc(eng: "Moved Temporarily", rus: "перемещено временно")
        case 303: return HttpCodesDesc(eng: "See Other", rus: "смотреть другое")
        case 304: return HttpCodesDesc(eng: "Not Modified", rus: "не изменялось")
        case 305: return HttpCodesDesc(eng: "Use Proxy", rus: "использовать прокси")
        case 306: return HttpCodesDesc(eng: "Reserved", rus: "код использовался только в ранних спецификациях")
        case 307: return HttpCodesDesc(eng: "Temporary Redirect", rus: "временное перенаправление")
        case 308: return HttpCodesDesc(eng: "Permanent Redirect", rus: "постоянное перенаправление")

        case 400: return HttpCodesDesc(eng: "Bad Request", rus: "неправильный, некорректный запрос")
        case 401: return HttpCodesDesc(eng: "Unauthorized", rus: "не авторизован (не представился)")
        case 402: return HttpCodesDesc(eng: "Payment Required", rus: "необходима оплата")
        case 403: return HttpCodesDesc(eng: "Forbidden", rus: "запрещено (не уполномочен)")
        case 404: return unknownCodeResult
        case 405: return HttpCodesDesc(eng: "Method Not Allowed", rus: "метод не поддерживается")
        case 406: return HttpCodesDesc(eng: "Not Acceptable", rus: "неприемлемо")
        case 407: return HttpCodesDesc(eng: "Proxy Authentication Required", rus: "необходима аутентификация прокси")
        case 408: return HttpCodesDesc(eng: "Request Timeout", rus: "истекло время ожидания")
        case 409: return HttpCodesDesc(eng: "Conflict", rus: "конфликт")
        case 410: return HttpCodesDesc(eng: "Gone", rus: "удалён")
        case 411: return HttpCodesDesc(eng: "Length Required", rus: "необходима длина")
        case 412: return HttpCodesDesc(eng: "Precondition Failed", rus: "условие ложно")
        case 413: return HttpCodesDesc(eng: "Payload Too Large", rus: "полезная нагрузка слишком велика")
        case 414: return HttpCodesDesc(eng: "URI Too Long", rus: "URI слишком длинный")
        case 415: return HttpCodesDesc(eng: "Unsupported Media Type", rus: "неподдерживаемый тип данных")
        case 416: return HttpCodesDesc(eng: "Range Not Satisfiable", rus: "диапазон не достижим")
        case 417: return HttpCodesDesc(eng: "Expectation Failed", rus: "ожидание не удалось")
        case 418: return HttpCodesDesc(eng: "I’m a teapot", rus: "я — чайник")
        case 419: return HttpCodesDesc(eng: "Authentication Timeout", rus: "обычно ошибка проверки CSRF")
        case 421: return HttpCodesDesc(eng: "Misdirected Request", rus: "")
        case 422: return HttpCodesDesc(eng: "Unprocessable Entity", rus: "необрабатываемый экземпляр")
        case 423: return HttpCodesDesc(eng: "Locked", rus: "заблокировано")
        case 424: return HttpCodesDesc(eng: "Failed Dependency", rus: "невыполненная зависимость")
        case 425: return HttpCodesDesc(eng: "Too Early", rus: "слишком рано")
        case 426: return HttpCodesDesc(eng: "Upgrade Required", rus: "необходимо обновление")
        case 428: return HttpCodesDesc(eng: "Precondition Required", rus: "необходимо предусловие")
        case 429: return HttpCodesDesc(eng: "Too Many Requests", rus: "слишком много запросов")
        case 431: return HttpCodesDesc(eng: "Request Header Fields Too Large", rus: "поля заголовка запроса слишком большие")
        case 449: return HttpCodesDesc(eng: "Retry With", rus: "повторить с")
        case 451: return HttpCodesDesc(eng: "Unavailable For Legal Reasons", rus: "недоступно по юридическим причинам")
        case 499: return HttpCodesDesc(eng: "Client Closed Request", rus: "клиент закрыл соединение")

        case 500: return HttpCodesDesc(eng: "Internal Server Error", rus: "внутренняя ошибка сервера")
        case 501: return HttpCodesDesc(eng: "Not Implemented", rus: "не реализовано")
        case 502: return HttpCodesDesc(eng: "Bad Gateway", rus: "плохой, ошибочный шлюз")
        case 503: return HttpCodesDesc(eng: "Service Unavailable", rus: "сервис недоступен")
        case 504: return HttpCodesDesc(eng: "Gateway Timeout", rus: "шлюз не отвечает")
        case 505: return HttpCodesDesc(eng: "HTTP Version Not Supported", rus: "версия HTTP не поддерживается")
        case 506: return HttpCodesDesc(eng: "Variant Also Negotiates", rus: "вариант тоже проводит согласование")
        case 507: return HttpCodesDesc(eng: "Insufficient Storage", rus: "переполнение хранилища")
        case 508: return HttpCodesDesc(eng: "Loop Detected", rus: "обнаружено бесконечное перенаправление")
        case 509: return HttpCodesDesc(eng: "Bandwidth Limit Exceeded", rus: "исчерпана пропускная ширина канала")
        case 510: return HttpCodesDesc(eng: "Not Extended", rus: "не расширено")
        case 511: return HttpCodesDesc(eng: "Network Authentication Required", rus: "требуется сетевая аутентификация")
        case 520: return HttpCodesDesc(eng: "Unknown Error", rus: "неизвестная ошибка")
        case 521: return HttpCodesDesc(eng: "Web Server Is Down", rus: "веб-сервер не работает")
        case 522: return HttpCodesDesc(eng: "Connection Timed Out", rus: "соединение не отвечает")
        case 523: return HttpCodesDesc(eng: "Origin Is Unreachable", rus: "источник недоступен")
        case 524: return HttpCodesDesc(eng: "A Timeout Occurred", rus: "время ожидания истекло")
        case 525: return HttpCodesDesc(eng: "SSL Handshake Failed", rus: "квитирование SSL не удалось")
        case 526: return HttpCodesDesc(eng: "Invalid SSL Certificate", rus: "недействительный сертификат SSL")

        default: return unknownCodeResult
        }
    }
}
