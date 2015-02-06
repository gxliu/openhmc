#
#                              .--------------. .----------------. .------------.
#                             | .------------. | .--------------. | .----------. |
#                             | | ____  ____ | | | ____    ____ | | |   ______ | |
#                             | ||_   ||   _|| | ||_   \  /   _|| | | .' ___  || |
#       ___  _ __   ___ _ __  | |  | |__| |  | | |  |   \/   |  | | |/ .'   \_|| |
#      / _ \| '_ \ / _ \ '_ \ | |  |  __  |  | | |  | |\  /| |  | | || |       | |
#       (_) | |_) |  __/ | | || | _| |  | |_ | | | _| |_\/_| |_ | | |\ `.___.'\| |
#      \___/| .__/ \___|_| |_|| ||____||____|| | ||_____||_____|| | | `._____.'| |
#           | |               | |            | | |              | | |          | |
#           |_|               | '------------' | '--------------' | '----------' |
#                              '--------------' '----------------' '------------'
#
#  openHMC - An Open Source Hybrid Memory Cube Controller
#  (C) Copyright 2014 Computer Architecture Group - University of Heidelberg
#  www.ziti.uni-heidelberg.de
#  B6, 26
#  68159 Mannheim
#  Germany
#
#  Contact: openhmc@ziti.uni-heidelberg.de
#  http://ra.ziti.uni-heidelberg.de/openhmc
#
#   This source file is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This source file is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with this source file.  If not, see <http://www.gnu.org/licenses/>.
#
#

#Leave untouched
+define+HMC_REQUESTER_IS_ACTIVE=0
+define+HMC_RESPONDER_IS_ACTIVE=0
+define+SIMULATION=1

###Include Sources
#Behavioral serializer and routing models
${OPENHMC_SIM}/tb/bfm/src/behavioral/deserializer.v
${OPENHMC_SIM}/tb/bfm/src/behavioral/serializer.v
${OPENHMC_SIM}/tb/bfm/src/behavioral/routing.v

#openHMC controller
-f ${OPENHMC_PATH}/rtl/hmc_controller/hmc_controller_top.f
+incdir+${OPENHMC_PATH}/rtl/include/

#Micron BFM model
-f ${OPENHMC_SIM}/bfm/hmc_bfm.f

#Include Register File and controller header
+incdir+${OPENHMC_SIM}/tb/bfm/src/rgm/openhmc/
+incdir+${OPENHMC_SIM}/tb/bfm/src/targets/

#Source top TB and DUT
-f ${OPENHMC_SIM}/tb/bfm/build/compile_tb_openhmc.f
${OPENHMC_SIM}/tb/bfm/src/tb_top_bfm.sv
${OPENHMC_SIM}/tb/bfm/src/targets/dut_openhmc_behavioral_bfm.sv
