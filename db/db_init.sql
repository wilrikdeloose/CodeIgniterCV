-- DROP statements --------------------------------

DROP TABLE IF EXISTS CI__CITY;
DROP TABLE IF EXISTS CI__COUNTRY;
DROP TABLE IF EXISTS CI__EXPERIENCE;
DROP TABLE IF EXISTS CI__KNOWLEDGE_HOBBY;
DROP TABLE IF EXISTS CI__PERSON_LANGUAGE;
DROP TABLE IF EXISTS CI__LANG;
DROP TABLE IF EXISTS CI__PERSON;

-- CREATE statements --------------------------------

CREATE TABLE CI__LANG (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE CI__COUNTRY (
    Abbreviation VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Nationality VARCHAR(100) NOT NULL
);

CREATE TABLE CI__CITY (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Country VARCHAR(10) NOT NULL REFERENCES COUNTRY(Abbreviation)
);

CREATE TABLE CI__PERSON (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Street VARCHAR(255) NOT NULL,
    ZipCode VARCHAR(8) NOT NULL,
    CityID INT NOT NULL REFERENCES CITY(ID),
    Phone VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Birthday DATE CHECK(Born < CURDATE()),
    BirthplaceID INT NOT NULL REFERENCES CITY(ID),
    Nationality VARCHAR(10) NOT NULL REFERENCES COUNTRY(Abbreviation),
    DriversLicence BOOLEAN NOT NULL DEFAULT FALSE,
    Mime VARCHAR(255),
    Photo BLOB
);

CREATE TABLE CI__PERSON_LANGUAGE (
    PersonID INT NOT NULL REFERENCES PERSON(ID),
    LanguageID INT NOT NULL REFERENCES LANG(ID),
    Description VARCHAR(255) NOT NULL,
    PRIMARY KEY (PersonID, LanguageID)
);

CREATE TABLE CI__EXPERIENCE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    BeginDate DATE NOT NULL,
    EndDate DATE,
    Title VARCHAR(100) NOT NULL,
    Description VARCHAR(4096) NOT NULL,
    CityID VARCHAR(100) NOT NULL REFERENCES CITY(ID),
    PersonID INT NOT NULL REFERENCES PERSON(ID),
    Category VARCHAR(50) NOT NULL,
    CHECK (Category IN ('Education', 'Work'))
);

CREATE TABLE CI__KNOWLEDGE_HOBBY (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    PersonID INT NOT NULL REFERENCES PERSON(ID),
    Category VARCHAR(50) NOT NULL,
    CHECK (Category IN ('Knowledge', 'Hobby'))
);

-- INSERT statements --------------------------------

INSERT INTO CI__LANG (Name) VALUES ('Dutch');     -- ID : 1
INSERT INTO CI__LANG (Name) VALUES ('English');   -- ID : 2
INSERT INTO CI__LANG (Name) VALUES ('Finnish');   -- ID : 3
INSERT INTO CI__LANG (Name) VALUES ('French');    -- ID : 4
INSERT INTO CI__LANG (Name) VALUES ('German');    -- ID : 5
INSERT INTO CI__LANG (Name) VALUES ('Hungarian'); -- ID : 6

INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('BE', 'Belgium', 'Belgian');            -- ID : 1
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('NL', 'The Netherlands', 'Dutch');      -- ID : 2
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('UK', 'The United Kingdom', 'English'); -- ID : 3
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('FI', 'Finland', 'Finnish');            -- ID : 4
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('FR', 'France', 'French');              -- ID : 5
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('DE', 'Germany', 'German');             -- ID : 6
INSERT INTO CI__COUNTRY (Abbreviation, Name, Nationality) VALUES ('HU', 'Hungary', 'Hungarian');          -- ID : 7

INSERT INTO CI__CITY (Name, Country) VALUES ('Antwerp', 'BE');    -- ID : 1
INSERT INTO CI__CITY (Name, Country) VALUES ('Amsterdam', 'NL');  -- ID : 2
INSERT INTO CI__CITY (Name, Country) VALUES ('Den Haag', 'NL');   -- ID : 3
INSERT INTO CI__CITY (Name, Country) VALUES ('Eindhoven', 'NL');  -- ID : 4
INSERT INTO CI__CITY (Name, Country) VALUES ('Helmond', 'NL');    -- ID : 5
INSERT INTO CI__CITY (Name, Country) VALUES ('Oude-Tonge', 'NL'); -- ID : 6
INSERT INTO CI__CITY (Name, Country) VALUES ('Panningen', 'NL');  -- ID : 7
INSERT INTO CI__CITY (Name, Country) VALUES ('Rotterdam', 'NL');  -- ID : 8
INSERT INTO CI__CITY (Name, Country) VALUES ('Utrecht', 'NL');    -- ID : 9
INSERT INTO CI__CITY (Name, Country) VALUES ('London', 'UK');     -- ID : 10
INSERT INTO CI__CITY (Name, Country) VALUES ('Oulu', 'FI');       -- ID : 11
INSERT INTO CI__CITY (Name, Country) VALUES ('Helsinki', 'FI');   -- ID : 12
INSERT INTO CI__CITY (Name, Country) VALUES ('Paris', 'FR');      -- ID : 13
INSERT INTO CI__CITY (Name, Country) VALUES ('Berlin', 'DE');     -- ID : 14
INSERT INTO CI__CITY (Name, Country) VALUES ('Budapest', 'HU');   -- ID : 15

