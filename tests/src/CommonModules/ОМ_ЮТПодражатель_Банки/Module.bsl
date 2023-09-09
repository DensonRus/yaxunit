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
		.ДобавитьТестовыйНабор("Банки")
			.ДобавитьТест("БИК")
			.ДобавитьТест("НомерСчета")
	;

КонецПроцедуры

#Область События

Процедура ПередВсемиТестами() Экспорт

КонецПроцедуры

Процедура ПередКаждымТестом() Экспорт

КонецПроцедуры

Процедура ПослеКаждогоТеста() Экспорт

КонецПроцедуры

Процедура ПослеВсехТестов() Экспорт

КонецПроцедуры

#КонецОбласти

Процедура БИК() Экспорт
	БИК = ЮТТестовыеДанные.Подражатель().Банки().БИК();
	Ютест.ОжидаетЧто(БИК)
		.ИмеетТип("Строка")
		.Заполнено()
		.ИмеетДлину(9)
	;
КонецПроцедуры

Процедура НомерСчета() Экспорт
	БИК = ЮТТестовыеДанные.Подражатель().Банки().БИК();
	КодВалюты = "978";
	НомерСчета = ЮТТестовыеДанные.Подражатель().Банки().НомерСчета(БИК, КодВалюты);

	Ютест.ОжидаетЧто(НомерСчета)
		.ИмеетТип("Строка")
		.Заполнено()
		.ИмеетДлину(20)
	;

	КодВалютыИзСчета = Сред(НомерСчета, 6, 3);
	ЮТест.ОжидаетЧто(КодВалютыИзСчета)
		.Равно(КодВалюты)
	;

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#КонецОбласти
