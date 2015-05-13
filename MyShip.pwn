# // Az _ SHIP

// BY azula
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <a_samp>
#include <streamer>
#include <zcmd>
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

main()
{return 1;
}

#define @error SendClientMessage(playerid,-1," {FF2EE1} [Az-MyShip] : {FC0B0B}Error");
#define FLOAT_INFINITY      (Float:0x7F800000)


enum AzInfo
{
	bool:ID,
	AZVEH
}
new AzShip[MAX_PLAYERS][AzInfo];
new AZOBJ[MAX_PLAYERS][18];
new Cam[MAX_PLAYERS];
//new Float:health; just for debug view don

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public OnFilterScriptInit()
{
	print("\n-----------Azula 2015 scripting------------------------");
	print(" Az _My SHIP By Azula");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

/*public OnPlayerUpdate(playerid) // debug update
{

    printf("health changes %f", GetVehicleHealth(AzShip[playerid] [ AZVEH ], health));
    return 1;
}*/


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CMD:myship(playerid, params[]) {

	if( AzShip[playerid] [ ID ] != false ) return @error
	
	new Float:AZPOS[3];
	
	GetPlayerPos(playerid,AZPOS[0],AZPOS[1],AZPOS[2]);
	
	AzShip[playerid] [ AZVEH ]  = AddStaticVehicle(484, 0,0,0, 90.0000, -1, -1);
	
	// object attach
	AZOBJ[playerid][0] = CreateObject(5166, 9.28260, -5.10100, 12.52660,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][1] = CreateObject(5160, 9.26610, -4.38820, 12.53700,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][2] = CreateObject(5167, 1.23210, -111.96890, 14.60670,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][3] = CreateObject(5157, 1.23894, 48.11191, 24.25010,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][4] = CreateObject(5156, 1.28523, -60.89987, 18.21230,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][5] = CreateObject(5154, 1.84110, -36.40240, 22.98230,   0.00000, 0.00000, 91.00000);
	AZOBJ[playerid][6] = CreateObject(12911, 13.73760, -69.57770, 16.90660,   0.00000, 0.00000, 11.00000);
	AZOBJ[playerid][7] = CreateObject(5155, 2.88898, -124.71310, 28.41030,   0.00000, 0.00000, 90.00000);
	AZOBJ[playerid][8] =  CreateObject(5158, 3.12849, -148.76134, 19.35090,   0.00000, 0.00000, 180.00000);
	AZOBJ[playerid][9] = CreateObject(12911, -11.30160, -72.64630, 16.05860,   0.00000, 0.00000, -164.00000);
	AZOBJ[playerid][10] = CreateObject(3934, 2.43130, -23.09680, 18.27420,   0.00000, 0.00000, 0.00000);
	AZOBJ[playerid][11] = CreateObject(3934, -5.77430, -15.58513, 18.27420,   0.00000, 0.00000, 0.00000);
	AZOBJ[playerid][12] = CreateObject(3934, 10.70086, -15.43115, 18.27420,   0.00000, 0.00000, 0.00000);
	AZOBJ[playerid][13] = CreateObject(3934, 2.70715, -7.90210, 18.27420,   0.00000, 0.00000, 0.00000);
	
	AZOBJ[playerid][14] = CreateObject(0, 22.4578, -234.1633, 76.9828,   0.00000, 0.00000, 0.00000); // camera 1
    AZOBJ[playerid][15] = CreateObject(0, 22.4578, -234.1633, 76.9828,   0.00000, 0.00000, 0.00000); // camera 2
    AZOBJ[playerid][16] = CreateObject(0, 22.4578, -234.1633, 76.9828,   0.00000, 0.00000, 0.00000); // camera 3
    AZOBJ[playerid][17] = CreateObject(0, 22.4578, -234.1633, 76.9828,   0.00000, 0.00000, 0.00000); // camera 4

	
	
 	AttachObjectToVehicle(AZOBJ[playerid][0], AzShip[playerid] [ AZVEH ], 9.28260, -5.10100, 12.52660,   0.00000, 0.00000, 90.00000);
    AttachObjectToVehicle(AZOBJ[playerid][1], AzShip[playerid] [ AZVEH ], 9.26610, -4.38820, 12.53700,   0.00000, 0.00000, 90.00000);
    AttachObjectToVehicle(AZOBJ[playerid][2], AzShip[playerid] [ AZVEH ], 1.23210, -111.96890, 14.60670,   0.00000, 0.00000, 90.00000);
    
    AttachObjectToVehicle(AZOBJ[playerid][3], AzShip[playerid] [ AZVEH ], 1.23894, 48.11191, 24.25010,   0.00000, 0.00000, 90.00000);
    AttachObjectToVehicle(AZOBJ[playerid][4], AzShip[playerid] [ AZVEH ], 1.28523, -60.89987, 18.21230,   0.00000, 0.00000, 90.00000);
    AttachObjectToVehicle(AZOBJ[playerid][5], AzShip[playerid] [ AZVEH ], 1.84110, -36.40240, 22.98230,   0.00000, 0.00000, 91.00000);
    AttachObjectToVehicle(AZOBJ[playerid][6], AzShip[playerid] [ AZVEH ], 13.73760, -69.57770, 16.90660,   0.00000, 0.00000, 11.00000);
    AttachObjectToVehicle(AZOBJ[playerid][7], AzShip[playerid] [ AZVEH ], 2.88898, -124.71310, 28.41030,   0.00000, 0.00000, 90.00000);
    AttachObjectToVehicle(AZOBJ[playerid][8], AzShip[playerid] [ AZVEH ], 3.12849, -148.76134, 19.35090,   0.00000, 0.00000, 180.00000);
    AttachObjectToVehicle(AZOBJ[playerid][9], AzShip[playerid] [ AZVEH ], -11.30160, -72.64630, 16.05860,   0.00000, 0.00000, -164.00000);
    AttachObjectToVehicle(AZOBJ[playerid][10], AzShip[playerid] [ AZVEH ], 2.43130, -23.09680, 18.27420,   0.00000, 0.00000, 0.00000);
    AttachObjectToVehicle(AZOBJ[playerid][11], AzShip[playerid] [ AZVEH ], -5.77430, -15.58513, 18.27420,   0.00000, 0.00000, 0.00000);
    AttachObjectToVehicle(AZOBJ[playerid][12], AzShip[playerid] [ AZVEH ], 10.70086, -15.43115, 18.27420,   0.00000, 0.00000, 0.00000);
    AttachObjectToVehicle(AZOBJ[playerid][13], AzShip[playerid] [ AZVEH ], 2.70715, -7.90210, 18.27420,   0.00000, 0.00000, 0.00000);
    AttachObjectToVehicle(AZOBJ[playerid][14], AzShip[playerid] [ AZVEH ], 5.1835, -104.7419, 76.9828,   0.00000, 0.00000, 0.00000); // main cam
    AttachObjectToVehicle(AZOBJ[playerid][15], AzShip[playerid] [ AZVEH ],  -67.32504, -70.69270, 77.47660,   0.00000, 0.00000, 0.00000); //2 cam
    AttachObjectToVehicle(AZOBJ[playerid][16], AzShip[playerid] [ AZVEH ], 73.3556, 15.5611, 77.4766,   0.00000, 0.00000, 0.00000); // 3 cam
    AttachObjectToVehicle(AZOBJ[playerid][17], AzShip[playerid] [ AZVEH ], 68.6926, -114.2084, 77.4766,   0.00000, 0.00000, 0.00000); // 4 cam
    
    SetVehiclePos(AzShip[playerid] [ AZVEH ] ,AZPOS[0],AZPOS[1],AZPOS[2] + 5 );
    PutPlayerInVehicle(playerid, AzShip[playerid] [ AZVEH ], 0);
    SetVehicleHealth(AzShip[playerid] [ AZVEH ], FLOAT_INFINITY);
    
  	AttachCameraToObject(playerid, AZOBJ[playerid][14]);
  	
   	
    
    AzShip[playerid] [ ID ] = true;
    Cam[playerid] = 1;
    return 1;
}


CMD:dship(playerid, params[]) {

	if( AzShip[playerid] [ ID ] == false ) return @error
	for(new i = 0; i!=15;i++) { DestroyObject(AZOBJ[playerid][i]); }
 	DestroyVehicle(AzShip[playerid] [ AZVEH ]);
 	SetCameraBehindPlayer(playerid);
	AzShip[playerid] [ ID ] = false;
	return true;
}

CMD:drive(playerid, params[]) {

	if( AzShip[playerid] [ ID ] == false ) return @error
	PutPlayerInVehicle(playerid, AzShip[playerid] [ AZVEH ], 0);
	AttachCameraToObject(playerid, AZOBJ[playerid][14]);
	return true;
}

CMD:navigate(playerid, params[]) {

	if( AzShip[playerid] [ ID ] == false ) return @error
	new Float:AZPOS[3];

	GetVehiclePos(AzShip[playerid] [ AZVEH ],AZPOS[0],AZPOS[1],AZPOS[2]);

    SetPlayerPos(playerid,AZPOS[0]+4.2498  ,AZPOS[1]+47.1940,AZPOS[2]+25.1967);  
    
    SetCameraBehindPlayer(playerid);

	return true;
}

CMD:cam(playerid, params[]) {

	if( AzShip[playerid] [ ID ] == false ) return @error
	switch ( Cam[playerid] ) {
	    case 0,1 : AttachCameraToObject(playerid, AZOBJ[playerid][15]),Cam[playerid]=1;
	    case 2 : AttachCameraToObject(playerid, AZOBJ[playerid][16]);
	    case 3 : AttachCameraToObject(playerid, AZOBJ[playerid][17]);
	    case 4 : AttachCameraToObject(playerid, AZOBJ[playerid][14]),Cam[playerid]=0;
	}
	Cam[playerid] ++;
	return true;
}

CMD:crash(playerid, params[]) {

	SetVehicleHealth(AzShip[playerid] [ AZVEH ], 0);
	return true;
}

