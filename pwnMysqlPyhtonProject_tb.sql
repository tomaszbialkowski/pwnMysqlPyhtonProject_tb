CREATE database ekstra2;
use ekstra2;

#drop database ekstra3;
#================================================================================================== tabele

create table logowanie (
	login varchar(30) primary key unique,
	pass varchar(30), 
	uprawnienia char default ''
);

create table sezon (
	SEZ_id int primary key auto_increment,
    rok varchar (9)
);

create table kategoria (
	KAT_id int primary key auto_increment,
    kat_rozgrywki varchar (30)
);

create table rodzaj (
	ROD_id int primary key auto_increment,
    rodzaj varchar (30)
);

create table kolejka (
	KOL_id int primary key auto_increment,
    nr_kolejki int,
    SEZ_id int,
    KAT_id int,
    ROD_id int,
    foreign key (SEZ_id) references sezon(SEZ_id),
	foreign key (KAT_id) references kategoria(KAT_id),
	foreign key (ROD_id) references rodzaj(ROD_id)
);

create table polowa (
	POL_id int primary key auto_increment,
    polowa int (1)
);

create table klub (
	KLU_id int primary key auto_increment,
	nazwa_klubu varchar (30)
);

create table miasto (
	MIA_id int primary key auto_increment,
	miasto varchar (30)
);

create table druzyna (
	DRU_id int primary key auto_increment,
	KLU_id int,
    MIA_id int,
    foreign key (KLU_id) references klub(KLU_id),
    foreign key (MIA_id) references miasto(MIA_id)
);
 
create table imie (
	IMI_id int primary key auto_increment,
	imie_zaw varchar(50)
);

create table nazwisko (
	NAZ_id int primary key auto_increment,
	nazwisko_zaw varchar(70)
);

create table zawodnicy (
	ZAW_id int primary key auto_increment,
	IMI_id int,
    NAZ_id int,
    foreign key (NAZ_id) references nazwisko(NAZ_id),
    foreign key (IMI_id) references imie(IMI_id)
);

create table kontrakty (
	KON_id int primary key auto_increment,
	ZAW_id int,
    DRU_id int,
    od_kiedy date,
    do_kiedy date,
    transfer_do varchar(50),
    rodzaj_transferu varchar(20),
   	foreign key (DRU_id) references druzyna(DRU_id),
    foreign key (ZAW_id) references zawodnicy(ZAW_id)
);

create table mecze (
	MEC_id int primary key auto_increment,
	KOL_id int,
    data_meczu date,
    gosp_DRU_id int,
    gosc_DRU_id int,
    gol_h int,
    gol_a int,
    foreign key (KOL_id) references kolejka(KOL_id),
    foreign key (gosp_DRU_id) references druzyna(DRU_id),
    foreign key (gosc_DRU_id) references druzyna(DRU_id)
);

create table bramki (
	BRA_id int primary key auto_increment,
    MEC_id int,
	DRU_id_zdob_bramki int,
    minuta int,
    POL_id int,
    opis_bramki varchar(20),
    strzelec_KON_id int,
    asystent_KON_id int,
    foreign key (MEC_id) references mecze(MEC_id),
	foreign key (DRU_id_zdob_bramki) references druzyna(DRU_id),
	foreign key (POL_id) references polowa(POL_id),
	foreign key (strzelec_KON_id) references kontrakty(KON_id),
	foreign key (asystent_KON_id) references kontrakty(KON_id)
);

create table grajacy (
	GRA_id int primary key auto_increment,
    MEC_id int,
	DRU_id int,
	KON_id int,
    min_in_1p int,
	min_out_1p int,
    min_in_2p int,
	min_out_2p int,
    foreign key (MEC_id) references mecze(MEC_id),
    foreign key (DRU_id) references druzyna(DRU_id),
    foreign key (KON_id) references kontrakty(KON_id)
);

create table punkty (
	PKT_id int primary key auto_increment,
    KON_id int,
    BRA_id int,
    punkty int,
    GRA_id int,
    MEC_id int,
    foreign key (KON_id) references kontrakty(KON_id),
	foreign key (BRA_id) references bramki(BRA_id),
	foreign key (GRA_id) references grajacy(GRA_id),
	foreign key (MEC_id) references mecze(MEC_id)
);


#================================================================================================== inserty

insert into logowanie values ('admin', 'admin', 'A');
insert into logowanie values ('tomek', 'aaa', 'A');

insert into sezon (rok) values ('2017/2018'); 

insert into kategoria (kat_rozgrywki) values ('sezon podstawowy - jesien');
insert into kategoria (kat_rozgrywki) values ('sezon podstawowy - wiosna');
insert into kategoria (kat_rozgrywki) values ('grupa mistrzowska');
insert into kategoria (kat_rozgrywki) values ('grupa spadkowa');

insert into Rodzaj (rodzaj) values ('Ekstraklasa');

insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (1,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (2,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (3,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (4,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (5,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (6,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (7,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (8,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (9,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (10,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (11,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (12,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (13,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (14,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (15,1,1,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (16,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (17,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (18,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (19,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (20,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (21,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (22,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (23,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (24,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (25,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (26,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (27,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (28,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (29,1,2,1);
insert into kolejka (Nr_kolejki,SEZ_id,KAT_id,ROD_id) values (30,1,2,1);

insert into polowa (polowa) values (1);
insert into polowa (polowa) values (2);

insert into klub (nazwa_klubu) values ('Arka');
insert into klub (nazwa_klubu) values ('Cracovia');
insert into klub (nazwa_klubu) values ('Górnik');
insert into klub (nazwa_klubu) values ('Jagiellonia');
insert into klub (nazwa_klubu) values ('Korona');
insert into klub (nazwa_klubu) values ('Lech');
insert into klub (nazwa_klubu) values ('Lechia');
insert into klub (nazwa_klubu) values ('Legia');
insert into klub (nazwa_klubu) values ('Piast');
insert into klub (nazwa_klubu) values ('Pogoń');
insert into klub (nazwa_klubu) values ('Sandecja');
insert into klub (nazwa_klubu) values ('Śląsk');
insert into klub (nazwa_klubu) values ('Termalica');
insert into klub (nazwa_klubu) values ('Wisła');
insert into klub (nazwa_klubu) values ('Zagłębie');


insert into miasto (miasto) values ('Białystok');
insert into miasto (miasto) values ('Gdańsk');
insert into miasto (miasto) values ('Gdynia');
insert into miasto (miasto) values ('Gliwice');
insert into miasto (miasto) values ('Kielce');
insert into miasto (miasto) values ('Kraków');
insert into miasto (miasto) values ('Lubin');
insert into miasto (miasto) values ('Nieciecza');
insert into miasto (miasto) values ('Nowy Sącz');
insert into miasto (miasto) values ('Płock');
insert into miasto (miasto) values ('Poznań');
insert into miasto (miasto) values ('Szczecin');
insert into miasto (miasto) values ('Warszawa');
insert into miasto (miasto) values ('Wrocław');
insert into miasto (miasto) values ('Zabrze');


insert into druzyna (KLU_id, MIA_id) values (7, 2);
insert into druzyna (KLU_id, MIA_id) values (8, 13);
insert into druzyna (KLU_id, MIA_id) values (4, 1);
insert into druzyna (KLU_id, MIA_id) values (6, 11);
insert into druzyna (KLU_id, MIA_id) values (3, 15);
insert into druzyna (KLU_id, MIA_id) values (14, 10);
insert into druzyna (KLU_id, MIA_id) values (5, 5);
insert into druzyna (KLU_id, MIA_id) values (14, 6);
insert into druzyna (KLU_id, MIA_id) values (15, 7);
insert into druzyna (KLU_id, MIA_id) values (1, 3);
insert into druzyna (KLU_id, MIA_id) values (2, 6);
insert into druzyna (KLU_id, MIA_id) values (12, 14);
insert into druzyna (KLU_id, MIA_id) values (9, 4);
insert into druzyna (KLU_id, MIA_id) values (10, 12);
insert into druzyna (KLU_id, MIA_id) values (13, 8);
insert into druzyna (KLU_id, MIA_id) values (11, 9);


insert into imie (imie_zaw) values ('Achilleas');
insert into imie (imie_zaw) values ('Adam');
insert into imie (imie_zaw) values ('Ádám');
insert into imie (imie_zaw) values ('Adnan');
insert into imie (imie_zaw) values ('Adrian');
insert into imie (imie_zaw) values ('Akos');
insert into imie (imie_zaw) values ('Alan');
insert into imie (imie_zaw) values ('Aleksandar');
insert into imie (imie_zaw) values ('Aleksander');
insert into imie (imie_zaw) values ('Alexandru');
insert into imie (imie_zaw) values ('Andrij');
insert into imie (imie_zaw) values ('Angelos');
insert into imie (imie_zaw) values ('Antoni');
insert into imie (imie_zaw) values ('Antonini');
insert into imie (imie_zaw) values ('Ariel');
insert into imie (imie_zaw) values ('Arkadiusz');
insert into imie (imie_zaw) values ('Armando');
insert into imie (imie_zaw) values ('Aron');
insert into imie (imie_zaw) values ('Artem');
insert into imie (imie_zaw) values ('Artur');
insert into imie (imie_zaw) values ('Arvydas');
insert into imie (imie_zaw) values ('Bartłomiej');
insert into imie (imie_zaw) values ('Bartosz');
insert into imie (imie_zaw) values ('Błażej');
insert into imie (imie_zaw) values ('Boban');
insert into imie (imie_zaw) values ('Bodvar');
insert into imie (imie_zaw) values ('Brian');
insert into imie (imie_zaw) values ('Carlitos');
insert into imie (imie_zaw) values ('Cezary');
insert into imie (imie_zaw) values ('Chris');
insert into imie (imie_zaw) values ('Christian');
insert into imie (imie_zaw) values ('Cillian');
insert into imie (imie_zaw) values ('Cornel');
insert into imie (imie_zaw) values ('Cristian');
insert into imie (imie_zaw) values ('Damian');
insert into imie (imie_zaw) values ('Dani');
insert into imie (imie_zaw) values ('Daniel');
insert into imie (imie_zaw) values ('Dario');
insert into imie (imie_zaw) values ('Dariusz');
insert into imie (imie_zaw) values ('Darko');
insert into imie (imie_zaw) values ('David');
insert into imie (imie_zaw) values ('Dawid');
insert into imie (imie_zaw) values ('Dejan');
insert into imie (imie_zaw) values ('Denis');
insert into imie (imie_zaw) values ('Deniss');
insert into imie (imie_zaw) values ('Denys');
insert into imie (imie_zaw) values ('Diego');
insert into imie (imie_zaw) values ('Dmytro');
insert into imie (imie_zaw) values ('Domagoj');
insert into imie (imie_zaw) values ('Dominik');
insert into imie (imie_zaw) values ('Dorde');
insert into imie (imie_zaw) values ('Dragoljub');
insert into imie (imie_zaw) values ('Dusan');
insert into imie (imie_zaw) values ('Eduardo');
insert into imie (imie_zaw) values ('Elhadji');
insert into imie (imie_zaw) values ('Elia');
insert into imie (imie_zaw) values ('Elvir');
insert into imie (imie_zaw) values ('Emir');
insert into imie (imie_zaw) values ('Enrique');
insert into imie (imie_zaw) values ('Erik');
insert into imie (imie_zaw) values ('Fabian');
insert into imie (imie_zaw) values ('Fedor');
insert into imie (imie_zaw) values ('Filip');
insert into imie (imie_zaw) values ('Flavio');
insert into imie (imie_zaw) values ('Florian');
insert into imie (imie_zaw) values ('Florin');
insert into imie (imie_zaw) values ('Fran');
insert into imie (imie_zaw) values ('Frantisek');
insert into imie (imie_zaw) values ('Frederik');
insert into imie (imie_zaw) values ('Gabriel');
insert into imie (imie_zaw) values ('Gerard');
insert into imie (imie_zaw) values ('Giorgi');
insert into imie (imie_zaw) values ('Goran');
insert into imie (imie_zaw) values ('Grzegorz');
insert into imie (imie_zaw) values ('Guilherme');
insert into imie (imie_zaw) values ('Gutieri');
insert into imie (imie_zaw) values ('Hebert');
insert into imie (imie_zaw) values ('Hubert');
insert into imie (imie_zaw) values ('Igor');
insert into imie (imie_zaw) values ('Igors');
insert into imie (imie_zaw) values ('Inaki');
insert into imie (imie_zaw) values ('Ivan');
insert into imie (imie_zaw) values ('Jacek');
insert into imie (imie_zaw) values ('Jakub');
insert into imie (imie_zaw) values ('Jan');
insert into imie (imie_zaw) values ('Jaroslav');
insert into imie (imie_zaw) values ('Jarosław');
insert into imie (imie_zaw) values ('Jasmin');
insert into imie (imie_zaw) values ('Javi');
insert into imie (imie_zaw) values ('Jesus');
insert into imie (imie_zaw) values ('Joao');
insert into imie (imie_zaw) values ('Joel');
insert into imie (imie_zaw) values ('Jonatan');
insert into imie (imie_zaw) values ('Joona');
insert into imie (imie_zaw) values ('Jose');
insert into imie (imie_zaw) values ('Julian');
insert into imie (imie_zaw) values ('Kacper');
insert into imie (imie_zaw) values ('Kamil');
insert into imie (imie_zaw) values ('Karol');
insert into imie (imie_zaw) values ('Kasper');
insert into imie (imie_zaw) values ('Ken');
insert into imie (imie_zaw) values ('Konrad');
insert into imie (imie_zaw) values ('Konstantin');
insert into imie (imie_zaw) values ('Krystian');
insert into imie (imie_zaw) values ('Krzysztof');
insert into imie (imie_zaw) values ('Lasha');
insert into imie (imie_zaw) values ('Lennard');
insert into imie (imie_zaw) values ('Lubomir');
insert into imie (imie_zaw) values ('Luka');
insert into imie (imie_zaw) values ('Lukas');
insert into imie (imie_zaw) values ('Łukasz');
insert into imie (imie_zaw) values ('Maciej');
insert into imie (imie_zaw) values ('Maksymilian');
insert into imie (imie_zaw) values ('Marcel');
insert into imie (imie_zaw) values ('Marcin');
insert into imie (imie_zaw) values ('Marco');
insert into imie (imie_zaw) values ('Marcus');
insert into imie (imie_zaw) values ('Marek');
insert into imie (imie_zaw) values ('Marian');
insert into imie (imie_zaw) values ('Mario');
insert into imie (imie_zaw) values ('Mariusz');
insert into imie (imie_zaw) values ('Marko');
insert into imie (imie_zaw) values ('Martin');
insert into imie (imie_zaw) values ('Matej');
insert into imie (imie_zaw) values ('Mateusz');
insert into imie (imie_zaw) values ('Mathieu');
insert into imie (imie_zaw) values ('Matić');
insert into imie (imie_zaw) values ('Matthias');
insert into imie (imie_zaw) values ('Matus');
insert into imie (imie_zaw) values ('Meik');
insert into imie (imie_zaw) values ('Michael');
insert into imie (imie_zaw) values ('Michal');
insert into imie (imie_zaw) values ('Michał');
insert into imie (imie_zaw) values ('Mihai');
insert into imie (imie_zaw) values ('Mikkel');
insert into imie (imie_zaw) values ('Mikołaj');
insert into imie (imie_zaw) values ('Milan');
insert into imie (imie_zaw) values ('Milen');
insert into imie (imie_zaw) values ('Milos');
insert into imie (imie_zaw) values ('Miroslav');
insert into imie (imie_zaw) values ('Morten');
insert into imie (imie_zaw) values ('Nabil');
insert into imie (imie_zaw) values ('Nemanja');
insert into imie (imie_zaw) values ('Nicklas');
insert into imie (imie_zaw) values ('Nicolai');
insert into imie (imie_zaw) values ('Nicolas');
insert into imie (imie_zaw) values ('Nika');
insert into imie (imie_zaw) values ('Niko');
insert into imie (imie_zaw) values ('Nikola');
insert into imie (imie_zaw) values ('Oleksandr');
insert into imie (imie_zaw) values ('Oleksij');
insert into imie (imie_zaw) values ('Oliver');
insert into imie (imie_zaw) values ('Ołeksij');
insert into imie (imie_zaw) values ('Oskar');
insert into imie (imie_zaw) values ('Patrik');
insert into imie (imie_zaw) values ('Patryk');
insert into imie (imie_zaw) values ('Pavels');
insert into imie (imie_zaw) values ('Paweł');
insert into imie (imie_zaw) values ('Pawło');
insert into imie (imie_zaw) values ('Petar');
insert into imie (imie_zaw) values ('Piotr');
insert into imie (imie_zaw) values ('Plamen');
insert into imie (imie_zaw) values ('Pol');
insert into imie (imie_zaw) values ('Przemysław');
insert into imie (imie_zaw) values ('Radek');
insert into imie (imie_zaw) values ('Radosław');
insert into imie (imie_zaw) values ('Rafał');
insert into imie (imie_zaw) values ('Ricardo');
insert into imie (imie_zaw) values ('Robert');
insert into imie (imie_zaw) values ('Roman');
insert into imie (imie_zaw) values ('Ruben');
insert into imie (imie_zaw) values ('Samuel');
insert into imie (imie_zaw) values ('Sandi');
insert into imie (imie_zaw) values ('Sanel');
insert into imie (imie_zaw) values ('Sasa');
insert into imie (imie_zaw) values ('Sebastian');
insert into imie (imie_zaw) values ('Semir');
insert into imie (imie_zaw) values ('Serafin');
insert into imie (imie_zaw) values ('Sergei');
insert into imie (imie_zaw) values ('Seweryn');
insert into imie (imie_zaw) values ('Shawn');
insert into imie (imie_zaw) values ('Siergiej');
insert into imie (imie_zaw) values ('Simeon');
insert into imie (imie_zaw) values ('Sito');
insert into imie (imie_zaw) values ('Sławomir');
insert into imie (imie_zaw) values ('Spas');
insert into imie (imie_zaw) values ('Steven');
insert into imie (imie_zaw) values ('Sylwester');
insert into imie (imie_zaw) values ('Szymon');
insert into imie (imie_zaw) values ('Tadeusz');
insert into imie (imie_zaw) values ('Taras');
insert into imie (imie_zaw) values ('Thibault');
insert into imie (imie_zaw) values ('Thomas');
insert into imie (imie_zaw) values ('Tibor');
insert into imie (imie_zaw) values ('Tim');
insert into imie (imie_zaw) values ('Tomasz');
insert into imie (imie_zaw) values ('Tymoteusz');
insert into imie (imie_zaw) values ('Uros');
insert into imie (imie_zaw) values ('Vernon');
insert into imie (imie_zaw) values ('Vitalijs');
insert into imie (imie_zaw) values ('Vjaceslavs');
insert into imie (imie_zaw) values ('Vladislavs');
insert into imie (imie_zaw) values ('Vlastymir');
insert into imie (imie_zaw) values ('Vullnet');
insert into imie (imie_zaw) values ('Wiktor');
insert into imie (imie_zaw) values ('William');
insert into imie (imie_zaw) values ('Wojciech');
insert into imie (imie_zaw) values ('Wołodymyr');
insert into imie (imie_zaw) values ('Yannick');
insert into imie (imie_zaw) values ('Zdenek');
insert into imie (imie_zaw) values ('Ziggy');
insert into imie (imie_zaw) values ('Zlatan');
insert into imie (imie_zaw) values ('Zlatko');
insert into imie (imie_zaw) values ('Zoran');
insert into imie (imie_zaw) values ('Lasse');
insert into imie (imie_zaw) values ('Nicki Niels Bille');
insert into imie (imie_zaw) values ('Abdul Aziz');


insert into nazwisko values (1,'Aankour');
insert into nazwisko values (2,'Abalo Paulos');
insert into nazwisko values (3,'Alomerović');
insert into nazwisko values (4,'Ambrosiewicz');
insert into nazwisko values (5,'Andrzejczak');
insert into nazwisko values (6,'Angielski');
insert into nazwisko values (7,'Angulo');
insert into nazwisko values (8,'Antolić');
insert into nazwisko values (9,'Arcon');
insert into nazwisko values (10,'Argyris');
insert into nazwisko values (11,'Arsenić');
insert into nazwisko values (12,'Astiz');
insert into nazwisko values (13,'Augusto');
insert into nazwisko values (14,'Augustyn');
insert into nazwisko values (15,'Badia');
insert into nazwisko values (16,'Balić');
insert into nazwisko values (17,'Bałaniuk');
insert into nazwisko values (18,'Baran');
insert into nazwisko values (19,'Barkroth');
insert into nazwisko values (20,'Barry');
insert into nazwisko values (21,'Bartczak');
insert into nazwisko values (22,'Bartczuk');
insert into nazwisko values (23,'Bartkowski');
insert into nazwisko values (24,'Bartosz');
insert into nazwisko values (25,'Basha');
insert into nazwisko values (26,'Basta');
insert into nazwisko values (27,'Benga');
insert into nazwisko values (28,'Bergier');
insert into nazwisko values (29,'Bezjak');
insert into nazwisko values (30,'Bida');
insert into nazwisko values (31,'Biliński');
insert into nazwisko values (32,'Błanik');
insert into nazwisko values (33,'Bochniewicz');
insert into nazwisko values (34,'Bodvarsson');
insert into nazwisko values (35,'Boguski');
insert into nazwisko values (36,'Bohdanow');
insert into nazwisko values (37,'Borysiuk');
insert into nazwisko values (38,'Brlek');
insert into nazwisko values (39,'Brock-Madsen');
insert into nazwisko values (40,'Broda');
insert into nazwisko values (41,'Broź');
insert into nazwisko values (42,'Brożek');
insert into nazwisko values (43,'Brzyski');
insert into nazwisko values (44,'Buchalik');
insert into nazwisko values (45,'Bučko');
insert into nazwisko values (46,'Budziłek');
insert into nazwisko values (47,'Budziński');
insert into nazwisko values (48,'Bukata');
insert into nazwisko values (49,'Buksa');
insert into nazwisko values (50,'Buławski');
insert into nazwisko values (51,'Burdenski');
insert into nazwisko values (52,'Burić');
insert into nazwisko values (53,'Burliga');
insert into nazwisko values (54,'Bursztyn');
insert into nazwisko values (55,'Byrtek');
insert into nazwisko values (56,'Cafu');
insert into nazwisko values (57,'Cebula');
insert into nazwisko values (58,'Celeban');
insert into nazwisko values (59,'Černych');
insert into nazwisko values (60,'Cetnarski');
insert into nazwisko values (61,'Chobłenko');
insert into nazwisko values (62,'Cholewiak');
insert into nazwisko values (63,'Chorążka');
insert into nazwisko values (64,'Chrapek');
insert into nazwisko values (65,'Chrzanowski');
insert into nazwisko values (66,'Cierzniak');
insert into nazwisko values (67,'Cotra');
insert into nazwisko values (68,'Covilo');
insert into nazwisko values (69,'Cuesta');
insert into nazwisko values (70,'Culina');
insert into nazwisko values (71,'Cvijanović');
insert into nazwisko values (72,'Cywka');
insert into nazwisko values (73,'Czerwiński');
insert into nazwisko values (74,'da Silva');
insert into nazwisko values (75,'Dahne');
insert into nazwisko values (76,'Danek');
insert into nazwisko values (77,'Dankowski');
insert into nazwisko values (78,'Datković');
insert into nazwisko values (79,'Dąbrowski');
insert into nazwisko values (80,'De Marco Morlacchi');
insert into nazwisko values (81,'Deja');
insert into nazwisko values (82,'Dejmek');
insert into nazwisko values (83,'Deleu');
insert into nazwisko values (84,'Delew');
insert into nazwisko values (85,'Diaw');
insert into nazwisko values (86,'Dilaver');
insert into nazwisko values (87,'Dimun');
insert into nazwisko values (88,'Długosz');
insert into nazwisko values (89,'Drewniak');
insert into nazwisko values (90,'Drygas');
insert into nazwisko values (91,'Dudzic');
insert into nazwisko values (92,'Dwali');
insert into nazwisko values (93,'Dybowski');
insert into nazwisko values (94,'Dytiatjew');
insert into nazwisko values (95,'Dziczek');
insert into nazwisko values (96,'Dziubek');
insert into nazwisko values (97,'Dziwniel');
insert into nazwisko values (98,'Dźwigała');
insert into nazwisko values (99,'Esqueda');
insert into nazwisko values (100,'Ferraresso');
insert into nazwisko values (101,'Fink');
insert into nazwisko values (102,'Fojut');
insert into nazwisko values (103,'Forenc');
insert into nazwisko values (104,'Formella');
insert into nazwisko values (105,'Frankowski');
insert into nazwisko values (106,'Frączczak');
insert into nazwisko values (107,'Freitag');
insert into nazwisko values (108,'Fryc');
insert into nazwisko values (109,'Furman');
insert into nazwisko values (110,'Gajos');
insert into nazwisko values (111,'Gałecki');
insert into nazwisko values (112,'Gamakow');
insert into nazwisko values (113,'Gardawski');
insert into nazwisko values (114,'Gergel');
insert into nazwisko values (115,'Gerson');
insert into nazwisko values (116,'Gęsior');
insert into nazwisko values (117,'Gliwa');
insert into nazwisko values (118,'Głowacki');
insert into nazwisko values (119,'Gojko');
insert into nazwisko values (120,'Gonzalez');
insert into nazwisko values (121,'Gordon');
insert into nazwisko values (122,'Gostomski');
insert into nazwisko values (123,'Górski');
insert into nazwisko values (124,'Gradecki');
insert into nazwisko values (125,'Grendel');
insert into nazwisko values (126,'Grić');
insert into nazwisko values (127,'Gryszkiewicz');
insert into nazwisko values (128,'Grzelak');
insert into nazwisko values (129,'Grzyb');
insert into nazwisko values (130,'Grzybek');
insert into nazwisko values (131,'Guba');
insert into nazwisko values (132,'Guilherme');
insert into nazwisko values (133,'Guldan');
insert into nazwisko values (134,'Gumny');
insert into nazwisko values (135,'Gutkovskis');
insert into nazwisko values (136,'Gytkjaer');
insert into nazwisko values (137,'Gyurcsó');
insert into nazwisko values (138,'Hajda');
insert into nazwisko values (139,'Halilović');
insert into nazwisko values (140,'Hamalainen');
insert into nazwisko values (141,'Hamrol');
insert into nazwisko values (142,'Haraslin');
insert into nazwisko values (143,'Hateley');
insert into nazwisko values (144,'Helik');
insert into nazwisko values (145,'Helstrup Jensen');
insert into nazwisko values (146,'Hernandez');
insert into nazwisko values (147,'Hlousek');
insert into nazwisko values (148,'Hładun');
insert into nazwisko values (149,'Hołota');
insert into nazwisko values (150,'Iancu');
insert into nazwisko values (151,'Iloski');
insert into nazwisko values (152,'Imaz Balleste');
insert into nazwisko values (153,'Jach');
insert into nazwisko values (154,'Jagiełło');
insert into nazwisko values (155,'Janicki');
insert into nazwisko values (156,'Janjatović');
insert into nazwisko values (157,'Janjić');
insert into nazwisko values (158,'Jankowski');
insert into nazwisko values (159,'Janoszka');
insert into nazwisko values (160,'Janus');
insert into nazwisko values (161,'Jevtić');
insert into nazwisko values (162,'Jędrzejczyk');
insert into nazwisko values (163,'Jodłowiec');
insert into nazwisko values (164,'Jovanović');
insert into nazwisko values (165,'Jović');
insert into nazwisko values (166,'Jóźwiak');
insert into nazwisko values (167,'Jukić');
insert into nazwisko values (168,'Jurado');
insert into nazwisko values (169,'Kaczarawa');
insert into nazwisko values (170,'Kakoko');
insert into nazwisko values (171,'Kallaste');
insert into nazwisko values (172,'Kamiński');
insert into nazwisko values (173,'Kanach');
insert into nazwisko values (174,'Kante');
insert into nazwisko values (175,'Kapidzić');
insert into nazwisko values (176,'Karpieszuk');
insert into nazwisko values (177,'Karwot');
insert into nazwisko values (178,'Kasprzak');
insert into nazwisko values (179,'Kasprzik');
insert into nazwisko values (180,'Kądzior');
insert into nazwisko values (181,'Keckes');
insert into nazwisko values (182,'Kelemen');
insert into nazwisko values (183,'Khomchenovskiy');
insert into nazwisko values (184,'Kiełb');
insert into nazwisko values (185,'Kiełpin');
insert into nazwisko values (186,'Kiklaisz');
insert into nazwisko values (187,'Kirkeskov');
insert into nazwisko values (188,'Klupś');
insert into nazwisko values (189,'Koj');
insert into nazwisko values (190,'Kokoszka');
insert into nazwisko values (191,'Kolar');
insert into nazwisko values (192,'Kolev');
insert into nazwisko values (193,'Koljić');
insert into nazwisko values (194,'Konczkowski');
insert into nazwisko values (195,'Kopacz');
insert into nazwisko values (196,'Kopczyński');
insert into nazwisko values (197,'Kort');
insert into nazwisko values (198,'Korun');
insert into nazwisko values (199,'Korzym');
insert into nazwisko values (200,'Kosakiewicz');
insert into nazwisko values (201,'Kosecki');
insert into nazwisko values (202,'Kostal');
insert into nazwisko values (203,'Kostewycz');
insert into nazwisko values (204,'Kuban');
insert into nazwisko values (205,'Kovačević');
insert into nazwisko values (206,'Kowalczyk');
insert into nazwisko values (207,'Kraczunow');
insert into nazwisko values (208,'Krakowczyk');
insert into nazwisko values (209,'Krasić');
insert into nazwisko values (210,'Krążek');
insert into nazwisko values (211,'Kriwiec');
insert into nazwisko values (212,'Kruppa');
insert into nazwisko values (213,'Kryczka');
insert into nazwisko values (214,'Ksionz');
insert into nazwisko values (215,'Kubicki');
insert into nazwisko values (216,'Kucharczyk');
insert into nazwisko values (217,'Kuciak');
insert into nazwisko values (218,'Kudrjavcevs');
insert into nazwisko values (219,'Kun');
insert into nazwisko values (220,'Kupczak');
insert into nazwisko values (221,'Kurek');
insert into nazwisko values (222,'Kurzawa');
insert into nazwisko values (223,'Kuświk');
insert into nazwisko values (224,'Kwantaliani');
insert into nazwisko values (225,'Kwiecień');
insert into nazwisko values (226,'Kwietniewski');
insert into nazwisko values (227,'Lasik');
insert into nazwisko values (228,'Laskoś');
insert into nazwisko values (229,'Lazarević');
insert into nazwisko values (230,'Lebedyński');
insert into nazwisko values (231,'Leciejewski');
insert into nazwisko values (232,'Ledecký');
insert into nazwisko values (233,'Lewandowski');
insert into nazwisko values (234,'Lipski');
insert into nazwisko values (235,'Listkowski');
insert into nazwisko values (236,'Llonch');
insert into nazwisko values (237,'Lopez');
insert into nazwisko values (238,'Loranc');
insert into nazwisko values (239,'Loska');
insert into nazwisko values (240,'Lusiusz');
insert into nazwisko values (241,'Łasicki');
insert into nazwisko values (242,'Łoś');
insert into nazwisko values (243,'Łuczak');
insert into nazwisko values (244,'Łukasiewicz');
insert into nazwisko values (245,'Łukasik');
insert into nazwisko values (246,'Łukowski');
insert into nazwisko values (247,'Łyszczarz');
insert into nazwisko values (248,'Macierzyński');
insert into nazwisko values (249,'Maćkowski');
insert into nazwisko values (250,'Madej');
insert into nazwisko values (251,'Majchrowicz');
insert into nazwisko values (252,'Majewski');
insert into nazwisko values (253,'Mak');
insert into nazwisko values (254,'Maksimenko');
insert into nazwisko values (255,'Makuszewski');
insert into nazwisko values (256,'Malarczyk');
insert into nazwisko values (257,'Malarz');
insert into nazwisko values (258,'Maloča');
insert into nazwisko values (259,'Małecki');
insert into nazwisko values (260,'Małkowski');
insert into nazwisko values (261,'Marciniak');
insert into nazwisko values (262,'Marcjanik');
insert into nazwisko values (263,'Mares');
insert into nazwisko values (264,'Maślanka');
insert into nazwisko values (265,'Matei');
insert into nazwisko values (266,'Matras');
insert into nazwisko values (267,'Matuszczyk');
insert into nazwisko values (268,'Matuszek');
insert into nazwisko values (269,'Matynia');
insert into nazwisko values (270,'Mauricio');
insert into nazwisko values (271,'Mazek');
insert into nazwisko values (272,'Mączyński');
insert into nazwisko values (273,'Merebashvili');
insert into nazwisko values (274,'Mihalík');
insert into nazwisko values (275,'Miković');
insert into nazwisko values (276,'Mila');
insert into nazwisko values (277,'Mišák');
insert into nazwisko values (278,'Miś');
insert into nazwisko values (279,'Mitrović');
insert into nazwisko values (280,'Mladenović');
insert into nazwisko values (281,'Moder');
insert into nazwisko values (282,'Moneta');
insert into nazwisko values (283,'Moulin');
insert into nazwisko values (284,'Możdżeń');
insert into nazwisko values (285,'Mójta');
insert into nazwisko values (286,'Mraz');
insert into nazwisko values (287,'Mrozek');
insert into nazwisko values (288,'Mucha');
insert into nazwisko values (289,'Murawski');
insert into nazwisko values (290,'Nagy');
insert into nazwisko values (291,'Najemski');
insert into nazwisko values (292,'Nalepa');
insert into nazwisko values (293,'Nawrocki');
insert into nazwisko values (294,'Nespor');
insert into nazwisko values (295,'Niepsuj');
insert into nazwisko values (296,'Niezgoda');
insert into nazwisko values (297,'Nikołajuk');
insert into nazwisko values (298,'Novikovas');
insert into nazwisko values (299,'Nowak');
insert into nazwisko values (300,'Nunes');
insert into nazwisko values (301,'Oko');
insert into nazwisko values (302,'Oliveira');
insert into nazwisko values (303,'Olszewski');
insert into nazwisko values (304,'Ondrasek');
insert into nazwisko values (305,'Paczuk');
insert into nazwisko values (306,'Paixao');
insert into nazwisko values (307,'Pakulski');
insert into nazwisko values (308,'Palcić');
insert into nazwisko values (309,'Pałaszewski');
insert into nazwisko values (310,'Papadopulos');
insert into nazwisko values (311,'Pasquato');
insert into nazwisko values (312,'Pawelec');
insert into nazwisko values (313,'Pawełek');
insert into nazwisko values (314,'Pawłowski');
insert into nazwisko values (315,'Pazdan');
insert into nazwisko values (316,'Peda');
insert into nazwisko values (317,'Pesković');
insert into nazwisko values (318,'Pestka');
insert into nazwisko values (319,'Peszko');
insert into nazwisko values (320,'Petrak');
insert into nazwisko values (321,'Philipps');
insert into nazwisko values (322,'Piątek');
insert into nazwisko values (323,'Piątkowski');
insert into nazwisko values (324,'Pich');
insert into nazwisko values (325,'Piech');
insert into nazwisko values (326,'Piesio');
insert into nazwisko values (327,'Pietrowski');
insert into nazwisko values (328,'Pietrzak');
insert into nazwisko values (329,'Pietrzkiewicz');
insert into nazwisko values (330,'Pik');
insert into nazwisko values (331,'Pilarz');
insert into nazwisko values (332,'Piotrowski');
insert into nazwisko values (333,'Piszczek');
insert into nazwisko values (334,'Plach');
insert into nazwisko values (335,'Plewka');
insert into nazwisko values (336,'Polaček');
insert into nazwisko values (337,'Poński');
insert into nazwisko values (338,'Poprawa');
insert into nazwisko values (339,'Pospisil');
insert into nazwisko values (340,'Poungouras');
insert into nazwisko values (341,'Praszelik');
insert into nazwisko values (342,'Przybysz');
insert into nazwisko values (343,'Purece');
insert into nazwisko values (344,'Putiwcew');
insert into nazwisko values (345,'Putnocky');
insert into nazwisko values (346,'Radliński');
insert into nazwisko values (347,'Radović');
insert into nazwisko values (348,'Radut');
insert into nazwisko values (349,'Rakels');
insert into nazwisko values (350,'Rakoczy');
insert into nazwisko values (351,'Rapa');
insert into nazwisko values (352,'Rasak');
insert into nazwisko values (353,'Rasmussen');
insert into nazwisko values (354,'Reca');
insert into nazwisko values (355,'Remy');
insert into nazwisko values (356,'Rieder');
insert into nazwisko values (357,'Riera');
insert into nazwisko values (358,'Robak');
insert into nazwisko values (359,'Rogalski');
insert into nazwisko values (360,'Rogne');
insert into nazwisko values (361,'Romanczuk');
insert into nazwisko values (362,'Romario');
insert into nazwisko values (363,'Rudol');
insert into nazwisko values (364,'Rugasević');
insert into nazwisko values (365,'Runje');
insert into nazwisko values (366,'Rymaniak');
insert into nazwisko values (367,'Sadiku');
insert into nazwisko values (368,'Sadlok');
insert into nazwisko values (369,'Scalet');
insert into nazwisko values (370,'Schikowski');
insert into nazwisko values (371,'Sedlar');
insert into nazwisko values (372,'Sekulski');
insert into nazwisko values (373,'Serafin');
insert into nazwisko values (374,'Sheridan');
insert into nazwisko values (375,'Sielewski');
insert into nazwisko values (376,'Siemaszko');
insert into nazwisko values (377,'Silva Santos');
insert into nazwisko values (378,'Siplak');
insert into nazwisko values (379,'Situm');
insert into nazwisko values (380,'Sitya');
insert into nazwisko values (381,'Skórski');
insert into nazwisko values (382,'Slisz');
insert into nazwisko values (383,'Słaby');
insert into nazwisko values (384,'Sławczew');
insert into nazwisko values (385,'Słowik');
insert into nazwisko values (386,'Smić');
insert into nazwisko values (387,'Smoleń');
insert into nazwisko values (388,'Smuga');
insert into nazwisko values (389,'Sobieraj');
insert into nazwisko values (390,'Socha');
insert into nazwisko values (391,'Sołdecki');
insert into nazwisko values (392,'Soriano');
insert into nazwisko values (393,'Sowah');
insert into nazwisko values (394,'Starzyński');
insert into nazwisko values (395,'Stasiak');
insert into nazwisko values (396,'Stefaniak');
insert into nazwisko values (397,'Stefanik');
insert into nazwisko values (398,'Stefańczyk');
insert into nazwisko values (399,'Steinbors');
insert into nazwisko values (400,'Stępiński');
insert into nazwisko values (401,'Stępniowski');
insert into nazwisko values (402,'Stilić');
insert into nazwisko values (403,'Stolarski');
insert into nazwisko values (404,'Straus');
insert into nazwisko values (405,'Strózik');
insert into nazwisko values (406,'Suarez');
insert into nazwisko values (407,'Sylwestrzak');
insert into nazwisko values (408,'Szarek');
insert into nazwisko values (409,'Szczepaniak');
insert into nazwisko values (410,'Szeliga');
insert into nazwisko values (411,'Szeweluchin');
insert into nazwisko values (412,'Szmatuła');
insert into nazwisko values (413,'Szota');
insert into nazwisko values (414,'Szufryn');
insert into nazwisko values (415,'Szwoch');
insert into nazwisko values (416,'Szymański');
insert into nazwisko values (417,'Szymiński');
insert into nazwisko values (418,'Szymonowicz');
insert into nazwisko values (419,'Śpiączka');
insert into nazwisko values (420,'Świątko');
insert into nazwisko values (421,'Świderski');
insert into nazwisko values (422,'Świerczok');
insert into nazwisko values (423,'Tarasovs');
insert into nazwisko values (424,'Todorovski');
insert into nazwisko values (425,'Toivio');
insert into nazwisko values (426,'Tomasik');
insert into nazwisko values (427,'Tomelin');
insert into nazwisko values (428,'Tosik');
insert into nazwisko values (429,'Trałka');
insert into nazwisko values (430,'Trela');
insert into nazwisko values (431,'Trochim');
insert into nazwisko values (432,'Turzyniecki');
insert into nazwisko values (433,'Tuszyński');
insert into nazwisko values (434,'Uryga');
insert into nazwisko values (435,'Urynowicz');
insert into nazwisko values (436,'Vacek');
insert into nazwisko values (437,'Valencia');
insert into nazwisko values (438,'Varela');
insert into nazwisko values (439,'Vassiljev');
insert into nazwisko values (440,'Velez');
insert into nazwisko values (441,'Vesović');
insert into nazwisko values (442,'Vinicius ');
insert into nazwisko values (443,'Vitoria');
insert into nazwisko values (444,'Vujadinović');
insert into nazwisko values (445,'Walukiewicz');
insert into nazwisko values (446,'Warcholak');
insert into nazwisko values (447,'Wasilewski');
insert into nazwisko values (448,'Wasiluk');
insert into nazwisko values (449,'Wawrzyniak');
insert into nazwisko values (450,'Wdowiak');
insert into nazwisko values (451,'Wieteska');
insert into nazwisko values (452,'Więckowicz');
insert into nazwisko values (453,'Wilk');
insert into nazwisko values (454,'Wlazło');
insert into nazwisko values (455,'Wojtkowiak');
insert into nazwisko values (456,'Wojtkowski');
insert into nazwisko values (457,'Wolniewicz');
insert into nazwisko values (458,'Wolsztyński');
insert into nazwisko values (459,'Woźniak');
insert into nazwisko values (460,'Wójcicki');
insert into nazwisko values (461,'Wrąbel');
insert into nazwisko values (462,'Załuska');
insert into nazwisko values (463,'Zarandia');
insert into nazwisko values (464,'Zawada');
insert into nazwisko values (465,'Zbozień');
insert into nazwisko values (466,'Zelenika');
insert into nazwisko values (467,'Zenjov');
insert into nazwisko values (468,'Zivec');
insert into nazwisko values (469,'Zwoliński');
insert into nazwisko values (470,'Żubrowski');
insert into nazwisko values (471,'Żukowski');
insert into nazwisko values (472,'Żurkowski');
insert into nazwisko values (473,'Żyra');
insert into nazwisko values (474,'Nielsen');
insert into nazwisko values (475,'Tetteh');


insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (30,53,217);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (31,152,466);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (32,84,449);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (33,null,115);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (34,187,443);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (35,2,65);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (36,63,280);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (37,74,455);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (38,24,14);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (39,91,300);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (40,158,403);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (41,183,384);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (42,139,209);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (43,null,362);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (44,156,234);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (45,176,276);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (46,15,37);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (47,110,142);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (48,185,319);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (49,133,292);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (50,65,370);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (51,37,245);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (52,164,248);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (53,125,471);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (54,64,306);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (55,138,112);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (56,116,306);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (57,74,223);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (58,91,302);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (59,125,297);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (60,2,147);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (61,16,257);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (62,16,291);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (63,20,162);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (64,27,151);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (65,null,56);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (66,30,321);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (67,34,311);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (68,49,8);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (69,54,74);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (70,81,12);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (71,87,296);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (72,100,140);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (73,105,272);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (74,111,41);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (75,111,432);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (76,122,441);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (77,125,341);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (78,null,270);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (79,133,196);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (80,133,216);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (81,133,315);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (82,136,226);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (83,140,347);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (84,166,66);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (85,169,21);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (86,176,416);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (87,201,218);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (88,206,355);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (89,119,182);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (90,105,176);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (91,24,296);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (92,121,313);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (93,143,279);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (94,111,53);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (95,75,380);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (96,118,448);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (97,76,427);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (98,82,365);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (99,26,34);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (100,84,460);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (101,23,225);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (102,191,361);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (103,21,298);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (104,43,229);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (105,164,105);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (106,167,129);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (107,161,454);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (108,123,339);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (109,136,293);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (110,42,418);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (111,170,29);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (112,32,374);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (113,99,421);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (114,23,30);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (115,88,52);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (116,129,345);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (117,23,287);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (118,23,342);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (119,169,134);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (120,193,360);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (121,149,444);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (122,199,80);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (123,208,203);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (124,167,155);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (125,58,86);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (126,161,426);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (127,111,429);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (128,112,110);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (129,40,161);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (130,84,281);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (131,120,379);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (132,112,255);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (133,134,348);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (134,84,373);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (135,144,19);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (136,98,166);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (137,166,252);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (138,153,61);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (139,57,193);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (140,31,136);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (141,197,188);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (142,196,239);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (143,207,314);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (144,74,179);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (145,2,457);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (146,125,451);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (147,150,411);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (148,133,189);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (149,36,406);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (150,207,138);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (151,5,127);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (152,158,33);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (153,22,303);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (154,167,222);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (155,102,299);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (156,35,180);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (157,60,125);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (158,173,9);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (159,189,268);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (160,167,458);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (161,111,458);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (162,189,472);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (163,112,4);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (164,39,172);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (165,23,22);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (166,37,388);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (167,39,314);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (168,79,7);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (169,115,435);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (170,50,227);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (171,105,186);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (172,125,213);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (173,22,124);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (174,193,75);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (175,180,185);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (176,98,407);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (177,22,375);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (178,35,55);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (179,7,434);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (180,29,398);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (181,79,241);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (182,156,400);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (183,35,416);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (184,35,352);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (185,146,438);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (186,50,109);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (187,16,354);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (188,72,273);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (189,2,98);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (190,113,359);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (191,177,402);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (192,84,246);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (193,154,464);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (194,98,31);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (195,95,174);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (196,112,122);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (197,128,141);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (198,212,3);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (199,35,210);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (200,104,278);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (201,161,256);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (202,4,205);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (203,101,171);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (204,55,85);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (205,181,20);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (206,23,366);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (207,165,82);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (208,6,181);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (209,12,10);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (210,73,71);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (211,115,57);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (212,125,284);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (213,142,1);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (214,131,113);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (215,152,320);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (216,84,470);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (217,205,88);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (218,61,51);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (219,133,96);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (220,111,200);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (221,82,167);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (222,83,184);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (223,213,157);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (224,147,169);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (225,112,123);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (226,174,175);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (227,56,392);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (228,161,337);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (229,96,69);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (230,133,44);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (231,98,40);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (232,97,238);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (233,97,63);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (234,112,368);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (235,84,23);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (236,16,118);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (237,214,11);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (238,115,447);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (239,124,308);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (240,82,120);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (241,67,440);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (242,97,228);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (243,161,420);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (244,163,236);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (245,194,139);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (247,196,72);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (248,204,25);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (249,160,38);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (250,98,456);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (251,24,381);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (252,156,335);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (253,5,130);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (254,123,202);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (255,156,259);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (256,167,35);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (257,28,237);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (258,90,152);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (259,210,304);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (260,158,42);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (261,122,191);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (262,46,17);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (263,102,103);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (264,161,231);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (265,50,148);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (266,23,195);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (267,175,16);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (268,8,424);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (269,178,413);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (270,167,328);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (271,37,97);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (272,84,428);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (273,108,133);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (274,7,73);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (275,35,301);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (276,98,271);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (277,22,314);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (278,42,307);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (279,111,159);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (280,158,473);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (281,63,394);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (282,63,154);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (283,87,215);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (284,2,267);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (285,125,266);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (286,111,282);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (287,102,5);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (288,23,382);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (289,16,459);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (290,123,294);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (291,84,263);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (292,156,433);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (293,157,399);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (294,189,452);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (295,105,331);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (296,190,390);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (297,105,389);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (298,42,391);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (299,2,261);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (300,115,446);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (301,1,340);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (302,69,145);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (303,133,262);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (304,35,465);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (305,13,244);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (306,109,463);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (307,117,442);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (308,125,415);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (309,74,326);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (310,133,292);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (311,105,160);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (312,182,211);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (313,209,170);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (314,156,219);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (315,171,168);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (316,167,376);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (317,59,99);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (318,85,242);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (319,11,36);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (320,104,401);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (321,2,453);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (322,132,317);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (323,63,251);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (324,127,101);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (325,132,378);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (326,148,78);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (327,98,318);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (328,151,94);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (329,133,144);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (330,47,100);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (331,166,212);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (332,140,68);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (333,188,240);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (334,14,70);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (335,137,87);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (336,166,173);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (337,35,79);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (338,89,146);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (339,2,81);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (340,189,89);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (341,133,350);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (342,179,467);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (343,125,450);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (344,145,39);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (345,176,405);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (346,45,349);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (347,37,330);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (348,105,322);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (349,84,461);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (350,50,47);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (351,84,385);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (352,25,165);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (353,161,58);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (354,51,67);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (355,null,13);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (356,121,312);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (357,125,233);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (358,2,190);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (359,195,356);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (360,102,338);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (361,80,423);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (362,158,216);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (363,133,64);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (364,84,201);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (365,52,386);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (366,98,436);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (367,125,62);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (368,133,253);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (369,169,324);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (370,111,250);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (371,176,28);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (372,5,247);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (373,37,243);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (374,98,77);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (375,112,309);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (376,112,50);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (377,126,369);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (378,115,358);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (379,184,357);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (380,16,325);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (381,84,412);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (382,99,93);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (383,68,334);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (384,84,107);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (385,105,221);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (386,135,187);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (387,84,73);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (388,2,285);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (389,123,194);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (390,38,364);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (391,8,371);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (392,198,198);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (393,44,119);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (394,115,327);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (395,193,143);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (396,9,154);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (397,175,468);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (398,103,439);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (399,156,95);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (400,92,437);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (401,125,253);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (402,71,15);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (403,196,163);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (404,125,409);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (405,123,48);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (406,99,6);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (407,111,208);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (408,132,310);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (409,111,462);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (410,84,54);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (411,111,46);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (412,33,351);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (413,78,269);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (414,176,363);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (415,87,102);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (416,106,92);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (417,114,396);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (418,176,445);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (419,168,300);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (420,84,332);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (421,167,289);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (422,42,32);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (423,2,106);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (424,42,197);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (425,186,84);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (426,98,90);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (427,196,149);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (428,41,295);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (429,35,314);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (430,167,249);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (431,176,206);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (432,156,305);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (433,141,353);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (434,2,49);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (435,115,235);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (436,18,395);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (437,111,469);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (438,39,430);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (439,85,288);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (440,200,254);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (441,94,425);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (442,70,265);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (443,19,344);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (444,164,408);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (445,203,164);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (446,167,128);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (447,170,114);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (448,172,397);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (449,123,275);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (450,23,410);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (451,189,314);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (452,147,224);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (453,125,220);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (454,111,322);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (455,66,343);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (456,70,150);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (457,43,156);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (458,23,419);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (459,41,131);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (460,202,135);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (461,133,117);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (462,111,346);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (463,42,329);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (464,93,404);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (465,10,27);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (466,42,414);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (467,162,207);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (468,5,26);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (469,155,286);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (470,132,45);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (471,196,43);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (472,84,24);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (473,74,18);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (474,112,260);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (475,23,116);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (476,207,431);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (477,133,111);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (478,5,76);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (479,125,60);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (480,159,214);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (481,22,178);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (482,22,91);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (483,84,126);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (484,78,264);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (485,97,387);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (486,112,199);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (487,63,333);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (488,205,299);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (489,8,192);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (490,164,417);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (491,120,258);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (492,125,323);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (493,136,230);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (494,8,205);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (495,3,137);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (496,null,83);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (497,86,274);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (498,107,393);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (499,41,232);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (500,112,79);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (501,null,132);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (502,192,283);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (503,50,290);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (504,17,367);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (505,98,383);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (506,156,108);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (507,155,277);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (508,104,316);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (509,211,121);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (510,48,183);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (511,62,59);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (512,111,372);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (513,37,2);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (514,123,336);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (515,87,153);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (516,84,422);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (517,77,377);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (518,112,158);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (519,39,104);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (520,130,177);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (521,166,289);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (522,215,474);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (523,216,474);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (524,217,475);
insert into zawodnicy (ZAW_id, IMI_id, NAZ_id) values (525,110,204);


insert into kontrakty (KON_id, ZAW_id, DRU_id) values (1,30,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (2,31,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (3,32,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (4,33,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (5,34,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (6,35,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (7,36,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (8,37,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (9,38,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (10,39,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (11,40,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (12,41,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (13,42,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (14,43,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (15,44,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (16,45,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (17,46,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (18,47,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (19,48,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (20,49,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (21,50,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (22,51,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (23,52,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (24,53,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (25,54,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (26,55,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (27,56,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (28,57,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (29,58,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (30,59,1);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (31,60,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (32,61,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (33,62,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (34,63,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (35,64,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (36,65,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (37,66,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (38,67,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (39,68,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (40,69,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (41,70,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (42,71,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (43,72,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (44,73,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (45,74,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (46,75,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (47,76,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (48,77,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (49,78,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (50,79,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (51,80,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (52,81,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (53,82,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (54,83,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (55,84,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (56,85,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (57,86,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (58,87,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (59,88,2);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (60,89,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (61,90,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (62,91,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (63,92,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (64,93,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (217,93,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (65,94,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (66,95,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (67,96,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (68,97,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (69,98,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (70,99,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (71,100,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (72,101,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (493,101,7,'2017-07-27','Jagielonia Białystok');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (73,102,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (74,103,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (75,104,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (76,105,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (77,106,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (78,107,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (462,107,6,'2017-07-17','Jagielonia Białystok');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (79,108,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (80,109,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (81,110,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (82,111,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (83,112,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (84,113,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (85,114,3);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (86,115,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (87,116,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (88,117,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (89,118,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (90,119,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (91,120,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (92,121,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (93,122,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (94,123,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (95,124,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (96,125,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (97,126,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (98,127,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (99,128,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (100,129,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (101,130,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (102,131,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (103,132,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (104,133,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (105,134,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (106,135,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (107,136,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (108,137,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (109,138,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (110,139,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (111,140,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (112,141,4);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (113,142,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (114,143,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (115,144,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (116,145,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (117,146,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (118,147,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (119,148,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (120,149,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (121,150,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (122,151,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (123,152,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (124,153,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (125,154,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (126,155,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (127,156,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (128,157,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (129,158,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (130,159,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (131,160,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (132,161,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (133,162,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (134,163,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (135,164,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (136,165,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (137,166,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (138,167,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (139,168,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (140,169,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (141,170,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (142,171,5);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (143,172,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (144,173,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (145,174,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (146,175,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (147,176,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (148,177,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (149,178,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (150,179,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (151,180,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (152,181,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (153,182,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (154,183,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (490,183,3,'2017-08-18','Wisła Płock');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (155,184,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (156,185,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (157,186,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (158,187,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (159,188,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (160,189,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (161,190,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (162,191,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (163,192,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (164,193,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (165,194,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (166,195,6);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (167,196,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (168,197,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (169,198,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (170,199,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (171,200,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (172,201,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (472,201,11,'2018-02-01','Korona Kielce');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (173,202,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (174,203,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (175,204,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (176,205,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (177,206,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (178,207,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (179,208,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (499,208,15,'2018-02-27','Korona Kielce');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (180,209,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (181,210,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (182,211,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (183,212,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (184,213,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (185,214,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (186,215,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (187,216,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (188,217,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (189,218,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (190,219,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (191,220,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (192,221,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (193,222,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (194,223,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (195,224,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (196,225,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (197,226,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (198,227,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (199,228,7);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (200,229,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (201,230,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (202,231,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (203,232,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (204,233,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (205,234,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (206,235,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (207,236,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (208,237,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (209,238,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (210,239,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (211,240,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (212,241,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (213,242,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (214,243,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (215,244,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (216,245,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (218,247,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (219,248,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (220,249,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (221,250,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (222,251,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (223,252,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (224,253,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (225,254,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (226,255,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (227,256,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (228,257,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (229,258,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (230,259,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (231,260,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (232,261,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (233,262,8);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (234,263,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (235,264,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (236,265,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (237,266,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (238,267,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (239,268,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (240,269,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (241,270,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (242,271,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (243,272,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (244,273,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (245,274,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (246,275,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (247,276,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (248,277,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (249,278,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (250,279,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (251,280,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (252,281,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (253,282,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (254,283,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (255,284,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (256,285,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (466,285,1,'2018-02-18','Zagłębie Lubin');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (257,286,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (258,287,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (259,288,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (260,289,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (261,290,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (262,291,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (263,292,9);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (264,293,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (265,294,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (266,295,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (267,296,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (268,297,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (269,298,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (270,299,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (271,300,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (272,301,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (273,302,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (274,303,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (275,304,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (276,305,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (277,306,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (278,307,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (279,308,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (481,308,2,'2018-07-01','Arka Gdynia');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (280,309,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (281,310,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (282,311,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (496,311,9,'2018-02-27','Arka Gdynia');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (283,312,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (284,313,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (285,314,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (286,315,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (287,316,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (288,317,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (289,318,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (290,319,10);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (291,320,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (292,321,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (293,322,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (294,323,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (295,324,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (296,325,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (297,326,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (298,327,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (299,328,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (300,329,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (301,330,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (302,331,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (303,332,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (304,333,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (305,334,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (306,335,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (307,336,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (308,337,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (309,338,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (310,339,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (311,340,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (312,341,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (313,342,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (314,343,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (315,344,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (316,345,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (317,346,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (509,346,4,'2018-01-26','Cracovia Kraków');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (318,347,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (319,348,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (320,349,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (321,350,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (322,351,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (323,352,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (324,353,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (325,354,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (326,355,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (327,356,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (328,357,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (467,357,1,'2018-02-01','Śląsk Wrocław');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (329,358,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (330,359,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (331,360,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (332,361,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (333,362,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (334,363,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (335,364,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (336,365,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (337,366,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (338,367,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (339,368,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (340,369,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (341,370,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (342,371,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (343,372,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (344,373,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (345,374,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (346,375,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (347,376,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (348,377,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (349,378,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (350,379,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (351,380,12);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (352,381,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (353,382,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (354,383,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (355,384,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (356,385,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (357,386,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (358,387,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (503,387,2,'2018-01-18','Piast Gliwice');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (359,388,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (360,389,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (361,390,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (362,391,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (363,392,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (364,393,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (365,394,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (366,395,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (367,396,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (368,397,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (369,398,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (370,399,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (371,400,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (372,401,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (373,402,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (374,403,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (375,404,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (474,404,11,'2018-02-01','Piast Gliwice');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (376,405,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (377,406,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (378,407,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (379,408,13);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (380,409,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (381,410,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (382,411,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (383,412,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (384,413,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (385,414,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (386,415,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (387,416,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (388,417,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (389,418,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (390,419,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (391,420,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (392,421,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (393,422,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (394,423,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (395,424,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (396,425,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (397,426,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (398,427,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (399,428,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (400,429,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (401,430,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (402,431,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (403,432,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (404,433,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (405,434,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (406,435,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (407,436,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (408,437,14);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (409,438,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (410,439,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (411,440,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (412,441,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (413,442,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (414,443,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (415,444,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (416,445,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (417,446,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (418,447,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (419,448,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (420,449,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (421,450,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (422,451,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (423,452,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (424,453,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (425,454,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (426,455,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (427,456,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (428,457,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (429,458,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (430,459,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (431,460,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (432,461,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (433,462,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (434,463,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (435,464,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (436,465,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (437,466,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (438,467,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (439,468,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (440,469,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (441,470,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (442,471,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (443,472,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (470,472,8,'2018-02-01','Sandecja Nowy Sącz');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (444,473,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (445,474,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (446,475,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (447,476,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (448,477,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (449,478,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (450,479,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (451,480,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (452,481,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (453,482,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (454,483,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (455,484,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (456,485,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (457,486,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (458,487,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (459,488,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (460,489,16);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (461,490,6,'2017-08-02','Palermo');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (465,491,1,'2017-07-25','Greuther Fürth');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (463,492,6,'2018-01-31','Miedź Legnica');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (464,493,6,'2018-02-28','Górnik Łęczna');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (468,494,1,'2017-08-10','Haugesund');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (469,495,14,'2018-02-01','Hajduk Split');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (471,496,11,'2018-02-17','Miedź Legnica');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (473,497,11,'2018-02-15','Žilina');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (475,498,11);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (476,499,5,'2018-02-17','OKS Odra Opole');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (477,500,2,'2018-03-18','Zagłębie Lubin');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (478,501,2,'2018-01-17','Benevento');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (479,502,2,'2018-01-31','PAOK');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (480,503,2,'2018-02-18','Ferencváros');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (482,504,2,'2018-01-31','Levante');
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (483,505,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (484,506,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id) values (485,507,15);
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (486,508,15,'2018-02-01','GKS Bełchatów');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (487,509,3,'2018-02-18','Pogoń Siedlce');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (488,510,3,'2018-02-22','Ural');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (489,511,3,'2018-01-26','Dinamo Moskwa');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (491,512,3,'2018-02-18','SKA Khabarovsk');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (492,513,7,'2017-08-31','FC Cartagena');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (494,514,9,'2018-02-22','Mladá Boleslav');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (495,515,9,'2018-01-23','Crystal Palace');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (497,516,9,'2018-01-19','Ludogorets');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (500,517,13,'2018-01-13','JEF Utd');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (501,518,13,'2018-03-02','Arka Gdynia');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (502,519,14,'2018-01-18','Lech Poznań');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (504,520,5,'2018-02-27','Pogoń Siedlce');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (505,521,13,'2017-07-17','Palermo');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (506,522,4,'2018-01-23','Trelleborg');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (507,523,4,'2018-01-27','Panionios');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (508,524,4,'2018-01-31','Dinamo Moskwa');
insert into kontrakty (KON_id, ZAW_id, DRU_id, do_kiedy, transfer_do) values (510,525,16,'2018-02-28','Stomil Olsztyn');


insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (1,1,'2017-07-14',6,1,0,2);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (2,1,'2017-07-14',14,8,1,2);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (3,1,'2017-07-15',11,13,1,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (4,1,'2017-07-15',5,2,3,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (5,1,'2017-07-16',10,12,2,0);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (6,1,'2017-07-16',15,3,0,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (7,1,'2017-07-16',4,16,0,0);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (8,1,'2017-07-17',7,9,0,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (9,2,'2017-07-27',16,10,0,0);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (10,2,'2017-07-27',8,15,1,0);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (11,2,'2017-07-22',13,14,1,2);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (12,2,'2017-07-22',1,11,0,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (13,2,'2017-07-22',2,7,1,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (14,2,'2017-07-23',6,4,1,0);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (15,2,'2017-07-23',3,5,2,1);
insert into mecze (MEC_id, KOL_id, data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (16,2,'2017-07-24',9,12,1,0);

insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (1,1,1,24,1,null,27,11);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (2,1,1,37,1,null,466,13);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (3,2,8,17,1,null,228,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (4,2,8,19,1,null,220,228);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (5,2,14,33,1,'karny',469,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (6,3,11,13,1,null,313,314);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (7,3,13,14,1,null,373,501);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (8,4,5,17,1,null,120,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (9,4,5,42,1,null,139,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (10,4,5,65,2,null,139,133);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (11,4,2,80,2,null,482,480);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (12,5,10,69,2,null,285,270);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (13,5,10,78,2,null,281,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (14,6,3,47,2,'karny',491,null);
insert into bramki (BRA_id, MEC_id, DRU_id_zdob_bramki, minuta, POL_id,opis_bramki,strzelec_KON_id,asystent_KON_id) values (15,8,9,71,2,'karny',252,null);


insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (1,1,6,146,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (2,1,6,149,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (3,1,6,151,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (4,1,6,461,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (5,1,6,159,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (6,1,6,462,1,45,45,71);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (7,1,6,157,1,45,45,56);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (8,1,6,158,1,45,45,80);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (9,1,6,155,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (10,1,6,463,1,45,45,68);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (11,1,6,464,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (12,1,6,165,0,0,68,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (13,1,6,156,0,0,71,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (14,1,6,163,0,0,80,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (15,1,1,1,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (16,1,1,3,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (17,1,1,465,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (18,1,1,20,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (19,1,1,11,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (20,1,1,13,1,45,45,80);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (21,1,1,25,1,45,45,81);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (22,1,1,466,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (23,1,1,22,1,45,45,59);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (24,1,1,18,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (25,1,1,27,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (26,1,1,468,0,0,59,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (27,1,1,467,0,0,80,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (28,1,1,28,0,0,81,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (29,2,14,380,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (30,2,14,386,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (31,2,14,383,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (32,2,14,390,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (33,2,14,385,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (34,2,14,392,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (35,2,14,397,1,45,45,75);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (36,2,14,398,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (37,2,14,469,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (38,2,14,408,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (39,2,14,406,1,45,0,0);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (40,2,14,395,0,0,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (41,2,14,402,0,0,75,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (42,2,8,200,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (43,2,8,205,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (44,2,8,207,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (45,2,8,211,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (46,2,8,212,1,45,45,85);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (47,2,8,218,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (48,2,8,227,1,45,45,79);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (49,2,8,226,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (50,2,8,220,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (51,2,8,230,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (52,2,8,228,1,45,45,74);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (53,2,8,221,0,0,74,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (54,2,8,470,0,0,79,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (55,3,11,292,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (56,3,11,471,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (57,3,11,472,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (58,3,11,300,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (59,3,11,298,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (60,3,11,303,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (61,3,11,473,1,45,45,72);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (62,3,11,314,1,45,45,57);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (63,3,11,306,1,45,45,56);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (64,3,11,313,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (65,3,11,319,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (66,3,11,311,0,0,56,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (67,3,11,474,0,0,57,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (68,3,11,475,0,0,72,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (69,3,13,352,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (70,3,13,362,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (71,3,13,500,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (72,3,13,360,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (73,3,13,369,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (74,3,13,365,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (75,3,13,368,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (76,3,13,373,1,25,0,0);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (77,3,13,505,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (78,3,13,370,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (79,3,13,501,1,45,45,89);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (80,3,13,376,25,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (81,3,13,379,0,0,89,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (82,4,5,113,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (83,4,5,120,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (84,4,5,117,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (96,4,2,32,1,45,0,0);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (98,4,2,45,1,45,45,61);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (106,4,2,50,1,45,45,46);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (107,4,2,55,0,0,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (108,4,2,482,0,0,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (109,4,2,44,0,0,61,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (85,4,5,119,1,45,45,80);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (86,4,5,139,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (87,4,5,127,1,45,45,61);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (88,4,5,125,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (95,4,5,128,0,0,80,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (89,4,5,116,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (90,4,5,132,1,45,45,73);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (91,4,5,134,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (92,4,5,133,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (93,4,5,476,0,0,61,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (94,4,5,124,0,0,73,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (97,4,2,34,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (99,4,2,31,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (100,4,2,477,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (101,4,2,43,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (102,4,2,478,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (103,4,2,479,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (104,4,2,480,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (105,4,2,481,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (110,5,10,264,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (111,5,10,270,1,45,45,87);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (112,5,10,268,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (113,5,10,267,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (114,5,10,271,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (115,5,10,274,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (116,5,10,280,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (117,5,10,284,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (118,5,10,278,1,45,45,46);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (119,5,10,285,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (120,5,10,287,1,45,45,67);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (121,5,10,281,0,0,46,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (122,5,10,286,0,0,67,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (123,5,10,269,0,0,87,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (124,5,12,320,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (125,5,12,327,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (126,5,12,324,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (127,5,12,332,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (128,5,12,325,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (129,5,12,341,1,45,45,87);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (130,5,12,340,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (131,5,12,335,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (132,5,12,339,1,45,45,60);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (133,5,12,336,1,45,45,60);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (134,5,12,351,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (135,5,12,334,0,0,60,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (136,5,12,343,0,0,60,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (137,5,12,344,0,0,87,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (138,6,15,410,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (139,6,15,414,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (140,6,15,483,1,45,45,63);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (141,6,15,484,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (142,6,15,425,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (143,6,15,416,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (144,6,15,420,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (145,6,15,424,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (146,6,15,419,1,45,45,78);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (147,6,15,485,1,45,45,78);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (148,6,15,429,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (149,6,15,411,0,0,63,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (150,6,15,431,0,0,78,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (151,6,15,486,0,0,78,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (152,6,3,60,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (153,6,3,66,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (154,6,3,487,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (155,6,3,68,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (156,6,3,69,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (157,6,3,488,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (158,6,3,489,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (159,6,3,79,1,45,45,70);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (160,6,3,490,1,45,45,60);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (161,6,3,73,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (162,6,3,491,1,45,45,77);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (163,6,3,81,0,0,60,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (164,6,3,74,0,0,70,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (165,6,3,83,0,0,77,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (166,7,4,86,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (167,7,4,506,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (168,7,4,96,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (169,7,4,94,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (170,7,4,90,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (171,7,4,108,1,45,45,64);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (172,7,4,103,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (173,7,4,99,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (174,7,4,507,1,45,45,69);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (175,7,4,102,1,45,45,83);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (176,7,4,508,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (177,7,4,104,0,0,64,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (178,7,4,111,0,0,83,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (179,7,4,509,0,0,69,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (180,7,16,432,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (181,7,16,442,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (182,7,16,510,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (183,7,16,441,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (184,7,16,437,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (185,7,16,449,1,45,45,80);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (186,7,16,444,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (187,7,16,450,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (188,7,16,447,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (189,7,16,453,1,45,45,64);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (190,7,16,460,1,45,45,55);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (191,7,16,457,0,0,55,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (192,7,16,458,0,0,64,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (193,7,16,435,0,0,80,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (194,8,7,169,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (195,8,7,174,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (196,8,7,177,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (197,8,7,173,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (198,8,7,492,1,11,0,0);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (199,8,7,183,1,45,45,84);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (200,8,7,184,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (201,8,7,493,1,45,45,55);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (202,8,7,187,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (203,8,7,192,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (204,8,7,196,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (205,8,7,191,11,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (206,8,7,171,0,0,55,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (207,8,7,199,0,0,84,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (208,8,9,494,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (209,8,9,243,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (210,8,9,244,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (211,8,9,239,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (212,8,9,242,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (213,8,9,495,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (214,8,9,250,1,45,45,65);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (215,8,9,496,1,45,45,73);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (216,8,9,252,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (217,8,9,254,1,45,45,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (218,8,9,497,1,45,45,81);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (219,8,9,248,0,0,65,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (220,8,9,260,0,0,73,90);
insert into grajacy (GRA_id, MEC_id, DRU_id, KON_id, min_in_1p, min_out_1p, min_in_2p, min_out_2p) values (221,8,9,261,0,0,81,90);

insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (1,146,1,-1,1,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (2,149,1,-1,2,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (3,151,1,-1,3,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (4,461,1,-1,4,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (5,159,1,-1,5,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (6,462,1,-1,6,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (7,157,1,-1,7,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (8,158,1,-1,8,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (9,155,1,-1,9,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (10,463,1,-1,10,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (11,464,1,-1,11,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (12,146,2,-1,1,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (13,149,2,-1,2,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (14,151,2,-1,3,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (15,461,2,-1,4,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (16,159,2,-1,5,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (17,462,2,-1,6,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (18,157,2,-1,7,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (19,158,2,-1,8,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (20,155,2,-1,9,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (21,463,2,-1,10,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (22,464,2,-1,11,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (23,1,1,1,15,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (24,3,1,1,16,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (25,465,1,1,17,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (26,20,1,1,18,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (27,11,1,1,19,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (28,13,1,1,20,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (29,25,1,1,21,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (30,466,1,1,22,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (31,22,1,1,23,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (32,18,1,1,24,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (33,27,1,1,25,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (34,1,2,1,15,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (35,3,2,1,16,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (36,465,2,1,17,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (37,20,2,1,18,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (38,11,2,1,19,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (39,13,2,1,20,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (40,25,2,1,21,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (41,466,2,1,22,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (42,22,2,1,23,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (43,18,2,1,24,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (44,27,2,1,25,1);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (45,380,3,-1,29,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (46,386,3,-1,30,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (47,383,3,-1,31,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (48,390,3,-1,32,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (49,385,3,-1,33,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (50,392,3,-1,34,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (51,397,3,-1,35,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (52,398,3,-1,36,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (53,469,3,-1,37,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (54,408,3,-1,38,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (55,406,3,-1,39,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (56,380,4,-1,29,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (57,386,4,-1,30,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (58,383,4,-1,31,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (59,390,4,-1,32,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (60,385,4,-1,33,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (61,392,4,-1,34,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (62,397,4,-1,35,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (63,398,4,-1,36,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (64,469,4,-1,37,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (65,408,4,-1,38,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (66,406,4,-1,39,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (67,380,5,1,29,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (68,386,5,1,30,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (69,383,5,1,31,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (70,390,5,1,32,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (71,385,5,1,33,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (72,392,5,1,34,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (73,397,5,1,35,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (74,398,5,1,36,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (75,469,5,1,37,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (76,408,5,1,38,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (77,406,5,1,39,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (78,200,3,1,42,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (79,205,3,1,43,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (80,207,3,1,44,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (81,211,3,1,45,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (82,212,3,1,46,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (83,218,3,1,47,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (84,227,3,1,48,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (85,226,3,1,49,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (86,220,3,1,50,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (87,230,3,1,51,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (88,228,3,1,52,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (89,200,4,1,42,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (90,205,4,1,43,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (91,207,4,1,44,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (92,211,4,1,45,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (93,212,4,1,46,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (94,218,4,1,47,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (95,227,4,1,48,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (96,226,4,1,49,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (97,220,4,1,50,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (98,230,4,1,51,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (99,228,4,1,52,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (100,200,5,-1,42,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (101,205,5,-1,43,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (102,207,5,-1,44,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (103,211,5,-1,45,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (104,212,5,-1,46,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (105,218,5,-1,47,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (106,227,5,-1,48,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (107,226,5,-1,49,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (108,220,5,-1,50,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (109,230,5,-1,51,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (110,228,5,-1,52,2);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (111,292,6,1,55,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (112,471,6,1,56,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (113,472,6,1,57,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (114,300,6,1,58,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (115,298,6,1,59,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (116,303,6,1,60,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (117,473,6,1,61,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (118,314,6,1,62,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (119,306,6,1,63,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (120,313,6,1,64,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (121,319,6,1,65,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (122,292,7,-1,55,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (123,471,7,-1,56,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (124,472,7,-1,57,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (125,300,7,-1,58,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (126,298,7,-1,59,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (127,303,7,-1,60,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (128,473,7,-1,61,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (129,314,7,-1,62,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (130,306,7,-1,63,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (131,313,7,-1,64,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (132,319,7,-1,65,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (133,352,6,-1,69,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (134,362,6,-1,70,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (135,500,6,-1,71,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (136,360,6,-1,72,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (137,369,6,-1,73,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (138,365,6,-1,74,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (139,368,6,-1,75,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (140,373,6,-1,76,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (141,505,6,-1,77,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (142,370,6,-1,78,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (143,501,6,-1,79,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (144,352,7,1,69,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (145,362,7,1,70,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (146,500,7,1,71,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (147,360,7,1,72,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (148,369,7,1,73,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (149,365,7,1,74,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (150,368,7,1,75,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (151,373,7,1,76,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (152,505,7,1,77,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (153,370,7,1,78,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (154,501,7,1,79,3);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (155,113,8,1,82,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (156,120,8,1,83,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (157,117,8,1,84,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (158,119,8,1,85,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (159,139,8,1,86,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (160,125,8,1,88,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (161,116,8,1,89,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (162,134,8,1,91,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (163,133,8,1,92,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (164,113,9,1,82,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (165,120,9,1,83,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (166,117,9,1,84,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (167,119,9,1,85,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (168,139,9,1,86,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (169,125,9,1,88,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (170,116,9,1,89,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (171,134,9,1,91,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (172,133,9,1,92,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (173,113,10,1,82,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (174,120,10,1,83,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (175,117,10,1,84,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (176,119,10,1,85,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (177,139,10,1,86,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (178,125,10,1,88,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (179,116,10,1,89,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (180,134,10,1,91,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (181,133,10,1,92,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (182,113,11,-1,82,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (183,120,11,-1,83,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (184,117,11,-1,84,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (185,119,11,-1,85,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (186,139,11,-1,86,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (187,125,11,-1,88,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (188,116,11,-1,89,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (189,134,11,-1,91,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (190,133,11,-1,92,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (191,132,8,1,90,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (192,132,9,1,90,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (193,132,10,1,90,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (194,127,8,1,87,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (195,127,9,1,87,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (196,476,10,1,93,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (197,476,11,-1,93,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (198,124,11,-1,94,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (199,34,8,-1,97,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (200,31,8,-1,99,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (201,477,8,-1,100,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (202,43,8,-1,101,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (203,478,8,-1,102,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (204,479,8,-1,103,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (205,480,8,-1,104,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (206,481,8,-1,105,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (207,34,9,-1,97,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (208,31,9,-1,99,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (209,477,9,-1,100,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (210,43,9,-1,101,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (211,478,9,-1,102,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (212,479,9,-1,103,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (213,480,9,-1,104,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (214,481,9,-1,105,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (215,34,10,-1,97,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (216,31,10,-1,99,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (217,477,10,-1,100,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (218,43,10,-1,101,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (219,478,10,-1,102,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (220,479,10,-1,103,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (221,480,10,-1,104,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (222,481,10,-1,105,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (223,34,11,1,97,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (224,31,11,1,99,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (225,477,11,1,100,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (226,43,11,1,101,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (227,478,11,1,102,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (228,479,11,1,103,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (229,480,11,1,104,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (230,481,11,1,105,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (231,32,8,-1,96,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (232,45,8,-1,98,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (233,50,8,-1,106,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (234,32,9,-1,96,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (235,45,9,-1,98,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (236,50,9,-1,106,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (237,55,10,-1,107,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (238,482,10,-1,108,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (239,44,10,-1,109,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (240,55,11,1,107,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (241,482,11,1,108,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (242,44,11,1,109,4);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (243,264,12,1,110,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (244,270,12,1,111,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (245,268,12,1,112,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (246,267,12,1,113,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (247,271,12,1,114,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (248,274,12,1,115,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (249,280,12,1,116,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (250,284,12,1,117,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (251,285,12,1,119,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (252,281,12,1,121,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (253,286,12,1,122,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (254,264,13,1,110,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (255,270,13,1,111,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (256,268,13,1,112,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (257,267,13,1,113,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (258,271,13,1,114,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (259,274,13,1,115,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (260,280,13,1,116,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (261,284,13,1,117,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (262,285,13,1,119,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (263,281,13,1,121,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (264,286,13,1,122,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (265,320,12,-1,124,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (266,327,12,-1,125,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (267,324,12,-1,126,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (268,332,12,-1,127,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (269,325,12,-1,128,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (270,341,12,-1,129,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (271,340,12,-1,130,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (272,335,12,-1,131,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (273,351,12,-1,134,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (274,334,12,-1,135,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (275,343,12,-1,136,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (276,320,13,-1,124,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (277,327,13,-1,125,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (278,324,13,-1,126,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (279,332,13,-1,127,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (280,325,13,-1,128,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (281,341,13,-1,129,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (282,340,13,-1,130,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (283,335,13,-1,131,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (284,351,13,-1,134,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (285,334,13,-1,135,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (286,343,13,-1,136,5);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (287,410,14,-1,138,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (288,414,14,-1,139,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (289,483,14,-1,140,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (290,484,14,-1,141,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (291,425,14,-1,142,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (292,416,14,-1,143,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (293,420,14,-1,144,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (294,424,14,-1,145,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (295,419,14,-1,146,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (296,485,14,-1,147,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (297,429,14,-1,148,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (298,60,14,1,152,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (299,66,14,1,153,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (300,487,14,1,154,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (301,68,14,1,155,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (302,69,14,1,156,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (303,488,14,1,157,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (304,489,14,1,158,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (305,79,14,1,159,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (306,490,14,1,160,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (307,73,14,1,161,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (308,491,14,1,162,6);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (309,169,15,-1,194,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (310,174,15,-1,195,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (311,177,15,-1,196,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (312,173,15,-1,197,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (313,183,15,-1,199,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (314,184,15,-1,200,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (315,187,15,-1,202,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (316,192,15,-1,203,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (317,196,15,-1,204,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (318,191,15,-1,205,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (319,171,15,-1,206,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (320,494,15,1,208,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (321,243,15,1,209,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (322,244,15,1,210,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (323,239,15,1,211,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (324,242,15,1,212,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (325,495,15,1,213,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (326,496,15,1,215,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (327,252,15,1,216,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (328,254,15,1,217,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (329,497,15,1,218,8);
insert into punkty (PKT_id, KON_id, BRA_id, punkty, GRA_id, MEC_id) values (330,248,15,1,219,8);


#================================================================================================== views

CREATE VIEW W_kolejka AS
    SELECT 
        KOL_id, nr_kolejki, rodzaj, kat_rozgrywki, rok
    FROM kolejka
	NATURAL JOIN sezon
	NATURAL JOIN kategoria
	NATURAL JOIN rodzaj;


CREATE VIEW W_Druzyny AS
    SELECT 
        d.DRU_id, 
        CONCAT_WS(' ', k.Nazwa_klubu, m.miasto) AS nazwa_druzyny
    FROM druzyna d
	NATURAL JOIN klub k
	NATURAL JOIN miasto m;

/*CREATE VIEW DruzynyJoin AS
    SELECT 
        DRU_id, 
        Nazwa_klubu, 
        miasto
    FROM druzyna d
	LEFT JOIN klub k ON k.KLU_id = d.KLU_id
	JOIN miasto m ON m.MIA_id = d.MIA_id;
        
*/

CREATE VIEW W_Zawodnicy AS
	SELECT
		z.ZAW_id,
		CONCAT_WS(' ', i.imie_zaw, n.nazwisko_zaw) AS pilkarz
	FROM zawodnicy z
	LEFT JOIN imie i ON i.IMI_id = z.IMI_id
	LEFT JOIN nazwisko n ON z.NAZ_id = n.NAZ_id;

CREATE VIEW W_Kontrakty AS 
	select 
		k.KON_id,
		z.pilkarz,
		d.nazwa_druzyny,
        k.od_kiedy,
        k.do_kiedy,
        k.transfer_do,
        k.rodzaj_transferu
	from kontrakty k 
	left join W_Zawodnicy z on k.ZAW_id = z.ZAW_id
	left join W_Druzyny d on k.DRU_id = d.DRU_id; 


CREATE VIEW W_grajacy AS
select
	g.GRA_id,
    m.MEC_id,
	k.pilkarz,
    k.nazwa_druzyny,
    g.min_in_1p,
	g.min_out_1p,
	g.min_in_2p,
	g.min_out_2p
from grajacy g
left join w_kontrakty k on g.KON_id=k.KON_id
left join mecze m on g.MEC_id=m.MEC_id;

CREATE VIEW W_grajacy2 AS
select
	k.KON_id,
	g.GRA_id,
    m.MEC_id,
	k.pilkarz,
    k.nazwa_druzyny,
    g.min_in_1p,
	g.min_out_1p,
	g.min_in_2p,
	g.min_out_2p
from grajacy g
left join w_kontrakty k on g.KON_id=k.KON_id
left join mecze m on g.MEC_id=m.MEC_id;

CREATE VIEW W_mecze3 AS 
select
	m.MEC_id,
    k.nr_kolejki,
    m.data_meczu,
    w1.DRU_id as id_h,
    w1.nazwa_druzyny as gospodarz,
    w2.DRU_id as id_a,
    w2.nazwa_druzyny as gosc,
    CONCAT_WS('-', m.gol_h,m.gol_a) AS wynik
from   mecze m
   left join w_kolejka k on m.KOL_id=k.KOL_id
   left join w_druzyny w1 on m.gosp_DRU_id=w1.DRU_id 
   left join w_druzyny w2 on m.gosc_DRU_id=w2.DRU_id; 


CREATE VIEW W_mecze2 AS 
select
	m.MEC_id,
    k.nr_kolejki,
    m.data_meczu,
    w1.nazwa_druzyny as gospodarz,
    w2.nazwa_druzyny as gosc,
    CONCAT_WS('-', m.gol_h,m.gol_a) AS wynik
from   mecze m
   left join w_kolejka k on m.KOL_id=k.KOL_id
   left join w_druzyny w1 on m.gosp_DRU_id=w1.DRU_id 
   left join w_druzyny w2 on m.gosc_DRU_id=w2.DRU_id; 


CREATE VIEW W_bramki AS
select
	b.bra_id,
    m.mec_id,
	m.wynik,
    d.nazwa_druzyny as gol_dla,
    b.minuta,
    p.polowa,
    b.opis_bramki,
    k1.pilkarz as strzelec,
    k2.pilkarz as asystent
from bramki b
left join w_mecze2 m on b.MEC_id=m.MEC_id
left join w_druzyny d on b.DRU_id_zdob_bramki=d.DRU_id
left join polowa p on b.pol_id=p.pol_id
left join w_kontrakty k1 on b.strzelec_KON_id=k1.kon_id
left join w_kontrakty k2 on b.asystent_KON_id=k2.kon_id;

CREATE VIEW W_bramki2 AS
select
	b.bra_id,
    m.mec_id,
    m.gospodarz as gospodarz,
    m.gosc as gosc,
	m.wynik,
	b.minuta,
    d.nazwa_druzyny as gol_dla,
    b.opis_bramki,
    k1.pilkarz as strzelec,
    k2.pilkarz as asystent
from bramki b
left join w_mecze2 m on b.MEC_id=m.MEC_id
left join w_druzyny d on b.DRU_id_zdob_bramki=d.DRU_id
left join w_kontrakty k1 on b.strzelec_KON_id=k1.kon_id
left join w_kontrakty k2 on b.asystent_KON_id=k2.kon_id;

CREATE VIEW W_punkty AS
select
	p.pkt_id,
    k.pilkarz,
    k.nazwa_druzyny,
    b.bra_id as nr_bramki,
    p.punkty,
    g.gra_id,
    m.mec_id
from 
	punkty p
left join w_kontrakty k on p.kon_id=k.kon_id
left join bramki b on p.bra_id=b.bra_id
left join grajacy g on p.gra_id=g.gra_id
left join mecze m on p.mec_id=m.mec_id;

CREATE VIEW W_punkty_suma AS
select
	p.pkt_id,
    k.pilkarz,
    k.nazwa_druzyny,
    sum(p.punkty) as Suma_punktow_wsz
from 
	punkty p
left join w_kontrakty k on p.kon_id=k.kon_id
group by k.pilkarz;



CREATE VIEW W_punkty_do_pkt_kanad AS
SELECT 
    w_bramki.bra_id,
	w_bramki.gol_dla,
	w_bramki.minuta,
    w_bramki.mec_id,
    w_grajacy2.gra_id,
	w_grajacy2.kon_id,
    w_grajacy2.pilkarz,
    w_grajacy2.nazwa_druzyny,
    w_grajacy2.min_in_1p,
    w_grajacy2.min_out_1p,
    w_grajacy2.min_in_2p,
    w_grajacy2.min_out_2p,
    IF((w_bramki.gol_dla = w_grajacy2.nazwa_druzyny)
            AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
            OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
        1,
        0) + IF((w_bramki.gol_dla != w_grajacy2.nazwa_druzyny)
            AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
            OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_2p)),
        - 1,
        0) AS decision,
	if(w_grajacy2.min_in_1p=1,(w_grajacy2.min_out_1p-w_grajacy2.min_in_1p)+(w_grajacy2.min_out_2p - w_grajacy2.min_in_2p)+1,(w_grajacy2.min_out_1p-w_grajacy2.min_in_1p)+(w_grajacy2.min_out_2p - w_grajacy2.min_in_2p)) as 		min_na_boisku        
FROM
    w_bramki
        LEFT JOIN
    w_grajacy2 ON w_bramki.mec_id = w_grajacy2.MEC_id;
    
    
    
 CREATE VIEW W_punkty_duze AS
    SELECT 
        w_bramki.bra_id,
        w_bramki.mec_id,
        w_grajacy2.pilkarz,
        w_grajacy2.nazwa_druzyny,
        IF(IF((w_bramki.gol_dla = w_grajacy2.nazwa_druzyny)
                    AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
                    OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
                1,
                0) + IF((w_bramki.gol_dla != w_grajacy2.nazwa_druzyny)
                    AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
                    OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
                - 1,
                0) >= 0,
            1,
            0) + IF(IF((w_bramki.gol_dla = w_grajacy2.nazwa_druzyny)
                    AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
                    OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
                1,
                0) + IF((w_bramki.gol_dla != w_grajacy2.nazwa_druzyny)
                    AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
                    OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
                - 1,
                0) > 0,
            2,
            0) AS pkt_duze
    FROM
        w_bramki
            LEFT JOIN
        w_grajacy2 ON w_bramki.mec_id = w_grajacy2.MEC_id
    GROUP BY GRA_id;
    
    
    
CREATE VIEW W_punkty_do_pkt_meczowych AS
SELECT 
    w_bramki.bra_id,
	w_bramki.gol_dla,
	w_bramki.minuta,
    w_bramki.mec_id,
    w_grajacy2.gra_id,
	w_grajacy2.kon_id,
    w_grajacy2.pilkarz,
    w_grajacy2.nazwa_druzyny,
    w_grajacy2.min_in_1p,
    w_grajacy2.min_out_1p,
    w_grajacy2.min_in_2p,
    w_grajacy2.min_out_2p,
    sum(IF((w_bramki.gol_dla = w_grajacy2.nazwa_druzyny)
            AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
            OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
        1,
        0) + IF((w_bramki.gol_dla != w_grajacy2.nazwa_druzyny)
            AND ((w_bramki.minuta BETWEEN w_grajacy2.min_in_1p AND w_grajacy2.min_out_1p)
            OR (w_bramki.minuta BETWEEN w_grajacy2.min_in_2p AND w_grajacy2.min_out_2p)),
        - 1,
        0)) AS decision,
	if(w_grajacy2.min_in_1p=1,(w_grajacy2.min_out_1p-w_grajacy2.min_in_1p)+(w_grajacy2.min_out_2p - w_grajacy2.min_in_2p)+1,(w_grajacy2.min_out_1p-w_grajacy2.min_in_1p)+(w_grajacy2.min_out_2p - w_grajacy2.min_in_2p)) as 		min_na_boisku        
FROM w_bramki
        LEFT JOIN w_grajacy2 ON w_bramki.mec_id = w_grajacy2.MEC_id group by w_grajacy2.gra_id;    
    

-- select * from bramki;
-- select * from druzyna;
-- select * from grajacy;
-- select * from imie;
-- select * from kategoria;
-- select * from klub;
-- SELECT * FROM kolejka;
-- select * from kontrakty;
-- select * from logowanie;
-- select * from mecze;
-- select * from miasto;
-- select * from nazwisko;
-- select * from polowa;
-- select * from punkty;
-- select * from rodzaj;
-- select * from sezon;
-- select * from zawodnicy;
-- select * from w_bramki;
-- select * from w_bramki2;
-- select * from w_druzyny;
-- select * from w_grajacy;
-- select * from w_grajacy2;
-- select * from w_kolejka;
-- select * from w_kontrakty;
-- select * from w_mecze2;
-- select * from w_mecze3;
-- select * from w_punkty;
-- select * from w_punkty_duze;
-- select * from w_punkty_do_pkt_meczowych;
-- select * from w_punkty_suma;
-- select * from w_punkty_do_pkt_kanad;
-- select * from w_zawodnicy;