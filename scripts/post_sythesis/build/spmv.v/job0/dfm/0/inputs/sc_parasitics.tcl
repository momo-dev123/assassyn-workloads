################################################################
# Constraint "slow" -> PEX corner "typical"
# Source file: /home/gaod/.sc/cache/lambdapdk-v0.1.38/lambdapdk/asap7/base/pex/openroad/typical.tcl
################################################################

# Adopted from: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/9895e23b5d4abd4610f8d55ccf8f5173e770375e/flow/platforms/asap7/setRC.tcl

# Liberty units are fF,kOhm
set_layer_rc -corner slow -layer M1 -capacitance 1.1368e-01 -resistance 1.3889e-01
set_layer_rc -corner slow -layer M2 -capacitance 1.3426e-01 -resistance 2.4222e-02
set_layer_rc -corner slow -layer M3 -capacitance 1.2918e-01 -resistance 2.4222e-02
set_layer_rc -corner slow -layer M4 -capacitance 1.1396e-01 -resistance 1.6778e-02
set_layer_rc -corner slow -layer M5 -capacitance 1.3323e-01 -resistance 1.4677e-02
set_layer_rc -corner slow -layer M6 -capacitance 1.1575e-01 -resistance 1.0371e-02
set_layer_rc -corner slow -layer M7 -capacitance 1.3293e-01 -resistance 9.6720e-03
set_layer_rc -corner slow -layer M8 -capacitance 1.1822e-01 -resistance 7.4310e-03
set_layer_rc -corner slow -layer M9 -capacitance 1.3497e-01 -resistance 6.8740e-03

set_layer_rc -corner slow -via V1 -resistance 1.72E-02
set_layer_rc -corner slow -via V2 -resistance 1.72E-02
set_layer_rc -corner slow -via V3 -resistance 1.72E-02
set_layer_rc -corner slow -via V4 -resistance 1.18E-02
set_layer_rc -corner slow -via V5 -resistance 1.18E-02
set_layer_rc -corner slow -via V6 -resistance 8.20E-03
set_layer_rc -corner slow -via V7 -resistance 8.20E-03
set_layer_rc -corner slow -via V8 -resistance 6.30E-03

################################################################
################################################################
# Constraint "fast" -> PEX corner "typical"
# Source file: /home/gaod/.sc/cache/lambdapdk-v0.1.38/lambdapdk/asap7/base/pex/openroad/typical.tcl
################################################################

# Adopted from: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/9895e23b5d4abd4610f8d55ccf8f5173e770375e/flow/platforms/asap7/setRC.tcl

# Liberty units are fF,kOhm
set_layer_rc -corner fast -layer M1 -capacitance 1.1368e-01 -resistance 1.3889e-01
set_layer_rc -corner fast -layer M2 -capacitance 1.3426e-01 -resistance 2.4222e-02
set_layer_rc -corner fast -layer M3 -capacitance 1.2918e-01 -resistance 2.4222e-02
set_layer_rc -corner fast -layer M4 -capacitance 1.1396e-01 -resistance 1.6778e-02
set_layer_rc -corner fast -layer M5 -capacitance 1.3323e-01 -resistance 1.4677e-02
set_layer_rc -corner fast -layer M6 -capacitance 1.1575e-01 -resistance 1.0371e-02
set_layer_rc -corner fast -layer M7 -capacitance 1.3293e-01 -resistance 9.6720e-03
set_layer_rc -corner fast -layer M8 -capacitance 1.1822e-01 -resistance 7.4310e-03
set_layer_rc -corner fast -layer M9 -capacitance 1.3497e-01 -resistance 6.8740e-03

set_layer_rc -corner fast -via V1 -resistance 1.72E-02
set_layer_rc -corner fast -via V2 -resistance 1.72E-02
set_layer_rc -corner fast -via V3 -resistance 1.72E-02
set_layer_rc -corner fast -via V4 -resistance 1.18E-02
set_layer_rc -corner fast -via V5 -resistance 1.18E-02
set_layer_rc -corner fast -via V6 -resistance 8.20E-03
set_layer_rc -corner fast -via V7 -resistance 8.20E-03
set_layer_rc -corner fast -via V8 -resistance 6.30E-03

