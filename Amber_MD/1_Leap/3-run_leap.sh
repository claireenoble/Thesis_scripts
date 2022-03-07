#!/bin/bash

for i in *_tleap.in

do

echo $i
tleap -f $i

done
