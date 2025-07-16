echo "Make sure to add the path to  the game version you want to pack for SaveSploit"
otpath=$HOME/OpenTycoon/
game=$otpath/Game/versions/Test.zip




lua5.3 mokgen.lua $game ss.lua $otpath/SavS.lua
cp runss.sh /bin
chmod +x /bin/runss.sh
