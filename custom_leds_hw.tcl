# TCL File Generated by Component Editor 17.1
# Sun Mar 08 15:06:32 MSK 2020
# DO NOT MODIFY


# 
# custom_leds "Custom LEDs" v1.0
# aneemu 2020.03.08.15:06:32
# Custom LED driver IP
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module custom_leds
# 
set_module_property DESCRIPTION "Custom LED driver IP"
set_module_property NAME custom_leds
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR aneemu
set_module_property DISPLAY_NAME "Custom LEDs"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL custom_leds
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file custom_leds.sv SYSTEM_VERILOG PATH ip/custom_leds/custom_leds.sv TOP_LEVEL_FILE
add_fileset_file pwm.sv SYSTEM_VERILOG PATH ip/custom_leds/pwm.sv


# 
# parameters
# 
add_parameter no_leds INTEGER 20 ""
set_parameter_property no_leds DEFAULT_VALUE 20
set_parameter_property no_leds DISPLAY_NAME no_leds
set_parameter_property no_leds TYPE INTEGER
set_parameter_property no_leds UNITS None
set_parameter_property no_leds ALLOWED_RANGES -2147483648:2147483647
set_parameter_property no_leds DESCRIPTION ""
set_parameter_property no_leds HDL_PARAMETER true
add_parameter res INTEGER 8
set_parameter_property res DEFAULT_VALUE 8
set_parameter_property res DISPLAY_NAME res
set_parameter_property res TYPE INTEGER
set_parameter_property res UNITS None
set_parameter_property res ALLOWED_RANGES -2147483648:2147483647
set_parameter_property res HDL_PARAMETER true
add_parameter width INTEGER 20 ""
set_parameter_property width DEFAULT_VALUE 20
set_parameter_property width DISPLAY_NAME width
set_parameter_property width TYPE INTEGER
set_parameter_property width UNITS None
set_parameter_property width ALLOWED_RANGES -2147483648:2147483647
set_parameter_property width DESCRIPTION ""
set_parameter_property width HDL_PARAMETER true
add_parameter max INTEGER 999999 ""
set_parameter_property max DEFAULT_VALUE 999999
set_parameter_property max DISPLAY_NAME max
set_parameter_property max TYPE INTEGER
set_parameter_property max UNITS None
set_parameter_property max ALLOWED_RANGES -2147483648:2147483647
set_parameter_property max DESCRIPTION ""
set_parameter_property max HDL_PARAMETER true
add_parameter duty_min INTEGER 24999 ""
set_parameter_property duty_min DEFAULT_VALUE 24999
set_parameter_property duty_min DISPLAY_NAME duty_min
set_parameter_property duty_min TYPE INTEGER
set_parameter_property duty_min UNITS None
set_parameter_property duty_min ALLOWED_RANGES -2147483648:2147483647
set_parameter_property duty_min DESCRIPTION ""
set_parameter_property duty_min HDL_PARAMETER true
add_parameter duty_max INTEGER 124999 ""
set_parameter_property duty_max DEFAULT_VALUE 124999
set_parameter_property duty_max DISPLAY_NAME duty_max
set_parameter_property duty_max TYPE INTEGER
set_parameter_property duty_max UNITS None
set_parameter_property duty_max ALLOWED_RANGES -2147483648:2147483647
set_parameter_property duty_max DESCRIPTION ""
set_parameter_property duty_max HDL_PARAMETER true


# 
# module assignments
# 
set_module_assignment embeddedsw.dts.compatible dev,custom-leds
set_module_assignment embeddedsw.dts.group leds
set_module_assignment embeddedsw.dts.vendor dsa


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point avs_s0
# 
add_interface avs_s0 avalon end
set_interface_property avs_s0 addressUnits WORDS
set_interface_property avs_s0 associatedClock clock
set_interface_property avs_s0 associatedReset reset
set_interface_property avs_s0 bitsPerSymbol 8
set_interface_property avs_s0 burstOnBurstBoundariesOnly false
set_interface_property avs_s0 burstcountUnits WORDS
set_interface_property avs_s0 explicitAddressSpan 0
set_interface_property avs_s0 holdTime 0
set_interface_property avs_s0 linewrapBursts false
set_interface_property avs_s0 maximumPendingReadTransactions 0
set_interface_property avs_s0 maximumPendingWriteTransactions 0
set_interface_property avs_s0 readLatency 0
set_interface_property avs_s0 readWaitTime 1
set_interface_property avs_s0 setupTime 0
set_interface_property avs_s0 timingUnits Cycles
set_interface_property avs_s0 writeWaitTime 0
set_interface_property avs_s0 ENABLED true
set_interface_property avs_s0 EXPORT_OF ""
set_interface_property avs_s0 PORT_NAME_MAP ""
set_interface_property avs_s0 CMSIS_SVD_VARIABLES ""
set_interface_property avs_s0 SVD_ADDRESS_GROUP ""

add_interface_port avs_s0 avs_s0_address address Input 1
add_interface_port avs_s0 avs_s0_read read Input 1
add_interface_port avs_s0 avs_s0_write write Input 1
add_interface_port avs_s0 avs_s0_readdata readdata Output 32
add_interface_port avs_s0 avs_s0_writedata writedata Input 32
set_interface_assignment avs_s0 embeddedsw.configuration.isFlash 0
set_interface_assignment avs_s0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avs_s0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avs_s0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point leds
# 
add_interface leds conduit end
set_interface_property leds associatedClock clock
set_interface_property leds associatedReset reset
set_interface_property leds ENABLED true
set_interface_property leds EXPORT_OF ""
set_interface_property leds PORT_NAME_MAP ""
set_interface_property leds CMSIS_SVD_VARIABLES ""
set_interface_property leds SVD_ADDRESS_GROUP ""

add_interface_port leds leds new_signal Output no_leds

