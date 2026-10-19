# Mads – et digitalt kæledyr på McDonald's

## Udfordring og målgruppe

Det digitale kæledyr **Mads** er altid sultent. Brugeren skal vælge, om Mads skal have mad eller træne, og kan derefter se konsekvenserne for hans kalorier og vægt.

Programmet er lavet til elever og andre begyndere, der vil se en enkel og legende sammenhæng mellem mad, motion, kalorier og vægt.

## Sådan hjælper programmet brugeren

Brugeren kan vælge mellem forskellige madvarer og træningsformer. Mad øger kalorier og vægt, mens træning mindsker dem. Når Mads spiser, flyver en foderkugle fra madskålen til hans mund. Ved meget høj vægt eksploderer Mads, så brugeren får en tydelig konsekvens af at give for meget mad.

## Sådan kører du programmet

1. Installér [Processing 4](https://processing.org/download).
2. Hent eller klon dette repository.
3. Åbn `Pet_projekt.pde` i Processing. De øvrige `.pde`-filer åbnes som faner i samme sketch.
4. Tryk på **Run**-knappen i Processing.

## Kontroller

- Klik på **Giv mad** for at åbne madmenuen.
- Vælg **Burger**, **Æble**, **Pizza** eller **Hele McDonald's**. Kalorier og vægt ændres først, når foderkuglen når Mads' mund.
- Klik på **Træn** for at åbne træningsmenuen.
- Vælg **Løb**, **Cykel**, **Fitness** eller **Marathon** for at bruge kalorier og tabe vægt.
- Kun én menu kan være åben ad gangen.
- Hvis Mads kommer over 20 kg, eksploderer han. Tryk på **R** for at starte forfra.

## Centrale funktioner

- Et McDonald's-inspireret rum med bestillingsdisk, menuskilte og madskål.
- Madskål med foderkugler og en spise-animation.
- Partikeleffekter, når Mads spiser, og ved eksplosionen.
- Vægt vises med to decimaler.
- Vægt begrænses til mellem 4 og 40 kg, og kalorier kan ikke blive negative.

## Programstruktur

`Pet_projekt.pde` er hovedprogrammet. Det opretter objekterne, viser menuerne og registrerer klik. Tegning af baggrund og madskål ligger i egne faner, så hovedprogrammet er lettere at læse.

- `Pet` repræsenterer Mads og tegner ham på skærmen.
- `SundhedsStatus` holder styr på vægt og kalorier.
- `Mad` beskriver én type mad og dens kalorier.
- `Traening` beskriver én træningsaktivitet og dens kalorieforbrug.
- `Partikel` bruges både til spise-animationen og eksplosions-effekten.
- `baggrund.pde` og `madskaal.pde` tegner miljøet.

## OOP i projektet

- **Klasser og objekter:** Programmet opretter blandt andet `Pet`, `Mad`, `Traening`, `SundhedsStatus` og `Partikel` som objekter.
- **Indkapsling:** `vaegt` og `kalorier` er `private` i `SundhedsStatus`. De kan kun ændres gennem `aendreVaegt()` og `aendreKalorier()`, som sørger for gyldige værdier.
- **Komposition:** Et `Pet` består af én `SundhedsStatus`, der oprettes i `Pet`-konstruktøren og kun hører til det kæledyr.
- **Samling af objekter:** En array med `Partikel`-objekter bruges til at vise flere partikler på én gang.

## Test

| Testcase | Forventet resultat |
| --- | --- |
| Åbn madmenu og derefter træningsmenu | Madmenuen lukker, når træningsmenuen åbner. |
| Vælg en madvare | En kugle flyver til munden, hvorefter kalorier og vægt stiger. |
| Vælg træning | Kalorier og vægt falder, men kalorier bliver aldrig negative. |
| Giv Mads meget mad | Ved en vægt over 20 kg vises eksplosionen og genstartsteksten. |
| Tryk på `R` efter eksplosion | Mads oprettes igen med startvægt på 5 kg. |

## Arbejdsfordeling og brug af AI

Projektet er udviklet af **Aquaxyy** og **Frederik-bot-glitch**. Arbejdet er løbende delt gennem Git og GitHub:

- Aquaxyy har blandt andet arbejdet med mad- og træningsfunktioner, baggrund, eksplosion og visuelle rettelser.
- Frederik-bot-glitch har blandt andet arbejdet med indkapsling, klassestruktur, madskål og spise-animation.

Generativ AI (ChatGPT/Codex) er brugt som sparringspartner til forklaringer af OOP, forslag til Processing-kode, fejlretning og dokumentation. Gruppen har selv valgt, tilpasset og samlet løsningerne i projektet.