-- Only person ID : 1
INSERT INTO CI__PERSON (Name, Street, ZipCode, CityID, Phone, Email, Birthday, BirthplaceID, Nationality, DriversLicence)
VALUES ( 'Wilrik De Loose', 'Rachelsmolen 1', 'R1-2.01', 4, '+31 (0)6 12 345 678', 'w.deloose@fontys.nl', '1983-05-21', 4, 'NL', 1);

INSERT INTO CI__PERSON_LANGUAGE (PersonID, LanguageID, Description) VALUES (1, 1, 'Native language');
INSERT INTO CI__PERSON_LANGUAGE (PersonID, LanguageID, Description) VALUES (1, 2, 'Fluent in speaking, writing and understanding');
INSERT INTO CI__PERSON_LANGUAGE (PersonID, LanguageID, Description) VALUES (1, 5, 'Novice');

INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('1995-09-01', '2000-01-01', 'Secondary education', 'Finished my secondary education with courses like physics, mathematics and science.', 4, 1, 'Education');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2000-09-01', '2005-01-01', 'Fontys Hogeschool, Computer Science and Engineering Bachelor', 'Finished my bachelor in computer science and engineering. I graduated in technical software.', 4, 1, 'Education');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2005-09-01', '2010-01-01', 'TU/e University, Computer Science and Engineering Master', 'Finished my master in computer science and engineering. I graduated in computer visualisation.', 4, 1, 'Education');

INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2003-01-01', '2003-01-01', 'Software engineer, Internship, Fancom B.V.', 'Fancom B.V. focuses on the development of automation systems for the intensive animal husbandry sector. This was my first internship (three months) at the Fontys. I created a tool in C/C++ that was used in the development of their products.\r\n\r\nWebsite: http://www.fancom.nl/', 7, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2003-01-01', '2004-01-01', 'Software tester, Onwijs producties', 'Onwijs creates games for educational purposes. I tested several versions of their software.\r\n\r\nWebsite: http://www.onwijs.com/', 6, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2003-01-01', '2004-01-01', 'Software engineer, Internship, GEAR Software B.V.', 'Gear Software creates CD/DVD burning software. I was the first to work on a tool that should perform a set of tests in order to validate the compatibility of drive with their API. The application was written in C/C++. This was my second internship (five months).\r\n\r\nWebsite: http://www.gearsoftware.com/', 6, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2004-01-01', '2005-01-01', 'Software engineer, Graduation, Philips TASS B.V.', 'I did a duo-internship at (former Philips) TASS in which we tried to locate weaknesses in the production of embedded software. We created a complete software design (from customer requirements to acceptance test) and implemented a software application for a cruise control in C/C++.\r\n\r\nWebsite: http://www.tass.nl/', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2005-01-01', '2006-01-01', 'PR employee, Volunteer on festivals', 'I was working with a small group of people managing the public relations of the ABLive festival. This included writing and reviewing all the news items for the newspaper, local newsletters and the website. I also designed and programmed to entire website myself in PHP. I did this for one year. Furthermore, I worked on the festival itself as barkeeper (twice) and stage manager (once). Working as a volunteer also meant helping with building up and cleaning up the festival. I also did this at the Folkwoods festival.', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2005-01-01', '2009-06-01', 'PHP programmer, Part-time, Sprint Software Solutions B.V.', 'Sprint Software Solutions (or Sprint for short) creates web applications using PHP, PostgreSQL databases and open source technology. After my graduation at the Fontys I worked full-time at Sprint for six months. During this period I had the privilege to supervise a trainee from the Fontys. After the six months, I started at the TU/e and continued my work as a part-time employee.', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2009-06-01', '2010-06-01', 'Research, Graduation, Philips Lumalive', 'Lumalive created a textile with embedded LED technology. The textiles can display a high speed animation without comprising the softness and flexibility of the fabric. The goal of my project is to research the optical characteristics of the Lumalive product and create a simulation that visualizes the optical output. In other words, I visualize the looks of the LEDs on the fabric as realistic as possible.\r\n\r\nWebsite: http://www.lumalive.com/', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2010-02-01', '2012-09-01', 'Technical Software Developer, Full-time, uCAN @ TASS', 'The first project I worked on for TASS was called uCAN. In this automotive project I was responsible for the embedded software of an in-car module. This device was programmed to retrieve all the data from within a car. The data was then sent to a centralized server on which the customer could collect its requested data. Apart from designing and writing new features for the entire uCAN system, I also did lots of other activities. I went to several fairs with the project. One being the Automechanika fair in Frankfurt. I gave some presentations and published a paper together with some colleagues. Before the project was launched I wrote a subsidy request. When it was finally accepted the team eventually grew bigger up until it was a very stable Scrum team of about 8 people. This gave me lots of Scrum experience as a developer as well as excelent insights in the role of product owner, scrum master and all other Agile aspects.\r\n\r\nWebsite: http://www.tass.nl/', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, EndDate, Title, Description, CityID, PersonID, Category) VALUES ('2012-09-01', '2014-04-01', 'Technical Software Developer, Full-time, TASS technology solutions', 'At TASS I did several important project. The most notable was for a project called uCAN. In the next section you can read more about that specific project. I also did a project for Philips Research called 3D Creator in which I translated a highly complex C# application to a C++ plug-in. For this project I had close contact with the customer at Philips in order to communicate the progress and discuss the requirements. Currently I am working at Philips Lighting for the All-IP project. This team within Philips Lighting is responsible for the creation and maintenance of an IP based communication framework. All future lighting systems will make a transition to an IP-based system. This means that in the future all lights will be connected to the Internet. In this project I operate as the system integrator, meaning that I am responsible for smooth delivery and integration with the customer his own software. Technical customer support is an important part of this. Along with the technical responsibilities I also work as Scrum master support when our Scrum master is not available and I take care of the configuration– and release management. Next to all the projects I did at TASS I also joined the TASS newsletter editorial. Shortly after that I was asked to join the TASS Employees Council. I have been active in several committees like the publicity committee and the financial committee. Currently I am operating as the chairman of the Employees Council. Last but not least I also organize movie evenings at our office and the TASS music evening.\r\n\r\nWebsite: http://www.tass.nl/', 4, 1, 'Work');
INSERT INTO CI__EXPERIENCE (BeginDate, Title, Description, CityID, PersonID, Category) VALUES ('2014-04-01', 'Lecturer, Full-time, Fontys Hogeschool ICT', 'As a teacher I have many responsibilities. I teach C#, SQL, UX design, software design and much more. I am project manager of a couple of students projects as well as internships. I create new study material and help in the development of new courses.\r\n\r\nWebsite: http://www.fontys.nl/', 4, 1, 'Work');

INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('OS', 'Windows, Linux (Suse and Ubuntu)', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Programming', 'C/C++, C#, Object Pascal, Java, PHP', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Scripting', 'HTML, XML, Javascript, Python', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Databases', 'MS Access, MySQL, PostgreSQL, PL/SQL', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Modeling', 'UML, ERD, Z, YAWL, ...', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Microprocessors', 'LPC2368 ARM7, STM32-F107 Cortex-M3', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Software methods', 'TMAP, ISTQB, UML, Agile, eXtreme Programming, Scrum, ASD', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Configuration management', 'SVN, CVS, Redmine, Trac, Hudson, Jenkins', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Office', 'Microsoft Office, OpenOffice, Adobe Photoshop, Enterprise Architect, LATEX, ...', 1, 'Knowledge');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Miscellaneous', 'OpenCV, OpenGL, DirectX, MFC, Cg (GPGPU), AJAX', 1, 'Knowledge');

INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Music', 'I play electric and acoustic guitar and a little bit of keyboard. I have been in in several bands and performed over 50 times on stage for a live audience. I’m currently active in several projects and write almost all of the music myself.', 1, 'Hobby');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Games', 'I am a gamer but also like to create small gaming applications. I have done a few hobby projects
in this context.', 1, 'Hobby');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Web design', 'I have created and maintained a couple of web sites for friends, family, myself and my bands.', 1, 'Hobby');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Sports', 'I fitness a few times a week. Once a week I go boxing and once a week I go out to play some squash. I also like long distance jogging and snowboarding.', 1, 'Hobby');
INSERT INTO CI__KNOWLEDGE_HOBBY (Title, Description, PersonID, Category) VALUES ('Spiritual', 'I see myself as a Buddhist. All life is created equal. I am a vegan, blood donor, organ donor and fund several charities. I am also a member of the Dutch Party for the Animals.', 1, 'Hobby');