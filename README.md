# Semismooth-Newton

MATLAB and Python code for the master thesis "Quadratisch regularisierter optimaler Transport"

Author: Robert Detaille (robert.detaille@tu-dortmund.de)

# Contents

**Methods** (used to generate opitmal transport plans)
```
ssn.m           regularized semismooth quasi-Newton method
ssnDual.m       two times regularized semismooth Newton method
sinkhorn.m      Sinkhorn algorithm
```

**Dependencies** (called by methods)
```
phi.m           objective function of the dual problem
phiDe.m         objective function of the regularized dual problem
```

**Plots and tables**
```
analysisSSNMeshIndependence1.m      table, mesh independence
analysisSSNMeshIndependence2.m      plot, mesh independence
analysisSSNOrderOfConvergence.m     plot, order of convergence
analysisSSNPerformance.m            table, perfomance
analysisSSNvsSinkhornIterations.m   plot, comparison of iterationen sinhorn.m vs ssn.m
analysisSSNvsSinkhornRuntime.m      plot, comparison of runtime sinkhorn.m vs ssn.m
densityMap.ipynb                    visualization of a 2d transport plan
```

**Cost functions**
```
costConc.m      concave cost function
costMetr.m      metric cost function
costQuad.m      quadratic cost function
```

**Marginals**
```
margA.m
margB.m
margBiNorm.m
margDirac.m
margExp.m
margNorm.m
margUni.m 
```
