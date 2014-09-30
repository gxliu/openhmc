/*
 *                              .--------------. .----------------. .------------.
 *                             | .------------. | .--------------. | .----------. |
 *                             | | ____  ____ | | | ____    ____ | | |   ______ | |
 *                             | ||_   ||   _|| | ||_   \  /   _|| | | .' ___  || |
 *       ___  _ __   ___ _ __  | |  | |__| |  | | |  |   \/   |  | | |/ .'   \_|| |
 *      / _ \| '_ \ / _ \ '_ \ | |  |  __  |  | | |  | |\  /| |  | | || |       | |
 *       (_) | |_) |  __/ | | || | _| |  | |_ | | | _| |_\/_| |_ | | |\ `.___.'\| |
 *      \___/| .__/ \___|_| |_|| ||____||____|| | ||_____||_____|| | | `._____.'| |
 *           | |               | |            | | |              | | |          | |
 *           |_|               | '------------' | '--------------' | '----------' |
 *                              '--------------' '----------------' '------------'
 *
 *  openHMC - An Open Source Hybrid Memory Cube Controller
 *  (C) Copyright 2014 Computer Architecture Group - University of Heidelberg
 *  www.ziti.uni-heidelberg.de
 *  B6, 26
 *  68159 Mannheim
 *  Germany
 *
 *  Contact: openhmc@ziti.uni-heidelberg.de
 *  http://ra.ziti.uni-heidelberg.de/openhmc
 *
 *   This source file is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Lesser General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This source file is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public License
 *   along with this source file.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  Module name: crc_128bit_pipe
 *
 *
 *
 *  Description:  If valid is set the CRC value for the input inData will arrive in
 *                the next cycle on the crc output.
 *
 *  Note:         Currently the initialization value of the CRC register is 0, if
 *                this must be changed to all 1s then the calculation must also take
 *                into account whether an even or odd number of CRC bits feeds back
 *                into the CRC output bits. This is due to the used XOR gates. When
 *                the reset is 0 then the CRC feedback values have no effect as:
 *                a XOR 0 = a, but when reset is 1 then a XOR 1 = !a so all value
 *                with an even number of CRC feedback paths remain unchanged, while
 *                those with an odd number must be inverted!
 */

module crc_128_init (
    //----------------------------------
    //----SYSTEM INTERFACE
    //----------------------------------
    input  wire         clk        ,
    input  wire         res_n      ,

    //----------------------------------
    //----Input
    //----------------------------------
    input  wire [127:0] inData     ,
    // input  wire         inValid    ,
    // input  wire         inNew      ,

    //----------------------------------
    //----Output
    //----------------------------------
    output reg  [31:0]  crc    //This is also the remainder for the next crc
    // output reg          crcValid
);

// reg [31:0] crc;
// reg remainderStartNew;
// reg remainderValid;