################################################################
################################################################
# Constraint "typical" -> PEX corner "typical"
# Source file: /home/gaod/.sc/cache/lambdapdk-v0.1.38/lambdapdk/asap7/base/pex/openroad/typical.tcl
################################################################

# Adopted from: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/9895e23b5d4abd4610f8d55ccf8f5173e770375e/flow/platforms/asap7/setRC.tcl

# Liberty units are fF,kOhm
set_layer_rc -corner typical -layer M1 -capacitance 1.1368e-01 -resistance 1.3889e-01
set_layer_rc -corner typical -layer M2 -capacitance 1.3426e-01 -resistance 2.4222e-02
set_layer_rc -corner typical -layer M3 -capacitance 1.2918e-01 -resistance 2.4222e-02
set_layer_rc -corner typical -layer M4 -capacitance 1.1396e-01 -resistance 1.6778e-02
set_layer_rc -corner typical -layer M5 -capacitance 1.3323e-01 -resistance 1.4677e-02
set_layer_rc -corner typical -layer M6 -capacitance 1.1575e-01 -resistance 1.0371e-02
set_layer_rc -corner typical -layer M7 -capacitance 1.3293e-01 -resistance 9.6720e-03
set_layer_rc -corner typical -layer M8 -capacitance 1.1822e-01 -resistance 7.4310e-03
set_layer_rc -corner typical -layer M9 -capacitance 1.3497e-01 -resistance 6.8740e-03

set_layer_rc -corner typical -via V1 -resistance 1.72E-02
set_layer_rc -corner typical -via V2 -resistance 1.72E-02
set_layer_rc -corner typical -via V3 -resistance 1.72E-02
set_layer_rc -corner typical -via V4 -resistance 1.18E-02
set_layer_rc -corner typical -via V5 -resistance 1.18E-02
set_layer_rc -corner typical -via V6 -resistance 8.20E-03
set_layer_rc -corner typical -via V7 -resistance 8.20E-03
set_layer_rc -corner typical -via V8 -resistance 6.30E-03

################################################################
################################################################
# Constraint "default" -> PEX corner "typical"
# Source file: /home/gaod/.sc/cache/lambdapdk-v0.1.38/lambdapdk/asap7/base/pex/openroad/typical.tcl
################################################################

# Adopted from: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/9895e23b5d4abd4610f8d55ccf8f5173e770375e/flow/platforms/asap7/setRC.tcl

# Liberty units are fF,kOhm
set_layer_rc  -layer M1 -capacitance 1.1368e-01 -resistance 1.3889e-01
set_layer_rc  -layer M2 -capacitance 1.3426e-01 -resistance 2.4222e-02
set_layer_rc  -layer M3 -capacitance 1.2918e-01 -resistance 2.4222e-02
set_layer_rc  -layer M4 -capacitance 1.1396e-01 -resistance 1.6778e-02
set_layer_rc  -layer M5 -capacitance 1.3323e-01 -resistance 1.4677e-02
set_layer_rc  -layer M6 -capacitance 1.1575e-01 -resistance 1.0371e-02
set_layer_rc  -layer M7 -capacitance 1.3293e-01 -resistance 9.6720e-03
set_layer_rc  -layer M8 -capacitance 1.1822e-01 -resistance 7.4310e-03
set_layer_rc  -layer M9 -capacitance 1.3497e-01 -resistance 6.8740e-03

set_layer_rc  -via V1 -resistance 1.72E-02
set_layer_rc  -via V2 -resistance 1.72E-02
set_layer_rc  -via V3 -resistance 1.72E-02
set_layer_rc  -via V4 -resistance 1.18E-02
set_layer_rc  -via V5 -resistance 1.18E-02
set_layer_rc  -via V6 -resistance 8.20E-03
set_layer_rc  -via V7 -resistance 8.20E-03
set_layer_rc  -via V8 -resistance 6.30E-03

################################################################
