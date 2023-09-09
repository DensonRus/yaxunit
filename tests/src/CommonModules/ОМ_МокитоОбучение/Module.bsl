//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2023 BIA-Technologies Limited Liability Company
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Область СлужебныйПрограммныйИнтерфейс

Процедура ИсполняемыеСценарии() Экспорт
	
	ЮТТесты
		.ДобавитьТест("ВыброситьИсключение")
	;
	
КонецПроцедуры

Процедура ВыброситьИсключение() Экспорт
	
	Адрес = "service.com";
	
	Мокито.Обучение(Интеграция)
		.Когда("ВыполнитьЗапрос")
		.ВыброситьИсключение("Не верные параметры вызова")
		.Когда(Интеграция.ВыполнитьЗапрос(Адрес, Мокито.ЛюбойПараметр(), Мокито.ЛюбойПараметр()))
		.Вернуть(1)
		.Прогон();
		
	ЮТест.ОжидаетЧто(Интеграция)
		.Метод("ВыполнитьЗапрос", Мокито.МассивПараметров(Адрес, 1))
		.НеВыбрасываетИсключение()
		.Метод("ВыполнитьЗапрос", Мокито.МассивПараметров(1, 1))
		.ВыбрасываетИсключение("Не верные параметры вызова");
	
КонецПроцедуры

#КонецОбласти
