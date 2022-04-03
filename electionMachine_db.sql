-- save this file into your computer
-- open mysql monitor with root privileges so that you have mysql monitor prompt (mysql>)
-- give a command 'source path\nameofsavedfile'
--    where path is absolute path to the folder where the file exists, e.g. c:\temp
--    and nameofsavedfile is the name of the saved file, e.g. vaalikone.txt


-- create a user and user's password
-- credentials pena/kukkuu has all privileges to all all tables of database vaalikone (exept grant privilege)
grant all on vaalikone.* to sandu@localhost;

-- if there exists database vaalikone, drop it
drop database if exists vaalikone;

-- create database vaalikone (just dropped)
create database vaalikone;

-- This line is to handle utf8 character needs (like ä and ö) if you have not set utf8 encoding already default for your mysql
ALTER DATABASE vaalikone CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- use the database
use vaalikone;

-- these drops are not needed now (we droppped the whole database), but as an example how to drop a table
DROP TABLE if exists EHDOKKAAT;
DROP TABLE if exists KYSYMYKSET;
DROP TABLE if exists VASTAUKSET;

-- create a table ehdokkaat (mysql does not bother the case of letters - in this case)
CREATE TABLE EHDOKKAAT (
   EHDOKAS_ID INTEGER NOT NULL,
   SUKUNIMI VARCHAR(25),
   ETUNIMI VARCHAR(25),
   PUOLUE VARCHAR(50),
   KOTIPAIKKAKUNTA VARCHAR(25),
   IKA INTEGER,
   MIKSI_EDUSKUNTAAN VARCHAR(250),
   MITA_ASIOITA_HALUAT_EDISTAA VARCHAR(2000),
   AMMATTI VARCHAR(50),
   PRIMARY KEY (EHDOKAS_ID)
);

-- create a table kysymykset
CREATE TABLE KYSYMYKSET (
   KYSYMYS_ID INTEGER NOT NULL,
   KYSYMYS VARCHAR(100),
   PRIMARY KEY (KYSYMYS_ID)
);

-- create a table vastaukset
CREATE TABLE VASTAUKSET (
   EHDOKAS_ID INTEGER NOT NULL,
   KYSYMYS_ID INTEGER NOT NULL,
   VASTAUS INTEGER,
   KOMMENTTI VARCHAR(50),
   PRIMARY KEY (EHDOKAS_ID, KYSYMYS_ID)
);


