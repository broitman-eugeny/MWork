Attribute VB_Name = "Module1"
Private Sub RenamerDNA_Andrew() 'Переименовывает файлы диаграмм направленности антенн в формате "Диапазон МГц диаметр м коэффициент усиления дБи тип антенны номер ДНА.txt"
    
    Dim Data_string_from_file, G_ant, NuPointHH, NuPointHV, NuPointVV, NuPointVH
    'Стандартный диалог открытия файла возвращает строку путь к файлу
    File_path_name = Application.GetOpenFilename("Все файлы (*.*), *.*, Text Files (*.txt), *.txt", 1, "Выбор файлов для переименования", , True)
    Number_of_files = UBound(File_path_name, 1) 'количество выбранных файлов
    slash_position = InStrRev(File_path_name(1), "\", -1, vbTextCompare)
    Source_path_name = Left(File_path_name(1), slash_position)
    'Dest_path_name = Source_path_name + "DNA"
    File_number = FreeFile(0) 'находит незанятый номер файла

    For i = 1 To Number_of_files
        Open File_path_name(i) For Input Access Read As #File_number 'открывает файл для чтения
        Line Input #File_number, Data_string_from_file 'читаем строку из файла (разделитель - запятая, перевод строки)
        Do While Left(Data_string_from_file, 7) <> "HGGAIN:" 'цикл пока не достигли строки "HGGAIN"
        
            
            If Left(Data_string_from_file, 7) = "MODNUM:" Then 'если подошли к строке с типом антенны
                Anten_type = Mid(Data_string_from_file, 9) 'читаем тип антенны
            ElseIf Left(Data_string_from_file, 7) = "PATNUM:" Then 'если подошли к строке с номером ДНА
                Num_DNA = Mid(Data_string_from_file, 9) 'читаем номер ДНА
            ElseIf Left(Data_string_from_file, 7) = "LOWFRQ:" Then 'если подошли к строке с нижней частотой диапазона
                Low_freq = Mid(Data_string_from_file, 9) 'читаем нижнюю частоту диапазона
            ElseIf Left(Data_string_from_file, 7) = "HGHFRQ:" Then 'если подошли к строке с верхней частотой диапазона
                Hig_freq = Mid(Data_string_from_file, 9) 'читаем верхнюю частоту диапазона
            ElseIf Left(Data_string_from_file, 7) = "MDGAIN:" Then 'если подошли к строке с коэффициентом усиления
                G_ant = Mid(Data_string_from_file, 9) 'читаем значение коэффициента усиления
            End If
            Line Input #File_number, Data_string_from_file 'читаем след. строку
            
        Loop
        Close File_number
        Defis_position = InStrRev(Anten_type, "-", -1, vbTextCompare)
        start_Size_in_feet = Left(Anten_type, Defis_position - 1)
        Size_in_feet = 0
        Do While Size_in_feet = 0
            Size_in_feet = Val(start_Size_in_feet)
            If Len(start_Size_in_feet) > 1 Then
                start_Size_in_feet = Right(start_Size_in_feet, Len(start_Size_in_feet) - 1)
            ElseIf Size_in_feet = 0 Then
                Size_in_feet = -1
            End If
        Loop
        If Size_in_feet = 2.5 Then
            Size_in_meter = "0.8"
        ElseIf Size_in_feet = 12 Then
            Size_in_meter = "3.7"
        ElseIf Size_in_feet = 13 Then
            Size_in_meter = "4.0"
        ElseIf Size_in_feet = 15 Then
            Size_in_meter = "4.6"
        ElseIf Size_in_feet <> -1 And Size_in_feet < 12 And Size_in_feet <> 2.5 Then
            Size_in_meter = Str(Size_in_feet * 0.3)
        Else
            Size_in_meter = ""
        End If
        '"Диапазон МГц диаметр м коэффициент усиления дБи тип антенны номер ДНА.txt"
        Dest_path_name = Source_path_name + Low_freq + "-" + Hig_freq + " МГц диаметр " + Size_in_meter + " м " + G_ant + " дБи " + Anten_type + " " + Num_DNA + ".txt"
        Name File_path_name(i) As Dest_path_name

    Next i
    
    
End Sub
