#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only
   
echo "# Participation au `date +"%d-%m-%Y %H:%M"`"
echo ""


echo "| Table des matières            | Description                                             |"
echo "|-------------------------------|---------------------------------------------------------|"
echo "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
echo "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Boréal :id:                | Interne            | ssh | Docker Engine |"
echo "|------|----------------------------|--------------------|-----|---------------|"

i=0

for id in "${ETUDIANTS[@]}"
do
   VERSION=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} lsb_release -a 2>/dev/null`
    # echo "ssh -i ~/.ssh/b300098957@ramena.pk \
    #    -o StrictHostKeyChecking=no \
    #    -o PasswordAuthentication=no \
    #    -o ConnectTimeout=5 ${SERVERS[${i}]} lsb_release -a 2>/dev/null"
    # echo $VERSION
    # DOCKER=`ssh -i ~/.ssh/b300098957@ramena.pk \
    #     -o StrictHostKeyChecking=no \
    #     -o PasswordAuthentication=no \
    #     -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status docker 2>/dev/null`
   OKI="| ${i} | ${id} - <image src='https://avatars.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVERS[$i]}\` | :heavy_check_mark: | :tada: | "
   OK="| ${i} | ${id} - <image src='https://avatars.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVERS[$i]}\` | :heavy_check_mark: | :x: | "
   KO="| ${i} | ${id} - <image src='https://avatars.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVERS[$i]}\` | :x: | :x: | "
#   if [[ $VERSION == *"Ubuntu"* && $DOCKER == *"(running)"* ]]; then
#       echo ${OKI}
#   else
       if [[ $VERSION == *"Ubuntu"* ]]; then
           echo ${OK}
       else
           echo ${KO}
       fi
#   fi
   let "i++"
done