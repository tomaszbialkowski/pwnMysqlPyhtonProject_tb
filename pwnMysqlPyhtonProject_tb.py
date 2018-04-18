import pymysql
import time


class DBconnect:
    def __init__(self):
        try:
            self.conn = pymysql.connect('localhost', 'root', 'T764ia2a!', 'ekstra2', charset='utf8')
            print('Polaczenie z baza danych ustanowione!')
            self.powitanie()
        except:
            print('!UWAGA!\nUtracono polaczenie z baza danych!')

    def powitanie(self):
        while (True):
            menu = input('\nMENU:\n------\n'
                         'Klawisz [L] aby sie ZALOGOWAC - jesli jestes zarejestrowany w bazie danych.\n'
                         'Klawisz [R] w celu REJESTRACJI - jesli chcesz polaczyc sie z baza po raz pierwszy.\n\n'
                         'Klawisz [A] dla ADMINISTRATORA. \n'
                         'Klawisz [Q] aby zakonczyc dzialanie programu.\n'
                         '\n #for ENGLISH press [2]\n').upper()
            if (menu == 'R'):
                self.rejestracja()
            elif (menu == 'L'):
                self.logowanie()
            elif (menu == 'A'):
               self.dlaAdministratora()
            elif (menu == '2'):
                print(
                    '\n|   |   /\      |   |   /\      |   |   /\    | | |\n|___|  /__\     |___|  /__\     |___|  /__\   | | |\n|   | /    \    |   | /    \    |   | /    \  . . .  ŻARTOWAŁEM :)')
            elif (menu == 'Q'):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('\n!BLAD! Blad sprobuj jeszcze raz')

    def dlaAdministratora(self):
        print(
            '\n-------------------------------------------------------------------------------------'
            '\n| Informacje dla administratora. Domyslny login i haslo dla administratora to admin. |'
            '\n|       Administrator ma dodatkowe uprawnienia do dodawania i usuwania meczy.        |'
            '\n-------------------------------------------------------------------------------------')


    def rejestracja(self):
        try:
            print('\nPANEL REJESTRACYJNY\n--------------------\n')
            imie = input('Wpisz swoje imie:').title()
            login = input('Podaj LOGIN jakim chcesz sie poslugiwac (przynajmniej 3 znaki):')
            if (len(login) > 2):
                self.c = self.conn.cursor()
                liczba_wierszy = self.c.execute('select * from logowanie where login=%s',(login))
                if liczba_wierszy > 0:
                    login_res = self.c.fetchall()[0][0]
                    if(login_res == login):
                        print(
                            '\n!UWAGA!\nPodany przez Ciebie LOGIN jest juz wykorzystywany.\n(Wybierz inny LOGIN jesli chcesz sie zarejestrowac lub, jesli to Twoj LOGIN, przejdz do PANELU LOGOWANIA.)')
                        self.rejestracja()
                else:
                    passwd = input('Ustal swoje haslo:')
                    if (len(passwd) > 2):
                        self.c = self.conn.cursor()
                        self.c.execute('INSERT INTO logowanie (login, pass) values(%s, %s)', (login, passwd))
                        self.conn.commit()
                        if (imie[-1] == 'a'):
                            print('\n' + imie + ' zostalas zarejestrowana i mozesz korzystac z bazy danych. \nZaloguj sie wykorzystujac swoj login i haslo. ')
                            self.logowanie()
                        else:
                            print('\n' + imie + ' zostales zarejestrowany i mozesz korzystac z bazy danych. \nZaloguj sie wykorzystujac swoj login i haslo. ')
                            self.logowanie()
                    else:
                        print('\nWpisales zbyt krotkie HASLO. Musisz to poprawic, jesli chcesz korzystac z bazy.')
                        self.rejestracja()
            else:
                print('\nWpisales zbyt krotki LOGIN. Musisz to poprawic, jesli chcesz korzystac z bazy.')
                self.rejestracja()
        except:
            print('!BLAD! Wystapil blad przy rejestracji.\n Sprobuj jeszcze raz, lub zakoncz dzialanie programu [Q]')

    def logowanie(self):
        print('\nPANEL LOGOWANIA\n----------------')
        login = input('Login:')
        passwd = input('Haslo:')
        self.c = self.conn.cursor()
        self.c.execute('select * from logowanie where login=%s and pass=%s', (login, passwd))
        log_res = self.c.fetchall()
        if (len(log_res) == 1):
            if((log_res)[0][2].upper() == 'A'):
                print('\n----------------------------------------'
                      '\n| Jestes zalogowany jako ADMINISTRATOR |'
                      '\n----------------------------------------')
                self.menuMainA()
            else:
                print('Jestes zalogowany do bazy danych.\nGratuluje')
                self.menuMainU()
        else:
            print('\n!BLAD! Niepoprawny LOGIN lub HASLO.\nSprobuj jeszcze raz')
            self.logowanie()

