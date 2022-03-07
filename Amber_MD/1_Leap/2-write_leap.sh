#!/bin/bash

for i in *_input.pdb;

do
echo $i
a=$(echo ${i} | sed 's/_input.pdb/_/')
echo "source leaprc.protein.ff14SB" >> ${a}tleap.in
echo "source leaprc.gaff" >> ${a}tleap.in
echo "source leaprc.water.tip3p" >> ${a}tleap.in
echo "" >> ${a}tleap.in
echo "" >> ${a}tleap.in
echo "addAtomTypes {" >> ${a}tleap.in
echo '        {"FE" "Fe" "sp3"}' >> ${a}tleap.in
echo '        { "NO" "N" "sp2" }    ## Modified by George to define NO and NP atoms as sp2 hybridised.' >> ${a}tleap.in
echo '        { "NP" "N" "sp2" }    ## Prevents sp0 errors in leap.' >> ${a}tleap.in
echo "" >> ${a}tleap.in
echo "}" >> ${a}tleap.in
echo "" >> ${a}tleap.in
echo "" >> ${a}tleap.in
echo "loadamberparams heme.frcmod" >> ${a}tleap.in
echo "loadoff hemeb.lib" >> ${a}tleap.in
echo "mol = loadpdb $i" >> ${a}tleap.in
echo "bond mol.9.NE2 mol.197.FE" >> ${a}tleap.in
echo "bond mol.109.NE2 mol.197.FE" >> ${a}tleap.in
echo "solvateOct mol TIP3PBOX 12.0 0.78" >> ${a}tleap.in
echo "addIonsRand mol Na+ 0" >>  ${a}tleap.in
echo "addIonsRand mol Cl- 0" >>  ${a}tleap.in
echo "savepdb mol ${a}tleap.pdb" >> ${a}tleap.in
echo "saveamberparm mol ${a}tleap.prmtop ${a}tleap.inpcrd" >> ${a}tleap.in
echo "quit" >> ${a}tleap.in

done
