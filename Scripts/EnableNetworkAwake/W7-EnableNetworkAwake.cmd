  @echo off
:: Activation de la carte réseau pendant la mise en veille du PC : Script pour les Dell du marché ANITIA
:: Haile Toybou :: CST PDT :: 28/08/2013

:: Dell Optiplex 790 7010 Latitude E6320 E6330
powercfg -deviceenablewake "Intel(R) 82579LM Gigabit Network Connection"


:: Dell Latitude E5520
powercfg -deviceenablewake "Broadcom NetXtreme Gigabit Ethernet"


:: Dell Latitude E5530
powercfg -deviceenablewake "Broadcom NetXtreme 57xx Gigabit Controller"


:: Dell Latitude E5540 E5550
powercfg -deviceenablewake "Intel(R) Ethernet Connection I218-LM"


:: Dell Precision M6800
powercfg -deviceenablewake "Intel(R) Ethernet Connection I217-LM"


:: Dell Latitude E7440
powercfg -deviceenablewake "Connexion Ethernet Intel(R) I218-LM"


:: M700
powercfg -deviceenablewake "Intel(R) Ethernet Connection (2) I219-V"

:: optiplex 390
powercfg -deviceenablewake "Realtek PCIe GBE Family Controller"

