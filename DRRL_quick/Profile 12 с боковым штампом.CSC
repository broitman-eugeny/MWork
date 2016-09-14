GLOBAL Profile(0 TO 10000) as double, Stancia_A as string, Stancia_B as string, Azimut_pr_gr as string, Azimut_pr_min as string
GLOBAL Azimut_obr_gr as string, Azimut_obr_min as string, Zagolovok_Isp$ as string
GLOBAL Gradient_d as double
GLOBAL Chast_d as double
GLOBAL Pogr_d as double
GLOBAL Hosnright_d as double
GLOBAL Hosnleft_d as double
GLOBAL HdopLeft_d as double
GLOBAL HdopRight_d as double
GLOBAL R as double
GLOBAL N_relyef as double
GLOBAL N_prep as double
GLOBAL N_voda as double
GLOBAL Mashtab_karty as string
GLOBAL Mashtab_x as double
GLOBAL Mashtab_x_txt as string
GLOBAL Mashtab_y as double
GLOBAL Mashtab_y_txt as string
GLOBAL X_0_profile as double
GLOBAL X_0_table as double
GLOBAL X_0_A as double
GLOBAL X_0_B as double
GLOBAL Hor as double
GLOBAL PRP as integer



Gradient_d=0
Chast_d=8 
Pogr_d=3
Hosnright_d=30
Hosnleft_d=30
HdopLeft_d=0
HdopRight_d=0

Function Round (float as double, prec as integer) AS double
	
	Z=fix(float*10.^prec)
	IF(abs(float*10.^prec-Z)>0.5) then
		Round=(Z+sgn(Z))/(10.^prec)
	else
		Round=Z/(10.^prec)
	endif

END Function

Function OEM_to_ANSI (oem_str as string) AS string
	
	N=LEN(oem_str)

	FOR i = 1 TO N
		
		s=(ASC(oem_str)+256) MOD 256
		IF s>127 AND s<176 THEN
			OEM_to_ANSI=OEM_to_ANSI+CHR(s+64)
		ELSEIF s>223 AND s<240 THEN
			OEM_to_ANSI=OEM_to_ANSI+CHR(s+16)
		ELSEIF s=240 THEN
			OEM_to_ANSI=OEM_to_ANSI+CHR(168)
		ELSEIF s=241 THEN
			OEM_to_ANSI=OEM_to_ANSI+CHR(184)	
		ELSE
			OEM_to_ANSI=OEM_to_ANSI+CHR(s)
		ENDIF
		oem_str=RIGHT(oem_str, N-i)
	
	NEXT i

END Function

SUB PrObr_degmin (Azimut as string)
	
	N=LEN(Azimut)
	i=0
	DO WHILE (ASC(Azimut) > 57 or ASC(Azimut) < 48) and ASC(Azimut) <> 46 and (i<>N)
		i=i+1
		Azimut=RIGHT(Azimut, N-i)
	LOOP
	
	N=LEN(Azimut)
	i=0
	az=Azimut
	DO WHILE (ASC(az) < 58 and ASC(az) > 47 or ASC(az) = 46) and (i<>N)
		i=i+1 
		az=RIGHT(az,N-i)
	LOOP
	
	Azimut_pr_gr=LEFT(Azimut, i)
	
	
	Azimut=az
	N=LEN(Azimut)
	i=0
	DO WHILE (ASC(Azimut) > 57 or ASC(Azimut) < 48) and ASC(Azimut) <> 46 and (i<>N)
		i=i+1
		Azimut=RIGHT(Azimut, N-i)
	LOOP
	
	
	N=LEN(Azimut)
	i=0
	az=Azimut
	DO WHILE (ASC(az) < 58 and ASC(az) > 47 or ASC(az) = 46) and (i<>N)
		i=i+1
		az=RIGHT(az,N-i) 
	LOOP
	
	Azimut_pr_min=LEFT(Azimut, i)
	
	Azimut=az
	'Azimut=LTRIM(Azimut)
	N=LEN(Azimut)
	i=0
	DO WHILE (ASC(Azimut) > 57 or ASC(Azimut) < 48) and ASC(Azimut) <> 46 and (i<>N)
		i=i+1
		Azimut=RIGHT(Azimut, N-i)
	LOOP
	
	N=LEN(Azimut)
	i=0
	az=Azimut
	DO WHILE (ASC(az) < 58 and ASC(az) > 47 or ASC(az) = 46) and (i<>N)
		i=i+1
		az=RIGHT(az,N-i) 
	LOOP
	
	Azimut_obr_gr=LEFT(Azimut, i)
	
	Azimut=az
	'Azimut=LTRIM(Azimut)	
	N=LEN(Azimut)
	i=0
	DO WHILE (ASC(Azimut) > 57 or ASC(Azimut) < 48) and ASC(Azimut) <> 46 and (i<>N)
		i=i+1
		Azimut=RIGHT(Azimut, N-i)
	LOOP
	
	N=LEN(Azimut)
	i=0
	az=Azimut
	DO WHILE (ASC(az) < 58 and ASC(az) > 47 or ASC(az) = 46) and (i<>N)
		i=i+1
	LOOP
	
	Azimut_obr_min=LEFT(Azimut, i)
		
END SUB


