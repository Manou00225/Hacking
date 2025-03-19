echo " ***************** FOOTPRINTING TOOLS **********************" 
echo " *                                                         *"
echo " *                                                         *" 
echo " * 1    FOOTPRINTING WITH USING WHOIS                      *"
echo " * 2    FOOTPRINTING WITH USING DIG                        *"
echo " * 3    FOOTPRINTING WITH USING THE HARVESTER              *"
echo " * 4    FOOTPRINTING WITH USING TRACE ROUTE                *"
echo " * 5    FOOTPRINTING WITH USING HOST                       *"
echo " * 6    FOOTPRINTING WITH USING NSLOOKUP                   *"
echo " *                                                         *"
echo " ***********************************************************"

echo " Veuillez faire une choix de la plateforme a utiliser : " 
read choice 

echo " "
echo " Veuillez entrer un domaine a chercher : " 
read domaine

dir=Footprinting-$domaine
mkdir $dir
cd $dir

if [ $choice = 1 ]; then
	echo " ************************ FOOTPRINTING WITH WHOIS TOOL ********* "
	whois $domaine > whois.txt

fi
 
if [ $choice = 2 ] ; then
	echo " *********************** FOOTPRINTING WITH DIG *****************"
 	dig $domaine > dig.txt

fi

if [ $choice = 3 ] ; then
	echo " ********************* FOOTPRINTING WITH THE HARVESTER ******** "
	theHarvester -d $domaine -l 200 -b yahoo > theHarvester.txt

fi


if [ $choice = 4 ] ; then 
	echo " ******************* FOOTPRINTING WITH TRACE ROUTE *************"
 	traceroute $domaine > traceroute.txt 

fi

if [ $choice = 5 ] ; then
	echo " ***************** FOOTPRINTING WITH HOST *******************"
	host $domaine > host.txt

fi


if [ $choice = 6 ] ; then 
	echo " ***************** FOOTPRINTING WITH NSLOOKUP ****************"
	nslookup $domaine > nslookup.txt

fi

echo " "

echo " Voulez-vous faire une autre session ? (o/n) : "
    read replay
    if [ "$replay" != "o" ]; then
        echo " Merci d'avoir utilisé notre logiciel (*_*) "
    fi

exit



