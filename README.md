Rack приложение которое будет отвечать на  
URL GET /time
с параметром строки запроса format и возвращать время в заданном формате. 

Например, GET-запрос  
/time?format=year%2Cmonth%2Cday
вернет ответ с типом text/plain и телом 1970-01-01.

==========================================================================

"Rack приложение:
Это класс. В его обязанности входит обработка запроса и формирование ответа в формате совместимом с rack.Здесь мы проверяем правильный ли пришёл URL или нужно отдать 404, хватает ли параметров или нужно отдать 400-й статус. При этом логику формирования тела ответа помещаем в отдельный класс логики.

Класс логики:
Это отдельный простой Ruby класс. Он ничего не должен знать о rack приложении, иными словами о том кто и где будет его использовать. Мы можем вызывать его из консоли или в другом Ruby приложении без HTTP API интерфейса." ©