`ifdef ASYNC_RES
always @(posedge clk or negedge res_n) `else
always @(posedge clk) `endif
begin
if (!res_n) begin
    crc      <= 32'h0;
    // remainderStartNew <= 1'b0;
end
else begin
    // remainderStartNew <= inNew;
    // crcValid    <= inValid;

    // if(inValid) begin   //TODO DEBUG

        crc[31]  <= inData[2]^inData[5]^inData[10]^inData[12]^inData[13]^inData[14]^inData[16]^inData[17]^inData[20]^inData[21]^inData[23]^inData[25]^inData[26]^inData[28]^inData[32]^inData[34]^inData[36]^inData[40]^inData[41]^inData[43]^inData[45]^inData[47]^inData[49]^inData[51]^inData[53]^inData[54]^inData[57]^inData[58]^inData[60]^inData[61]^inData[64]^inData[65]^inData[66]^inData[71]^inData[74]^inData[76]^inData[77]^inData[78]^inData[80]^inData[81]^inData[82]^inData[84]^inData[92]^inData[93]^inData[94]^inData[100]^inData[102]^inData[103]^inData[104]^inData[105]^inData[106]^inData[108]^inData[111]^inData[115]^inData[116]^inData[119]^inData[121]^inData[122]^inData[125]^inData[126];
        crc[30]  <= inData[3]^inData[6]^inData[11]^inData[13]^inData[14]^inData[15]^inData[17]^inData[18]^inData[21]^inData[22]^inData[24]^inData[26]^inData[27]^inData[29]^inData[33]^inData[35]^inData[37]^inData[41]^inData[42]^inData[44]^inData[46]^inData[48]^inData[50]^inData[52]^inData[54]^inData[55]^inData[58]^inData[59]^inData[61]^inData[62]^inData[65]^inData[66]^inData[67]^inData[72]^inData[75]^inData[77]^inData[78]^inData[79]^inData[81]^inData[82]^inData[83]^inData[85]^inData[93]^inData[94]^inData[95]^inData[101]^inData[103]^inData[104]^inData[105]^inData[106]^inData[107]^inData[109]^inData[112]^inData[116]^inData[117]^inData[120]^inData[122]^inData[123]^inData[126]^inData[127];
        crc[29]  <= inData[2]^inData[4]^inData[5]^inData[7]^inData[10]^inData[13]^inData[15]^inData[17]^inData[18]^inData[19]^inData[20]^inData[21]^inData[22]^inData[26]^inData[27]^inData[30]^inData[32]^inData[38]^inData[40]^inData[41]^inData[42]^inData[54]^inData[55]^inData[56]^inData[57]^inData[58]^inData[59]^inData[61]^inData[62]^inData[63]^inData[64]^inData[65]^inData[67]^inData[68]^inData[71]^inData[73]^inData[74]^inData[77]^inData[79]^inData[81]^inData[83]^inData[86]^inData[92]^inData[93]^inData[95]^inData[96]^inData[100]^inData[103]^inData[107]^inData[110]^inData[111]^inData[113]^inData[115]^inData[116]^inData[117]^inData[118]^inData[119]^inData[122]^inData[123]^inData[124]^inData[125]^inData[126]^inData[127];
        crc[28]  <= inData[0]^inData[2]^inData[3]^inData[6]^inData[8]^inData[10]^inData[11]^inData[12]^inData[13]^inData[17]^inData[18]^inData[19]^inData[22]^inData[25]^inData[26]^inData[27]^inData[31]^inData[32]^inData[33]^inData[34]^inData[36]^inData[39]^inData[40]^inData[42]^inData[45]^inData[47]^inData[49]^inData[51]^inData[53]^inData[54]^inData[55]^inData[56]^inData[59]^inData[61]^inData[62]^inData[63]^inData[68]^inData[69]^inData[71]^inData[72]^inData[75]^inData[76]^inData[77]^inData[81]^inData[87]^inData[92]^inData[96]^inData[97]^inData[100]^inData[101]^inData[102]^inData[103]^inData[105]^inData[106]^inData[112]^inData[114]^inData[115]^inData[117]^inData[118]^inData[120]^inData[121]^inData[122]^inData[123]^inData[124]^inData[127];
        crc[27]  <= inData[0]^inData[1]^inData[2]^inData[3]^inData[4]^inData[5]^inData[7]^inData[9]^inData[10]^inData[11]^inData[16]^inData[17]^inData[18]^inData[19]^inData[21]^inData[25]^inData[27]^inData[33]^inData[35]^inData[36]^inData[37]^inData[45]^inData[46]^inData[47]^inData[48]^inData[49]^inData[50]^inData[51]^inData[52]^inData[53]^inData[55]^inData[56]^inData[58]^inData[61]^inData[62]^inData[63]^inData[65]^inData[66]^inData[69]^inData[70]^inData[71]^inData[72]^inData[73]^inData[74]^inData[80]^inData[81]^inData[84]^inData[88]^inData[92]^inData[94]^inData[97]^inData[98]^inData[100]^inData[101]^inData[105]^inData[107]^inData[108]^inData[111]^inData[113]^inData[118]^inData[123]^inData[124]^inData[126];
        crc[26]  <= inData[0]^inData[1]^inData[2]^inData[3]^inData[4]^inData[5]^inData[6]^inData[8]^inData[10]^inData[11]^inData[12]^inData[17]^inData[18]^inData[19]^inData[20]^inData[22]^inData[26]^inData[28]^inData[34]^inData[36]^inData[37]^inData[38]^inData[46]^inData[47]^inData[48]^inData[49]^inData[50]^inData[51]^inData[52]^inData[53]^inData[54]^inData[56]^inData[57]^inData[59]^inData[62]^inData[63]^inData[64]^inData[66]^inData[67]^inData[70]^inData[71]^inData[72]^inData[73]^inData[74]^inData[75]^inData[81]^inData[82]^inData[85]^inData[89]^inData[93]^inData[95]^inData[98]^inData[99]^inData[101]^inData[102]^inData[106]^inData[108]^inData[109]^inData[112]^inData[114]^inData[119]^inData[124]^inData[125]^inData[127];
        crc[25]  <= inData[0]^inData[1]^inData[3]^inData[4]^inData[6]^inData[7]^inData[9]^inData[10]^inData[11]^inData[14]^inData[16]^inData[17]^inData[18]^inData[19]^inData[25]^inData[26]^inData[27]^inData[28]^inData[29]^inData[32]^inData[34]^inData[35]^inData[36]^inData[37]^inData[38]^inData[39]^inData[40]^inData[41]^inData[43]^inData[45]^inData[48]^inData[50]^inData[52]^inData[55]^inData[61]^inData[63]^inData[66]^inData[67]^inData[68]^inData[72]^inData[73]^inData[75]^inData[77]^inData[78]^inData[80]^inData[81]^inData[83]^inData[84]^inData[86]^inData[90]^inData[92]^inData[93]^inData[96]^inData[99]^inData[104]^inData[105]^inData[106]^inData[107]^inData[108]^inData[109]^inData[110]^inData[111]^inData[113]^inData[116]^inData[119]^inData[120]^inData[121]^inData[122];
        crc[24]  <= inData[1]^inData[2]^inData[4]^inData[5]^inData[7]^inData[8]^inData[10]^inData[11]^inData[12]^inData[15]^inData[17]^inData[18]^inData[19]^inData[20]^inData[26]^inData[27]^inData[28]^inData[29]^inData[30]^inData[33]^inData[35]^inData[36]^inData[37]^inData[38]^inData[39]^inData[40]^inData[41]^inData[42]^inData[44]^inData[46]^inData[49]^inData[51]^inData[53]^inData[56]^inData[62]^inData[64]^inData[67]^inData[68]^inData[69]^inData[73]^inData[74]^inData[76]^inData[78]^inData[79]^inData[81]^inData[82]^inData[84]^inData[85]^inData[87]^inData[91]^inData[93]^inData[94]^inData[97]^inData[100]^inData[105]^inData[106]^inData[107]^inData[108]^inData[109]^inData[110]^inData[111]^inData[112]^inData[114]^inData[117]^inData[120]^inData[121]^inData[122]^inData[123];
        crc[23]  <= inData[2]^inData[3]^inData[5]^inData[6]^inData[8]^inData[9]^inData[11]^inData[12]^inData[13]^inData[16]^inData[18]^inData[19]^inData[20]^inData[21]^inData[27]^inData[28]^inData[29]^inData[30]^inData[31]^inData[34]^inData[36]^inData[37]^inData[38]^inData[39]^inData[40]^inData[41]^inData[42]^inData[43]^inData[45]^inData[47]^inData[50]^inData[52]^inData[54]^inData[57]^inData[63]^inData[65]^inData[68]^inData[69]^inData[70]^inData[74]^inData[75]^inData[77]^inData[79]^inData[80]^inData[82]^inData[83]^inData[85]^inData[86]^inData[88]^inData[92]^inData[94]^inData[95]^inData[98]^inData[101]^inData[106]^inData[107]^inData[108]^inData[109]^inData[110]^inData[111]^inData[112]^inData[113]^inData[115]^inData[118]^inData[121]^inData[122]^inData[123]^inData[124];
        crc[22]  <= inData[3]^inData[4]^inData[6]^inData[7]^inData[9]^inData[10]^inData[12]^inData[13]^inData[14]^inData[17]^inData[19]^inData[20]^inData[21]^inData[22]^inData[28]^inData[29]^inData[30]^inData[31]^inData[32]^inData[35]^inData[37]^inData[38]^inData[39]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[46]^inData[48]^inData[51]^inData[53]^inData[55]^inData[58]^inData[64]^inData[66]^inData[69]^inData[70]^inData[71]^inData[75]^inData[76]^inData[78]^inData[80]^inData[81]^inData[83]^inData[84]^inData[86]^inData[87]^inData[89]^inData[93]^inData[95]^inData[96]^inData[99]^inData[102]^inData[107]^inData[108]^inData[109]^inData[110]^inData[111]^inData[112]^inData[113]^inData[114]^inData[116]^inData[119]^inData[122]^inData[123]^inData[124]^inData[125];
        crc[21]  <= inData[4]^inData[5]^inData[7]^inData[8]^inData[10]^inData[11]^inData[13]^inData[14]^inData[15]^inData[18]^inData[20]^inData[21]^inData[22]^inData[23]^inData[29]^inData[30]^inData[31]^inData[32]^inData[33]^inData[36]^inData[38]^inData[39]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[45]^inData[47]^inData[49]^inData[52]^inData[54]^inData[56]^inData[59]^inData[65]^inData[67]^inData[70]^inData[71]^inData[72]^inData[76]^inData[77]^inData[79]^inData[81]^inData[82]^inData[84]^inData[85]^inData[87]^inData[88]^inData[90]^inData[94]^inData[96]^inData[97]^inData[100]^inData[103]^inData[108]^inData[109]^inData[110]^inData[111]^inData[112]^inData[113]^inData[114]^inData[115]^inData[117]^inData[120]^inData[123]^inData[124]^inData[125]^inData[126];
        crc[20]  <= inData[0]^inData[5]^inData[6]^inData[8]^inData[9]^inData[11]^inData[12]^inData[14]^inData[15]^inData[16]^inData[19]^inData[21]^inData[22]^inData[23]^inData[24]^inData[30]^inData[31]^inData[32]^inData[33]^inData[34]^inData[37]^inData[39]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[45]^inData[46]^inData[48]^inData[50]^inData[53]^inData[55]^inData[57]^inData[60]^inData[66]^inData[68]^inData[71]^inData[72]^inData[73]^inData[77]^inData[78]^inData[80]^inData[82]^inData[83]^inData[85]^inData[86]^inData[88]^inData[89]^inData[91]^inData[95]^inData[97]^inData[98]^inData[101]^inData[104]^inData[109]^inData[110]^inData[111]^inData[112]^inData[113]^inData[114]^inData[115]^inData[116]^inData[118]^inData[121]^inData[124]^inData[125]^inData[126]^inData[127];
        crc[19]  <= inData[1]^inData[2]^inData[5]^inData[6]^inData[7]^inData[9]^inData[14]^inData[15]^inData[21]^inData[22]^inData[24]^inData[26]^inData[28]^inData[31]^inData[33]^inData[35]^inData[36]^inData[38]^inData[42]^inData[44]^inData[46]^inData[53]^inData[56]^inData[57]^inData[60]^inData[64]^inData[65]^inData[66]^inData[67]^inData[69]^inData[71]^inData[72]^inData[73]^inData[76]^inData[77]^inData[79]^inData[80]^inData[82]^inData[83]^inData[86]^inData[87]^inData[89]^inData[90]^inData[93]^inData[94]^inData[96]^inData[98]^inData[99]^inData[100]^inData[103]^inData[104]^inData[106]^inData[108]^inData[110]^inData[112]^inData[113]^inData[114]^inData[117]^inData[121]^inData[127];
        crc[18]  <= inData[3]^inData[5]^inData[6]^inData[7]^inData[8]^inData[12]^inData[13]^inData[14]^inData[15]^inData[17]^inData[20]^inData[21]^inData[22]^inData[26]^inData[27]^inData[28]^inData[29]^inData[37]^inData[39]^inData[40]^inData[41]^inData[49]^inData[51]^inData[53]^inData[60]^inData[64]^inData[67]^inData[68]^inData[70]^inData[71]^inData[72]^inData[73]^inData[76]^inData[82]^inData[83]^inData[87]^inData[88]^inData[90]^inData[91]^inData[92]^inData[93]^inData[95]^inData[97]^inData[99]^inData[101]^inData[102]^inData[103]^inData[106]^inData[107]^inData[108]^inData[109]^inData[113]^inData[114]^inData[116]^inData[118]^inData[119]^inData[121]^inData[125]^inData[126];
        crc[17]  <= inData[0]^inData[4]^inData[6]^inData[7]^inData[8]^inData[9]^inData[13]^inData[14]^inData[15]^inData[16]^inData[18]^inData[21]^inData[22]^inData[23]^inData[27]^inData[28]^inData[29]^inData[30]^inData[38]^inData[40]^inData[41]^inData[42]^inData[50]^inData[52]^inData[54]^inData[61]^inData[65]^inData[68]^inData[69]^inData[71]^inData[72]^inData[73]^inData[74]^inData[77]^inData[83]^inData[84]^inData[88]^inData[89]^inData[91]^inData[92]^inData[93]^inData[94]^inData[96]^inData[98]^inData[100]^inData[102]^inData[103]^inData[104]^inData[107]^inData[108]^inData[109]^inData[110]^inData[114]^inData[115]^inData[117]^inData[119]^inData[120]^inData[122]^inData[126]^inData[127];
        crc[16]  <= inData[0]^inData[1]^inData[2]^inData[7]^inData[8]^inData[9]^inData[12]^inData[13]^inData[15]^inData[19]^inData[20]^inData[21]^inData[22]^inData[24]^inData[25]^inData[26]^inData[29]^inData[30]^inData[31]^inData[32]^inData[34]^inData[36]^inData[39]^inData[40]^inData[42]^inData[45]^inData[47]^inData[49]^inData[54]^inData[55]^inData[57]^inData[58]^inData[60]^inData[61]^inData[62]^inData[64]^inData[65]^inData[69]^inData[70]^inData[71]^inData[72]^inData[73]^inData[75]^inData[76]^inData[77]^inData[80]^inData[81]^inData[82]^inData[85]^inData[89]^inData[90]^inData[95]^inData[97]^inData[99]^inData[100]^inData[101]^inData[102]^inData[106]^inData[109]^inData[110]^inData[118]^inData[119]^inData[120]^inData[122]^inData[123]^inData[125]^inData[126]^inData[127];
        crc[15]  <= inData[0]^inData[1]^inData[3]^inData[5]^inData[8]^inData[9]^inData[12]^inData[17]^inData[22]^inData[27]^inData[28]^inData[30]^inData[31]^inData[33]^inData[34]^inData[35]^inData[36]^inData[37]^inData[45]^inData[46]^inData[47]^inData[48]^inData[49]^inData[50]^inData[51]^inData[53]^inData[54]^inData[55]^inData[56]^inData[57]^inData[59]^inData[60]^inData[62]^inData[63]^inData[64]^inData[70]^inData[72]^inData[73]^inData[80]^inData[83]^inData[84]^inData[86]^inData[90]^inData[91]^inData[92]^inData[93]^inData[94]^inData[96]^inData[98]^inData[101]^inData[104]^inData[105]^inData[106]^inData[107]^inData[108]^inData[110]^inData[115]^inData[116]^inData[120]^inData[122]^inData[123]^inData[124]^inData[125]^inData[127];
        crc[14]  <= inData[0]^inData[1]^inData[4]^inData[5]^inData[6]^inData[9]^inData[12]^inData[14]^inData[16]^inData[17]^inData[18]^inData[20]^inData[21]^inData[25]^inData[26]^inData[29]^inData[31]^inData[35]^inData[37]^inData[38]^inData[40]^inData[41]^inData[43]^inData[45]^inData[46]^inData[48]^inData[50]^inData[52]^inData[53]^inData[55]^inData[56]^inData[63]^inData[66]^inData[73]^inData[76]^inData[77]^inData[78]^inData[80]^inData[82]^inData[85]^inData[87]^inData[91]^inData[95]^inData[97]^inData[99]^inData[100]^inData[103]^inData[104]^inData[107]^inData[109]^inData[115]^inData[117]^inData[119]^inData[122]^inData[123]^inData[124];
        crc[13]  <= inData[1]^inData[2]^inData[5]^inData[6]^inData[7]^inData[10]^inData[13]^inData[15]^inData[17]^inData[18]^inData[19]^inData[21]^inData[22]^inData[26]^inData[27]^inData[30]^inData[32]^inData[36]^inData[38]^inData[39]^inData[41]^inData[42]^inData[44]^inData[46]^inData[47]^inData[49]^inData[51]^inData[53]^inData[54]^inData[56]^inData[57]^inData[64]^inData[67]^inData[74]^inData[77]^inData[78]^inData[79]^inData[81]^inData[83]^inData[86]^inData[88]^inData[92]^inData[96]^inData[98]^inData[100]^inData[101]^inData[104]^inData[105]^inData[108]^inData[110]^inData[116]^inData[118]^inData[120]^inData[123]^inData[124]^inData[125];
        crc[12]  <= inData[0]^inData[2]^inData[3]^inData[6]^inData[7]^inData[8]^inData[11]^inData[14]^inData[16]^inData[18]^inData[19]^inData[20]^inData[22]^inData[23]^inData[27]^inData[28]^inData[31]^inData[33]^inData[37]^inData[39]^inData[40]^inData[42]^inData[43]^inData[45]^inData[47]^inData[48]^inData[50]^inData[52]^inData[54]^inData[55]^inData[57]^inData[58]^inData[65]^inData[68]^inData[75]^inData[78]^inData[79]^inData[80]^inData[82]^inData[84]^inData[87]^inData[89]^inData[93]^inData[97]^inData[99]^inData[101]^inData[102]^inData[105]^inData[106]^inData[109]^inData[111]^inData[117]^inData[119]^inData[121]^inData[124]^inData[125]^inData[126];
        crc[11]  <= inData[1]^inData[3]^inData[4]^inData[7]^inData[8]^inData[9]^inData[12]^inData[15]^inData[17]^inData[19]^inData[20]^inData[21]^inData[23]^inData[24]^inData[28]^inData[29]^inData[32]^inData[34]^inData[38]^inData[40]^inData[41]^inData[43]^inData[44]^inData[46]^inData[48]^inData[49]^inData[51]^inData[53]^inData[55]^inData[56]^inData[58]^inData[59]^inData[66]^inData[69]^inData[76]^inData[79]^inData[80]^inData[81]^inData[83]^inData[85]^inData[88]^inData[90]^inData[94]^inData[98]^inData[100]^inData[102]^inData[103]^inData[106]^inData[107]^inData[110]^inData[112]^inData[118]^inData[120]^inData[122]^inData[125]^inData[126]^inData[127];
        crc[10]  <= inData[4]^inData[8]^inData[9]^inData[12]^inData[14]^inData[17]^inData[18]^inData[22]^inData[23]^inData[24]^inData[26]^inData[28]^inData[29]^inData[30]^inData[32]^inData[33]^inData[34]^inData[35]^inData[36]^inData[39]^inData[40]^inData[42]^inData[43]^inData[44]^inData[50]^inData[51]^inData[52]^inData[53]^inData[56]^inData[58]^inData[59]^inData[61]^inData[64]^inData[65]^inData[66]^inData[67]^inData[70]^inData[71]^inData[74]^inData[76]^inData[78]^inData[86]^inData[89]^inData[91]^inData[92]^inData[93]^inData[94]^inData[95]^inData[99]^inData[100]^inData[101]^inData[102]^inData[105]^inData[106]^inData[107]^inData[113]^inData[115]^inData[116]^inData[122]^inData[123]^inData[125]^inData[127];
        crc[ 9]  <= inData[0]^inData[2]^inData[9]^inData[12]^inData[14]^inData[15]^inData[16]^inData[17]^inData[18]^inData[19]^inData[20]^inData[21]^inData[24]^inData[26]^inData[27]^inData[28]^inData[29]^inData[30]^inData[31]^inData[32]^inData[33]^inData[35]^inData[37]^inData[44]^inData[47]^inData[49]^inData[52]^inData[58]^inData[59]^inData[61]^inData[62]^inData[64]^inData[67]^inData[68]^inData[72]^inData[74]^inData[75]^inData[76]^inData[78]^inData[79]^inData[80]^inData[81]^inData[82]^inData[84]^inData[87]^inData[90]^inData[95]^inData[96]^inData[101]^inData[104]^inData[105]^inData[107]^inData[111]^inData[114]^inData[115]^inData[117]^inData[119]^inData[121]^inData[122]^inData[123]^inData[124]^inData[125];
        crc[ 8]  <= inData[1]^inData[3]^inData[10]^inData[13]^inData[15]^inData[16]^inData[17]^inData[18]^inData[19]^inData[20]^inData[21]^inData[22]^inData[25]^inData[27]^inData[28]^inData[29]^inData[30]^inData[31]^inData[32]^inData[33]^inData[34]^inData[36]^inData[38]^inData[45]^inData[48]^inData[50]^inData[53]^inData[59]^inData[60]^inData[62]^inData[63]^inData[65]^inData[68]^inData[69]^inData[73]^inData[75]^inData[76]^inData[77]^inData[79]^inData[80]^inData[81]^inData[82]^inData[83]^inData[85]^inData[88]^inData[91]^inData[96]^inData[97]^inData[102]^inData[105]^inData[106]^inData[108]^inData[112]^inData[115]^inData[116]^inData[118]^inData[120]^inData[122]^inData[123]^inData[124]^inData[125]^inData[126];
        crc[ 7]  <= inData[0]^inData[2]^inData[4]^inData[11]^inData[14]^inData[16]^inData[17]^inData[18]^inData[19]^inData[20]^inData[21]^inData[22]^inData[23]^inData[26]^inData[28]^inData[29]^inData[30]^inData[31]^inData[32]^inData[33]^inData[34]^inData[35]^inData[37]^inData[39]^inData[46]^inData[49]^inData[51]^inData[54]^inData[60]^inData[61]^inData[63]^inData[64]^inData[66]^inData[69]^inData[70]^inData[74]^inData[76]^inData[77]^inData[78]^inData[80]^inData[81]^inData[82]^inData[83]^inData[84]^inData[86]^inData[89]^inData[92]^inData[97]^inData[98]^inData[103]^inData[106]^inData[107]^inData[109]^inData[113]^inData[116]^inData[117]^inData[119]^inData[121]^inData[123]^inData[124]^inData[125]^inData[126]^inData[127];
        crc[ 6]  <= inData[0]^inData[1]^inData[2]^inData[3]^inData[10]^inData[13]^inData[14]^inData[15]^inData[16]^inData[18]^inData[19]^inData[22]^inData[24]^inData[25]^inData[26]^inData[27]^inData[28]^inData[29]^inData[30]^inData[31]^inData[33]^inData[35]^inData[38]^inData[41]^inData[43]^inData[45]^inData[49]^inData[50]^inData[51]^inData[52]^inData[53]^inData[54]^inData[55]^inData[57]^inData[58]^inData[60]^inData[62]^inData[66]^inData[67]^inData[70]^inData[74]^inData[75]^inData[76]^inData[79]^inData[80]^inData[83]^inData[85]^inData[87]^inData[90]^inData[92]^inData[94]^inData[98]^inData[99]^inData[100]^inData[102]^inData[103]^inData[105]^inData[106]^inData[107]^inData[110]^inData[111]^inData[114]^inData[115]^inData[116]^inData[117]^inData[118]^inData[119]^inData[120]^inData[121]^inData[124]^inData[127];
        crc[ 5]  <= inData[1]^inData[3]^inData[4]^inData[5]^inData[10]^inData[11]^inData[12]^inData[13]^inData[15]^inData[19]^inData[21]^inData[27]^inData[29]^inData[30]^inData[31]^inData[39]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[45]^inData[46]^inData[47]^inData[49]^inData[50]^inData[52]^inData[55]^inData[56]^inData[57]^inData[59]^inData[60]^inData[63]^inData[64]^inData[65]^inData[66]^inData[67]^inData[68]^inData[74]^inData[75]^inData[78]^inData[82]^inData[86]^inData[88]^inData[91]^inData[92]^inData[94]^inData[95]^inData[99]^inData[101]^inData[102]^inData[105]^inData[107]^inData[112]^inData[117]^inData[118]^inData[120]^inData[126];
        crc[ 4]  <= inData[0]^inData[2]^inData[4]^inData[5]^inData[6]^inData[11]^inData[12]^inData[13]^inData[14]^inData[16]^inData[20]^inData[22]^inData[28]^inData[30]^inData[31]^inData[32]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[45]^inData[46]^inData[47]^inData[48]^inData[50]^inData[51]^inData[53]^inData[56]^inData[57]^inData[58]^inData[60]^inData[61]^inData[64]^inData[65]^inData[66]^inData[67]^inData[68]^inData[69]^inData[75]^inData[76]^inData[79]^inData[83]^inData[87]^inData[89]^inData[92]^inData[93]^inData[95]^inData[96]^inData[100]^inData[102]^inData[103]^inData[106]^inData[108]^inData[113]^inData[118]^inData[119]^inData[121]^inData[127];
        crc[ 3]  <= inData[0]^inData[1]^inData[2]^inData[3]^inData[6]^inData[7]^inData[10]^inData[15]^inData[16]^inData[20]^inData[25]^inData[26]^inData[28]^inData[29]^inData[31]^inData[33]^inData[34]^inData[36]^inData[40]^inData[42]^inData[44]^inData[46]^inData[48]^inData[52]^inData[53]^inData[59]^inData[60]^inData[62]^inData[64]^inData[67]^inData[68]^inData[69]^inData[70]^inData[71]^inData[74]^inData[78]^inData[81]^inData[82]^inData[88]^inData[90]^inData[92]^inData[96]^inData[97]^inData[100]^inData[101]^inData[102]^inData[105]^inData[106]^inData[107]^inData[108]^inData[109]^inData[111]^inData[114]^inData[115]^inData[116]^inData[120]^inData[121]^inData[125]^inData[126];
        crc[ 2]  <= inData[0]^inData[1]^inData[2]^inData[3]^inData[4]^inData[7]^inData[8]^inData[11]^inData[16]^inData[17]^inData[21]^inData[26]^inData[27]^inData[29]^inData[30]^inData[32]^inData[34]^inData[35]^inData[37]^inData[41]^inData[43]^inData[45]^inData[47]^inData[49]^inData[53]^inData[54]^inData[60]^inData[61]^inData[63]^inData[65]^inData[68]^inData[69]^inData[70]^inData[71]^inData[72]^inData[75]^inData[79]^inData[82]^inData[83]^inData[89]^inData[91]^inData[93]^inData[97]^inData[98]^inData[101]^inData[102]^inData[103]^inData[106]^inData[107]^inData[108]^inData[109]^inData[110]^inData[112]^inData[115]^inData[116]^inData[117]^inData[121]^inData[122]^inData[126]^inData[127];
        crc[ 1]  <= inData[0]^inData[1]^inData[3]^inData[4]^inData[8]^inData[9]^inData[10]^inData[13]^inData[14]^inData[16]^inData[18]^inData[20]^inData[21]^inData[22]^inData[23]^inData[25]^inData[26]^inData[27]^inData[30]^inData[31]^inData[32]^inData[33]^inData[34]^inData[35]^inData[38]^inData[40]^inData[41]^inData[42]^inData[43]^inData[44]^inData[45]^inData[46]^inData[47]^inData[48]^inData[49]^inData[50]^inData[51]^inData[53]^inData[55]^inData[57]^inData[58]^inData[60]^inData[62]^inData[65]^inData[69]^inData[70]^inData[72]^inData[73]^inData[74]^inData[77]^inData[78]^inData[81]^inData[82]^inData[83]^inData[90]^inData[93]^inData[98]^inData[99]^inData[100]^inData[105]^inData[106]^inData[107]^inData[109]^inData[110]^inData[113]^inData[115]^inData[117]^inData[118]^inData[119]^inData[121]^inData[123]^inData[125]^inData[126]^inData[127];
        crc[ 0]  <= inData[1]^inData[4]^inData[9]^inData[11]^inData[12]^inData[13]^inData[15]^inData[16]^inData[19]^inData[20]^inData[22]^inData[24]^inData[25]^inData[27]^inData[31]^inData[33]^inData[35]^inData[39]^inData[40]^inData[42]^inData[44]^inData[46]^inData[48]^inData[50]^inData[52]^inData[53]^inData[56]^inData[57]^inData[59]^inData[60]^inData[63]^inData[64]^inData[65]^inData[70]^inData[73]^inData[75]^inData[76]^inData[77]^inData[79]^inData[80]^inData[81]^inData[83]^inData[91]^inData[92]^inData[93]^inData[99]^inData[101]^inData[102]^inData[103]^inData[104]^inData[105]^inData[107]^inData[110]^inData[114]^inData[115]^inData[118]^inData[120]^inData[121]^inData[124]^inData[125]^inData[127];
    // end else begin
    //     crc <= {32{1'b0}};
    // end
end
end

// `ifdef ASYNC_RES
// always @(posedge clk or negedge res_n) `else
// always @(posedge clk) `endif
// begin
// if (!res_n) begin
//     crc      <= 32'h0;
// end
// else begin