SUB Ramka_stamp ()
WITHOBJECT "CorelDraw.Automation.12"
	 .FileNew
	.SetPageSize 4200000,2970000
	'.SetPageOrientation 1
	.CreateRectangle 1435000, -1900000, -1435000, 2050000, 0
	.SetOutlineWidth 10000
	.CreateRectangle -885000, 200000, -1435000, 2050000, 0
	.SetOutlineWidth 10000
	.BeginDrawCurve 850000, -885000
	.DrawCurveLineTo 850000, -1435000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 300000, -885000
	.DrawCurveLineTo 300000, -1135000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 400000, -885000
	.DrawCurveLineTo 400000, -1435000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 500000, -885000
	.DrawCurveLineTo 500000, -1135000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 600000, -885000
	.DrawCurveLineTo 600000, -1435000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 750000, -885000
	.DrawCurveLineTo 750000, -1435000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 1550000, -1135000
	.DrawCurveLineTo 1550000, -1435000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 1700000, -1135000
	.DrawCurveLineTo 1700000, -1285000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 1850000, -1135000
	.DrawCurveLineTo 1850000, -1285000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 200000, -935000
	.DrawCurveLineTo 850000, -935000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -985000
	.DrawCurveLineTo 850000, -985000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1035000
	.DrawCurveLineTo 850000, -1035000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1085000
	.DrawCurveLineTo 850000, -1085000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 200000, -1135000
	.DrawCurveLineTo 2050000, -1135000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 200000, -1185000
	.DrawCurveLineTo 850000, -1185000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1235000
	.DrawCurveLineTo 850000, -1235000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1285000
	.DrawCurveLineTo 850000, -1285000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1335000
	.DrawCurveLineTo 850000, -1335000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 200000, -1385000
	.DrawCurveLineTo 850000, -1385000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawCurve 850000, -985000
	.DrawCurveLineTo 2050000, -985000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 1550000, -1185000
	.DrawCurveLineTo 2050000, -1185000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve 850000, -1285000
	.DrawCurveLineTo 2050000, -1285000
	.DrawCurveClosePath
	.EndDrawCurve
	.SetOutlineWidth 10000
	.SelectObjectsInRect 1486000, -2110000, -1486000, 2110000, 0
	.Group
	.CreateArtisticText "XXXX-0-РЛ-1", 0, 0
	.SetReferencePoint 4
	.SetPosition 1450000, -935000
	.SetCharacterAttributes 0, 10, "Arial Cyr", 7, 160, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Титул объекта", 0, 0
	.SetReferencePoint 4
	.SetPosition 1450000, -1035000
	.SetCharacterAttributes 0, 13, "Arial Cyr", 7, 120, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText Stancia_A + " - " + Stancia_B, 0, 0
	.SetReferencePoint 4
	.SetPosition 1200000, -1210000
	.SetCharacterAttributes 0, 50, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Продольный профиль интервала РРЛ", 0, 0
	.SetReferencePoint 4
	.SetPosition 1200000, -1360000
	.SetCharacterAttributes 0, 31, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Стади" + CHR(255), 0, 0
	.SetReferencePoint 4
	.SetPosition 1625000, -1145000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Лист", 0, 0
	.SetReferencePoint 4
	.SetPosition 1775000, -1140000
	.SetCharacterAttributes 0, 4, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Листов", 0, 0
	.SetReferencePoint 4
	.SetPosition 1950000, -1140000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "П", 0, 0
	.SetReferencePoint 5
	.SetPosition 1630000, -1235000
	.SetCharacterAttributes 0, 2, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "-", 0, 0
	.SetReferencePoint 5
	.SetPosition 1775000, -1235000
	.SetCharacterAttributes 0, 1, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "1", 0, 0
	.SetReferencePoint 5
	.SetPosition 1950000, -1235000
	.SetCharacterAttributes 0, 1, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "ОАО "+CHR(171)+"Гипросв" + CHR(255)+ "зь-4"+CHR(187), 0, 0
	.SetReferencePoint 4
	.SetPosition 1800000, -1360000
	.SetCharacterAttributes 0, 18, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Изм.", 0, 0
	.SetReferencePoint 5
	.SetPosition 250000, -1120000
	.SetCharacterAttributes 0, 4, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "К. уч.", 0, 0
	.SetReferencePoint 5
	.SetPosition 350000, -1136000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Лист", 0, 0
	.SetReferencePoint 5
	.SetPosition 450000, -1120000
	.SetCharacterAttributes 0, 4, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "№док.", 0, 0
	.SetReferencePoint 5
	.SetPosition 550000, -1131000
	.SetCharacterAttributes 0, 5, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Подпись", 0, 0
	.SetReferencePoint 5
	.SetPosition 675000, -1131000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Дата", 0, 0
	.SetReferencePoint 5
	.SetPosition 800000, -1133000
	.SetCharacterAttributes 0, 4, "Arial Cyr", 7, 80, 0, 0, 0, 0, 0, 1000, 0, 2
	.CreateArtisticText "Разраб.", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1190000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1175000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Проверил", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1240000
	.SetCharacterAttributes 0, 8, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1225000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Гл. техн.", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1275000
	.SetCharacterAttributes 0, 9, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1275000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Нач. отд.", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1335000
	.SetCharacterAttributes 0, 9, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1325000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Н. контр.", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1390000
	.SetCharacterAttributes 0, 9, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1375000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "ГИП", 0, 0
	.SetReferencePoint 5
	.SetPosition 210000, -1425000
	.SetCharacterAttributes 0, 3, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.CreateArtisticText "Фамили"+CHR(255), 0, 0
	.SetReferencePoint 5
	.SetPosition 410000, -1425000
	.SetCharacterAttributes 0, 7, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	'DIM TodayDate AS DATE	'Отрисовка Года в штампе
	'TodayDate = GETCURRDATE()
	'StringDate$ = FORMATDATE (TodayDate, "yyy")
	'.CreateArtisticText StringDate$, 0, 0
	'.SetReferencePoint 5
	'.SetPosition 800000, -925000
	'.SetCharacterAttributes 0, 4, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 2
'Отрисовка бокового штампа
	.CreateRectangle -585000, -2020000, -1435000, -1900000, 0
	.SetOutlineWidth 10000
	.BeginDrawCurve -1970000, -1435000
	.DrawCurveLineTo -1970000, -585000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -2020000, -1185000
	.DrawCurveLineTo -1900000, -1185000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -2020000, -835000
	.DrawCurveLineTo -1900000, -835000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.CreateRectangle 65000, -2050000, -585000, -1900000, 0	'Прямоугольник рамки "Согласовано"
	.SetOutlineWidth 10000
	'.BeginDrawCurve -2050000, -585000	'Линия под словом "Согласовано" в четырехстрочной рамке "Согласовано"
	'.DrawCurveLineTo -2050000, 65000
	'.EndDrawCurve
	'.SetOutlineWidth 10000
	.BeginDrawCurve -2000000, -585000
	.DrawCurveLineTo -2000000, 65000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -1950000, -585000
	.DrawCurveLineTo -1950000, 65000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -2000000, -385000	'Нижняя линия в рамке "Согласовано"
	.DrawCurveLineTo -1900000, -385000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -2000000, -185000	'Средняя линия в рамке "Согласовано"
	.DrawCurveLineTo -1900000, -185000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.BeginDrawCurve -2000000, -35000	'Верхняя линия в рамке "Согласовано"
	.DrawCurveLineTo -1900000, -35000
	.EndDrawCurve
	.SetOutlineWidth 10000
	.CreateArtisticText "Инв. № подл.", 0, 0
	.SetReferencePoint 5
	.SetPosition -1970000, -1420000
	.SetCharacterAttributes 0, 11, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.RotateObject 90000000, FALSE, -1970000, -1420000
	.CreateArtisticText "Подп. и дата", 0, 0
	.SetReferencePoint 5
	.SetPosition -1970000, -1120000
	.SetCharacterAttributes 0, 11, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.RotateObject 90000000, FALSE, -1970000, -1120000
	.CreateArtisticText "Взам. инв. №", 0, 0
	.SetReferencePoint 5
	.SetPosition -1980000, -820000
	.SetCharacterAttributes 0, 11, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.RotateObject 90000000, FALSE, -1980000, -820000
	.CreateArtisticText "Согласовано", 0, 0
	.SetReferencePoint 5
	.SetPosition -2010000, -550000
	.SetCharacterAttributes 0, 10, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
	.RotateObject 90000000, FALSE, -2010000, -550000
	.CreateArtisticText "Формат А3", 0, 0
	.SetReferencePoint 5
	.SetPosition 1600000, -1490000
	.SetCharacterAttributes 0, 8, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 0, 1
END WITHOBJECT
END SUB





SUB Read_profile (BYREF flag as Integer)
	
	
	Filename$=GETFILEBOX("Файлы профилей|*.001|Все файлы|*.*", "Выберите профиль") 'выбрать файл профил.
	
	IF Filename$ = "" OR flag=0 THEN 'если файл не выбран или зашли с флагом 0 - выйти из процедуры
		flag=0 'обнулить флаг, чтобы вызывающа. программа знала, что файл не выбран
		EXIT
	END IF
	
	flag=1 ' дл. того, чтобы вызывающа. программа знала, что файл профил. выбран
		
	OPEN Filename$ FOR INPUT AS 1 'открыть файл профил. дл. чтени.
	
	dim prof_str(0 to 10000) as string 'определить массив строк дл. ввода данных из файла профил.
	i=0
	DO
	
		LINE INPUT  #1, prof_str(i) ' ввод строк из файла профил. в массив prof_str
		i=i+1
		konec=EOF(1)
		
	LOOP WHILE konec=FALSE ' пока не достигнут конец файла
	
	CLOSE 1
	
	j_max=17+VAL(prof_str(2))*3+VAL(prof_str(1))*4+VAL(prof_str(5))*2 ' индекс конца последнего водного участка
	
	FOR j =0 TO j_max
		Profile(j)=val (prof_str(j+1)) ' преобразование массива строк в массив чисел
	NEXT j

	Stancia_A =RTRIM(OEM_to_ANSI (prof_str(j_max+2))) ' название станции слева
	Stancia_B=RTRIM(OEM_to_ANSI (prof_str(j_max+3))) ' название станции справа
	Zagolovok_Isp$="Рисуем профиль "+Stancia_A + " - " + Stancia_B
		
	call PrObr_degmin prof_str(j_max+4)
	
	Massht_k=Round(Profile(9), 3)
	
	if Massht_k=0 or Massht_k=-1 then
		Mashtab_karty="1:100 000"
		elseif Massht_k=-0.5 then
			Mashtab_karty="1:50 000"
			elseif Massht_k=-0.25 then
				Mashtab_karty="1:25 000"
				elseif Massht_k=-0.1 then
					Mashtab_karty="1:10 000"
					elseif Massht_k=-0.05 then
						Mashtab_karty="1:5 000"
						elseif Massht_k=-0.02 then
							Mashtab_karty="1:2 000"
							elseif Massht_k=-0.005 then
								Mashtab_karty="1:500"
								elseif Massht_k=-2 then
									Mashtab_karty="1:200 000"
									elseif Massht_k=-5 then
										Mashtab_karty="1:500 000"
										elseif Massht_k=-10 then
											Mashtab_karty="1:1000 000"
	endif
