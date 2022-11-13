# Практическая работа №2

Необходимо реализовать таблицы для предметной области "Магазин продуктов"

## Ход работы

### Реализация 9-ти таблиц с помощью sql скрипта
```
 static const String _createTableRole = '''CREATE TABLE "$tableRole" (
        "id" INTEGER,
        "role" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableUsers = '''CREATE TABLE "$tableUser" (
        "id"	INTEGER,
        "login"	TEXT NOT NULL UNIQUE,
        "password"	TEXT NOT NULL,
        "id_role"	INTEGER,
        FOREIGN KEY("id_role") REFERENCES "$tableRole"("id") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
  static const String _createTableBankData = '''CREATE TABLE "$tableBankData" (
        "id"	INTEGER PRIMARY KEY,
        "CardNumber"	TEXT NOT NULL CHECK (length(CardNumber) = 16) ,
        "CardExp" DATE NOT NULL,
        "CardCVC" TEXT NOT NULL CHECK (length(CardCVC) = 3) ,
        FOREIGN KEY("id") REFERENCES "$tableUser"("id") ON DELETE CASCADE,
        ''';

  static const String _createTablePersonalData =
      '''CREATE TABLE "$tablePersonalData" (
        "id"	INTEGER PRIMARY KEY,
        "Name"	TEXT NOT NULL,
        "LName" TEXT NOT NULL,
        "Patronymic" TEXT NULL,
        FOREIGN KEY("id") REFERENCES "$tableUser"("id") ON DELETE CASCADE,
        ''';

  static const String _createTableCategory = '''CREATE TABLE "$tableCategory" (
        "Name"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("Name") )''';

  static const String _createTableProducts = '''CREATE TABLE "$tableProducts" (
        "id"	INTEGER,
        "Name"	TEXT NOT NULL UNIQUE,
        "Description"	TEXT NOT NULL,
        "Category_Name"	TEXT NOT NULL,
        "Price" DECIMAL NOT NULL,
        FOREIGN KEY("Category_Name") REFERENCES "$tableCategory"("Name") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
  static const String _createTableCart = '''CREATE TABLE "$tableCart" (
        "id"	INTEGER,
        "User_ID"	int NOT NULL,
        "Status_Name" TEXT NOT NULL,
        FOREIGN KEY("Status_Name") REFERENCES "$tableCartStatus"("Name") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';

  static const String _createTableCartStatus =
      '''CREATE TABLE "$tableCartStatus" (
        "Name"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("Name") )''';

  static const String _createTableCartItem = '''CREATE TABLE "$tableCartItem" (
        "id"	INTEGER,
        "Cart_ID"	int NOT NULL,
        "Product_ID" int NOT NULL,
        "Product_Amount" int NOT NULL,
        FOREIGN KEY("Cart_ID") REFERENCES "$tableCart"("id") ON DELETE CASCADE,
        FOREIGN KEY("Product_ID") REFERENCES "$tableProducts"("id") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
```



### Реализация классов-сущностей
      
![image](https://user-images.githubusercontent.com/78308933/201535639-98a3df6b-e475-4c7e-a87c-d03327373a6d.png)

### Реализация классов-моделей
      
![image](https://user-images.githubusercontent.com/78308933/201535667-282be32f-0bef-4838-bdbf-cb36188f29cc.png)

* В каждой классе-модели были реализованы методы парсинга
      
![image](https://user-images.githubusercontent.com/78308933/201535708-6d81a7b8-7d34-4418-9cfe-69433164d822.png)

### Реализовал класс-манипулятор базы данных

## Вывод
Реализовал класс, который отвечает за базу данных со следующими функциями:
- init - инициализация базы данных для всех платформ
- onCreateTable - создание таблиц 
- onUpdateTable - обновление таблиц
- onInitTable - заполнение таблиц данными
- onDropDataBase - удаление базы данных 