//     crcValid <= remainderValid;

    // if (remainderValid) begin
        // if (remainderStartNew) begin
            // crc <= crc; // crc is 0 when new calculation starts. 0 XOR a = a, so only the remainder is left
        // end
        // else begin
        //     crc[31] <= crc[31] ^ crc[3]^crc[5]^crc[6]^crc[8]^crc[10]^crc[11]^crc[14]^crc[15]^crc[17]^crc[18]^crc[19]^crc[21]^crc[26]^crc[29];
        //     crc[30] <= crc[30] ^ crc[2]^crc[4]^crc[5]^crc[7]^crc[9]^crc[10]^crc[13]^crc[14]^crc[16]^crc[17]^crc[18]^crc[20]^crc[25]^crc[28];
        //     crc[29] <= crc[29] ^ crc[1]^crc[4]^crc[5]^crc[9]^crc[10]^crc[11]^crc[12]^crc[13]^crc[14]^crc[16]^crc[18]^crc[21]^crc[24]^crc[26]^crc[27]^crc[29];
        //     crc[28] <= crc[28] ^ crc[0]^crc[4]^crc[5]^crc[6]^crc[9]^crc[12]^crc[13]^crc[14]^crc[18]^crc[19]^crc[20]^crc[21]^crc[23]^crc[25]^crc[28]^crc[29]^crc[31];
        //     crc[27] <= crc[27] ^ crc[4]^crc[6]^crc[10]^crc[12]^crc[13]^crc[14]^crc[15]^crc[20]^crc[21]^crc[22]^crc[24]^crc[26]^crc[27]^crc[28]^crc[29]^crc[30]^crc[31];
        //     crc[26] <= crc[26] ^ crc[3]^crc[5]^crc[9]^crc[11]^crc[12]^crc[13]^crc[14]^crc[19]^crc[20]^crc[21]^crc[23]^crc[25]^crc[26]^crc[27]^crc[28]^crc[29]^crc[30]^crc[31];
        //     crc[25] <= crc[25] ^ crc[2]^crc[3]^crc[4]^crc[5]^crc[6]^crc[12]^crc[13]^crc[14]^crc[15]^crc[17]^crc[20]^crc[21]^crc[22]^crc[24]^crc[25]^crc[27]^crc[28]^crc[30]^crc[31];
        //     crc[24] <= crc[24] ^ crc[1]^crc[2]^crc[3]^crc[4]^crc[5]^crc[11]^crc[12]^crc[13]^crc[14]^crc[16]^crc[19]^crc[20]^crc[21]^crc[23]^crc[24]^crc[26]^crc[27]^crc[29]^crc[30];
        //     crc[23] <= crc[23] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[4]^crc[10]^crc[11]^crc[12]^crc[13]^crc[15]^crc[18]^crc[19]^crc[20]^crc[22]^crc[23]^crc[25]^crc[26]^crc[28]^crc[29];
        //     crc[22] <= crc[22] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[9]^crc[10]^crc[11]^crc[12]^crc[14]^crc[17]^crc[18]^crc[19]^crc[21]^crc[22]^crc[24]^crc[25]^crc[27]^crc[28];
        //     crc[21] <= crc[21] ^ crc[0]^crc[1]^crc[2]^crc[8]^crc[9]^crc[10]^crc[11]^crc[13]^crc[16]^crc[17]^crc[18]^crc[20]^crc[21]^crc[23]^crc[24]^crc[26]^crc[27];
        //     crc[20] <= crc[20] ^ crc[0]^crc[1]^crc[7]^crc[8]^crc[9]^crc[10]^crc[12]^crc[15]^crc[16]^crc[17]^crc[19]^crc[20]^crc[22]^crc[23]^crc[25]^crc[26]^crc[31];
        //     crc[19] <= crc[19] ^ crc[0]^crc[3]^crc[5]^crc[7]^crc[9]^crc[10]^crc[16]^crc[17]^crc[22]^crc[24]^crc[25]^crc[26]^crc[29]^crc[30];
        //     crc[18] <= crc[18] ^ crc[2]^crc[3]^crc[4]^crc[5]^crc[9]^crc[10]^crc[11]^crc[14]^crc[16]^crc[17]^crc[18]^crc[19]^crc[23]^crc[24]^crc[25]^crc[26]^crc[28];
        //     crc[17] <= crc[17] ^ crc[1]^crc[2]^crc[3]^crc[4]^crc[8]^crc[9]^crc[10]^crc[13]^crc[15]^crc[16]^crc[17]^crc[18]^crc[22]^crc[23]^crc[24]^crc[25]^crc[27]^crc[31];
        //     crc[16] <= crc[16] ^ crc[0]^crc[1]^crc[2]^crc[5]^crc[6]^crc[7]^crc[9]^crc[10]^crc[11]^crc[12]^crc[16]^crc[18]^crc[19]^crc[22]^crc[23]^crc[24]^crc[29]^crc[30]^crc[31];
        //     crc[15] <= crc[15] ^ crc[0]^crc[1]^crc[3]^crc[4]^crc[9]^crc[14]^crc[19]^crc[22]^crc[23]^crc[26]^crc[28]^crc[30]^crc[31];
        //     crc[14] <= crc[14] ^ crc[0]^crc[2]^crc[5]^crc[6]^crc[10]^crc[11]^crc[13]^crc[14]^crc[15]^crc[17]^crc[19]^crc[22]^crc[25]^crc[26]^crc[27]^crc[30]^crc[31];
        //     crc[13] <= crc[13] ^ crc[1]^crc[4]^crc[5]^crc[9]^crc[10]^crc[12]^crc[13]^crc[14]^crc[16]^crc[18]^crc[21]^crc[24]^crc[25]^crc[26]^crc[29]^crc[30];
        //     crc[12] <= crc[12] ^ crc[0]^crc[3]^crc[4]^crc[8]^crc[9]^crc[11]^crc[12]^crc[13]^crc[15]^crc[17]^crc[20]^crc[23]^crc[24]^crc[25]^crc[28]^crc[29]^crc[31];
        //     crc[11] <= crc[11] ^ crc[2]^crc[3]^crc[7]^crc[8]^crc[10]^crc[11]^crc[12]^crc[14]^crc[16]^crc[19]^crc[22]^crc[23]^crc[24]^crc[27]^crc[28]^crc[30];
        //     crc[10] <= crc[10] ^ crc[1]^crc[2]^crc[3]^crc[5]^crc[7]^crc[8]^crc[9]^crc[13]^crc[14]^crc[17]^crc[19]^crc[22]^crc[23]^crc[27];
        //     crc[ 9] <= crc[ 9] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[4]^crc[5]^crc[7]^crc[10]^crc[11]^crc[12]^crc[13]^crc[14]^crc[15]^crc[16]^crc[17]^crc[19]^crc[22]^crc[29]^crc[31];
        //     crc[ 8] <= crc[ 8] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[4]^crc[6]^crc[9]^crc[10]^crc[11]^crc[12]^crc[13]^crc[14]^crc[15]^crc[16]^crc[18]^crc[21]^crc[28]^crc[30];
        //     crc[ 7] <= crc[ 7] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[5]^crc[8]^crc[9]^crc[10]^crc[11]^crc[12]^crc[13]^crc[14]^crc[15]^crc[17]^crc[20]^crc[27]^crc[29]^crc[31];
        //     crc[ 6] <= crc[ 6] ^ crc[0]^crc[1]^crc[2]^crc[3]^crc[4]^crc[5]^crc[6]^crc[7]^crc[9]^crc[12]^crc[13]^crc[15]^crc[16]^crc[17]^crc[18]^crc[21]^crc[28]^crc[29]^crc[30]^crc[31];
        //     crc[ 5] <= crc[ 5] ^ crc[0]^crc[1]^crc[2]^crc[4]^crc[10]^crc[12]^crc[16]^crc[18]^crc[19]^crc[20]^crc[21]^crc[26]^crc[27]^crc[28]^crc[30];
        //     crc[ 4] <= crc[ 4] ^ crc[0]^crc[1]^crc[3]^crc[9]^crc[11]^crc[15]^crc[17]^crc[18]^crc[19]^crc[20]^crc[25]^crc[26]^crc[27]^crc[29]^crc[31];
        //     crc[ 3] <= crc[ 3] ^ crc[0]^crc[2]^crc[3]^crc[5]^crc[6]^crc[11]^crc[15]^crc[16]^crc[21]^crc[24]^crc[25]^crc[28]^crc[29]^crc[30]^crc[31];
        //     crc[ 2] <= crc[ 2] ^ crc[1]^crc[2]^crc[4]^crc[5]^crc[10]^crc[14]^crc[15]^crc[20]^crc[23]^crc[24]^crc[27]^crc[28]^crc[29]^crc[30]^crc[31];
        //     crc[ 1] <= crc[ 1] ^ crc[0]^crc[1]^crc[4]^crc[5]^crc[6]^crc[8]^crc[9]^crc[10]^crc[11]^crc[13]^crc[15]^crc[17]^crc[18]^crc[21]^crc[22]^crc[23]^crc[27]^crc[28]^crc[30]^crc[31];
        //     crc[ 0] <= crc[ 0] ^ crc[0]^crc[4]^crc[6]^crc[7]^crc[9]^crc[11]^crc[12]^crc[15]^crc[16]^crc[18]^crc[19]^crc[20]^crc[22]^crc[27]^crc[30];
        // end
    // end

        // end
    // end // of always

endmodule