-- insert values into the table ehdokkaat
INSERT INTO EHDOKKAAT VALUES (1, "Ahvenjärvi", "Joel", "Suomen Kristillisdemokraatit (KD)", "Uurainen", 86, "Mieluiten tekisin aivan muuta, mutta valtakunta on korjattava. Tulen toimeen noin kahdeksalla kielellä ja olen perehtynyt monen alan asioihin. Kaupunkilais- ja maalaisjärkeä.", "Haluan edistaa Suomea, jossa kenenkään ei tarvitse kärsiä puutetta tai voimattomuuden tunnetta omiin asioihinsa vaikuttamisesta.", "Kansanedustaja");
INSERT INTO EHDOKKAAT VALUES (2, "Aintila", "Henrik Jeremias", "Suomen ruotsalainen kansanpuolue", "Helsinki", 47, "Olen puheeni pitävä, monipuolisesti asioita harkitseva, perusteellisesti asiat selvittävä, erilaisissa yhteisäissä, yritysmaailmassa ja julkishallinnossa toiminut kolmen lapsen äiti.", "- Inhimillinen toimeentulo ja aito tasa-arvo kaikille statuksesta riippumatta  - Aito itsemääräämisoikeus ja puolueettomuus  - Kansan hyvinvointi yritysvoittojen edelle  - Avoimuus käsiteltävistä asioista!", "Lähihoitaja");
INSERT INTO EHDOKKAAT VALUES (3, "Aittakumpu", "Alviina", "Vasemmistoliitto", "Jämsä", 46, "Tiedän erilaisia vaiettuja epäkohtia. Esimerkiksi korruptioon ja epärehellisyyteen liittyviä asioita. Jotta demokratia toimisi niin on vaadittavaa täyttä rehellisyyttä.", "Suomen markka euron rinnalle, ja sitä myätä Suomen sisäinen talous kuntoon. Tyäpaikkoja julkiselle ja yksityiselle sektorille; investointeja ja perustuloa Suomen markalla; yritysten toimintaedellytykset huomattavasti helpommiksi ja tyällistäminen kannustavaksi. Veroparatiisikikkailu kuriin mm. rinnakkaisvaluutan avulla.", "Opettaja, kansanedustaja");
INSERT INTO EHDOKKAAT VALUES (4, "Ala-Kokko", "Henri", "Vihreä liitto", "Espoo", 87, "Kuljen aate edellä, itsenäisyyden, maaseudun, suomalaisuuden ja sosiaalisen oikeudenmukaisuuden puolesta.", "Vanhusten ja omaishoitajien asemaa täytyy parantaa tulevalla vaalikaudella. Vanhustenpalveluihin ei voida tehdä lisää leikkauksia ja ennaltaehkäiseviin palveluihin täytyy läytyä lisää rahaa. Omaishoidon tukea täytyy korottaa ja jokaiselle omaishoitajalle pitää järjestää tarpeeksi vapaapäiviä. Nuorten tyällistymistä pitää tukea ja heidän tyäolojaan täytyy valvoa. Meillä on paljon ahkeria nuoria, jotka tarvitsevat ensimmäisestä tyäpaikastaan positiivisen kokemuksen.", "Räntgenhoitaja, pääluottamusmies");
INSERT INTO EHDOKKAAT VALUES (5, "Ala-Nissilä", "Benjamin", "Suomen Keskusta", "Lappajärvi", 26, "Haluan muutosta nykyiseen hallitustoimintaan, toiminta ei ole vastannut Katainen-Stubb -hallituksen odotuksia, valtiolla on enemmän velkaa kuin koskaan", "Suomen ero EU:sta. Kansallisen keskuspankin liikkeelle laskeman oman valuutan käyttäänotto Suomessa. Suomen ja NATO:n välillä solmitun isäntämaasopimuksen irtisanominen ja palaaminen puoluettomuuteen. Hyvinvointivaltion palvelujen turvaaminen oman keskuspankin, kansallisen valuutan ja itsenäisen talouspolitiikan avustuksella.", "Metallimies");
INSERT INTO EHDOKKAAT VALUES (6, "Ala-Reinikka", "Karl-Mikael", "Kansallinen Kokoomus", "Mustasaari", 37, "Koska olen rohkea ja rehellinen. - Ylipäänsäkin eduskuntaan pitäisi valita vain niitä, joilla on oikeanlainen kasvatus ja koulutus. Pissapäiset nousukkaat ovat tuhoneet Suomen.", "- Uudistusta tyäelämään ja koulutuslaitoksiin - ihmisten yksilällisyys otettava huomioon joustavilla tyäajoilla, liikkuvalla tyällä, opettamismetodeilla. 8 h/pvä systemi on vanhanaikainen ja kaipaa uudistusta. Enemmän luovuutta tyäelämään! K", "Liikunnan lehtori");
INSERT INTO EHDOKKAAT VALUES (7, "Alametsä", "Vilja", "Vihreä liitto", "Kotka", 82, "Mikäli haluat saman menon jatkuvan seuraavankin vaalikauden, ohita tämä ehdokas. Mikäli haluat muutosta niin olet oikeassa osoitteessa.", "Ehdottomasti päällimäisenä asiana on hyvien suhteiden rakentaminen muihinkin kuin EU-maihin. Tarvitsemme enemmän kaupankäyntiä jotta vientimme nousee ja saamme uusia tyäpaikkoja säilyttäen nykyisetkin.", "Juniorijääkiekkoseuran yhteyspäällikkä");
INSERT INTO EHDOKKAAT VALUES (8, "Alanko-Kahiluoto", "Sara", "Vihreä liitto", "Nokia", 21, "Haluan vaikuttaa politiikan kautta yhteiskunnan hyvinvointiin.", "Pohjoismaisen hyvinvointiyhteiskunnan turvaaminen moderniin rahateoriaan (uuschartalismiin) perustuvalla talousjärjestelmällä.    Suomen sotilaallisen liittoutumattomuuden ja ulkopoliittisen puolueettomuuden puolustaminen.     Sivistysyliopiston ja voittoa tuottamattoman tutkimuksen tukeminen.     Mainittuihin asioihin sisältyvät EU-, EMU-, Nato- ja TTIP-jäsenyyksien vastustaminen.", "äidinkielen ja kirjallisuuden lehtori");
INSERT INTO EHDOKKAAT VALUES (9, "Alasalmi", "Otto", "Suomen Sosialidemokraattinen Puolue", "Varkaus", 30, "Suomi kaipaa uusia ideoita ja niitä minulta läytyy.  Tämä maa kaipaa yhteistyätä.  Katson eteenpäin, uskon parempaan ja puolustan heikoimpia.", "EU:sta eroaminen on tärkeintä! En ole tehnyt koskaan palkkatyätä, joten yrittäjyys on myäs sydämmen asia! Ei NATO, ei EU, ei TTIP, ei GMO ei äuro! KYLLä ITSENäISYYS JA KANSANVALTA! Suomeen tulee saada myäs perustuslakituomioistuin joka valvoo hallituksen tekemisiä ja päätäksien laillisuutta! ETA-sopimus riittää meille! Se takaa koulutuksen, liikkumisen ja kaupankäynnin EU:n alueella!", "Freelancer-kirjoittaja");
INSERT INTO EHDOKKAAT VALUES (10, "Alatalo", "Cosmo", "Suomen Keskusta", "Tampere", 68, "Olen tarmokas yhteisten asioiden hoitaja ja minulla on 20 vuoden kokemus ihmisten asioiden hoitamisesta. Viime kunnallisvaaleissa sain luottamuksen osoituksena ääniharavan aseman kaupungissani.", "Poliitikot eivät luo tyäpaikkoja, vaan rakentavat raamit. Tyällisyysaste on saatava nostettua Ruotsin tasolle, ja rakenteellisia uudistuksia julkisella sektorilla sekä myäs tyämarkkinoilla on tehtävä, jotta tyän verotusta ja tyällistymisen esteitä voidaan olennaisesti pienentää.     Turhaa yrittäjyyttä ja talouselämää kuristavaa sääntäjen ja kieltojen viidakkoa pitää vähentää.     Tulen paneutumaan tyättämyyden ja syrjäytymisen ehkäisemiseen.", "Opiskelija / Tyäntekijä");
INSERT INTO EHDOKKAAT VALUES (11, "Albert", "Essi", "Suomen Keskusta", "Turku", 47, "Vaikka se kliseiseltä kuulostaakin, ajaisin kaikkien asiota eduskunnassa, eikä minulla ole hämäriä motiiveja. Eduskunnassa haluan luoda yhteiskuntaa, jossa kaikille riittää rakkautta.", "Tasapainoista valtiontaloutta, uskottavaa puolustuskykyä, turvallista arkea, koulutuksen monipuolisuutta ja suurempaa yksilänvapautta.", "Närtti");
INSERT INTO EHDOKKAAT VALUES (12, "Alän", "Mikko", "Itsenäisyyspuolue", "Kuopio", 82, "Tavoitteenani on tuode tuoreita ja moderneja ajatuksia valtaapitävien puolueiden kurjistamalle poliittiselle kentälle.  Pienen puoleen ehdokkaana vanhuksien määrittämä puoluekuri ei rajoita minua.", "JäRKEä SääNTELYYN, TILAA TYäLLE JA VALINNOILLE.  Suomi tarvitsee tyätä ja liikettä. Turhaa byrokratiaa ja ylisääntelyä pitää purkaa, jotta yrittäjyydelle, toimeliaisuudelle ja arjen valinnoille syntyy tilaa. Esimerkiksi kaupan aukioloaikojen ja sijainnin sääntelyä tulee vapauttaa. Erityisesti pk-yritysten velvoitteita pitää keventää. Lakien vaikutukset on arvioitava paremmin.    LAPSILLE, NUORILLE JA PERHEILLE ASIAN AJAJA  Perheet tarvitsevat tukea ja joustoja tyän ja perheen yhteensovittamiseksi. Kotihoidontuen jakaminen on perheen oma asia. Suomalaisesta laadukkaasta varhaiskasvatuksesta ja koulutuksesta on pidettävä kiinni, eikä koulutuksesta ole enää varaa leikata.    ARJEN TURVALLISUUTTA JA VAHVEMPAA OIKEUSTURVAA  Arjen turvallisuutta ja oikeusturvaa tulee vahvistaa. Poliisin, oikeuslaitoksen ja puolustusvoimien toimintakyky on turvattava. Tämä edellyttää riittäviä voimavaroja ja uudistuksia. Vakavien henkeen ja terveyteen, erityisesti lapsiin kohdistuvien rikosten rangaistuksia tulee koventaa.", "Esiintyvä taiteilija, showmies, itsensänolaaja");
INSERT INTO EHDOKKAAT VALUES (13, "Alho", "Inna ", "Kansallinen Kokoomus", "Kouvola", 62, "Haluan edistää kokonaisvaltaisen hyvinvoinnin kasvua ilman eturyhmäpolittista suuntautumista.", "Tahdon olla mukana rakentamassa vastuullista ja kannustavaa yhteiskuntaa, jossa sivistykseen panostetaan. Tyällisyyden edistäminen ja koulutukseen panostaminen ovat tulevaisuuden hyvinvoinnin kannalta keskeisiä asioita. Tyä on hyvinvoinnin tae niin yksilän kuin yhteisän tasolla. Siksi tyällistämisen esteitä pitää purkaa. Koulutus on avain tulevaisuuteen - nyt on aika alkaa kehittää suomalaista koulua ja oppimista!", "Uuden ajan sekatyömies");
INSERT INTO EHDOKKAAT VALUES (14, "Alhojärvi", "Mikael ", "Suomen Kommunistinen Puolue", "Lappeenranta", 19, "Toisin eduskuntaan en vain yhtä, vaan useita uusia näkäkulmia.", "Perusoikeuksien puolesta taistelija. Läpinäkyvyyttä, luotettavuutta ja oikeudenmukaisuutta päätäksentekoon. Lupauksistaan kiinni pitävä, takki ei käänny vaalien jälkeenkään.", "Everstiluutnantti evp, taksin kuljettaja");
INSERT INTO EHDOKKAAT VALUES (15, "Alhonnoro", "Jasmine ", "Vihreä liitto", "Tampere", 53, "Olen valmis ajamaan suurempiakin rakenne uudistuksia suomen kilpailukyvyn parantamiseksi. Luotan suomalaisiin, että he itse tietävät mikä on parasta heille itselleen eikä niinkään valtiovalta.", "Pitkäaikainen kokemus ihmisten parissa tomimisessa - tyä, yritys, urheilu sekä järjestäjen parissa. Kunnallispolitiikassa toimiminen jo 80 - 90 luvuilla...", "Valokuvaaja, ark.yo");
INSERT INTO EHDOKKAAT VALUES (16, "Alijärvi", "Daniel", "Suomen Sosialidemokraattinen Puolue", "Helsinki", 20, "Pidän sanani", "Päätäksenteko kaipaa osaavia, yhteistyäkykyisiä, kokeneita ja hyvät johtamistaidot omaavia tulevia kansanedustajia.", "erityisasiantuntija");
INSERT INTO EHDOKKAAT VALUES (17, "Allahmoradi", "Tuomas", "Vasemmistoliitto", "Inkoo", 73, "Fär att det behäv nägon som fär fram de liberala borgerliga värderingarna och nägon som inte är rädd att fatta ocksä svära beslut.", "Oma maa mansikka, muu maa mustikka", "Mediapastori");
INSERT INTO EHDOKKAAT VALUES (18, "Anderson", "Otto", "Suomen ruotsalainen kansanpuolue", "Vantaa", 45, "Minulla on erityisavustajatyäni kautta vankka kokemus valtakunnan poliitikasta. Hallitsen eri kiemurat ja tiedän miten asiat saadaan maaliin.", "Eduskuntaan tarvitaan piraatti. Teknologinen kehitys on yhteiskunnan suurin muutosvoima ja se pitää huomioida päätäksentekoprosessissa. Olen DI/fyysikko sekä opettaja ja osaava vaikuttaja.", "maa- ja metsätalouden harjoittaja, sijaispappi");
INSERT INTO EHDOKKAAT VALUES (19, "Andersson ", "Cosmo", "Vasemmistoliitto", "Joensuu", 41, "Minusta saisi omistautuneet kansanedustajan jolla on vapauteen ja sosiaaliseen oikeudenmukaisuuteen pohjautuvat arvot, vahvat mielipiteet ja kykyä yhteistyähän.", "Olen uskonnoton yksilänvapauden kannattaja.  NATO myänteinen, ydinvoiman kannattaja.", "Kansanedustaja");
INSERT INTO EHDOKKAAT VALUES (20, "Andersson", "Essi", "Suomen ruotsalainen kansanpuolue", "Kouvola", 63, "SUOMEN TALOUSNäKYMäT OVAT KATASTROFAALISIA  On tärkeä alkaa kohottamaan Suomen taloutta.   Sitä varten pitää saada päätäsvallan Suomeen  eroamalla EU:sta ja jostakin muista liitoista.", "Mnulla on fysiikan tohtorina vahva tieteellinen koulutus ja ohjelmistoyrittäjänä paljon kokemusta yhteiskunnasta, ml. julkishallinnosta. Näkemys ja kyky uudistuksiin on vahvuuteni.", "rakennusmestari");