#MENU GLOWNE ADMIN
    def menuMainA(self):
        while (True):
            dec = input('\nMasz nastepujace mozliwosci:\n'
                        '-----------------------------\n'
                        'Klawisz [M] - menu dotyczace MECZU; \n'
                        'Klawisz [Z] - menu dotyczace ZAWODNIKOW; \n'
                        'Klawisz [D] - menu dotyczace DRUZYN; \n'
                        'Klawisz [B] - menu dotyczace BRAMEK; \n'
                        'Klawisz [P] - menu dotyczace PUNKTOW KANADYJSKICH;\n'
                        '--------\n'
                        'Klawisz [I] - INFORMACJE o bazie;\n'
                        'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (dec == 'M'):
                    self.meczA()
            elif (dec == 'Z'):
                self.zawodnik()
            elif (dec == 'D'):
                self.druzyny()
            elif (dec == 'B'):
                self.bramki()
            elif (dec == 'P'):
                self.punkty()
            elif (dec == 'I'):
                self.info()
            elif (dec == 'Q'):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU GLOWNE')

        # MENU GLOWNE USER
    def menuMainU(self):
        while (True):
            dec = input('\nMENU GLOWNE:\n-----------------------------\n'
                        'Klawisz [M] - menu dotyczace MECZU; \n'
                        'Klawisz [Z] - menu dotyczace ZAWODNIKOW; \n'
                        'Klawisz [D] - menu dotyczace DRUZYN; \n'
                        'Klawisz [B] - menu dotyczace BRAMEK; \n'
                        'Klawisz [P] - menu dotyczace PUNKTOW KANADYJSKICH;\n'
                        '--------\n'
                        'Klawisz [I] - INFORMACJE o bazie;\n'
                        'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (dec == 'M'):
                self.meczU()
            elif (dec == 'Z'):
                self.zawodnik()
            elif (dec == 'D'):
                self.druzyny()
            elif (dec == 'B'):
                self.bramki()
            elif (dec == 'P'):
                self.punkty()
            elif (dec == 'I'):
                self.info()
            elif (dec == 'Q'):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU GLOWNE')


# MENU ADMIN MECZE
    def meczA(self):
        while(True):
            klawisz = input(
                '\nMENU MECZU:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL mecze znajdujace sie w bazie danych;\n'
                'Klawisz [D] - DODAJ mecz do bazy;\n'
                'Klawisz [S] - SKASUJ mecz z bazy;\n'
                '------------\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()

            if (klawisz == "W"):
                self.selectM()
            elif (klawisz == "D"):
                self.addM()
            elif (klawisz == "S"):
                self.deleteM()
            elif (klawisz == "G"):
                self.menuMainA()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')



#MENU USER MECZE
    def meczU(self):
        while(True):
            klawisz = input(
                '\nMENU MECZU:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL mecze znajdujace sie w bazie danych;\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                '------------\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()

            if (klawisz == "W"):
                self.selectM()

            elif (klawisz == "G"):
                self.menuMainU()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')

#MENU USER ZAWODNICY
    def zawodnik(self):
        while (True):
            klawisz = input(
                '\nMENU ZAWODNIKOW:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL zawodnikow grajacych w Ekstraklasie;\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                '------------\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (klawisz == "W"):
                self.selectZ()
            elif (klawisz == "G"):
                self.menuMainU()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')

#MENU USER DRUZYNY
    def druzyny(self):
        while (True):
            klawisz = input(
                '\nMENU DRUZYN:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL wszystkie druzyny Ekstraklasy;\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                '------------\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (klawisz == "W"):
                self.selectD()
            elif (klawisz == "G"):
                self.menuMainU()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')

#MENU USER BRAMKI
    def bramki(self):
        while (True):
            klawisz = input(
                '\nMENU BRAMEK:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL wszystkie bramki, ktore padly w meczach ekstraklasy;\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                '------------\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (klawisz == "W"):
                self.selectB()
            elif (klawisz == "G"):
                self.menuMainU()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')

#MENU USER PUNKTY
    def punkty(self):
        while (True):
            klawisz = input(
                '\nMENU PUNKTOW KANADYJSKICH:\n'
                '------------\n'
                'Klawisz [W] - WYSWIETL punkty kanadysjkie zdobyte przez wszystkich zawodnikow;\n'
                'Klawisz [G] - powrot do MENU GLOWNEGO;\n'
                '------------\n'
                'Klawisz [Q] - WYJSCIE z programu.\n').upper()
            if (klawisz == "W"):
                self.selectP()
            elif (klawisz == "G"):
                self.menuMainU()
            elif (klawisz == "Q"):
                self.conn.close()
                print('Rozlaczono z baza danych.')
                print('\nZakonczono dzialanie programu. Dziekujemy i do zobaczenia.')
                sys.exit()
            else:
                print('!BLAD! Blad przy dokonywaniu wyboru z MENU MECZU')

#WYSWIETL MECZE
    def selectM(self):
        self.c = self.conn.cursor()
        self.c.execute('select data_meczu, gospodarz, gosc, wynik from w_mecze2')
        sel_M = self.c.fetchall()
        print('---------------------------------------------------------------------------------------\n'
              '|    DATA    |            GOSPODARZ           |              GOSC              | WYN. |\n'
              '---------------------------------------------------------------------------------------')
        for row in sel_M:
            print('| %10s | %30s | %30s | %4s |' % (row[0], row[1], row[2], row[3]))
        print('---------------------------------------------------------------------------------------')

#DODAJ MECZ
    def addM(self):

        try:
            print('\nAby dodac mecz bedziesz musial wprowadzic o nim kilka informacji. Nie martw sie, przeprowadze Cie przez caly proces.')
            Data_meczu = input('Wprowadz date rozegranego meczu w formacie RRRR-MM-DD, np.2017-07-12 :')
            Gosp_DRU_id = input('Wybierz druzyne gospodarza (wystarczy ze wpiszesz jej numer):\n\nArka Gdynia - 10\nCracovia Kraków - 11\nGórnik Zabrze - 5\nJagiellonia Białystok - 3\nKorona Kielce - 7\nLech Poznań - 4\nLechia Gdańsk - 1\nLegia Warszawa - 2\n'
                            'Piast Gliwice - 13\nPogoń Szczecin - 14\nSandecja Nowy Sącz - 16\nTermalica Nieciecza - 15\nWisła Kraków - 8\nWisła Płock - 6\nZagłębie Lubin - 9\nŚląsk Wrocław - 12\n')
            if  int(Gosp_DRU_id) in range(1,17):
                # Gosp_DRU_id.isdigit() - dziwna rzecz, funkcja isdigit sprawdza czy Gosp_DRU_id jest liczba i daje wynik pozytywny ale nie moge sprawdzic bez rzutowania na int czy Gosp_DRU_id jest w range1,17?
                print('CZEKAJ - Trwa sprawdzanie wprowadzonych danych...')
                time.sleep(4)
                print('Tak, wprowadzona wartosc to liczba')
                Gosc_DRU_id = input('Wybierz druzyne gosci (wystarczy ze wpiszesz jej numer):\n\nArka Gdynia - 10\nCracovia Kraków - 11\nGórnik Zabrze - 5\nJagiellonia Białystok - 3\nKorona Kielce - 7\nLech Poznań - 4\nLechia Gdańsk - 1\nLegia Warszawa - 2\n'
                                'Piast Gliwice - 13\nPogoń Szczecin - 14\nSandecja Nowy Sącz - 16\nTermalica Nieciecza - 15\nWisła Kraków - 8\nWisła Płock - 6\nZagłębie Lubin - 9\nŚląsk Wrocław - 12\n')
                if int(Gosc_DRU_id) in range(1,17):
                    Gol_H = input('Wprowadz liczbe bramek zdobytych przez gospodarza:')
                    if (Gol_H.isdigit()):
                        Gol_A = input('Wprowadz liczbe bramek zdobytych przez gosci:')
                        if (Gol_A.isdigit()):
                            if (Gosp_DRU_id != Gosc_DRU_id):
                                self.d = self.conn.cursor()
                                self.e = self.conn.cursor()
                                self.d.execute('select * from w_druzyny where DRU_id=%s', (Gosp_DRU_id))
                                self.e.execute('select * from w_druzyny where DRU_id=%s', (Gosc_DRU_id))
                                gospodarz = self.d.fetchall()[0][1]
                                gosc = self.e.fetchall()[0][1]
                                print('\n!UWAGA!\nMecz ktory chcesz dodac do bazy, to mecz pomiedzy\n' + gospodarz + ' i ' + gosc + ' z dnia '+ Data_meczu + ' zakonczony wynikiem ' + Gol_H + " - " + Gol_A)
                                dec = input('\nCzy na pewno chcesz dodac ten mecz? TAK [T] / NIE [N]').upper()
                                if (dec == "T"):
                                    self.c.execute('insert into mecze (data_meczu, gosp_DRU_id, gosc_DRU_id, gol_h, gol_a) values (%s,%s,%s,%s,%s)', (Data_meczu, Gosp_DRU_id, Gosc_DRU_id, Gol_H, Gol_A))
                                    self.conn.commit()
                                    print('\nDziekuje. Nowy mecz zostal dodany do bazy')
                                    self.menuMainA()
                                else:
                                    self.menuMainA()
                            else:
                                print('\n!BLAD! Wybrales te same druzyny na gospodarza meczu i na goscia. Wybierz druzyny jeszcze raz.')
                                self.addM()
                        else:
                            print('Nie wprowadziles liczby - mozesz to teraz poprawic')
                            self.addM()
                    else:
                        print('Nie wprowadziles liczby - mozesz to teraz poprawic')
                        self.addM()
                else:
                    print('prowadziles zla wartosc.')
                    self.addM()
            else:
                print('Wprowadziles zla wartosc.')
                self.addM()
        except:
            print('!BLAD! Dodawanie meczu nie powiodlo sie!')

#SKASUJ MECZ
    def deleteM(self):
        print('\nZeby skasowac mecz musisz podac nazwy druzyn, ktore w nim zagraly.\n')
        Gosp_DRU_id = input('Wybierz druzyne gospodarza (wystarczy ze wpiszesz jej numer):\n\nArka Gdynia - 10\nCracovia Kraków - 11\nGórnik Zabrze - 5\nJagiellonia Białystok - 3\nKorona Kielce - 7\nLech Poznań - 4\nLechia Gdańsk - 1\nLegia Warszawa - 2\n'
                            'Piast Gliwice - 13\nPogoń Szczecin - 14\nSandecja Nowy Sącz - 16\nTermalica Nieciecza - 15\nWisła Kraków - 8\nWisła Płock - 6\nZagłębie Lubin - 9\nŚląsk Wrocław - 12\n')
        Gosc_DRU_id = input('Wybierz druzyne gosci (wystarczy ze wpiszesz jej numer):\n\nArka Gdynia - 10\nCracovia Kraków - 11\nGórnik Zabrze - 5\nJagiellonia Białystok - 3\nKorona Kielce - 7\nLech Poznań - 4\nLechia Gdańsk - 1\nLegia Warszawa - 2\n'
                            'Piast Gliwice - 13\nPogoń Szczecin - 14\nSandecja Nowy Sącz - 16\nTermalica Nieciecza - 15\nWisła Kraków - 8\nWisła Płock - 6\nZagłębie Lubin - 9\nŚląsk Wrocław - 12\n')
    # dodac nierownosc w druzynach
        self.c = self.conn.cursor()
        self.d = self.conn.cursor()
        self.e = self.conn.cursor()
        self.d.execute('select * from w_druzyny where DRU_id=%s', (Gosp_DRU_id))
        self.e.execute('select * from w_druzyny where DRU_id=%s', (Gosc_DRU_id))
        gospodarz = self.d.fetchall()[0][1]
        gosc = self.e.fetchall()[0][1]
        if (gospodarz != gosc):
            liczba_meczy = self.c.execute('select * from mecze where gosp_DRU_id=%s AND gosc_DRU_id=%s', (Gosp_DRU_id, Gosc_DRU_id))
            if liczba_meczy > 0:
                doKasacji = self.c.fetchall()
                for row in doKasacji:
                    print('!UWAGA!\nMecz ktory chcesz skasowac, to mecz pomiedzy ' + gospodarz + ' i ' + gosc + ' z dnia %10s zakonczony wynikiem %2s -%2s' % (row[2], row[5], row[6]))
                    dec = input('Czy na pewno chcesz usunac wlasnie ten mecz? Zdecyduj TAK [T] / NIE [N]').upper()
                    if (dec == "T"):
                        self.c.execute('delete from mecze where gosp_DRU_id=%s AND gosc_DRU_id=%s', (Gosp_DRU_id, Gosc_DRU_id))
                        self.conn.commit()
                        print('\n-------------------------\n| Mecz zostal skasowany |\n-------------------------\n')
                        self.menuMainA()
                    else:
                        dec2 = input('\nNie zdecydowales sie na skasowanie meczu.\nMozesz skasowac inny mecz [S] lub wrocic do glownego menu [G], co wybierasz').upper()
                        if (dec2 == "S"):
                            self.deleteM()
                        elif (dec2 == "G"):
                            self.menuMainA()
                        else:
                            print('\nDokonales niejasnego wyboru. Jestes w menu glownym.\n')
                            self.menuMainA()
            else:
                print('Nie ma takiego meczu w bazie. Wybierz druzyny jeszcze raz')
                self.deleteM()

        else:
            print('\n!BLAD! Wybrales te same druzyny na gospodarza meczu i na goscia. Wybierz druzyny jeszcze raz.')
            self.deleteM()

#WYSWIETL ZAWODNIKOW
    def selectZ(self):
        self.c = self.conn.cursor()
        self.c.execute('select pilkarz, nazwa_druzyny from w_kontrakty')
        sel_M = self.c.fetchall()
        print('-------------------------------------------------------------------\n'
              '|        IMIE i NAZWISKO         |              DRUZYNA           |\n'
              '-------------------------------------------------------------------')
        for row in sel_M:
            print('| %30s | %30s |' % (row[0], row[1]))
        print('-------------------------------------------------------------------')

#WYSWIETL DRUZYNY
    def selectD(self):
        self.c = self.conn.cursor()
        self.c.execute('select nazwa_druzyny from w_druzyny')
        sel_M = self.c.fetchall()
        print('----------------------------------\n'
              '|              DRUZYNA           |\n'
              '----------------------------------')
        for row in sel_M:
            print('| %30s |' % (row[0]))
        print('----------------------------------')

#WYSWIETL BRAMKI
    def selectB(self):
        self.c = self.conn.cursor()
        self.c.execute('select * from w_bramki2')
        sel_M = self.c.fetchall()
        print('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n'
              '| BRA | MEC |        GOSPODARZ          |             GOSC          | WYNIK | MIN |          GOL DLA          |    OPIS    |        STRZELEC        |          ASYSTA        |\n'
              '------------------------------------------------------------------------------------------------------------------------------------------------------------------------------')
        for row in sel_M:
            print('| %3s | %3s | %25s | %25s | %5s | %3s | %25s | %10s | %22s | %22s |' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]))
        print('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------')

#WYSWIETL PUNKTY
    def selectP(self):
        self.c = self.conn.cursor()
        self.c.execute('SELECT pilkarz, nazwa_druzyny, Suma_punktow_wsz FROM w_punkty_suma')
        sel_M = self.c.fetchall()
        print(
            '------------------------------------------------------------\n'
            '|          PILKARZ          |        DRUZYNA         | PKT |\n'
            '------------------------------------------------------------')
        for row in sel_M:
            print('| %25s | %22s | %3s |' % (row[0], row[1], row[2]))
        print(
            '------------------------------------------------------------')

#INFO
    def info(self):
        print('****************************************************************************************************\n'
              '*                                                                                                  *\n'
              '*               !!! UWAGA - BAZA JEST W FAZIE TESTOW I MOZE ZAWIERAC BLEDY !!!                     *\n'
              '*                                                                                                  *\n'              
              '* Przygotowana baza danych stanowi zbior informacji o rozgrywkach ekstraklasy w sezonie 2017/2018. *\n'
              '* W bazie dostepne sa informacje o:                                                                *\n'
              '* - druzynach bioracych udzial w rozgrywkach                                                       *\n'
              '* - meczach rozegranych w sezonie,                                                                 *\n'
              '* - pilkarzach i ich kontraktach.                                                                  *\n'
              '*                                                                                                  *\n'
              '* Baza zostala przygotowana pod katem analizy i przyznawania zawodnikom tzw "punktow kanadyjskich".*\n'
              '* Baza jest w fazie tworzenia a w tym programie zostal udostepniony jedynie jej wycinek.           *\n'
              '*                                                                                                  *\n'
              '*               !!! UWAGA - BAZA JEST W FAZIE TESTOW I MOZE ZAWIERAC BLEDY !!!                     *\n'
              '*                                                                                                  *\n'
              '* \xa9 2018 Tomasz Bialkowski                                                                         *\n'
              '****************************************************************************************************\n')


o = DBconnect()
