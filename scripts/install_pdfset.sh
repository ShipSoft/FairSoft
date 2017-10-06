#!/bin/bash

#author: Ahmed El Alaoui, USM

install_data=$SIMPATH_INSTALL/share/lhapdf/data

if [ ! -d  $install_data ];
then
  mkdir -p $install_data
  ln -s $install_data $SIMPATH_INSTALL/share/lhapdf/PDFsets
fi

cd $install_data

if [ ! -d  $SIMPATH_INSTALL/share/lhapdf/PDFsets/cteq6 ];
then

pdfset=("cteq6l1" "cteq66" "cteq6" "CT09MCS")


START=0
END=${#pdfset[@]}

for (( t=$START; t<$END; t++ )); do
  pdf=${pdfset[${t}]}
  if [ -f "$pdf" ];then
   echo $pdf already installed
  else
   wget $PDFSET_LOCATION/$pdf.tar.gz -O- | tar xz -C $install_data
  fi
done
fi

cd $SIMPATH
return 1
