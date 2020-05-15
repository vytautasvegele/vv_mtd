
## Pristatymas

Čia pateikiamas magistro baigiamojo darbo metu naudotas kodas tyrimams.
Tikėtina, jog dalis bus pakeista po katedrinio gynimo ir prieš viešąjį gynimą.

## Greitas paleidimas
Minimalią tyrimo versiją, atitinkanti 50 bičių šeimos dydį iki 2500 tikslo funkcijos įverčių galima išsibandyti paleidus `runs_python.sh`. Tokiu atveju bus išbandomi ABC, sABC, qABC, iqABC ir iqsABC algoritmai su darbe nurodytomis klasikinėmis funkcijomis. Šis bandymas turėtų trukti apie 10 minučių.
Tam reikės Python3.7 ir bibliotekų, nurodomų `requirements.txt`, tačiau turėtų užtekti matplotlib ir numpy.
Rezultatai surašomi į `logs` aplanką, juos geriausia atidaryti su teksto redaktoriumi, nes tekstas dalinai pritaikytas naudojimui LaTeX. Konvergavimo grafikai į `graphs` aplanką. Rekomenduojama žiūrėti į grafikus, kadangi rezultatų tekstas turi specialų formatavimą, kur Yres eilutės nurodo Wilcoxon testus tarp sABC ir ABC, o ZRes tarp iqsABC ir iqABC.

## Reikalavimai

Rekomenduojama kodą leisti Linux aplinkoje. Pats darbas atliktas naudojantis Windows Subsystem for Linux.

Modelio panaudojimui reikalingas NetLogo paketas. Jį galima gauti čia:
https://ccl.northwestern.edu/netlogo/
Rekomenduojama naudoti NetLogo 6.1 versiją. Senesnes versijas galima rasti šioje nuorodoje.
https://ccl.northwestern.edu/netlogo/oldversions.shtml
Modelis kreipiasi į Python kodą. Rekomenduojama naudoti Python 3.7.6 versiją. Papildomi bibliotekų reikalavimai Python kodui išvardinti `requirements.txt` dokumente. NetLogo meniu juostoje reikia pasirinkti Python nustatymą ir nurodyti Python interpretatoriaus vietą kompiuteryje.

Norint naudoti papildomas tikslo funkcijas, minimas darbe, reikės susikompiliuoti bendrą biblioteką `cec15.so`
Reikalingas kodas ir makefile pateiktas aplanke extra_functions. Sukurtą biblioteką reikia įdėti į šakninį kodo aplanką, ten pat, kur laikomas `run.py`.

Modelio veikimui reikalingi dokumentai:
`BBH-BumbleSpecies_UK_06.csv` - Naminių bičių informacija, reikalinga modeliui
`BBH-Flowerspecies_Suss_02.csv` - Modelio aplinkoje augančių augalų informacija
`BBH-I_Suss1.png` - Modelio aplinkos žemėlapis
`BBH-T_Suss1.txt` - Modelio parašuota aplinkos informacija
`modelis.nlogo` - Pats modelis
`run.py` - Algoritmus kviečiantis kodas. Hive aplankale turėtų būti kiekvieno algoritmo atskiras kodas:
(`Hive, HiveIQ, HiveIQS, HiveQ, HiveS`) python failai. Papildomai Hive aplanke pateikiamas `Utilities.py` skirtas konvergavimo grafikų brėžimui.
`cec15.so` bendra biblioteka ir jai reikalinga informacija laikoma input_data aplanke. 

## Naudojimas

### Modelis
Modeliu galima naudotis atsidarius modelis.nlogo dokumentą. Nesigilinus į NetLogo ir Bumble-BEEHAVE valdymo įrankius užtenka nuspausti SETUP ir RUN. Simuliacijos pradžioje sudaromos kelios bičių šeimos. Patenkinus spietimosi sąlygas, šeima kreipsis į run.py ir gaus naujo lizdo koordinates.

### Algoritmai (iqsABC ir sABC)

Pristatomus iqsABC ir sABC algoritmus galima išsibandyti atskirai paleidus run.py kodą.
Nekeitus kodo run.py pateiks skirtingus rezultatus pagal pateikiamus argumentus.

#### Tikslo funkcijų bandymai, algoritmų lyginimas

Pateikus vieną argumentą run.py atliks eksperimentą su viena iš tikslo funkcijų, jį paleidus 
`LD_LIBRARY_PATH="$(pwd):$LD_LIBRARY_PATH" python3 run.py $i`

Čia i atitinka funkcijos numerį. Toliau pateikiamas sąrašas funkcijų pagal nurodytą i.
Klasikinės tikslo funkcijos:

 1. Sferos
 2. Rosenbrock
 3. Rastrigin
 4. Ackley
 5. Schaffer
 6. Dixon
 7. Griewank
 8. Kupranugario
 9. Branin
 10. Schwefel
 
 Papildomos funkcijos:
 Likusios funkcijos nuo 11 iki 25 atitinka papildomas funkcijas nuo f1 iki f15

``LD_LIBRARY_PATH="$(pwd):$LD_LIBRARY_PATH"`` komanda reikalinga ctypes naudojimui, jog python kodas galėtų kreiptis į C kodu parašytas papildomas funkcijas.

Patogumui visas funkcijas galima išbandyti pasileidus `runs.sh`
Jeigu nepavyksta susikurti `cec15.so`  bendros bibliotekos, klasikines funkcijas galima išsibandyti su `runs_python.sh`

#### Algoritmo pritaikymas dalykinei sričiai (rankinis bandymas to, ką bandytų daryti modelis.nlogo)

Paleidus algoritmą su `python3 run.py` gausime sABC algoritmo pritaikymą aplinkos modeliui. Šiuo atveju bus naudojama 100 bičių ir iki 1000 tikslo funkcijos patikrinimų. Matplotlib turėtų grąžinti panašu paveikslėlį, kurį matytume 10-ame paveikslėlyje magistro baigiamojo darbo dokumente.

## Pastabos

Papildomos tikslo funkcijos paimtos iš https://github.com/P-N-Suganthan/CEC2015/blob/master/Expensive%20Problems.rar

ABC algoritmas parašytas ir keistas naudojantis kitos implementacijos pagrindu:
https://github.com/rwuilbercq/Hive
Hive licenzija:
The MIT License (MIT)
Copyright (C) 2017 Romain Wuilbercq

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

