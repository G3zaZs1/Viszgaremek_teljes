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
    UserID INT,  -- Hozzáadott oszlop a felhasználó azonosítójának tárolására
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

-- Új tartalmak beszúrása a Content táblába
INSERT INTO Content (UserID, Title, Content, CreatedAt)
VALUES 
(1, 'update 1.0', 'Elkészült a játék első tesztelhető verziója!\n\nÖrömmel jelentjük, hogy elkészült a játékunk első olyan verziója, amely már alapvető funkciókkal is bír, és alkalmas a tesztelés megkezdésére. Ebben a változatban a felhasználók már be tudnak jelentkezni, illetve elmenthetik saját adataikat a játék során. Ez lehetővé teszi a profilok létrehozását és a játékállás későbbi folytatását.\n\nEmellett látványosabbá tettük az élményt: a játékosok számára különböző vizuális és hanghatások (effektek) is bekerültek, amelyek még izgalmasabbá teszik a játékmenetet.\n\nFontos mérföldkő, hogy a második szint logikai feltételrendszere is teljesen működőképes. Ez azt jelenti, hogy a játékosok már nemcsak átjutnak a következő pályára, hanem valódi kihívásokkal is szembesülnek, amelyeket megfelelő stratégiával és ügyességgel kell megoldaniuk.\n\nKövetkező lépésként a részletes hibakeresésre, finomhangolásra, valamint további tartalmak és szintek fejlesztésére fókuszálunk. Nagyon izgatottak vagyunk, hogy hamarosan megoszthatjuk veletek az első kipróbálható változatot!', '2025-04-21 10:20:10'),

(1, 'update 1.1', 'Kisebb hibák javítása.\n\nA mostani frissítés során számos kisebb hibát javítottunk, amelyek az előző verzióban ugyan nem befolyásolták közvetlenül a játékmenetet, de látványos megjelenésük miatt zavaróak lehettek a játékosok számára.\n\nEzek a hibák főként technikai apróságok voltak, például grafikai eltérések illetve kisebb UI (felhasználói felület) problémák.', '2025-04-24 11:45:30');

