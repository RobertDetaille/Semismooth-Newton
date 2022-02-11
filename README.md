# Semismooth-Newton

Code für die Masterarbeit "Quadratisch regularisierter optimaler Transport"

Autor: Robert Detaille (robert.detaille@tu-dortmund.de)

# Inhalt

**Verfahren**
```
ssn.m           Regularisiertes semiglattes Quasi-Newton-Verfahren
ssnDual.m       Doppelt regularisiertes semiglattes Newton-Verfahren
sinkhorn.m      Sinkhorn Algorithmus
```

**Hilfsfunktionen**
```
phi.m           Zielfunktion des regularisierten dualen Problems
phiDe.m         Zielfunktion des doppelt regularisierten dualen Problems
```

**Plots und Tabellen**
```
analysisSSNMeshIndependence1.m      Tabelle Gitterunabhängigket 
analysisSSNMeshIndependence2.m      Plot Gitterunabhängigket
analysisSSNOrderOfConvergence.m     Plot Konvergenzordnung
analysisSSNPerformance.m            Tabelle Perfomance
analysisSSNvsSinkhornIterations.m   Plot Vergleich Iterationen sinhorn.m vs ssn.m
analysisSSNvsSinkhornRuntime.m      Plot Vergleich Laufzeit sinkhorn.m vs ssn.m
densityMap.ipynb 
```

**Kostenfunktionen**
```
costConc.m      Konkave Kosten
costMetr.m      Metrische Kosten 
costQuad.m      Quadratische Kosten
```

**Marginale**
```
margA.m
margB.m
margBiNorm.m
margDirac.m
margExp.m
margNorm.m
margUni.m 
```
