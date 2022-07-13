/COM    Datei: TRIBEAM.GEO
/PREP7
/TITLE, Silizium-Dreifachstimmgabel

/COM     Materialeigenschaften Si(100)
EMOD=1.689E11   ! E-Modul [N/m2]
POIS=.0625      ! Poissonzahl
RHO=2329        ! Dichte [kg/m3]
DICK=.02e-3     ! Balkendicke [m]
EX,1,EMOD
NUXY,1,POIS
DENS,1,RHO
R,1,DICK

/COM Geometrie-Parameter:  alle Masse in [m]
AUFH=0.2e-3     ! laterale Einspannung
LANG=1.5e-3     ! halbe Balkenlaenge
X1=AUFH+LANG
Y1=0.20e-3      ! aeussere Balkenbreite
Y2=0.05e-3      ! Balkenabstand
Y3=0.40e-3      ! mittlere Balkenbreite

/COM     ANSYS-Parameter
ELTY=63         ! Elementtyp
ELGR=.05e-3     ! Elementgroesse
/PBC,ALL,2

/COM     Knotenpunkte generieren
K,1
K,2,X1
K,3,X1,Y1
K,4,AUFH,Y1
K,5,AUFH,Y1+Y2
K,6,X1,Y1+Y2
K,7,X1,Y1+Y2+Y3
K,8,AUFH,Y1+Y2+Y3
K,9,AUFH,Y1+2*Y2+Y3
K,10,X1,Y1+2*Y2+Y3
K,11,X1,2*Y1+2*Y2+Y3
K,12,,2*Y1+2*Y2+Y3
/COM     Linien generieren
L,1,2
RP11,1,1
L,12,1
/COM     Flaechen generieren
AL,ALL
LOCAL,11,,X1
ARSYM,1,ALL
NUMMRG,KPOI,1.0E-7
/COM    Elemente generieren:
/COM    automatische Vernetzung
ET,1,ELTY
ELSI,ELGR
AMESH,1
/COM   Beginne Vernetzung von rechts
LOCAL,12,,2*X1
AMESH,2
NUMMRG,NODE,1.0E-7
/COM    Randbedingungen
CSYS
/COM    linke Seite ganz eingespannt
NSEL,X
D,ALL,ALL
NSEL,X,2*X1
d,all,all
NALL
WSORT,X
TOTAL,TOTL,1

/com  ===============  Berechnung starten
!     Datei: TRIBEAM.K2 - modale Analyse
!     Datei: TRIBEAM.K6 - harmonische Analyse
/com  ===============
