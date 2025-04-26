-- Adatbázis létrehozása
CREATE DATABASE LastKnightGame;

-- Adatbázis használata
USE LastKnightGame;

-- Felhasználói tábla (Users)
CREATE TABLE Users (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Role BOOLEAN DEFAULT FALSE  -- FALSE = normál felhasználó, TRUE = adminisztrátor
);

-- Tartalom tábla (Content)
CREATE TABLE Content (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(ID)  -- Kapcsolat a Users táblával
);

-- Admin felhasználók hozzáadása
INSERT INTO Users (Name, Email, Password, Role) 
VALUES 
  ('Kornel', 'kornel@gmail.com', '$2y$10$UpFLNQOEy0k59kEdeFysWuf0XS3LthxIGuO7oN6MB0h5LLjG5/W7.', 1),
  ('devil', 'geza@gmail.com', '$2y$10$OOEFZO1XO5M639xiSv5Aeu47txLpK.fvtsnlFQTddYvR6HuJh5tLq', 1);



