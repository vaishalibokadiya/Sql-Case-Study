CREATE DATABASE VirtualGalleryProject;

USE VirtualGalleryProject;

CREATE TABLE Artwork (
    artworkID INT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    creationDate VARCHAR(20),
    medium VARCHAR(100),
    imageURL VARCHAR(200)
);

CREATE TABLE Artist (
    artistID INT PRIMARY KEY,
    name VARCHAR(100),
    biography TEXT,
    birthDate VARCHAR(20),
    nationality VARCHAR(100),
    website VARCHAR(200),
    contactInformation VARCHAR(200)
);

CREATE TABLE Users (
    userID INT PRIMARY KEY,
    username VARCHAR(100),
	password VARCHAR(100),
    email VARCHAR(100),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    dateOfBirth VARCHAR(20),
    profilePicture VARCHAR(250),
	favoriteArtworkID INT,
    FOREIGN KEY (favoriteArtworkID) REFERENCES Artwork(artworkID) ON DELETE CASCADE
);

CREATE TABLE Gallery (
    galleryID INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    location VARCHAR(200),
    curator INT,
    openingHours VARCHAR(100),
    FOREIGN KEY (curator) REFERENCES Artist(artistID)
);

INSERT INTO Artwork (artworkID, title, description, creationDate, medium, imageURL)
VALUES
	(1,'Mona Lisa','half length portrait painting','08-09-1503','oil painting','image/mona-lisa'),
	(2,'The stary night','depicts view from the window of asylum room','09-08-1889','oil painting','image/stary-night'),
	(3,'Girl with the pearl earring','portrait of earring worn by a girl','01-09-1665','oil painting','image/pearl-girl'),
	(4,'The kiss','realistic and geometric depiction of a kissing couple','01-02-1908','oil painting','image/kiss'),
	(5,'The scream','Featuring a ghoulish figure','03-02-1893','oil and pastel painting','image/scream'),
	(6,'Guernica','inspired by bombing of guirnica, spain','05-11-1937','oil painting','image/guernica'),
	(7,'The persistence of memory','depicting a dismal shoreline','07-11-1931','oil and pastel painting','image/persistence-of-memory'),
	(8,'Three musicians','emeplify the synthetic whist style','09-11-1921','oil painting','image/three-musician'),
	(9,'The night watch','also known as the shooting company','07-11-1642','oil painting','image/night-watch'),
	(10,'Whistler mother','portrait of mother of the artist','04-12-1971','oil painting','image/whistler-mother');

INSERT INTO Artist (artistID, name, biography, birthDate, nationality, website, contactInformation)
VALUES
	(1,'Leonardo Da Vinci','Italian polymath of the high renaissance','15-04-1452','Italy','website/leonardo-da-vinci','1234567890'),
	(2,'Vincent Van Gogh','Dutch post impressionist painter','03-03-1853','Netherlands','website/vincent-van-gogh','0987654321'),
	(3,'Johannes Vermeer','Dutch baroque period painter','01-10-1632','Holand','website/johannes-vermeer','6789054321'),
	(4,'Gustav Klimt','prominent member of Vienna Secession movement','12-07-1862','Australia','website/gustav-klimt','8907890987'),
	(5,'Edvard Munch','painting and graphic artist','12-12-1863','Norwegian','website/edvard-munch','3456789876'),
	(6,'Pablo Picasso','most influential painter of 20th century','05-10-1881','Spain','website/pablo picasso','2345678654'),
	(7,'Salvador Dali','Spanish surrealist artist','11-05-1904','Spain','website/salvador-dali','8765432176'),
	(8,'Georges Pierre Seurat','French post-impressionist artist','02-12-1859','France','website/georges-pierre','9873456745'),
	(9,'Sandro Botticelli','italian painter of early Renaissance','15-9-09-1445','Italy','website/sandro-botticelli','0978567876'),
	(10,'James McNeill','american painter','10-07-1834','USA','website/james-mcneil','0975267907');

INSERT INTO Users (userID, username, password, email, firstName, lastName, dateOfBirth, profilePicture, favoriteArtworkID)
VALUES
	(1,'JohnDoe','password123','johndoe@example.com','John','Doe','09-09-1997','profile/john',3),
	(2,'JaneDoe','password456','janedoe@example.com','Jane','Doe','05-09-1987','profile/jane',2),
	(3,'ChandlerBing','password129','chandlerbing@example.com','Chandler','Bing','07-09-1982','profile/chandler',5),
	(4,'JoeyTribiani','password876','joeytribiani@example.com','Joey','Tribiani','02-07-1999','profile/joey',6),
	(5,'PheobeBuffay','password890','pheobebuffay@example.com','Pheobe','Buffay','02-04-1999','profile/pheobe',7),
	(6,'MonicaGeller','password459','monicageller@example.com','Monica','Geller','07-12-2000','profile/monica',1),
	(7,'RachelGreen','password157','rachelgreen@example.com','Rachel','Green','10-07-2000','profile/rachel',9),
	(8,'RossGeller','password879','rossgeller@example.com','Ross','Geller','10-09-1990','profile/ross',10),
	(9,'SalenaGomez','password567','salenagomez@example.com','Salena','Gomez','15-09-2000','profile/salena',4),
	(10,'TaylorSwift','password879','taylorswift@example.com','Taylor','Swift','16-09-2000','profile/taylor',8);

INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours)
VALUES
    (1, 'Art Haven Gallery', 'Contemporary art gallery', '123 Main St, Cityville', 1, 'Mon-Fri: 10am-6pm, Sat: 12pm-4pm'),
    (2, 'Modern Art Space', 'Showcasing modern and abstract art', '456 Oak St, Townsville', 2, 'Tue-Sat: 11am-7pm, Sun: 1pm-5pm'),
    (3, 'Portraits & More Gallery', 'Specializing in portrait art', '789 Elm St, Villageton', 3, 'Wed-Sun: 9am-5pm'),
    (4, 'Nature Impressions Gallery', 'Inspired by the beauty of nature', '234 Pine St, Countryside', 1, 'Mon-Sat: 9am-5pm'),
    (5, 'Urban Expression Gallery', 'Capturing the essence of urban life', '567 Maple St, Metroville', 2, 'Mon-Fri: 12pm-8pm, Sat: 10am-4pm'),
    (6, 'Sculpture Showcase', 'Exhibition of contemporary sculptures', '789 Granite St, Artville', 3, 'Thu-Sun: 11am-6pm'),
    (7, 'Digital Dreams Art Center', 'Exploring digital and virtual art forms', '890 Oakwood St, Technocity', 1, 'Tue-Sat: 10am-7pm'),
    (8, 'Abstract Wonders Gallery', 'A journey into the world of abstract wonders', '123 Cedar St, Dreamland', 2, 'Wed-Sun: 12pm-6pm'),
    (9, 'Cultural Perspectives Art Space', 'Celebrating diverse cultural expressions', '456 Birch St, Multicity', 3, 'Mon-Sat: 11am-6pm'),
    (10, 'Classic Revival Gallery', 'Reviving classic art traditions', '789 Walnut St, Renaissanceville', 1, 'Tue-Fri: 10am-5pm, Sat: 11am-3pm');