END SUB


BEGIN DIALOG OBJECT Ispolnenie 336, 48, Zagolovok_Isp$, SUB Draw_Profile
	TEXT  11, 3, 156, 11, .Text1, "Пожалуйста подождите!"
	PROGRESS 10, 24, 306, 14, .Progress1
END DIALOG


sub Draw_Profile(BYVAL ControlID%, BYVAL Event%)

	dim Prof_Rel(0 TO 10000) as double

	N_relyef=Profile(1)
	N_prep=Profile(0)
	N_voda=Profile(4)
	
	R=Profile(12+(N_relyef-1)*3) 'длина интервала
	
	if R>165 then
		Mashtab_x=10000
		Mashtab_x_txt="1:1000 000"
		k_shag=10
		elseif R>82.5 then
			Mashtab_x=20000
			Mashtab_x_txt="1:500 000"
			k_shag=10
			elseif R>66 then
				Mashtab_x=40000
				Mashtab_x_txt="1:250 000"
				k_shag=20
				elseif R>33 then
					Mashtab_x=50000
					Mashtab_x_txt="1:200 000"
					k_shag=20
					elseif R>16.5 then
						Mashtab_x=100000
						Mashtab_x_txt="1:100 000"
						k_shag=20
						elseif R>8.25 then
							Mashtab_x=200000
							Mashtab_x_txt="1:50 000"
							k_shag=40
							elseif R>3.3 then
								Mashtab_x=400000
								Mashtab_x_txt="1:25 000"
								k_shag=80
								elseif R>1.65 then
									Mashtab_x=1000000
									Mashtab_x_txt="1:10 000"
									k_shag=200
									elseif R>0.66 then
										Mashtab_x=2000000
										Mashtab_x_txt="1:5 000"
										k_shag=400
										elseif R>0.33 then
											Mashtab_x=5000000
											Mashtab_x_txt="1:2 000"
											k_shag=1000
											elseif R>0.165 then
												Mashtab_x=10000000
												Mashtab_x_txt="1:1 000"
												k_shag=2000
												elseif R<=0.165 then
													Mashtab_x=20000000
													Mashtab_x_txt="1:500"
													k_shag=4000
	endif
	
	X_0_profile=-R*Mashtab_x/2+175000 'координата левой границы профилya
	X_0_table=X_0_profile-300000 'координата левой границы таблицы
	X_0_A=X_0_table 'координата левой границы названиya станции слева
	X_0_B=X_0_profile+R*Mashtab_x+30000 'координаты левой границы названиya станции справа
	
	Hor=Profile(3)
	
	'Заполнение массива высотных отметок рельефа
	k=0
	a=6370*1000/(1+6370*1000*Gradient_d/2)
	Max_rel_y=Profile(13)
	Max_rel_y_x=0
	j=0
	FOR i = 0 TO N_relyef-2
		r1=Profile(13+3*(i))
		r2=Profile(13+3*(i+1))
		x1=Profile(12+3*(i))
		x2=Profile(12+3*(i+1))
		k=x1/R
		y=R*R*1000000/2/a*k*(1-k)
		Prof_Rel(j)=r1+y
		for j=clng(x1*k_shag)+1 to clng(x2*k_shag)-1
			k=j/k_shag/R
			y=R*R*1000000/2/a*k*(1-k)
			Prof_Rel(j)=r1+(r2-r1)/(x2-x1)*(j/k_shag-x1)+y
			if Prof_Rel(j)>Max_rel_y then
				Max_rel_y=Prof_Rel(j) 'макс. высотн. отм рельефа
				Max_rel_y_x=j/k_shag 'координата макс. высотн. отм рельефа
			endif
		next j
	NEXT i
	'j=j+1
	Prof_Rel(j)=Profile(13+3*( N_relyef-1))
	
	if Profile(0)>0 then
		Max_prep_y=Profile(18+3*(N_relyef))+Prof_Rel(k_shag*Profile(16+3*(N_relyef)))
		Max_prep_y_x=Profile(16+3*(N_relyef))
		for i=0 to N_prep-1
			for j=k_shag*Profile(16+3*(N_relyef)+i*4) to k_shag*Profile(17+3*(N_relyef)+i*4)
				if Profile(18+3*(N_relyef)+i*4)+Prof_Rel(j)>Max_prep_y then
					Max_prep_y=Profile(18+3*(N_relyef)+i*4)+Prof_Rel(j)
					Max_prep_y_x=j/k_shag
				endif
			next j
		next i
	else
		Max_prep_y=Max_rel_y
		Max_prep_y_x=Max_rel_y_x
	endif
	
	Max_H_ant_rel=Hosnright_d+Prof_Rel(k_shag*R-1)
	if Max_H_ant_rel<Hosnleft_d+Prof_Rel(0) then Max_H_ant_rel=Hosnleft_d+Prof_Rel(0)
	if Max_H_ant_rel<HdopLeft_d+Prof_Rel(0) then Max_H_ant_rel=HdopLeft_d+Prof_Rel(0)
	if Max_H_ant_rel<HdopRight_d+Prof_Rel(k_shag*R-1) then Max_H_ant_rel=HdopRight_d+Prof_Rel(k_shag*R-1)
	
	Max_H=Max_rel_y
	if Max_H<Max_prep_y then Max_H=Max_prep_y
	if Max_H<Max_H_ant_rel then Max_H=Max_H_ant_rel
	
	if Max_H-Hor>6680 then
		Mashtab_y=200
		Mashtab_y_txt="1:50 000"
	elseif Max_H-Hor>5010 then
		Mashtab_y=250
		Mashtab_y_txt="1:40 000"
	elseif Max_H-Hor>4175 then
		Mashtab_y=333
		Mashtab_y_txt="1:30 000"
	elseif Max_H-Hor>3340 then
		Mashtab_y=400
		Mashtab_y_txt="1:25 000"
	elseif Max_H-Hor>2505 then
		Mashtab_y=500
		Mashtab_y_txt="1:20 000"
	elseif Max_H-Hor>1670 then
		Mashtab_y=667
		Mashtab_y_txt="1:15 000"
	elseif Max_H-Hor>1503 then
		Mashtab_y=1000
		Mashtab_y_txt="1:10 000"
	elseif Max_H-Hor>1336 then
		Mashtab_y=1111
		Mashtab_y_txt="1:9 000"
	elseif Max_H-Hor>1169 then
		Mashtab_y=1250
		Mashtab_y_txt="1:8 000"
	elseif Max_H-Hor>1002 then
		Mashtab_y=1429
		Mashtab_y_txt="1:7 000"
	elseif Max_H-Hor>835 then
		Mashtab_y=1667
		Mashtab_y_txt="1:6 000"
	elseif Max_H-Hor>668 then
		Mashtab_y=2000
		Mashtab_y_txt="1:5 000"
	elseif Max_H-Hor>501 then
		Mashtab_y=2500
		Mashtab_y_txt="1:4 000"
	elseif Max_H-Hor>334 then
		Mashtab_y=3333
		Mashtab_y_txt="1:3 000"
	elseif Max_H-Hor>250.5 then
		Mashtab_y=5000
		Mashtab_y_txt="1:2 000"
	elseif Max_H-Hor>167 then
		Mashtab_y=6667
		Mashtab_y_txt="1:1 500"
	elseif Max_H-Hor>83.5 then
		Mashtab_y=10000
		Mashtab_y_txt="1:1 000"
	elseif Max_H-Hor>41.75 then
		Mashtab_y=20000
		Mashtab_y_txt="1:500"
	else
		Mashtab_y=40000
		Mashtab_y_txt="1:250"
	endif
		
	Y_0_profile=-385000
	
	
	'Dialog Event Handler subroutine
	
	IF Event=0 THEN
		Ispolnenie.Progress1.SETMINRANGE 0
		Ispolnenie.Progress1.SETMAXRANGE (220+2*N_prep+2*N_relyef+N_voda+clng(R*k_shag-1))
		Ispolnenie.Progress1.SETINCREMENT 1
	ENDIF
	
	Ispolnenie.Progress1.STEP
	CALL Ramka_stamp
			
	WITHOBJECT "CorelDraw.Automation.12" 
	.BeginDrawCurve X_0_profile, Y_0_profile 'отрисовка нижней границы профилya
	.DrawCurveLineTo X_0_profile+R*Mashtab_x, Y_0_profile
	.EndDrawCurve
	.SetOutlineWidth 5000
	
		
	'отрисовка кривизны
	.BeginDrawCurve X_0_profile, Y_0_profile
	.DrawCurveLineTo X_0_profile+R/100*Mashtab_x, Y_0_profile+R*R*1000000/2/a/100*(1-0.01)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 2500
	for i=1 to 100
		Ispolnenie.Progress1.STEP
		k=i/100
		y=R*R*1000000/2/a*k*(1-k)
		k_1=(i-1)/100
		y_1=R*R*1000000/2/a*k_1*(1-k_1)
		X_kriv=X_0_profile+R/100*i*Mashtab_x
		Y_kriv=Y_0_profile+y*Mashtab_y
		X_kriv_1=X_0_profile+R/100*(i-1)*Mashtab_x
		Y_kriv_1=Y_0_profile+y_1*Mashtab_y
		.BeginDrawCurve  X_kriv_1, Y_kriv_1
		.DrawCurveLineTo X_kriv, Y_kriv
		.EndDrawCurve
		.SetOutlineWidth 2500
	next i	


	dom=false
	les=false
	if N_prep>0 then 'отрисовка препyaтствий
		for i=0 to N_prep-1
			Ispolnenie.Progress1.STEP
			flag=0
			for j=clng(k_shag*Profile(16+3*(N_relyef)+i*4)) to clng(k_shag*Profile(17+3*(N_relyef)+i*4)-1) 'От начала i-го препyaтствиya до конца с шагом j/k_shag км
				.BeginDrawCurve  X_0_profile+j/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel( j)-Hor+Profile(18+3*(N_relyef)+i*4))*Mashtab_y 'Лини- от j-й точки
				.DrawCurveLineTo X_0_profile+(j+1)/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel(j+1)-Hor+Profile(18+3*(N_relyef)+i*4))*Mashtab_y 'До j+1-й точки
				.EndDrawCurve
				if Profile(19+3*(N_relyef)+i*4)=0 then 'Если тип препyaтствиya - лес
					.SetOutlineWidth 1500
					.StoreColor 5, 0, 255, 0, 0							'Отличие от Corel 7
					.SetOutlineColor
					else 'Если тип препyaтствиya - здание
						.SetOutlineWidth 2000
				endif		
			next j
			.BeginDrawCurve X_0_profile+(j)/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel (j)-Hor)*Mashtab_y 'Вертикальная линиya от рельефа в последней точке препyaтствия
			.DrawCurveLineTo  X_0_profile+(j)/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel(j)-Hor+Profile(18+3*(N_relyef)+i*4))*Mashtab_y 'До верха препyaтствиya
			.EndDrawCurve
			if Profile(19+3*(N_relyef)+i*4)=0 then 'Если тип препyaтствиya - лес
				les=true
				.SetOutlineWidth 1500
				.StoreColor 5, 0, 255, 0, 0
				.SetOutlineColor
				else 'Если тип препyaтствиya - здание
					dom=true
					.SetOutlineWidth 2000
			endif
			for j=clng(k_shag*Profile(16+3*(N_relyef)+i*4)) to clng(k_shag*Profile(17+3*(N_relyef)+i*4))
				if flag=0 then 'Штриховка делаетсya через 3 шага, т.е. каждый третий шаг flag обнулyaется
					.BeginDrawCurve X_0_profile+j/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel (j)-Hor)*Mashtab_y 'Вертикальная линиya от рельефа
					.DrawCurveLineTo  X_0_profile+j/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel(j)-Hor+Profile(18+3*(N_relyef)+i*4))*Mashtab_y 'До верха препyaтствиya
					.EndDrawCurve
					if Profile(19+3*(N_relyef)+i*4)=0 then 'Если тип препyaтствиya - лес
						.SetOutlineWidth 1500
						.StoreColor 5, 0, 255, 0, 0
						.SetOutlineColor
						else 'Если тип препyaтствиya - здание
							.SetOutlineWidth 2000
					endif
				endif
				flag=flag+1 'Следующий шаг
				if flag=3 then flag=0 'Если уже пройдено 3 шага - обнуляем флаг для отрисовки следующей вертикальной линии
			next j 'Следующий шаг внутри одного препyaтствия
		next i 'Следующее препyaтствие
	endif 'Конец отрисовки препyaтствий
	
	voda=false
	if N_voda>0 then 'отрисовка воды
		for i=0 to N_voda-1
			Ispolnenie.Progress1.STEP
			for j=clng(k_shag*Profile(18+3*(N_relyef)+N_prep*4+2*i)) to clng(k_shag*Profile(19+3*(N_relyef)+N_prep*4+2*i)-1)
				.BeginDrawCurve X_0_profile+j/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel( j)-Hor)*Mashtab_y
				.DrawCurveLineTo  X_0_profile+(j+1)/k_shag*Mashtab_x, Y_0_profile+(Prof_Rel( j+1)-Hor)*Mashtab_y
				.EndDrawCurve
				.SetOutlineWidth 10000
				.StoreColor 5, 0, 0, 255, 0
				.SetOutlineColor
				voda=true
			next j
		next i
	endif
	
	y_1=Prof_Rel(0)-Hor 'отрисовка рельефа
	i_voda=0
	for i=1 to clng(R*k_shag-1)
		Ispolnenie.Progress1.STEP
		X_kriv_1=X_0_profile+(i-1)/k_shag*Mashtab_x
		Y_kriv_1=Y_0_profile+y_1*Mashtab_y
		X_kriv=X_0_profile+i/k_shag*Mashtab_x
		Y_kriv=Y_0_profile+(Prof_Rel(i)-Hor)*Mashtab_y
		if (voda=true) and (i_voda<N_voda) and (X_kriv>X_0_profile+clng(Mashtab_x*Profile(18+3*(N_relyef)+N_prep*4+2*i_voda)+Mashtab_x/2/k_shag)) then
			else
				.BeginDrawCurve X_kriv_1, Y_kriv_1
				.DrawCurveLineTo X_kriv, Y_kriv
				.EndDrawCurve
				.SetOutlineWidth 3500
		endif
		if (voda=true) and (i_voda<N_voda) and (X_kriv_1<X_0_profile+clng(Mashtab_x*Profile(19+3*(N_relyef)+N_prep*4+2*i_voda)-Mashtab_x/2/k_shag)) then
			elseif (voda=true) and (i_voda<N_voda) then
				.BeginDrawCurve X_kriv_1, Y_kriv_1
				.DrawCurveLineTo X_kriv, Y_kriv
				.EndDrawCurve
				.SetOutlineWidth 3500
				i_voda=i_voda+1
		endif
		y_1=Prof_Rel(i)-Hor
	next i
	X_kriv_1=X_0_profile+(i-1)/k_shag*Mashtab_x
	Y_kriv_1=Y_0_profile+y_1*Mashtab_y
	X_kriv=X_0_profile+Profile(12+3*(N_relyef-1))*Mashtab_x
	Y_kriv=Y_0_profile+(Profile(13+3*(N_relyef-1))-Hor)*Mashtab_y
	.BeginDrawCurve X_kriv_1, Y_kriv_1
	.DrawCurveLineTo X_kriv, Y_kriv
	.EndDrawCurve
	.SetOutlineWidth 3500
	
	
	FOR i = 0 TO N_relyef-1'вертикальные метки в точках рельефа
		Ispolnenie.Progress1.STEP
		r1=Profile(13+3*(i))
		x1=Profile(12+3*(i))
		k=x1/R
		y=R*R*1000000/2/a*k*(1-k)
		.BeginDrawCurve X_0_profile+x1*Mashtab_x, Y_0_profile
		.DrawCurveLineTo  X_0_profile+x1*Mashtab_x, Y_0_profile+(r1+y-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 1000
	next i
	
	

	if Hosnright_d>=HdopRight_d Then
		H_opor_right=Hosnright_d
		else
		H_opor_right=HdopRight_d
	endif

	if Hosnleft_d>=HdopLeft_d Then
		H_opor_left=Hosnleft_d
		else
		H_opor_left=HdopLeft_d
	endif
	
	'башнya слева	
	.BeginDrawCurve X_0_profile, Y_0_profile
	.DrawCurveLineTo  X_0_profile, Y_0_profile+(Prof_Rel(0)+H_opor_left-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 5000
	Ispolnenie.Progress1.STEP
	
	'башнya справа
	.BeginDrawCurve X_0_profile+R*Mashtab_x, Y_0_profile
	.DrawCurveLineTo  X_0_profile+R*Mashtab_x, Y_0_profile+(Profile(13+3*( N_relyef-1))+H_opor_right-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 5000
	Ispolnenie.Progress1.STEP
		
	'луч основнаya-основнаya
	.BeginDrawCurve X_0_profile, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y
	.DrawCurveLineTo  X_0_profile+R*Mashtab_x, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 3000
	Ispolnenie.Progress1.STEP
	
	
	
	if PRP<>0 then
		'луч основнаya-дополнительнаya
		.BeginDrawCurve X_0_profile, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y
		.DrawCurveLineTo  X_0_profile+R*Mashtab_x, Y_0_profile+(Profile(13+3*( N_relyef-1))+HdopRight_d-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 3000
		'луч дополнительнаya-основнаya
		.BeginDrawCurve X_0_profile, Y_0_profile+(Prof_Rel(0)+HdopLeft_d-Hor)*Mashtab_y
		.DrawCurveLineTo  X_0_profile+R*Mashtab_x, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 3000
	endif
	
	'отрисовка 1-й зоны Ф.
	k_shag1=200
	lambda=0.3/Chast_d
	luch=(R-R/k_shag1)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'основн.-основн.
	luch_dop1=(R-R/k_shag1)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hdopright_d))/R+Profile(13+3*( N_relyef-1))+Hdopright_d 'основн.-доп.
	luch_dop2=(R-R/k_shag1)*((Prof_Rel(0)+Hdopleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'доп.-основн.
	k=1/k_shag1
	Fresnel1=sqr(R*1000*lambda*k*(1-k))
	IF PRP<>0 THEN
		IF Hosnleft_d<Hdopleft_d THEN
			Hant_min=Hosnleft_d
		ELSE
			Hant_min=Hdopleft_d
		ENDIF
		IF luch<luch_dop1 THEN
			luch_min=luch
		ELSE
			luch_min=luch_dop1
		ENDIF
		IF luch_min>luch_dop2 THEN luch_min=luch_dop2
	ELSE
		Hant_min=Hosnleft_d
		luch_min=luch
	ENDIF
	.BeginDrawCurve X_0_profile, Y_0_profile+(Prof_Rel(0)+Hant_min-Hor)*Mashtab_y
	.DrawCurveLineTo X_0_profile+R/k_shag1*Mashtab_x, Y_0_profile+(luch_min-Fresnel1-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 3000
	.StoreColor 5, 255, 0, 0, 0
	.SetOutlineColor
	for i=2 to k_shag1 step 2
		Ispolnenie.Progress1.STEP
		k=i/k_shag1
		luch=(R-k*R)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'основн.-основн.
		luch_dop1=(R-k*R)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hdopright_d))/R+Profile(13+3*( N_relyef-1))+Hdopright_d 'основн.-доп.
		luch_dop2=(R-k*R)*((Prof_Rel(0)+Hdopleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'доп.-основн.
		Fresnel1=sqr(R*1000*lambda*k*(1-k))
		k_1=(i-1)/k_shag1
		luch_1=(R-k_1*R)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'основн.-основн.
		luch_1dop1=(R-k_1*R)*((Prof_Rel(0)+Hosnleft_d)-(Profile(13+3*( N_relyef-1))+Hdopright_d))/R+Profile(13+3*( N_relyef-1))+Hdopright_d 'основн.-доп.
		luch_1dop2=(R-k_1*R)*((Prof_Rel(0)+Hdopleft_d)-(Profile(13+3*( N_relyef-1))+Hosnright_d))/R+Profile(13+3*( N_relyef-1))+Hosnright_d 'доп.-основн.
		IF PRP<>0 THEN
			IF luch_1<luch_1dop1 THEN
				luch_1min=luch_1
			ELSE
				luch_1min=luch_1dop1
			ENDIF
			IF luch_1min>luch_1dop2 THEN luch_1min=luch_1dop2
			IF luch<luch_dop1 THEN
				luch_min=luch
			ELSE
				luch_min=luch_dop1
			ENDIF
			IF luch_min>luch_dop2 THEN luch_min=luch_dop2
		ELSE
			luch_1min=luch_1
			luch_min=luch
		ENDIF
		Fresnel1_1=sqr(R*1000*lambda*k_1*(1-k_1))
		.BeginDrawCurve X_0_profile+R*k_1*Mashtab_x, Y_0_profile+(luch_1min-Fresnel1_1-Hor)*Mashtab_y
		.DrawCurveLineTo X_0_profile+R*k*Mashtab_x, Y_0_profile+(luch_min-Fresnel1-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 3000
		.StoreColor 5, 255, 0, 0, 0
		.SetOutlineColor
	next i
	
	'основные антенны
	.CreateEllipse  clng(Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+25000), clng(X_0_profile), clng(Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y-25000), clng(X_0_profile+50000), 90000000, 270000000, false
	.SetOutlineWidth 7500
	.CreateEllipse  clng(Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+25000), clng(X_0_profile+R*Mashtab_x-50000), clng(Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y-25000), clng(X_0_profile+R*Mashtab_x), -90000000, 90000000, false
	.SetOutlineWidth 7500
	Ispolnenie.Progress1.STEP
		
	'дополнительные антенны
	if PRP<>0 then
	.CreateEllipse  clng(Y_0_profile+(Prof_Rel(0)+HdopLeft_d-Hor)*Mashtab_y+25000), clng(X_0_profile), clng(Y_0_profile+(Prof_Rel(0)+HdopLeft_d-Hor)*Mashtab_y-25000), clng(X_0_profile+50000), 90000000, 270000000, false
	.SetOutlineWidth 7500
	.CreateEllipse  clng(Y_0_profile+(Profile(13+3*( N_relyef-1))+HdopRight_d-Hor)*Mashtab_y+25000), clng(X_0_profile+R*Mashtab_x-50000), clng(Y_0_profile+(Profile(13+3*( N_relyef-1))+HdopRight_d-Hor)*Mashtab_y-25000), clng(X_0_profile+R*Mashtab_x), -90000000, 90000000, false
	.SetOutlineWidth 7500
	endif
	
	'отрисовка таблицы
	.CreateRectangle Y_0_profile-10000, X_0_profile-300000, Y_0_profile-400000, X_0_profile+R*Mashtab_x+30000, 0
	.SetOutlineWidth 2500
	Ispolnenie.Progress1.STEP
	
	.BeginDrawCurve X_0_profile-300000, Y_0_profile-140000
	.DrawCurveLineTo X_0_profile+R*Mashtab_x+30000, Y_0_profile-140000
	.EndDrawCurve
	.SetOutlineWidth 2500
	Ispolnenie.Progress1.STEP
	
	.BeginDrawCurve X_0_profile-300000, Y_0_profile-290000
	.DrawCurveLineTo X_0_profile+R*Mashtab_x+30000, Y_0_profile-290000
	.EndDrawCurve
	.SetOutlineWidth 2500
	Ispolnenie.Progress1.STEP
	
	.BeginDrawCurve X_0_profile-20000, Y_0_profile-10000
	.DrawCurveLineTo X_0_profile-20000, Y_0_profile-400000
	.EndDrawCurve
	.SetOutlineWidth 2500
	Ispolnenie.Progress1.STEP
	
	'Шапка таблицы
	.CreateArtisticText "Рассто"+CHR(255)+"ние, км", X_0_profile-285000, Y_0_profile-85000
	.SetReferencePoint 5
	.SetPosition X_0_profile-285000, Y_0_profile-85000
	.SetCharacterAttributes 0, 14, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 0, 1
	Ispolnenie.Progress1.STEP
	
	.CreateArtisticText "Уровень земли, м", X_0_profile-285000, Y_0_profile-225000
	.SetReferencePoint 5
	.SetPosition X_0_profile-285000, Y_0_profile-225000
	.SetCharacterAttributes 0, 16, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 0, 1
	Ispolnenie.Progress1.STEP
	
	.CreateArtisticText "Высота"+ CHR(13) + CHR(10)+"преп"+CHR(255)+"тстви"+CHR(255)+", м", X_0_profile-285000, Y_0_profile-445000
	.SetReferencePoint 5
	.SetPosition X_0_profile-285000, Y_0_profile-445000
	.SetCharacterAttributes 0, 22, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
	Ispolnenie.Progress1.STEP
	
	'отметки рельефа (в таблице)
	.CreateArtisticText CSTR(Round(Profile(12), 3)), X_0_profile, Y_0_profile-120000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
	.RotateObject 90000000, true, 0, 0
	.SetReferencePoint 6
	.SetPosition X_0_profile, Y_0_profile-120000
	.CreateArtisticText CSTR(Round(Profile(13), 3)), X_0_profile, Y_0_profile-250000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
	.RotateObject 90000000, true, 0, 0
	.SetReferencePoint 6
	.SetPosition X_0_profile, Y_0_profile-250000
	r_end=Profile(13+3*(N_relyef-1))
	x_end=Profile(12+3*(N_relyef-1))
	x_1=0
	for i=1 to N_relyef-2
		Ispolnenie.Progress1.STEP
		r_i=Profile(13+3*(i))
		x_i=Profile(12+3*(i))
		if ((x_i-x_1)*Mashtab_x)>=25000 and ((x_end-x_i)*Mashtab_x)>=25000 then
			.CreateArtisticText CSTR(Round(cdbl(x_i), 3)), (X_0_profile+x_i*Mashtab_x), Y_0_profile-120000
			.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
			.RotateObject 90000000, true, 0, 0
			.SetReferencePoint 6
			.SetPosition (X_0_profile+x_i*Mashtab_x), Y_0_profile-120000
			.CreateArtisticText CSTR(Round(cdbl(r_i), 3)), (X_0_profile+x_i*Mashtab_x), Y_0_profile-250000
			.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
			.RotateObject 90000000, true, 0, 0
			.SetReferencePoint 6
			.SetPosition (X_0_profile+x_i*Mashtab_x), Y_0_profile-250000
			x_1=x_i
		endif		
	next i
	.CreateArtisticText CSTR(Round(cdbl(x_end), 3)), (X_0_profile+x_end*Mashtab_x), Y_0_profile-120000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
	.RotateObject 90000000, true, 0, 0
	.SetReferencePoint 6
	.SetPosition (X_0_profile+x_end*Mashtab_x), Y_0_profile-120000
	.CreateArtisticText CSTR(Round(cdbl(r_end), 3)), (X_0_profile+x_end*Mashtab_x), Y_0_profile-250000
	.SetCharacterAttributes 0, 6, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
	.RotateObject 90000000, true, 0, 0
	.SetReferencePoint 6
	.SetPosition (X_0_profile+x_end*Mashtab_x), Y_0_profile-250000
	
	'препyaтствиya (в таблице)
	if N_prep>0 then
		.CreateArtisticText CSTR(int(Profile(18+3*(N_relyef))*100)/100), X_0_profile+Profile(16+3*(N_relyef))*Mashtab_x, Y_0_profile-380000
		.SetCharacterAttributes 0, 5, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
		.RotateObject 90000000, true, 0, 0
		.SetReferencePoint 6
		.SetPosition X_0_profile+Profile(16+3*(N_relyef))*Mashtab_x, Y_0_profile-380000
		for i=1 to N_prep-1
			Ispolnenie.Progress1.STEP
			p_i=Profile(18+3*(N_relyef)+i*4)
			x_i=Profile(16+3*(N_relyef)+i*4)
			x_1=Profile(16+3*(N_relyef)+(i-1)*4)
			if ((x_i-x_1)*Mashtab_x)>=25000 then
				.CreateArtisticText CSTR((int(p_i)*100)/100), (X_0_profile+x_i*Mashtab_x), Y_0_profile-380000
				.SetCharacterAttributes 0, 5, "Arial Cyr", 7, 90, 0, 0, 0, 0, 0, 1000, 1000, 1
				.RotateObject 90000000, true, 0, 0
				.SetReferencePoint 6
				.SetPosition  (X_0_profile+x_i*Mashtab_x), Y_0_profile-380000
			endif
		next i
	endif
	
	sign_osn_left=1
	sign_osn_right=1
	if PRP<>0 then
		if Hosnleft_d<Hdopleft_d then sign_osn_left=-1
		if Hosnright_d<Hdopright_d then sign_osn_right=-1
	endif
	
	'Отметка основной антенны слева
	.BeginDrawCurve X_0_profile-50000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y
	.DrawCurveLineTo X_0_profile-100000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 4000
	.BeginDrawCurve X_0_profile-200000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+80000*sign_osn_left
	.DrawCurveLineTo X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+80000*sign_osn_left
	.EndDrawCurve
	.SetOutlineWidth 2500
	.BeginDrawCurve X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+80000*sign_osn_left
	.DrawCurveLineTo X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+20000*sign_osn_left
	.EndDrawCurve
	.SetOutlineWidth 2500
	.BeginDrawArrow false, 0, 5
	.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
	.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
	.EndDrawArrow
	.SetOutlineArrow 1
	.CreateArtisticText  CSTR(Hosnleft_d)+ CHR(13) + CHR(10)+"H ц.р."+CHR(13) + CHR(10)+"осн.", X_0_profile-137500, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+110000
	.SetReferencePoint 2
	.SetCharacterAttributes 0, 18, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
	.SetPosition X_0_profile-137500, Y_0_profile+(Prof_Rel(0)+Hosnleft_d-Hor)*Mashtab_y+80000*sign_osn_left+30000
	Ispolnenie.Progress1.STEP
	
	'Отметка основной антенны справа
	.BeginDrawCurve X_0_profile+R*Mashtab_x+50000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y
	.DrawCurveLineTo X_0_profile+R*Mashtab_x+100000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y
	.EndDrawCurve
	.SetOutlineWidth 4000
	.BeginDrawCurve X_0_profile+R*Mashtab_x+200000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+80000*sign_osn_right
	.DrawCurveLineTo X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+80000*sign_osn_right
	.EndDrawCurve
	.SetOutlineWidth 2500
	.BeginDrawCurve X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+80000*sign_osn_right
	.DrawCurveLineTo X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+20000*sign_osn_right
	.EndDrawCurve
	.SetOutlineWidth 2500
	.BeginDrawArrow false, 0, 5
	.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
	.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
	.EndDrawArrow
	.SetOutlineArrow 1
	.CreateArtisticText  CSTR(Hosnright_d)+ CHR(13) + CHR(10)+"H ц.р."+CHR(13) + CHR(10)+"осн.", X_0_profile+R*Mashtab_x+137500, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+110000
	.SetReferencePoint 2
	.SetCharacterAttributes 0, 18, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
	.SetPosition X_0_profile+R*Mashtab_x+137500, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hosnright_d-Hor)*Mashtab_y+80000*sign_osn_right+30000
	Ispolnenie.Progress1.STEP
	
	'Отметки дополнительных антенн
	if PRP<>0 then
		'Отметка дополнительной антенны слева
		.BeginDrawCurve X_0_profile-50000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y
		.DrawCurveLineTo X_0_profile-100000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 4000
		.BeginDrawCurve X_0_profile-200000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+80000*(-sign_osn_left)
		.DrawCurveLineTo X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+80000*(-sign_osn_left)
		.EndDrawCurve
		.SetOutlineWidth 2500
		.BeginDrawCurve X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+80000*(-sign_osn_left)
		.DrawCurveLineTo X_0_profile-75000, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+20000*(-sign_osn_left)
		.EndDrawCurve
		.SetOutlineWidth 2500
		.BeginDrawArrow false, 0, 5
		.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
		.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
		.EndDrawArrow
		.SetOutlineArrow 1
		.CreateArtisticText  CSTR(Hdopleft_d)+ CHR(13) + CHR(10)+"H ц.р."+CHR(13) + CHR(10)+"доп.", X_0_profile-137500, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+110000
		.SetReferencePoint 2
		.SetCharacterAttributes 0, 18, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
		.SetPosition X_0_profile-137500, Y_0_profile+(Prof_Rel(0)+Hdopleft_d-Hor)*Mashtab_y+80000*(-sign_osn_left)+30000
	
		'Отметка дополнительной антенны справа
		.BeginDrawCurve X_0_profile+R*Mashtab_x+50000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y
		.DrawCurveLineTo X_0_profile+R*Mashtab_x+100000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y
		.EndDrawCurve
		.SetOutlineWidth 4000
		.BeginDrawCurve X_0_profile+R*Mashtab_x+200000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+80000*(-sign_osn_right)
		.DrawCurveLineTo X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+80000*(-sign_osn_right)
		.EndDrawCurve
		.SetOutlineWidth 2500
		.BeginDrawCurve X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+80000*(-sign_osn_right)
		.DrawCurveLineTo X_0_profile+R*Mashtab_x+75000, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+20000*(-sign_osn_right)
		.EndDrawCurve
		.SetOutlineWidth 2500
		.BeginDrawArrow false, 0, 5
		.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
		.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
		.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
		.EndDrawArrow
		.SetOutlineArrow 1
		.CreateArtisticText  CSTR(Hdopright_d)+ CHR(13) + CHR(10)+"H ц.р."+CHR(13) + CHR(10)+"доп.", X_0_profile+R*Mashtab_x+137500, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+110000
		.SetReferencePoint 2
		.SetCharacterAttributes 0, 18, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
		.SetPosition X_0_profile+R*Mashtab_x+137500, Y_0_profile+(Profile(13+3*( N_relyef-1))+Hdopright_d-Hor)*Mashtab_y+80000*(-sign_osn_right)+30000
	endif
	
	'отрисовка азимутов
	'прyaмой азимут
	.BeginDrawCurve -870000, -885000
	.DrawCurveLineTo 30000, -885000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawArrow false, 0, 5
	.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
	.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
	.EndDrawArrow
	.SetOutlineArrow 1
	.CreateArtisticText "Пр"+ CHR(255) + "мой азимут "+Azimut_pr_gr + CHR(176)+Azimut_pr_min+CHR(39), -420000, -875000
	.SetCharacterAttributes 0, 25, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
	.SetReferencePoint 6
	.SetPosition -420000, -875000
	Ispolnenie.Progress1.STEP
	
 	'обратный азимут
	.BeginDrawCurve 30000, -945000
	.DrawCurveLineTo -870000, -945000
	.EndDrawCurve
	.SetOutlineWidth 3000
	.BeginDrawArrow false, 0, 5
	.AddArrowPoint 0, 0, FALSE, FALSE, TRUE, TRUE, 0, 0
	.AddArrowPoint -300000, 250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 640000, 0, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint -300000, -250000, FALSE, FALSE, TRUE, FALSE, 0, 1
	.AddArrowPoint 0, 0, FALSE, FALSE, FALSE, TRUE, 0, 1
	.EndDrawArrow
	.SetOutlineArrow 1
	.CreateArtisticText "Обратный азимут "+Azimut_obr_gr + CHR(176)+Azimut_obr_min+CHR(39), -420000, -935000
	.SetCharacterAttributes 0, 25, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
	.SetReferencePoint 6
	.SetPosition -420000, -935000
	Ispolnenie.Progress1.STEP
	
	'Условные обозначениya
	.CreateArtisticText "Условные обозначени"+CHR(255), -1550000, -1085000
	.SetCharacterAttributes 0, 20, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 2
	.SetReferencePoint 6
	.SetPosition  -1550000, -1085000
	Ispolnenie.Progress1.STEP
	
	smeshenie=0
	
	'усл. обозн. застройки
	if dom=true then
		.BeginDrawCurve -1740000, -1175000-smeshenie
		.DrawCurveLineTo -1740000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.BeginDrawCurve -1740000, -1115000-smeshenie
		.DrawCurveLineTo -1710000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.BeginDrawCurve -1710000, -1115000-smeshenie
		.DrawCurveLineTo -1710000, -1175000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.BeginDrawCurve -1730000, -1175000-smeshenie
		.DrawCurveLineTo -1730000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.BeginDrawCurve -1720000, -1175000-smeshenie
		.DrawCurveLineTo -1720000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.CreateArtisticText "- застройка", -1640000, -1175000-smeshenie
		.SetCharacterAttributes 0, 11, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
		.SetReferencePoint 5
		.SetPosition  -1640000, -1175000-smeshenie
		
		smeshenie=smeshenie+70000
	endif
	
	'усл. обозн. леса
	if les=true then
		.BeginDrawCurve -1740000, -1175000-smeshenie
		.DrawCurveLineTo -1740000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.StoreColor 5, 0, 255, 0, 0
		.SetOutlineColor
		.BeginDrawCurve -1740000, -1115000-smeshenie
		.DrawCurveLineTo -1710000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.StoreColor 5, 0, 255, 0, 0
		.SetOutlineColor
		.BeginDrawCurve -1710000, -1115000-smeshenie
		.DrawCurveLineTo -1710000, -1175000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.StoreColor 5, 0, 255, 0, 0
		.SetOutlineColor
		.BeginDrawCurve -1730000, -1175000-smeshenie
		.DrawCurveLineTo -1730000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.StoreColor 5, 0, 255, 0, 0
		.SetOutlineColor
		.BeginDrawCurve -1720000, -1175000-smeshenie
		.DrawCurveLineTo -1720000, -1115000-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 2000
		.StoreColor 5, 0, 255, 0, 0
		.SetOutlineColor
		.CreateArtisticText "- лесной массив", -1640000, -1175000-smeshenie
		.SetCharacterAttributes 0, 15, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
		.SetReferencePoint 5
		.SetPosition  -1640000, -1175000-smeshenie
		
		smeshenie=smeshenie+70000
	endif
	
	'усл. обозн. воды
	if voda=true then
		.BeginDrawCurve -1740000, -1157500-smeshenie
		.DrawCurveLineTo -1710000, -1157500-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 10000
		.StoreColor 5, 0, 0, 255, 0
		.SetOutlineColor
		.CreateArtisticText "- водный участок", -1640000, -1175000-smeshenie
		.SetCharacterAttributes 0, 16, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
		.SetReferencePoint 5
		.SetPosition  -1640000, -1175000-smeshenie
		
		smeshenie=smeshenie+70000
	endif

	'усл. обозн. 1-й зоны Ф.
	for i=1 to 5 step 2
		k=i/k_shag1
		k_1=(i-1)/k_shag1
		.BeginDrawCurve -1740000+R*k_1*Mashtab_x, -1157500-smeshenie
		.DrawCurveLineTo -1740000+R*k*Mashtab_x, -1157500-smeshenie
		.EndDrawCurve
		.SetOutlineWidth 3000
		.StoreColor 5, 255, 0, 0, 0
		.SetOutlineColor
	next i	
	.CreateArtisticText "- охранна"+CHR(255)+" зона радиолуча", -1640000, -1175000-smeshenie
	.SetCharacterAttributes 0, 25, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
	.SetReferencePoint 5
	.SetPosition  -1640000, -1175000-smeshenie
	Ispolnenie.Progress1.STEP
	
	'названиya станций
	.CreateArtisticText Stancia_A, X_0_A, Y_0_profile-430000
	.SetCharacterAttributes 0, 50, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
	.SetReferencePoint 3
	.SetPosition  X_0_A, Y_0_profile-420000
	.CreateArtisticText Stancia_B, X_0_B, Y_0_profile-430000
	.SetCharacterAttributes 0, 50, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 3
	.SetReferencePoint 1
	.SetPosition  X_0_B, Y_0_profile-420000
	Ispolnenie.Progress1.STEP
	
	'примечаниya
	IF Gradient_d<>0 THEN
		refrakcia="    при эфф. g="+cstr(Gradient_d*100000000)+"xE-8 (1/м);"
	ELSE
		refrakcia="    при нулевой рефракции;" 
	ENDIF
	.CreateArtisticText "1. Профиль составлен с учетом кривизны земли"+ CHR(13) + CHR(10)+refrakcia+ CHR(13) + CHR(10)+"2. Профиль составлен по картам масштаба М"+Mashtab_karty+";"+CHR(13) + CHR(10)+"3. Погрешность отметок земли "+ cstr(Pogr_d)+" (м);"+CHR(13) + CHR(10)+"4. Масштаб по горизонтали М"+Mashtab_x_txt+", по вертикали М"+ Mashtab_y_txt+";"+CHR(13) + CHR(10)+"5. Уровень условного горизонта "+CSTR(int(Hor*100)/100)+" (м);"+CHR(13) + CHR(10)+"6. На чертеже даны отметки центров раскрыва антенн в метрах;"+CHR(13) + CHR(10)+"7. Отметки земли указаны в Балтийской системе.", 15, -1335000 '+ CHR(13) + CHR(10)+"8. Охранна"+chr(255)+" зона радиолуча построена дл"+chr(255)+" частоты "+ cstr(Chast_d)+ " (ГГц);"
	.SetCharacterAttributes 0, 472, "Arial Cyr", 7, 100, 0, 0, 0, 0, 0, 1000, 1000, 1
	.SetReferencePoint 7
	.SetPosition  10, -1335000
	Ispolnenie.Progress1.STEP
	
	 Ispolnenie.CLOSEDIALOG 1
		
	end WITHOBJECT
end sub


REM Отсюда начинает исполнyaтьсya SCRIPT

dim flag as Integer

flag=1

Read_profile flag

IF flag=0 THEN GOTO Breakout

Zagolovok_id$="Исходные данные дл"+chr(255)+" интервала " + Stancia_A + " - " + Stancia_B

BEGIN DIALOG OBJECT Ish_dat 343, 200, Zagolovok_id$, SUB CheckPRP
	TEXT  8, 7, 206, 12, .TGradient, "Градиент диэлектрической проницаемости воздуха, g, x10-8"
	TEXT  8, 49, 176, 12, .THosnright, "Высота центра раскрыва осн. антенны справа, м"
	TEXT  8, 70, 103, 12, .TPogr, "Погрешность отметок земли"
	TEXT  8, 28, 168, 12, .THosnleft, "Высота центра раскрыва осн. антенны слева, м"
	TEXT  8, 111, 48, 12, .TNalichiePRP, "Наличие ПРП"
	TEXT  8, 91, 98, 12, .TChast, "Частота, ГГц"
	TEXTBOX  229, 7, 39, 13, .Gradient
	TEXTBOX  229, 91, 39, 13, .Chast
	TEXTBOX  229, 70, 39, 13, .Pogr
	TEXTBOX  229, 49, 39, 13, .Hosnright
	TEXTBOX  229, 28, 39, 13, .Hosnleft
	CHECKBOX  230, 110, 11, 11, .NalichiePRP, ""
	TEXT  8, 150, 176, 12, .THdopLeft, "Высота центра раскрыва доп. антенны справа, м"
	TEXT  8, 131, 168, 12, .THdopRight, "Высота центра раскрыва доп. антенны слева, м"
	TEXTBOX  230, 146, 39, 13, .HdopRight
	TEXTBOX  230, 126, 39, 13, .HdopLeft
	OKBUTTON  108, 175, 79, 16, .Okey
END DIALOG

Ish_dat.Gradient.Settext "0"
Ish_dat.Chast.Settext "8"
Ish_dat.Pogr.Settext "3"
Ish_dat.Hosnright.Settext "30"
Ish_dat.Hosnleft.Settext "30"
Ish_dat.HdopLeft.Settext "0"
Ish_dat.HdopRight.Settext "0"

flag=DIALOG (Ish_dat)

IF flag=2 THEN GOTO Breakout

Gradient_d=val(Ish_dat.Gradient.Gettext())*0.00000001
Chast_d=val(Ish_dat.Chast.Gettext())
Pogr_d=val(Ish_dat.Pogr.Gettext())
Hosnright_d=val(Ish_dat.Hosnright.Gettext())
Hosnleft_d=val(Ish_dat.Hosnleft.Gettext())
HdopLeft_d=val(Ish_dat.HdopLeft.Gettext())
HdopRight_d=val(Ish_dat.HdopRight.Gettext())
PRP=Ish_dat.NalichiePRP.GETVALUE()


DIALOG Ispolnenie	


'Draw_Profile

Breakout:
REM Здесь заканчиваетсya выполнение SCRIPTа

SUB CheckPRP(BYVAL Control%, BYVAL Event%)
	DIM ReturnValue%

	IF Event = 0 THEN
		Ish_dat.NalichiePRP.SETTHREESTATE FALSE
		Ish_dat .THdopLeft.ENABLE FALSE
		Ish_dat.THdopRight.ENABLE FALSE
		Ish_dat.HdopLeft.ENABLE FALSE
		Ish_dat.HdopRight.ENABLE FALSE
	ENDIF	

	IF Event = 2 THEN 
		ReturnValue = Ish_dat.NalichiePRP.GETVALUE()
		Ish_dat .THdopLeft.ENABLE ReturnValue
		Ish_dat.THdopRight.ENABLE ReturnValue
		Ish_dat.HdopLeft.ENABLE ReturnValue
		Ish_dat.HdopRight.ENABLE ReturnValue
	ENDIF

END SUB
