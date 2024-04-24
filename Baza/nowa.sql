-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Cze 2023, 20:55
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `nowa`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_data`
--

CREATE TABLE `contact_data` (
  `idcontact_data` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `adres` varchar(45) DEFAULT NULL,
  `users_idusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `contact_data`
--

INSERT INTO `contact_data` (`idcontact_data`, `telephone`, `mail`, `adres`, `users_idusers`) VALUES
(1, '666666666', 'agnieszkakowalska@gmail.com', 'Wrocław, Polna 65 ', 1),
(2, '777777777', 'zbigniewnowak@gmail.com', 'Wrocław, Piękna 77', 2),
(3, '572937283', 'grzegorzbrzęczyszczykiewicz@gmail.com', 'Wrocław, Ładna 50', 3),
(4, '492099182', 'grzegorzfajny@gmail.com', 'Wrocław, Grzeczna 5', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `eksperymenty`
--

CREATE TABLE `eksperymenty` (
  `ideksperymenty` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `date_start` date NOT NULL,
  `date_koniec` date DEFAULT NULL,
  `opis` longtext DEFAULT NULL,
  `wynik` longtext DEFAULT NULL,
  `projekty_idprojekty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `eksperymenty`
--

INSERT INTO `eksperymenty` (`ideksperymenty`, `name`, `date_start`, `date_koniec`, `opis`, `wynik`, `projekty_idprojekty`) VALUES
(1, 'Eksperyment 1 ', '2021-04-13', '2023-03-22', 'Ekspozycja na Długotrwałe Promieniowanie UVB prowadzi do Uszkodzeń DNA i Zwiększonego Ryzyka Wystąpienia Nowotworów Skóry. W ramach projektu \"Ekspozycja na Długotrwałe Promieniowanie UVB prowadzi do Uszkodzeń DNA i Zwiększonego Ryzyka Wystąpienia Nowotworów Skóry\", przeprowadzono eksperyment mający na celu zbadanie wpływu długotrwałej ekspozycji na promieniowanie UVB na uszkodzenia DNA i ryzyko rozwoju nowotworów skóry. Badanie przeprowadzono w warunkach laboratoryjnych na hodowlach komórek skóry oraz na grupie ochotników.\r\n', 'Wyniki eksperymentu potwierdzają, że długotrwała ekspozycja na promieniowanie UVB prowadzi do uszkodzeń DNA i może wywoływać zmiany w komórkach skóry, które są związane z zwiększonym ryzykiem wystąpienia nowotworów skóry. Chociaż nie zaobserwowano bezpośredniego rozwoju nowotworów wśród ochotników w trakcie trwania eksperymentu, wyniki sugerują, że długotrwała ekspozycja zwiększa ryzyko rozwoju nowot', 3),
(2, 'Eksperyment 2 ', '2023-07-01', '2024-07-01', 'Wpływ Podwyższonego Stężenia Dwutlenku Węgla na Zakwaszenie Oceanów i Życie Morskie\", przeprowadzono eksperyment mający na celu zbadanie wpływu zwiększonego stężenia CO2 w atmosferze na zakwaszenie oceanów i ocenę, jak te zmiany wpływają na organizmy morskie. Eksperyment był prowadzony zarówno w kontrolowanych warunkach laboratoryjnych, jak i na wybranych obszarach oceanicznych.', 'Wyniki eksperymentu potwierdzają, że zwiększone stężenie CO2 w atmosferze prowadzi do zakwaszenia oceanów. Dodatkowo, zakwaszenie to ma negatywny wpływ na organizmy morskie, szczególnie te, które wykorzystują wapń do budowy swoich struktur, jak małże i koralowce. Ryby również wykazują oznaki stresu i zmian w zachowaniu.\r\n', 4),
(3, 'Eksperyment 3', '2023-07-01', '2024-07-01', 'Eksperyment dotyczący wpływu kofeiny na rozwój nasion fasoli. W eksperymencie tym, nasiona fasoli zostały podzielone na dwie grupy - jedna została moczone w wodzie, druga w roztworze kofeiny o stężeniu 0,5%.', 'Po 7 dniach obserwacji okazało się, że nasiona moczone w kofeinie wykazywały większy wzrost i większą liczbę liści w porównaniu z kontrolną grupą moczoną jedynie w wodzie.', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `metody`
--

CREATE TABLE `metody` (
  `idmetody` int(11) NOT NULL,
  `procedura` longtext NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `metody`
--

INSERT INTO `metody` (`idmetody`, `procedura`, `name`) VALUES
(1, 'Technika analityczna wykorzystująca spektrometry masowe do identyfikacji, charakteryzacji i ilościowej analizy związków chemicznych w próbkach. Metoda ta polega na rozpyleniu próbki w gazie nośnym i jonizacji jej atomów lub cząsteczek, po czym wyznaczeniu masy i ładunku jonów w polu elektrycznym.\r\n\r\n', 'Spektrometria mas'),
(2, 'Metoda analityczna wykorzystująca separację związków chemicznych na podstawie ich różnic w oddziaływaniach z fazą stacjonarną i mobilną. W tym przypadku próbka jest wprowadzana na kolumnę chromatograficzną wraz z eluentem, a następnie frakcjonowana na poszczególne składniki.\r\n\r\n', 'Chromatografia cieczowa'),
(3, 'Metoda analityczna polegająca na rozdziale substancji chemicznych na podstawie ich różnic w ruchliwości w polu elektrycznym. Próbki są wprowadzane na żel poliakryloamidowy lub agarozowy, a następnie poddawane elektroforezie, podczas której oddzielają się według rozmiaru i ładunku cząsteczek.\r\n\r\n', 'Elektroforeza'),
(4, 'Metoda wykorzystywana do identyfikacji i ilościowej analizy antygenów i przeciwciał w próbkach biologicznych. Metoda ta opiera się na reakcji między antygenami a przeciwciałami, które prowadzi do powstania kompleksów immunologicznych, które są następnie detekowane.\r\n\r\n', 'Reakcje immunologiczne'),
(5, 'Metoda analityczna wykorzystująca zjawisko rezonansu magnetycznego do identyfikacji i charakteryzacji związków chemicznych w próbkach. Metoda ta polega na umieszczeniu próbki w silnym polu magnetycznym i naświetleniu jej fali radiowej, co prowadzi do zarejestrowania charakterystycznego sygnału NMR, który umożliwia określenie struktury cząsteczek w próbce.\r\n\r\n', 'Spektroskopia nuklearna rezonansu magnetyczne');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `metod_urzadzenia`
--

CREATE TABLE `metod_urzadzenia` (
  `idmetod_urzadzenia` int(11) NOT NULL,
  `sprzet_idsprzet` int(11) NOT NULL,
  `sprzet_users_idusers` int(11) NOT NULL,
  `metody_idmetody` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `metod_urzadzenia`
--

INSERT INTO `metod_urzadzenia` (`idmetod_urzadzenia`, `sprzet_idsprzet`, `sprzet_users_idusers`, `metody_idmetody`) VALUES
(1, 6, 2, 3),
(2, 4, 1, 1),
(3, 2, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy_projektow`
--

CREATE TABLE `pracownicy_projektow` (
  `idpracownicy_projektow` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `projekty_idprojekty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `pracownicy_projektow`
--

INSERT INTO `pracownicy_projektow` (`idpracownicy_projektow`, `users_idusers`, `projekty_idprojekty`) VALUES
(1, 3, 3),
(2, 4, 4),
(3, 4, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `probki`
--

CREATE TABLE `probki` (
  `temperatura` int(11) NOT NULL,
  `data` date NOT NULL,
  `idprobki` int(11) NOT NULL,
  `spsob_przechowywania` longtext NOT NULL,
  `ideksperymenty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `probki`
--

INSERT INTO `probki` (`temperatura`, `data`, `idprobki`, `spsob_przechowywania`, `ideksperymenty`) VALUES
(6, '2022-04-22', 5, 'przechowywać w lodówce przy temperaturze 2-8°C lub zamrożone w temperaturze -20°C.', 1),
(-30, '2022-09-21', 6, 'przechowywać w zamrażarce przy temperaturze -20°C lub -80°C.', 2),
(37, '2023-01-17', 3, ' przechowywać w hodowli komórkowej w temperaturze 37°C i 5% dwutlenku węgla.', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `projekty`
--

CREATE TABLE `projekty` (
  `idprojekty` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `opis` longtext DEFAULT NULL,
  `data_poczatek` date NOT NULL,
  `data_koniec` date DEFAULT NULL,
  `users_idusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `projekty`
--

INSERT INTO `projekty` (`idprojekty`, `name`, `opis`, `data_poczatek`, `data_koniec`, `users_idusers`) VALUES
(1, 'Analiza nawozów', 'Czy zwiększenie dawki nawozów azotowych wpłynie na wzrost masy roślin.', '2019-04-12', '2022-08-25', 4),
(2, 'Analiza stężenia', 'Zwiększenie stężenia glukozy we krwi zwiększa ryzyko wystąpienia chorób sercowo-naczyniowych', '2019-05-14', '2022-03-15', 4),
(3, 'Badanie promeniowania', 'Ekspozycja na długotrwałe promieniowanie UVB prowadzi do uszkodzeń DNA i zwiększonego ryzyka wystąpienia nowotworów skóry.', '2016-05-28', '2018-11-21', 4),
(4, 'Badanie promeniowania', 'Zwiększenie stężenia dwutlenku węgla w atmosferze prowadzi do zakwaszenia oceanów i zwiększenia ryzyka dla organizmów morskich.', '2020-01-10', '2023-02-21', 4),
(6, 'test', 'test', '2023-05-31', '2023-06-23', 4),
(7, 'test', 'test', '2023-05-31', '2023-06-23', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przeglady`
--

CREATE TABLE `przeglady` (
  `data_przegladu` date NOT NULL,
  `opis_przegladu` longtext NOT NULL,
  `idpsrzed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `przeglady`
--

INSERT INTO `przeglady` (`data_przegladu`, `opis_przegladu`, `idpsrzed`) VALUES
('2023-04-13', 'Wyniki przeglądu:\r\n\r\nWizualna kontrola - brak widocznych uszkodzeń mechanicznych lub zarysowań na obiektywie, okularze i statywie.\r\nKontrola funkcji - mikroskop działa prawidłowo. Mechanizmy regulacji ostrości, przesuwu obiektu i zmiany powiększenia działają bezproblemowo.\r\nOptyczna kontrola - badana próbka była wyraźnie widoczna, obraz był ostry i wyraźny. Kontrola poziomu oświetlenia również przebiegła bezproblemowo.\r\nCzyszczenie i konserwacja - mikroskop został dokładnie wyczyszczony z kurzu i zanieczyszczeń. Konserwacja polegała na nasmarowaniu ruchomych części i przesmarowaniu mechanicznych części wewnętrznych.\r\nPodsumowanie:\r\nMikroskop jest gotowy do użytku i działa w pełni sprawnie. Brak wykrytych usterek lub awarii podczas przeglądu. Należy ponownie przeprowadzić przegląd za rok.', 1),
('2023-04-02', 'Przegląd rozpoczęto od wizualnej oceny stanu spektrometru UV-vis, która wykazała, że urządzenie jest w dobrym stanie, bez uszkodzeń czy zarysowań. Następnie dokonano czyszczenia całego urządzenia oraz jego elementów, w tym lampy i lustra. W tym celu użyto specjalistycznych detergentów i środków do dezynfekcji, a następnie dokładnie osuszono urządzenie.\r\n\r\nKolejnym krokiem była kalibracja spektrometru UV-vis. Kalibracja była wykonywana zgodnie z instrukcją obsługi urządzenia i obejmowała wyznaczenie poziomu sygnału zerowego oraz optymalizację parametrów systemu detekcji. Kalibracja potwierdziła poprawność działania urządzenia.\r\n\r\nPo wykonaniu kalibracji przeprowadzono serię pomiarów, używając próbek wzorcowych. Wykonano pomiary absorbancji, aby zweryfikować poprawność działania urządzenia. Wyniki pomiarów były zgodne z oczekiwaniami, co potwierdzała poprawne działanie spektrometru UV-vis.\r\n\r\nNa zakończenie przeglądu, wykonano testy wydajnościowe, aby upewnić się, że urządzenie działa w sposób prawidłowy i zgodny z normami i standardami. Testy wydajnościowe zostały wykonane zgodnie z instrukcją obsługi i potwierdziły poprawne działanie spektrometru UV-vis.\r\n\r\nPodsumowując, przegląd spektrometru UV-vis został przeprowadzony w sposób dokładny i skrupulatny. Wszystkie wyniki pomiarów były zgodne z oczekiwaniami, a testy wydajnościowe potwierdziły poprawne działanie urządzenia. Spektrometr UV-vis jest gotowy do dalszego użytku w laboratorium.\r\n\r\n\r\n\r\n\r\n', 2),
('2023-04-01', 'Przegląd rozpoczęto od wizualnej oceny stanu mikroskopu, która wykazała, że urządzenie jest w dobrym stanie, bez uszkodzeń czy zarysowań. Następnie dokonano czyszczenia całego urządzenia oraz jego elementów, w tym obiektywów, okularów, stolika i diapoztywów. W tym celu użyto specjalistycznych detergentów i środków do dezynfekcji, a następnie dokładnie osuszono urządzenie.\r\n\r\nKolejnym krokiem była kalibracja mikroskopu. Kalibracja była wykonywana zgodnie z instrukcją obsługi urządzenia i obejmowała wyznaczenie odległości między obiektywem a preparatem, ustawienie ogniskowej, ustawienie ostrości i ustawienie korekcji barwnej. Kalibracja potwierdziła poprawność działania urządzenia.\r\n\r\nPo wykonaniu kalibracji przeprowadzono serię pomiarów, używając próbek wzorcowych. Wykonano pomiary obserwacji, aby zweryfikować poprawność działania urządzenia. Wyniki pomiarów były zgodne z oczekiwaniami, co potwierdzała poprawne działanie mikroskopu.\r\n\r\nNa zakończenie przeglądu, wykonano testy wydajnościowe, aby upewnić się, że urządzenie działa w sposób prawidłowy i zgodny z normami i standardami. Testy wydajnościowe obejmowały analizę jakości obrazu, rozdzielczości i kontrastu. Testy wydajnościowe zostały wykonane zgodnie z instrukcją obsługi i potwierdziły poprawne działanie mikroskopu.\r\n\r\nPodsumowując, przegląd mikroskopu optycznego został przeprowadzony w sposób dokładny i skrupulatny. Wszystkie wyniki pomiarów były zgodne z oczekiwaniami, a testy wydajnościowe potwierdziły poprawne działanie urządzenia. Mikroskop optyczny jest gotowy do dalszego użytku w laboratorium.', 3),
('2023-04-10', 'Przegląd rozpoczęto od wizualnej oceny stanu spektrometru masowego, która wykazała, że urządzenie jest w dobrym stanie, bez uszkodzeń czy zarysowań. Następnie dokonano czyszczenia całego urządzenia oraz jego elementów, w tym źródła jonów, detektora oraz elektrod. W tym celu użyto specjalistycznych detergentów i środków do dezynfekcji, a następnie dokładnie osuszono urządzenie.\r\n\r\nKolejnym krokiem była kalibracja spektrometru masowego. Kalibracja była wykonywana zgodnie z instrukcją obsługi urządzenia i obejmowała wyznaczenie położenia masowego, punktu zerowego oraz prądu wejściowego. Kalibracja potwierdziła poprawność działania urządzenia.\r\n\r\nPo wykonaniu kalibracji przeprowadzono serię pomiarów, używając próbek wzorcowych. Wykonano pomiary masowe, aby zweryfikować poprawność działania urządzenia. Wyniki pomiarów były zgodne z oczekiwaniami, co potwierdzała poprawne działanie spektrometru masowego.\r\n\r\nNa zakończenie przeglądu, wykonano testy wydajnościowe, aby upewnić się, że urządzenie działa w sposób prawidłowy i zgodny z normami i standardami. Testy wydajnościowe zostały wykonane zgodnie z instrukcją obsługi i potwierdziły poprawne działanie spektrometru masowego.\r\n\r\nPodsumowując, przegląd spektrometru masowego został przeprowadzony w sposób dokładny i skrupulatny. Wszystkie wyniki pomiarów były zgodne z oczekiwaniami, a testy wydajnościowe potwierdziły poprawne działanie urządzenia. Spektrometr masowy jest gotowy do dalszego użytku w laboratorium.', 4),
('2023-04-12', 'Wyniki przeglądu:\r\n\r\nWizualna kontrola - brak widocznych uszkodzeń mechanicznych lub przecieków. Uszczelki w dobrym stanie, okno widokowe nieporysowane.\r\nKontrola funkcji - autoklaw uruchamia się bezproblemowo. Cykl sterylizacji odbywa się w sposób właściwy, drzwi otwierają się i zamykają bezproblemowo.\r\nPomiar temperatury - temperatura wewnątrz autoklawu wynosiła 121 stopni Celsjusza w każdym z pięciu miejsc pomiarowych. Różnice między pomiarami były znikome.\r\nKontrola ciśnienia - ciśnienie wewnątrz autoklawu wynosiło 1,1 bara, zgodnie z zaleceniami producenta.\r\nCzyszczenie i konserwacja - przeprowadzono czyszczenie wnętrza autoklawu za pomocą wody destylowanej i środka dezynfekcyjnego zgodnie z instrukcją producenta. Konserwacja ograniczona do smarowania drzwi.\r\nPodsumowanie:\r\nAutoklaw przejdzie do użytku zgodnie z instrukcją producenta. Brak wykrytych usterek lub awarii podczas przeglądu. Należy ponownie przeprowadzić przegląd za rok.', 5),
('2023-04-10', 'Wizualna ocena stanu wagi wykazała, że urządzenie jest w dobrym stanie, bez widocznych uszkodzeń czy zarysowań na powierzchni szklanej szalki. Następnie przeprowadzono procedurę czyszczenia, polegającą na usunięciu pozostałości substancji z poprzedniego użytkowania. W tym celu użyto delikatnego detergentu i wody destylowanej, a następnie dokładnie osuszono wagę.\r\n\r\nKolejnym krokiem był pomiar przy użyciu wzorców masy, celem dokładnego określenia dokładności i precyzji wagi. Wykonano serię pomiarów w zakresie od 1 g do 100 g, z dokładnością do 0,001 g. Wszystkie wyniki były zgodne z oczekiwaniami, co potwierdza prawidłowe działanie wagi.\r\n\r\nNa zakończenie, wykonano kalibrację wagi, aby upewnić się, że waga działa zgodnie z normami i standardami. Kalibracja została wykonana zgodnie z instrukcją obsługi i potwierdziła poprawne działanie wagi.\r\n\r\nPodsumowując, przegląd wagi analitycznej został przeprowadzony w sposób dokładny i skrupulatny. Wszystkie wyniki pomiarów były zgodne z oczekiwaniami, a kalibracja potwierdziła prawidłowe działanie wagi. Urządzenie jest gotowe do dalszego użytku w laboratorium.', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `slownik_probek`
--

CREATE TABLE `slownik_probek` (
  `idprobki` int(11) NOT NULL,
  `opis` longtext NOT NULL,
  `zalecone_przechowywanie` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `slownik_probek`
--

INSERT INTO `slownik_probek` (`idprobki`, `opis`, `zalecone_przechowywanie`) VALUES
(1, 'Krew - cenną próbką, która może dostarczyć informacji na temat stanu zdrowia, składu i funkcji krwi, a także chorób i infekcji.', 'przechowywać w lodówce przy temperaturze 2-8°C; przed użyciem ogrzać do temperatury pokojowej.'),
(2, 'Tkanka  Tkanka - fragmenty tkanek pobrane z różnych części ciała, które służą do badania histologicznego, genetycznego lub biochemicznego.', 'przechowywać w formalinie lub zamrożone w temperaturze -80°C.'),
(3, 'Komórki - pojedyncze komórki pobrane z organizmu, służące do badań mikroskopowych, hodowli komórkowych lub do analizy DNA.', 'przechowywać w hodowli komórkowej w temperaturze 37°C i 5% dwutlenku węgla.'),
(4, 'Bakterie - organizmy jednokomórkowe, które są używane w badaniach mikrobiologicznych i medycznych, np. w diagnostyce infekcji.', 'przechowywać w hodowli bakteryjnej w temperaturze 4-8°C lub zamrożone w temperaturze -80°C.'),
(5, 'Antygeny - białka lub cukry, które są obecne na powierzchni komórek lub wirusów i służą do diagnozowania chorób lub produkcji szczepionek.', 'przechowywać w lodówce przy temperaturze 2-8°C lub zamrożone w temperaturze -20°C.'),
(6, 'Próbniki DNA - próbki materiału genetycznego, takie jak krew, ślina lub fragmenty tkanek, służące do badania DNA i genetyki.', 'przechowywać w zamrażarce przy temperaturze -20°C lub -80°C.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `slownik_stanowisk`
--

CREATE TABLE `slownik_stanowisk` (
  `idslownik_stanowisk` int(11) NOT NULL,
  `stanowisko` varchar(45) NOT NULL,
  `opis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `slownik_stanowisk`
--

INSERT INTO `slownik_stanowisk` (`idslownik_stanowisk`, `stanowisko`, `opis`) VALUES
(1, 'Kierownik zakładu ', 'Osoba odpowiedzialna za zarządzanie pracą laboratorium, koordynowanie działań zespołu, planowanie zadań i projektów, kontrolowanie jakości pracy oraz zapewnienie przestrzegania standardów bezpieczeństwa i procedur laboratoryjnych. Kierownik zakładu może być także odpowiedzialny za zarządzanie zasobami ludzkimi, finansowymi i logistycznymi, a także za komunikację z klientami, partnerami i dostawcami.'),
(2, 'Technik laboratoryjny', 'Osoba zajmująca się przygotowaniem próbek, kontrolą jakości, przygotowywaniem roztworów i czynników laboratoryjnych, a także obsługą i konserwacją sprzętu laboratoryjnego.'),
(3, 'Analityk chemiczny', 'Osoba zajmująca się przeprowadzaniem analiz chemicznych, interpretacją wyników oraz opracowywaniem raportów z analiz.'),
(4, 'Biotechnolog', 'Osoba zajmująca się badaniami biologicznymi, hodowlą komórkową, mikrobiologiczną oraz oczyszczaniem biomolekuł.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzet`
--

CREATE TABLE `sprzet` (
  `idsprzet` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `opis` longtext NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `rok_produkcji` year(4) NOT NULL,
  `producent` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `sprzet`
--

INSERT INTO `sprzet` (`idsprzet`, `name`, `opis`, `users_idusers`, `rok_produkcji`, `producent`) VALUES
(1, 'Mikroskop', 'Służy do paczania małych obiektów', 1, 1999, 'Sigma'),
(2, 'Spektrofotometr UV-Vis', 'Sprzęt służący do pomiaru absorpcji promieniowania UV-Vis przez próbki.', 3, 2015, 'Shimadzu Corporation'),
(3, 'Mikroskop optyczny', 'Sprzęt laboratoryjny służący do obserwacji próbek pod mikroskopem.', 1, 2020, 'Carl Zeiss AG'),
(4, 'Spektrometr masowy', 'Urządzenie umożliwiające analizę składu chemicznego próbek, w których występują związki chemiczne o dużej masie cząsteczkowej. ', 1, 2018, 'Agilent Technologies'),
(5, 'Autoklaw', 'Urządzenie laboratoryjne służące do sterylizacji narzędzi i materiałów poprzez narażenie ich na wysoką temperaturę i ciśnienie. ', 1, 2021, 'Tuttnauer'),
(6, 'Waga analityczna', 'Precyzyjna waga laboratoryjna służąca do ważenia próbek w skali mikro- lub miligramowej.', 2, 2019, 'METTLER TOLEDO'),
(7, 'test', 'test', 3, 1999, 'test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uprawnienia`
--

CREATE TABLE `uprawnienia` (
  `iduprawnienia` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `slownik_stanowisk_idslownik_stanowisk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `uprawnienia`
--

INSERT INTO `uprawnienia` (`iduprawnienia`, `users_idusers`, `slownik_stanowisk_idslownik_stanowisk`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 4),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `danelogowania` varchar(45) DEFAULT NULL,
  `haslo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`idusers`, `name`, `surname`, `pesel`, `danelogowania`, `haslo`) VALUES
(1, 'Agnieszka', 'Kowalska', '12340987787', 'aga123', '1234'),
(2, 'Zbigniew', 'Nowak', '12340987888', 'nowak123', '1234'),
(3, 'Grzegorz', 'Brzęczyszczykiewicz', '23430987787', 'grzes123', '123'),
(4, 'Grzegorz', 'Fajny', '23430987757', 'fajny123', '123'),
(7, 'test1', 'test1', '123412341', 'test1234', '123');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `contact_data`
--
ALTER TABLE `contact_data`
  ADD PRIMARY KEY (`idcontact_data`,`users_idusers`),
  ADD KEY `fk_contact_data_users_idx` (`users_idusers`);

--
-- Indeksy dla tabeli `eksperymenty`
--
ALTER TABLE `eksperymenty`
  ADD PRIMARY KEY (`ideksperymenty`,`projekty_idprojekty`),
  ADD KEY `fk_eksperymenty_projekty1_idx` (`projekty_idprojekty`);

--
-- Indeksy dla tabeli `metody`
--
ALTER TABLE `metody`
  ADD PRIMARY KEY (`idmetody`);

--
-- Indeksy dla tabeli `metod_urzadzenia`
--
ALTER TABLE `metod_urzadzenia`
  ADD PRIMARY KEY (`idmetod_urzadzenia`,`sprzet_idsprzet`,`sprzet_users_idusers`,`metody_idmetody`),
  ADD KEY `fk_metod_urzadzenia_sprzet1_idx` (`sprzet_idsprzet`,`sprzet_users_idusers`),
  ADD KEY `fk_metod_urzadzenia_metody1_idx` (`metody_idmetody`);

--
-- Indeksy dla tabeli `pracownicy_projektow`
--
ALTER TABLE `pracownicy_projektow`
  ADD PRIMARY KEY (`idpracownicy_projektow`,`users_idusers`,`projekty_idprojekty`),
  ADD KEY `fk_pracownicy_projektow_users1_idx` (`users_idusers`),
  ADD KEY `fk_pracownicy_projektow_projekty1_idx` (`projekty_idprojekty`);

--
-- Indeksy dla tabeli `probki`
--
ALTER TABLE `probki`
  ADD PRIMARY KEY (`ideksperymenty`),
  ADD KEY `idprobki_2` (`idprobki`),
  ADD KEY `idprobki_3` (`idprobki`),
  ADD KEY `idprobki_id` (`idprobki`) USING BTREE;

--
-- Indeksy dla tabeli `projekty`
--
ALTER TABLE `projekty`
  ADD PRIMARY KEY (`idprojekty`,`users_idusers`),
  ADD KEY `fk_projekty_users1_idx` (`users_idusers`);

--
-- Indeksy dla tabeli `przeglady`
--
ALTER TABLE `przeglady`
  ADD PRIMARY KEY (`idpsrzed`);

--
-- Indeksy dla tabeli `slownik_probek`
--
ALTER TABLE `slownik_probek`
  ADD PRIMARY KEY (`idprobki`);

--
-- Indeksy dla tabeli `slownik_stanowisk`
--
ALTER TABLE `slownik_stanowisk`
  ADD PRIMARY KEY (`idslownik_stanowisk`);

--
-- Indeksy dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD PRIMARY KEY (`idsprzet`,`users_idusers`),
  ADD KEY `fk_sprzet_users1_idx` (`users_idusers`);

--
-- Indeksy dla tabeli `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD PRIMARY KEY (`iduprawnienia`,`users_idusers`,`slownik_stanowisk_idslownik_stanowisk`),
  ADD KEY `fk_uprawnienia_users1_idx` (`users_idusers`),
  ADD KEY `fk_uprawnienia_slownik_stanowisk1_idx` (`slownik_stanowisk_idslownik_stanowisk`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `contact_data`
--
ALTER TABLE `contact_data`
  MODIFY `idcontact_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `eksperymenty`
--
ALTER TABLE `eksperymenty`
  MODIFY `ideksperymenty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `metody`
--
ALTER TABLE `metody`
  MODIFY `idmetody` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `metod_urzadzenia`
--
ALTER TABLE `metod_urzadzenia`
  MODIFY `idmetod_urzadzenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pracownicy_projektow`
--
ALTER TABLE `pracownicy_projektow`
  MODIFY `idpracownicy_projektow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `projekty`
--
ALTER TABLE `projekty`
  MODIFY `idprojekty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `slownik_stanowisk`
--
ALTER TABLE `slownik_stanowisk`
  MODIFY `idslownik_stanowisk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  MODIFY `idsprzet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `uprawnienia`
--
ALTER TABLE `uprawnienia`
  MODIFY `iduprawnienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `contact_data`
--
ALTER TABLE `contact_data`
  ADD CONSTRAINT `fk_contact_data_users` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `eksperymenty`
--
ALTER TABLE `eksperymenty`
  ADD CONSTRAINT `eksperymenty_ibfk_1` FOREIGN KEY (`ideksperymenty`) REFERENCES `probki` (`ideksperymenty`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eksperymenty_projekty1` FOREIGN KEY (`projekty_idprojekty`) REFERENCES `projekty` (`idprojekty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `metod_urzadzenia`
--
ALTER TABLE `metod_urzadzenia`
  ADD CONSTRAINT `fk_metod_urzadzenia_metody1` FOREIGN KEY (`metody_idmetody`) REFERENCES `metody` (`idmetody`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_metod_urzadzenia_sprzet1` FOREIGN KEY (`sprzet_idsprzet`,`sprzet_users_idusers`) REFERENCES `sprzet` (`idsprzet`, `users_idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `pracownicy_projektow`
--
ALTER TABLE `pracownicy_projektow`
  ADD CONSTRAINT `fk_pracownicy_projektow_projekty1` FOREIGN KEY (`projekty_idprojekty`) REFERENCES `projekty` (`idprojekty`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pracownicy_projektow_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `probki`
--
ALTER TABLE `probki`
  ADD CONSTRAINT `probki_ibfk_1` FOREIGN KEY (`idprobki`) REFERENCES `slownik_probek` (`idprobki`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `projekty`
--
ALTER TABLE `projekty`
  ADD CONSTRAINT `fk_projekty_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `przeglady`
--
ALTER TABLE `przeglady`
  ADD CONSTRAINT `przeglady_ibfk_1` FOREIGN KEY (`idpsrzed`) REFERENCES `sprzet` (`idsprzet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD CONSTRAINT `fk_sprzet_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD CONSTRAINT `fk_uprawnienia_slownik_stanowisk1` FOREIGN KEY (`slownik_stanowisk_idslownik_stanowisk`) REFERENCES `slownik_stanowisk` (`idslownik_stanowisk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_uprawnienia_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