-- insert values into the table kysymykset
INSERT INTO KYSYMYKSET VALUES (1, "Suomessa on liian helppo elää sosiaaliturvan varassa");
INSERT INTO KYSYMYKSET VALUES (2, "Kaupan ja muiden liikkeiden aukioloajat on vapautettava.");
INSERT INTO KYSYMYKSET VALUES (3, "Suomessa on siirryttävä perustuloon joka korvaisi nykyisen sosiaaliturvan vähimmäistason.");
INSERT INTO KYSYMYKSET VALUES (4, "Tyäntekijälle on turvattava lailla minimityäaika.");
INSERT INTO KYSYMYKSET VALUES (5, "Ansiosidonnaisen tyättämyysturvan kestoa pitää lyhentää.");
INSERT INTO KYSYMYKSET VALUES (6, "Euron ulkopuolella Suomi pärjäisi paremmin.");
INSERT INTO KYSYMYKSET VALUES (7, "Ruoan verotusta on varaa kiristää.");
INSERT INTO KYSYMYKSET VALUES (8, "Valtion ja kuntien taloutta on tasapainotettava ensisijaisesti leikkaamalla menoja.");
INSERT INTO KYSYMYKSET VALUES (9, "Lapsilisiä on korotettava ja laitettava verolle.");
INSERT INTO KYSYMYKSET VALUES (10, "Suomella ei ole varaa nykyisen laajuisiin sosiaali- ja terveyspalveluihin.");
INSERT INTO KYSYMYKSET VALUES (11, "Nato-jäsenyys vahvistaisi Suomen turvallisuuspoliittista asemaa.");
INSERT INTO KYSYMYKSET VALUES (12, "Suomeen tarvitaan enemmän poliiseja.");
INSERT INTO KYSYMYKSET VALUES (13, "Maahanmuuttoa Suomeen on rajoitettava terrorismin uhan vuoksi.");
INSERT INTO KYSYMYKSET VALUES (14, "Venäjän etupiiripolitiikka on uhka Suomelle.");
INSERT INTO KYSYMYKSET VALUES (15, "Verkkovalvonnassa valtion turvallisuus on tärkeämpää kuin kansalaisten yksityisyyden suoja.");
INSERT INTO KYSYMYKSET VALUES (16, "Suomen on osallistuttava Isisin vastaiseen taisteluun kouluttamalla Irakin hallituksen joukkoja.");
INSERT INTO KYSYMYKSET VALUES (17, "Parantumattomasti sairaalla on oltava oikeus avustettuun kuolemaan.");
INSERT INTO KYSYMYKSET VALUES (18, "Terveys- ja sosiaalipalvelut on tuotettava ensijaisesti julkisina palveluina.");
INSERT INTO KYSYMYKSET VALUES (19, "Viranomaisten pitää puuttua lapsiperheiden ongelmiin nykyistä herkemmin.");

