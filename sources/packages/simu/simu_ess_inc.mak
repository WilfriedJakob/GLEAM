#-----------------------------------------------------------------------------------------
#
# Makefile for MAKE Utility
#
# Include file for package "simu"    for ESS versions 
#
# This file provides the include for the ESS-based parallel version (External Simulation 
# Services).
# It is based on "simu_common_inc.mak".
#
# There are also two other alternative include files: 
#   simu_inc.mak      for the standard versions without parallelism of simulations and a
#                     pipe-based interface to external simulators or an interface to 
#                     MatPower/Matlab
#   simu_cec_inc.mak  for the standard version enhanced by the CEC'05 benchmarks
#
# There are two object groups defined in men_common_inc.mak for the versions with
#   - textual user interface (TUI) and the
#   - command line version (CLV).
#
#-----------------------------------------------------------------------------------------
# This is free software, which is governed by the Lesser GNU Public Licence (LGPL), 
# version 3, see the comment section at the end of the main program files or the 
# files "schalter.h".
#-----------------------------------------------------+----------------------------------+
#   Autor: W.Jakob                                    |   Stand: 09.01.2018              |
#-----------------------------------------------------+----------------------------------+


#----------------------------- common package include-file: ------------------------------
include $(SIMU)/simu_common_inc.mak


#-----------------------------------------------------------------------------------------
#      specific definition of objects:
#-----------------------------------------------------------------------------------------
SIMU_ESS_TUI  = $(SIMU_ALLG)  $(SIMU)/extSimuServKoppl.o  $(SIMU)/simucmen.o 
SIMU_ESS_CLV  = $(SIMU_ALLG)  $(SIMU)/extSimuServKoppl.o  


#-----------------------------------------------------------------------------------------
#      specific dependencies:
#-----------------------------------------------------------------------------------------
$(SIMU)/cec_sim.o : $(SYS)/sys.h       $(FBHM_INC)        $(CHAINDEF)        $(AUFG)/aufg.h     \
                    $(SIMU)/simu.h     $(SIMU)/simuInt.h  
$(SIMU)/simu_gsw.o: $(SIMU_ALL)        $(SIMU_TXT)        $(GLOB_TXT)        $(LGSW_INC)        \
                    $(BEW)/bew.h       $(APPL)/appl.h     $(WEBIO)/webIO.h   
$(SIMU)/simucmen.o: $(SIMU_ALL)        $(SIMU_TXT)        $(GLOB_TXT)        $(LGSW_INC)        \
                    $(BEW)/bew.h       $(MEN)/men.h       $(WEBIO)/webIO.h   $(AUFG)/aufg.h     

$(SIMU)/extSimuServKoppl.o: $(SIMU_ALL)      $(SIMU_TXT)      $(GLOB_TXT)      $(CHAINDEF)      \
                            $(AUFG)/aufg.h   $(WEBIO)/webIO.h  