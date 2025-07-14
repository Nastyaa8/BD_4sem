USE SAA_MyBase;  -- Замените "I_MyBase" на имя вашей базы данных

CREATE TABLE Операции (
    ID_операции INT PRIMARY KEY IDENTITY(1,1),
    Наименование_операции NVARCHAR(255) NOT NULL,
    Признак_сложности NVARCHAR(50) NOT NULL
);

CREATE TABLE Работники (
    ID_работника INT PRIMARY KEY IDENTITY(1,1),
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Отчество NVARCHAR(50),
    Адрес NVARCHAR(255),
    Телефон VARCHAR(20),
    Стаж INT
);

CREATE TABLE Учет_Работы (
    ID_учета INT PRIMARY KEY IDENTITY(1,1),
    ID_работника INT NOT NULL,
    ID_операции INT NOT NULL,
    Количество_деталей INT NOT NULL,
    Дата DATE NOT NULL,
    FOREIGN KEY (ID_работника) REFERENCES Работники(ID_работника),
    FOREIGN KEY (ID_операции) REFERENCES Операции(ID_операции)
);