-- insert values into the table vastaukset
INSERT INTO VASTAUKSET VALUES  (1, 1, 2, "ehdokkaan 1 vastaus kysymykseen 1");
INSERT INTO VASTAUKSET VALUES  (1, 2, 4, "ehdokkaan 1 vastaus kysymykseen 2");
INSERT INTO VASTAUKSET VALUES  (1, 3, 3, "ehdokkaan 1 vastaus kysymykseen 3");
INSERT INTO VASTAUKSET VALUES  (1, 4, 2, "ehdokkaan 1 vastaus kysymykseen 4");
INSERT INTO VASTAUKSET VALUES  (1, 5, 1, "ehdokkaan 1 vastaus kysymykseen 5");
INSERT INTO VASTAUKSET VALUES  (1, 6, 2, "ehdokkaan 1 vastaus kysymykseen 6");
INSERT INTO VASTAUKSET VALUES  (1, 7, 5, "ehdokkaan 1 vastaus kysymykseen 7");
INSERT INTO VASTAUKSET VALUES  (1, 8, 2, "ehdokkaan 1 vastaus kysymykseen 8");
INSERT INTO VASTAUKSET VALUES  (1, 9, 4, "ehdokkaan 1 vastaus kysymykseen 9");
INSERT INTO VASTAUKSET VALUES  (1, 10, 1, "ehdokkaan 1 vastaus kysymykseen 10");
INSERT INTO VASTAUKSET VALUES  (1, 11, 1, "ehdokkaan 1 vastaus kysymykseen 11");
INSERT INTO VASTAUKSET VALUES  (1, 12, 2, "ehdokkaan 1 vastaus kysymykseen 12");
INSERT INTO VASTAUKSET VALUES  (1, 13, 4, "ehdokkaan 1 vastaus kysymykseen 13");
INSERT INTO VASTAUKSET VALUES  (1, 14, 5, "ehdokkaan 1 vastaus kysymykseen 14");
INSERT INTO VASTAUKSET VALUES  (1, 15, 3, "ehdokkaan 1 vastaus kysymykseen 15");
INSERT INTO VASTAUKSET VALUES  (1, 16, 1, "ehdokkaan 1 vastaus kysymykseen 16");
INSERT INTO VASTAUKSET VALUES  (1, 17, 4, "ehdokkaan 1 vastaus kysymykseen 17");
INSERT INTO VASTAUKSET VALUES  (1, 18, 4, "ehdokkaan 1 vastaus kysymykseen 18");
INSERT INTO VASTAUKSET VALUES  (1, 19, 3, "ehdokkaan 1 vastaus kysymykseen 19");
INSERT INTO VASTAUKSET VALUES  (2, 1, 3, "ehdokkaan 2 vastaus kysymykseen 1");

create table useraccount(
id int not null auto_increment primary key,
username varchar(100) not null,
hashedpassword varchar(100) not null,
salt varchar(100) not null
);
