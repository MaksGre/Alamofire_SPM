//
//  Constants.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 03.02.2023.
//

public enum Constants {

    public enum Errors {
        public static let errorNoInet = "Не удаётся подключиться к Интернету.\nПроверьте подключение и повторите попытку"
        public static let errorNoData = "Сервер не вернул данные"
        public static let errorUnknown = "Неизвестная ошибка"
        public static let errorTooOften = "Слишком частое обновление"
        public static let errorDefault = "Ошибка"
        public static let errorImpossible = "This shouldn't have happened"
        public static let decodingError = "Ошибка декодирования"
        public static let needUserData = "Необходимо указать данные пользователя"
    }
}
