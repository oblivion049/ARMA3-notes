/*
	�ű�����v0.5
	���ߣ�����Ъ��
	��飺�����Ѽ���wiki�ű������뺯����һЩ�÷�,��Ϊ���,����ѧϰ�ο�ʹ�á�
	���飺ʹ��VScode��רҵ����������װ��ص�SQF�﷨
	vscode �еĲ�����ƣ�
	senfo.sqflint 
	Armitxes.sqf
	HkonRRydland.a3cfgfunctions
	vlad333000.sqf
	��������Ȥ�����Լ����ҵ�Ⱥ��һ��ѧϰ��
	Aram3&��װͻϮ3:ɳ�����Ⱥ��781108732
	Qin����װͻϮ��������Ⱥ��	643134730
*/

/*=============================�ű�=========================*/
//��ͷ���Լ�/**/�������ı���ע������,����㰲װ����Ӧ��SQF�������ôע�ͻ�����ɫ������ʾ
/*
	����ע�����ڵ���������,�ڱ���ʱ�ᱻ�����Զ�����,����Ӱ����Ĵ���
	�л����ĩβ��β��ո�
	����
	����
*/
//������һԪ�����comment���ɵ�ע��,��Ҫע����ǲ�Ӧ����,��Ϊ��ʵ���ϻᱻִ��(��Ҫʱ����ִ��)ʹ����û���κκô�
comment "This is a commented line";	

//���ʯ����������������  "LeadTrack02_F_EXP"
/*=============================��λ���============================*/
//����������������[���֣����֣�����],����ȡ����ұ���ID
player setName ["Tony Jackson","Tony","Jackson"];
player setName ["Ben Kerry","Ben","Kerry"];
[player, "Kirby", "Male08ENGB", 1.0, "Jackson"] call BIS_fnc_setIdentity;

//���鵥λ�������ԣ�ֱ�ӷ��ú������Ϸ���ǽ�ɫ��������Ҫд���ʼ����Identity��ݰ������沿�����������������۾���������Ϣ
this setIdentity "EPC_B_Miller"; // "Miller"
this setIdentity "EPC_B_James"; // "James"
this setIdentity "EPB_I_Stavrou";
this setIdentity "EPA_B_Hardy";
this setidentity "EPA_B_Adams"; //Adams

//�������
_soldier setFace "WhiteHead_18";
player setface "WhiteHead_11"; //kirby����
BIS_BHQ setface"WhiteHead_07";
//���þ���
player setRank "CORPORAL"; //Sgt Jackson  //SERGEANT ��ʿ
//��������
_unit setPitch 1;
//����������,��λû��������ʱ����־������
player setSpeaker "Male08ENGB";//����Ӣ��08
//���ú���,Ĭ������£����´�����ʱ����λ������Ѱַ������ nameSound ���������ڶԵ�Ԫ����Ѱַ�����磺��"2-ͣ��!", ���: "����, ͣ��!".
_unit setNameSound "Miller";
this setNameSound ""; //������õ�λ�ĺ�������
//�ַ������Ϳ���ʹ�ø�����configfile >> "RadioProtocolENG" >> "Words"���κδʻ�
//����ʹ��getarray���ôʻ��Ƿ���������ļ�,������ֵ��Ϊ[]ʱ,��ô�鳤�ͻ���ȷ��ʹ�ø��������´�����
getArray(configfile >> "RadioProtocolENG" >> "Words" >> "Kerry");
this setNameSound "Alpha";


//���õ�λ����
[player, "111thID"] call BIS_fnc_setUnitInsignia;
[this,"GryffinRegiment"] call BIS_fnc_setUnitInsignia;//�������
[this,"CSAT_ScimitarRegiment"] call BIS_fnc_setUnitInsignia;//�䵶����
[this,"AAF_3rdRegiment"] call BIS_fnc_setUnitInsignia;//����֧Ԯ��
[this,"AAF_1stRegiment"] call BIS_fnc_setUnitInsignia;//��һ��
[this,"TFAegis"] call BIS_fnc_setUnitInsignia;//�����ǲ��

//��������["����","����","����"]
player setName ["Jones Johnson","Johnson","Johnson"];
_soldier setFace "WhiteHead_18";
player setRank "CORPORAL";
//���û�������Ի�ı������λ�����ԡ�
player setUnitTrait ["Engineer", true]; //����ʦ������ά�޳����Ͳ������
player setUnitTrait["ExplosiveSpecialist",true];//��ըר�� ���Խ������
//��ȡ��λ����
getUnitTrait player;

//��ʿ�����������̽���� 
_soldier addItemToVest "itemGPS";

//�ı�����ߴ�,���������޸Ļ����Ĵ�С����Ϊ���������仯����һ֡�ָ�ԭʼ��С��
this setObjectScale 10; //����Ϊ0.0001~65504��
//�־��Եĸı����ƽ�myUnit�ĵ�λ�Ĵ�С,��ע��˹������ڶ�����Ϸʱ������λ������Ӱ�����ܣ������ʹ�á�
addMissionEventHandler ["EachFrame",{
	myUnit setObjectScale 2;
}];
//�ı���������,������ԭ���������̫��ʱ,�����ͽ�ɫ���ƶ����ܻ�����쳣,Ӧ����ǰ��ȡԭ������
_Object setMass 10;
//��ȡ��������
getMass _object; 

//����(����):���� animate [����������,�׶�(0~1),�ٶ�];
_build animate ["Door_1_rot",1];
//���ߵ��Լ��Ի�:
player groupChat "Hi there";//С��ͨѶ����ɫ 1"Hi there"
player sideChat "Show this text";//���ߵ�ͨѶ��ӪƵ����ͨ������ɫ Alpha 1-1 "Show this text" 
player globalChat "globalChat";//ȫ��Ƶ��(��ʹ���豸)��ͨ������ɫ OPFOR"globalChat"
player systemChat "����ϵͳ��ʾ";//��ɫ��û��ǰ׺
vehicle player vehicleChat "����Ƶ��";//��ɫ ����Ա "����Ƶ��"
player commandChat "Show this text"; //ָ��Ƶ�� ��ɫ Alpha 1-1 1 "Show this text"

(leader player) groupchat "text";

//�Զ������ߵ�Ƶ�� radioChannelCreate[��ɫ����, ��ǩ,����("%UNIT_NAME":��ʾ��λ���� "%CHANNEL_LABEL":��ʾƵ����ǩ),���Խ��պͷ�����Ϣ�ĵ�λ�б�]
//���ʹ��side_2����ɫͬ��Ϊ��ɫ����˵��ʱֻ��ʾ��̨���ƣ���̨��������Ϊ��ɫ���֡�
side_1 = radioChannelCreate [[1, 1, 1, 1], "Direct Chat", "%UNIT_NAME", [WS1,WS2,leader player,player]];
//��ʾ�Զ�������
player_radio = radioChannelCreate [[1, 1, 1, 1], "(Jackson)", "%CHANNEL_LABEL", units player];
WS1 customChat [side_1, "Bout fucking time you bundas" ];
player customChat [side_2, "got here!" ];
/* 
	customChat [side_1, "" ];
	WS1(��λ����) "Bout fucking time you bundas got here!"
*/
//ģ���ؾߵ�̨
side_2 = radioChannelCreate [[1, 0.8, 0, 1], "Custom_2", "%UNIT_NAME", units player];
//����Ԫ���Զ���Ƶ��ɾ��
side_1 radioChannelRemove [blufor_unit_1, blufor_unit_2];
//����Ԫ��ӵ��Զ���Ƶ��
side_1 radioChannelAdd [player,_unit];


//���ո���ʱ��չʾһ������Ļ
[
	["Speaker1", "Subtitle1", 0],
	["Speaker2", "Subtitle2", 5],
	["Speaker3", "Subtitle3", 10],
	["˵������", "��ĸ", 15]
] spawn BIS_fnc_EXP_camp_playSubtitles; //displays 4 subtitles with 5 seconds between them

//����ͨ��������ǿ�ƹر���Ļ
BIS_fnc_EXP_camp_playSubtitles_terminate = true;

//���һ����λ�Ƿ��и��������������ϻ򱳲������ı������ǡ���ΪMX ACO��ɫ��
if !(player hasWeapon "arifle_MX_ACO_pointer_F") then { systemChat "������������"};

/*=================================�ؾ�================================*/
//��ս��������һ��������������������Ĭ��λ�ûῴ�����ܲ����������ǿ����趨һ��Ŀ�꣬����������������սʱ���ٵ��ġ�
soldierone doWatch eastsoldier; //����soldierone�������ʿ��eastsoldier��λ��
soldierone doWatch markerPos "Marker_0"; //ʿ�������ͼ��Ǳ���Mraker_0��λ��
//����һ�����������ø�ʿ����ʱ����׼����Ŀ�꣬��󣬴�������Ч����λ������һ��������װ�׳���
_house1 setDamage [1, false];//false,�����ƻ�Ч��
//���ⲻ�����Ч������,Ϊ���Ż�����,Ӧ��ʹ�ü򵥶���
this animate ["mainturret",rad 290,true]; //��ת����
this animate ["maingun",rad 10,true]; //�趨��������
//�趨��������,����������ؾߵ�pbo�п���,ÿ���ؾ߶��ж�Ӧ����������(��׺Ϊdestruct��rvmat�ļ�)����ͬ�ؾ�Ҳ����ͨ��,��λ�˷ḻ�Խ���ʹ�ö���������
{this setObjectMaterial [_foreachindex,_x];} foreach [ 
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_body_destruct.rvmat", 
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_turret_destruct.rvmat", 
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_tracks_destruct.rvmat"
];

//Ӧ���ڳ�ʼ��������ͼ���ת��Ϊ�򵥶���(������ѡ����û�еĶ��󣬲����������װ����������ģ�顣ʹ���ڽ���ʱ���Ż��޷�����
_type = typeOf this;
_pos = getPosWorld this;
_dir = getDir this;
_vectorDirUp = [vectorDir this, vectorUp this];
deleteVehicle this;
_object = createSimpleObject [_type, _pos];
_object setPosWorld _pos;
_object setVectorDirAndUp _vectorDirUp;
_object setdir _dir;

//ɾ��ָ���ؾߣ�����ؾ������г�Ա,���Ǿͱ�����ԭ��
deleteVehicle _Vehicle
//ɾ���г�Ա�ĳ���ʱ��Ӧ��ʹ�á�
{_car deleteVehicleCrew _x} forEach crew _car;
deleteVehicle _car;
//��2.06�汾��ʼ���ô�����ɾ����Ա
DeleteVehicleCrew _vehicle;

//��ָʿ����Ϊ�ؾ߼�ʻԱ���ڴ˴�����Ч�£������˽����ؾ�ʱ������ѡ���ʻԱ
_soldier1 assignAsDriver _tank;
//����һ����λ��Ϊ�����ĳ�Ա����orderGetInһ��ʹ���ó�Ա�����ض���������ʹ�ô�����֮ǰ����λ���ܽ��복���ġ�
_soldier1 assignAsCargo _truck;
��//�������������С��ֱ����Ϊ����0,1����λ��Ϊֱ����������3,4Ϊ��೤�ʣ�2 5��֮��
player assignAsCargoIndex [resuceHeil, 1];
//���λ�³�,���Ժ�orderGetIn true����ʹ��
[_unitOne, _unitTwo] orderGetIn true;
[_unitOne, _unitTwo] orderGetIn false;
//������ʹ��allowGetIn����
units player allowGetIn false;

//Ŀ��ʿ�����������ؾߣ��������붯����·��,����ʹ�ô����﷨[�ؾ�,λ������]��ǿ�Ƶ�λ����ĳ����λ
_soldier moveInCargo _jeep; 
_soldier moveInCargo [_vehicle, 2];//���������λ�ö�����Ĭ�ϵĵ�һ��

//��λ���������ؾߵĵ�һ����λ�ã���С�ӳ������λ�á�3DEN����˹���϶�����Ч����ͬ
//���ռ�ʻԱ(moveInDriver) �� ָ�ӹ�(moveInCommander) �� ����(moveInGunner) �� ����(moveInTurret) �� �˿�(moveInCargo)��˳�����
player moveInAny _tank;
//�����ؾߣ���ֹ��ҽ��������������ŶӶӳ���ָ�������ж��·��������ҳ�ȥ��
_veh lock true;
//�����ؾߵ��ض���λ
_veh lockCargo [0 ,true];
//�������г˿ͣ�������������ʿ���뿪�ؾߣ��������ǻ��ٴγ���
{ moveOut _x ; _x leaveVehicle _vehicle } forEach units _grp;
_vehicle lockCargo [0, true];
//�ؾ�����ر�
_heli action["engineOFF", _heli];
//�ؾ����濪�������ַ�ʽ
_vehicle action["engineON", vehicle _vehicle];
_vehicle engineon true;
//����һ����ʼʱ�ڵ����ֱ����
[this, 0] call BIS_fnc_setHeight;
this engineOn true;

//�뿪�ؾ� ����������unit����group
_unit leaveVehicle _vehicle;
_grp leaveVehicle _vehicle;

//Ϊ�����ϵ�������������[�������׶Σ�˲ʱ]
_object animateDoor ["Door_L", 1, true]; //���������ţ��޶���
_object animateDoor ["Door_L", 0]; //�ر�����

//���Ľ�ͧ�������״̬
[this, 1] call BIS_fnc_destroyer01OperateHangarDoors; //to open doors
[this, 0] call BIS_fnc_destroyer01OperateHangarDoors; //to close doors


//�򿪳������������������ؾ�
_vehicle setPilotLight true;
//�򿪷�ײ��
_heli setCollisionLight true;
//�����ؾߵ�ҩ
_vehicle setvehicleammo 1;

//�ڿ�������ֱ����
fighter_0 = createVehicle ["O_Plane_Fighter_02_F", position player, [], 0, "FLY"];
"O_Pilot_F" createUnit  [ getMarkerPos  "marker_0", Grp_CSAT,"grp_CSAT selectLeader this;this moveInDriver fighter_0"];
//������ܣ����ػ�����װ�ص������ڣ����ݳ����Ƿ��ܹ�װ�ط��ز���ֵ��Ҳ������ж���ض�װ�س���������װ�س�����
blackfish setVehicleCargo offroad;
private _success = objNull setVehicleCargo offroad;//ж���ض�װ�صĳ���(����Ӹ߿յ��佫����ɡ)
private _success = blackfish setVehicleCargo objNull;//ж�����г���(����Ӹ߿յ��䣬���ή��ɡ)

//ǿ���趨�������ȶ� 0������״̬��1������״̬�����������ֱ���[����/���� ,�Ĵ�/���� ,����]
this setVehicleTiPars [1, 1, 1];
{_x setVehicleTiPars [1, 1, 1]} forEach vehicles;
/*====================================================·��ƪ==============================================*/
//��λ�������ƶ���ָ��λ��(����Ϊ��ͼ��Ǳ����������������ܾ�)
[_soldier1, _soldier2] commandMove getMarkerPos "Marker1";
//��λ������ָ��λ���ƶ�(����Ϊ��ͼ��Ǳ����������������ܾ�)
this doMove (getMarkerPos "Marker1");
//��������ĵ�λ�ƶ���������λ��(ͨ�����ߵ�)�����������ÿɼ��ĺ�·���ǡ�
//���Խ�С�ӳ����Ա������ֿ����������ῴ���������ߵ���Ϣ
[_soldier] commandMove getMarkerPos "Marker_0";
[_soldier1, _soldier2] commandMove getMarkerPos "Marker_0";

//���·���� λ�� ���ȼ�(0Ϊ��ǰ)
Alpha addWaypoint [getposATL w1, 0];
//���ñ��·���㲻�ɼ�
[Alpha, 0] setWaypointVisible false;
/*================================================��Ԫ����===========================================*/
//���ö����ٶ�
_unit setAnimSpeedCoef 1;

//��λ���벻���ڵ�С��(�뿪��ǰС��)
[_unitOne, _unitTwo] join grpNull;

//����Ԫ����������飬���λ�� id ���ã���ʹ�ø��顣����ʾ"x �����Ŷ�"���������ߵ�ͨ�š�
player joinAsSilent [_group, 4];
//�������е����е�Ԫ��Ĭ���������(�����ߵ���Ϣ)��
[_unitOne, _unitTwo] joinSilent (group player);

//���������ԭ���Ŷӷ��룬Ȼ���Ϊ�ŶӶӳ�������Ϊһ��λʱ��
//�Ƚ�����һ��С��(��Ҳ�Ϊ�ӳ����ŶӺ���Ĭ��Alpha 1-1)��Ȼ�����ýű���
[player] join grpNull; //��ҽ��벻���ڵ�С��
//��ʱ���Ŷ���Ϣʱ���֣���һ���ʾAlpha 1-2 x.�ŶӶӳ�(xΪԭʼС�ӵ����)������������Ҽ���һ��С��
player joinAs [player, 1];
//��ʱ�ͻ��Ϊ Alpha 1-2 1.�ŶӶӳ�
//Ȼ������������Ա���뼴��
[soldier2,soldier3] join _group;
//�����ŶӺ���
group player setGroupId ["Kerry"]; // Kerry 1.�ŶӶӳ�
//���ʹ��
[player] join grpNull;
player joinAs [player, 1];
group player setGroupId ["Jackson"];
//Ϊ����Ŷ�ѡ��һ���쵼�ߣ�������С���е�����һ�ˡ�
group player selectLeader _soldier1;

//�л���ҵ�������̬����ȫ/����
player action ["WeaponOnBack", player];
//Ϊ��������������Ȼ��ǿ�����¼���
player addMagazine ["30Rnd_65x39_caseless_mag", 3];
reload player;
//���õ�λ��̬
_soldier setUnitPos "UP";
//"UP"  	վ��
//"MIDDLE" 	��أ������λû���������򲻻����
//"DOWN"  	�Ե�
//"AUTO"	����ѡ����̬

//ΪС��������̬��ͬʱ���������ߵ���Ϣ
{_x setUnitPos "MIDDLE"} forEach units player;


//���õ�λ���� 0~1
_soldier setskill 0.7;
//ʿ������Ŀ��
_soldier doWatch player;
//����ʿ����׼ָ��Ŀ��
_ESoldier1 doTarget _WSoldier1;
//���Ƶ�Ԫ���ڲ鿴������(Ŀ���λ��)�����Ŀ�걻ʹ�ã���������ȫ��¶��
_someSoldier lookAt _otherSoldier;
//���Ƶ�λ������(Ŀ���λ��)�����Ŀ�걻ʹ�ã���������ȫ��¶������������ɨ�ӵ�Ƶ��ȡ������Ϊ��
_someSoldier glanceAt _otherSoldier;
//����ʿ������
_ESoldier1 doFire _WSoldier1;
//ǿ�Ƶ�λ����_unit forceWeaponFire [ǹ�� ,ģʽ ]; [����, ǹ��] call BIS_fnc_fire;
_unit forceWeaponFire [primaryWeapon _unit , currentWeaponMode _unit ];
[BIS_inf, currentMuzzle BIS_inf] call BIS_fnc_fire;
[BIS_tank, "cannon_120mm"] call BIS_fnc_fire;
[BIS_tank, "SmokeLauncher"] call BIS_fnc_fire; //̹�˷��䵯Ļ

//ֱ�������� [�顢λ�á�Ŀ��(ͣ��ƺ����)]
[group player, [0,0,0], BIS_vehicle] spawn BIS_fnc_wpLand;

//��ֹʿ���ƶ�
_soldierOne disableAI "Move";

//ʹ��setCaptive���������ֹ�з���λ��Ŀ�굥λ���𡣱���Ϊ����ƽ�񣬵���Ȼ��������ĵ��ˣ������Ƴ�����������Ӱ��С�ӷ��䣻�����λ�ǳ���������ָ�ӹ١�
_soldier setCaptive  true; // _soldier �������������������˲��ỹ��
_soldier1 setCaptive 1;//����ʿ��Ϊ��²(��ֵ���㼴���÷�²)
//������ͨ��ȡ����²״̬���¼�����⡣
_soldier setCaptive  false; // _soldier ���ٴα��з���λ���
//������ CSAT��NATO��ϵ��0Ϊ�жԣ�1Ϊ�Ѻ�
east setFriend [west, 1];
west setFriend [east, 1];

//��Ӧ�ı���²վ��
_unit switchMove "Acts_JetsShooterIdle"; 
_unit switchMove "Acts_JetsShooterIdle_m";
_unit switchMove "Acts_JetsShooterIdle2";
//���ַ��ں�����(���������ظ�����λ�ᱣ�������һ֡)
this switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
//�Ƴ���λ���������͵���
removeAllWeapons player;
//����ѹ��
_soldier doSuppressiveFire tar_1; //��λ�������Ŀ��
//���õ���ʣ���ӵ� ��λ setAmmo [ǹ��,����]
bis_miller setAmmo [currentWeapon bis_miller, 0];
//Ϊ�����������ӵ�ҩ
player addMagazines [primaryWeaponMagazine player select 0, 3];
//�Ƴ���������������е�ҩ
[] spawn {
	player removeMagazines (currentMagazine player); 
	sleep 0.1;
	player removePrimaryWeaponItem (currentMagazine player );  
};

//Ŀ��enableGunLights�ֵ�Ͳ/�����ģʽ
//"Auto"         - ȡ����ս��ģʽ
//"ForceOn"   - ʼ�տ���
//"ForceOff" - ʼ�չر�
_unit enableGunLights "Auto";
//���õ�����Ԫ��С����ΪΪ��ȫ
unit1 setCombatBehaviour "SAFE";
group setCombatBehaviour "AWARE";	
this setCombatBehaviour "Careless";//��������
//���õ�λ����ʶ
_unit setUnconscious true;
//����һ���ڱ������ڸ�����λ��(������)���𡣵�λ����Ҫ�ڴ��������,����������ڻ���,��ô���������������
Mortar doArtilleryFire [[3000, 120, 0], "8Rnd_82mm_Mo_shells", 3]; 

//���������붯�����Զ��˳�������ʹ�ý���AI����
soldier1 disableAI "anim";

//��Ҫ�ָ�ʱʹ��
soldier1 enableAI "anim";
//��ֹAI�ƶ���ת�򣬰���AI���ݵĳ���
soldier1 disableAI "Move";//�ָ�ͬenableAI
//"autocombat" ��ֹAI������в���л���ս��״̬��������AI���쵽��Ŀ�ĵ�
//"NVG" 	��ֹAI���ҹ����
//"path"	��ֹAI�ƶ���������ֹ������Ŀ��

//ʿ��ɥʧ��ʶ
_soldier setUnconscious true;

//���������� 0~1ԽСʿ��Խ����������
this allowFleeing 0;
//����ս��ģʽ
_grp setCombatMode "YELLOW";
//���õ�λս��ģʽunit setUnitCombatMode mode;
//"Blue" �������𲢱��ֶ���
//"Green" ͣ�𲢱��ֶ���
//"White" ͣ�𵫿�������ѡ��Ŀ��
//"Yellow" ���ɿ��𲢱��ֶ���
//"Red" ���ɿ������ɽ�ս

//���ó�����Ա�������Ƿ���ս��״̬ʱ�³������Ϊture����λ�������³�
_veh setUnloadInCombat [true, false]; //setUnloadInCombat [allowCargo, allowTurrets]
//���ó������Ĵ�/��������ʱ�Ƿ��³������ڳ�����ˮ��������ը����һ��ʱ�䣬������Ȼ���뿪
_vehicle allowCrewInImmobile true; //allowCrewInImmobile [brokenWheels, upsideDown]

//�����ĵ�λ
bis_endUnits = ([BIS_air, BIS_inf] + units group BIS_officerHeliD + units group BIS_heli2D + BIS_heli2Team + units group BIS_ambHeli1D + units group BIS_ambHeli2D);
//ɾ������Ҫ�ĵ�λ
{deleteVehicle _x} forEach ((allUnits + vehicles) - BIS_endUnits);


//����ʹ��forEach���������������Ҫ��������������ִ�д������Ӧ�ٶ�ʼ�ձ�foreach��,�������ٶȿ��ܱ�foreach��
[_unitOne, _unitTwo, _unitThr] orderGetIn true;
{_x assignAsCargo _veh } forEach units player;

//ɾ�����С��
{deletevehicle _x} forEach (units group1 + units group2)
//ͬʱɾ������ؾߺ��ؾ߳�Ա
{deletevehicleCrew _x;deletevehicle _x} forEach [_veh1 , _veh2 , _veh3];
//ͬʱ��Ч�������ͬС�ӵĵ�λ����ͬһ��С�ӵ�ĳЩ��λ
{_x allowdammage false; _x setCaptive true;} forEach [leaderplayer,teamplayer1,teamplayer2,staygroup];
units player orderGetIn true; 
//����λ��
_obj SetPos [0,0,0];
//��������
hideObject _obj; _obj hideObject false;
//����/����ģ��
player enableSimulation false;

//������ϷҪʹ��ר����������ģ�Ⲣ��ʾ���壬
_obj hideObjectGlobal false ; _obj enableSimulationGlobal true;
//�����ؾ�ȼ��(0~1)
_veh setfuel 0.5;
//�������ײ�ɱ�����
_mines = createMine ["APERSMine", getposATL player, [], 0];
_mines setdammage 1;
player setdammage 1;
//�����ڵ�ɱ�����
createVehicle ["M_Mo_120mm_AT", position player, [], 0, "NONE"];
player setdammage 1;
//Ϊָ�������趨������װʱ�䣬��������Ч ���� setWeaponReloadingTime [���� , ǹ������]
_vehicle setWeaponReloadingTime [gunner , currentMuzzle gunner , 0.5];

//Ҫʼ�յ�������������װʱ��ʱ��
this addEventHandler  ["Fired" ,{ 
	_this # 0 setWeaponReloadingTime [gunner (_this # 0), currentMuzzle (gunner (_this # 0)), 1/3] ; 
}];

//���һ���¼���������õ�λ����ĵ��������̶�Ŀ��
this addEventHandler ["Fired", {
	params ["_unit", "_projectile" ];
	_unit = _this select 0;
	_projectile = _this select 6;
	_projectile setMissileTarget _target;
}];

//��ͨ�����Ʋ��ᷢ���������⣬���������ʹ�����ǵĻ��������ϣ���ƴ�һ��ʼ������ֻ�轫����� init �ֶμ��ɡ�
this animate ["BeaconsStart", 1]; //���ھ���ԽҰ
this animateSource ["lights_em_hide",1];//���ھ���;Ȼ���
//��ԽҰ���ͻ����ľ�����
[this,"CustomSoundController1",1,0.2] remoteExec ["BIS_fnc_setCustomSoundController"];
//�رվ�����
[this,"CustomSoundController1",0,0.4] remoteExec ["BIS_fnc_setCustomSoundController"];

//ǿ�ȵ������������,�����������������λ��
vehicle player fireAtTarget [vehicle player ,"cannon_railgun_fake"]
gunner _veh fire "cannon_railgun_fake";
gunner _veh forceWeaponFire ["cannon_railgun_fake","ai"];

//���ñ�¯��״̬ true��ʾ����ȼ��
_object inflame true;

//���Ƴ����ٶ�
this limitSPeed 60; //60km/h
this limitSpeed -1; //С������κ��������ڽ������

//������ҳ������ٶ� ������ʹ�� PID ���������ǳ���������/�ƶ�������ʵ�ֵ�
this setCruiseControl [50, false]; //������Զ���ᳬ��50Km/h
//���Ʒ������߶� object flyInHeight [�߶�, ǿ��];Ĭ�ϲ�ǿ�ƣ���[100,false]
this flyInHeight 80; //����������80�߶ȷ���
this flyInHeight [60, true]; //ǿ�Ʒ�������60�߶ȷ���

/*==============================����============================*/
//�����ַ��������а�
copyToClipboard "��ã�";
//�����Ҫ�����ַ����������ĵĸ��ƣ���ʹ�ã�
forceUnicode 1;
copyToClipboard str _data;
/*============================���============================*/
//���ص�λ��ǰʹ�õ�ǹ��;
currentMuzzle _unit;//"Missile_AGM_02_Plane_CAS_01_F"�նԵص���

//����һ������У�����ָ��ʱ������ʾ
_laser = "LaserTargetW" createVehicle (getPosATL BIS_target);  //westbase LaserTargetW
_laser attachTo [BIS_Target, [0, 0, 1]]; //������и�����Ŀ����
west reportRemoteTarget [_laser, 3600];
//���Ŀ�� �������׼��λ�õ�Ŀ��
cursorTarget;
//���ض�������ڵ��ε�λ��
getPosATL _obj; getPos _obj;
//�����Զ���Ϊ���ĵĺ�ƽ��߶�
getPosWorld _obj; getPosALS _obj;
//���ö���߶�
[this , 10 ] call BIS_fnc_setHeight;
//��ȡ��λ���� 
_type = typeOf player; // "B_Story_Protagonist_F";
//�����������ѡ��
selectrandom [1, 2, 3, 4];//��������������κ�һ��
//��������� random ���֡�
random 3; //��������ֲ����� 0 < x < 3������
//ͨ��ȫ�ֱ��������Ա������װ��������
//��ȡ���װ��
private _varsToSave = getUnitLoadout player; 
//�����װ����������Ϊ"testsave_1"�ı��ر�����
profileNamespace setVariable ["testsave_1",_varsToSave];
//ǿ�Ʊ���
saveProfileNamespace;

//�ٴζ�ȡ
BIS_playerInventory = profileNamespace getVariable "testsave_1";
//�������װ��
player setUnitLoadout BIS_playerInventory;
//��ձ���ı��ر���
profileNamespace setVariable ["testsave_1",nil];

//�������Ƿ�Я������
primaryWeapon player ==  "";
secondaryWeapon player ==  "";
//�������Ƿ�Я����ǹ
handgunWeapon player == "";
//���ص�λ������
primaryWeapon player;
//�����������ݵĵ�ҩ
compatibleMagazines  ["arifle_Katiba_GL_F", "this"]; //compatibleMagazines [������ǹ��]

//��鵥λ���������صĵ�ҩ
primaryWeaponMagazine _units;
//��ȡ��λ���ڼ��ӵ�Ŀ��
getAttackTarget _unit;
//��Ҫ������������״̬�����ʱ�Ŵ���
_var && this;//&&����������Ϊ��ʱ����Ϊtrue

(alive player) || this;//||��������֮һΪ��ʱ����Ϊtrue

//ͬʱ������������Ϊ��ʱ����true
(((!alive soldier1) && (!alive soldier2)) && ((!alive soldier3) && (!alive soldier4)))
//���򵥵ķ�ʽ
(alive soldier1) && (soldier1 in BIS_car) && (triggerActivated _tri) && (!alive soldier4) && (!alive soldier5)
//���������ͼ��ǵľ���
(player distance markerpos "marker_0") <= 15;

//��鴥�����Ƿ񼤻���Ѽ������true
triggerActivated _trg;

//����Ϊ��λ��ͣ����ʱ��Ĵ���ִ�С�˯�߾�����֡�ʸ������������ӳ���Ԥ�ڵ���С�ӳ١������ڼƻ��������ã�����execVM��spawnִ�еĽű��ȡ�
sleep 1; //��ͣһ��

//���𣬵ȼ�Ϊ1~4
[4] spawn BIS_fnc_earthquake;
//(���Ŀ���Ƿ�Ӵ�����)
isTouchingGround player;
//�������ڳ����еĵ�λ��Ӧ��ʹ��
isTouchingGround (vehicle player); // anytime is true

isTouchingGround vehicle; //True when on the ground
itemsWithMagazines player  || (items player + assignedItems player);
//��鵥λ���.Ҫע����ǣ������Ʒ�������Դ������������δ����ͬ��Ҫ��ȡ����Ŀ���ƣ���Ҫʹ�ü��������ȡ��
//�����λӵ��GPS���򷵻�true
"ToolKit" in (items player + assignedItems player)
//������ ���� ToolKit
 
("ToolKit" in (items player + assignedItems player)) 


//�������Ƿ��ڻ״̬
mineActive _mine;
if (mineActive _mine) then { } else  {  hint "���Ǽٵ�"  } ;
//���ص�λ��С�ӳ�
leader player;

//ȡָ������󴥷� _item����Ϊ�������
player addEventHandler ["Take", {
	params [ "_unit", "", "_item"];
	if (_item == "B_AssaultPack_rgr") then {
		_code;
	};
}];
//�����Ŀ���״̬
{alive _x} count [ BIS_AA1, BIS_AA2] == 0;
//���С������״̬
{alive _x} count units _group == count units _group;

//��鳵��ȼ��
if (fuel vehicle player == 0) then {hint "�����ؾ�û��ȼ���ˣ�"};

openMap [true,false]; //�����򿪵�ͼ
openMap [false,false]; // �����رմ򿪵ĵ�ͼ
openMap [true,true]; //ǿ�ƴ򿪵�ͼ�����ִ�״̬(�û��޷����йر�)

//�������Ƿ�����ĳ������
_obj isKindOf "MRAP_02_base_F"; //CSAT�����ؾ�MRAP
_obj isKindOf "MRAP_01_base_F"; //NATO��MRAP������01Ϊ��Լʹ�� 02ΪCSATʹ�� 03����AAF
"LSV_02_base_F" //CSAT����ͻ����
"Tank" //ȫ��̹�˵����ͣ��Լ������ؾ�����
"Wheeled_APC_F" //��ʽװ�׳�

//����������
_type = typeof _object; 

//�����ҳ����Ƿ����ڸ�������
vheicle player iskindof "Truck_02_base_F";

//���ص�λ�����ĸ�����ǰѡ�������״̬
_wsPlayer = weaponState player;
//["arifle_MXC_ACO_F","arifle_MXC_ACO_F","Single","30Rnd_65x39_caseless_mag",30,0,0]
//��λ��ǰ����ģʽ
_muzzle = weaponState player select 2;//ǹ��
_weaponMode = currentWeaponMode player;//ģʽ

//���ѡ��
_projectiles = [1, 2, 3, 4];
selectRandom _projectiles;//���������1~4������һ��

//������ĸ����͵��ؾ����������һ��
_projectiles = ["C_Truck_02_box_F" , "C_Truck_02_transport_F" , "C_Truck_02_fuel_F" , "C_Truck_02_covered_F"];  
_class = if (typeName _projectiles != "ARRAY") then {
		_projectiles;
	} else {
		selectRandom _projectiles;
	};
_projectile = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];

//�۲�ԱΪ�ѻ��ֱ���Ŀ��[�ѻ���,�۲�Ա]
[player, unitSpotter] call BIS_fnc_spotter;

//�����ǰ�������������׼��� 
bis_camera = "camera" camCreate (player modelToWorld [0,5,1]);//���� camCreate λ��
bis_camera cameraEffect ["internal", "back"]; //���������ͼ
bis_camera camPrepareTarget player; //�������Ŀ��
BIS_camear camCommitPrepared 0; //�����λĿ���λ����Ҫ���Ѷ��:0��

bis_camera cameraEffect ["terminate", "back"];//������ͼ
camDestroy bis_camera;//ɾ�����
//����������ʾ��ЩHUDͼ��
showHUD [
	true, // scriptedHUD ����׼�ǡ����ֲ˵�
	false, // ��ʾ������ʿ����������Ϣ
	true, // �����״�
	true, // ��������
	true, // ����ָʾ
	true, // HC�������˵�
	true, // group
	true, // ����HUD���
	true, // �Զ�����Ϣ
	true, // kills
	true  // showIcon3D
];
showHUD [true, false, true, true, true, true, false, true, false, false, true];

//��������ͷ�������˻�Ч��
[player, "Sytar", 300, 250, 75, 1, [], 0, true] spawn BIS_fnc_establishingShot;

[player, "Sytar", 0, 0, 0, 0, [], 0, true] spawn BIS_fnc_establishingShot;
//�ڼ�����ӿ�ָ���ͼ������
<marker name='marker_0'>����</marker>
//�������ӽ�������,���ҶԺ�������Ϸ�������Ч
[
	player, // Ŀ�����
	"Hack Laptop", // ��������
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// ��ʼ����ʱʹ�õ�ͼ��
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// ������ʹ�õ�ͼ��
	"_this distance _target < 3",	// ��������������
	"_caller distance _target < 3",	 // ��ɶ���ʱ�ľ���
	{}, // ������ʼʱִ�еĴ���
	{}, // ִ�ж�����ÿ�����ʱִ�еĴ���
	{}, //�������ʱִ�еĴ���
	{},  // �����ж�ʱִ�еĴ���
	[], // Arguments passed to the scripts as _this select 3
	12, // ��ɶ�������ʱ��
	0,  // Priority
	true,  // ִ�к�ɾ��
	false // �Ƿ���������ʶ״̬��ʹ��
] remoteExec ["BIS_fnc_holdActionAdd", 0, player];	// MP����
//������Ϸֻ��Ҫ��ô������
[ 
	BIS_toCam, 
	"�鿴",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{ }, 
	{},  
	{ execVM "vedio_Complete.sqf"}, 
	{},
	[],
	3,
	0, 
	true, 
	false
 ] call BIS_fnc_holdActionAdd;

"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa" //����
"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa" //̸��

//���ñ�����Ϸ
enableSaving [true, true];

//���õ�ͼ��ǿɼ���/��ɫ
"marker" setMarkerAlphaLocal 0.5;
"marker" setMarkerAlpha 0.5;
//�������ǰ����һ��ֱ����ͣ��ƺ
createVehicle [ "Land_HelipadSquare_F", player modelToWorld [0, 10, 0]];

/*===================================������׽=======================================*/

//¼���ؾ�BIS_vehicle�Ĺ켣
[vehicle player, 240] spawn BIS_fnc_UnitCapture;

//¼���ؾ߹켣��Esc������ʹ��F1�������ݡ�����һ��scenes.sqf���ļ����򿪲�ճ�����ݺ󱣴�
//��init.sqf
myscenes = call compile preprocessfile "scenes.sqf";
//������Ϸִ������
[BIS_vehicle, myscenes] spawn BIS_fnc_Unitplay;
//���ؾ߻ط�¼�Ƶ�·�� [�ؾ�,����,nil,nil,nil,nil,�����೤ʱ��]
[BIS_vehicle , rescue , nil , nil , nil , nil , 5] spawn BIS_fnc_Unitplay;

//�ڼ򱨽����󲥷���Ƶ
["a3\missions_f_epa\video\a_m01_quotation.ogv"] spawn BIS_fnc_quotations;
//a3\missions_f_epa\video\c_out2_sometime_later.ogv
//init.sqf:�����Ҫ���ȴ�����ͷӰƬ��ʧ��ִ�С�����Ϊtrue
waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

//���룬��������
titleCut ["", "BLACK FADED", 10e10];
titleCut ["", "BLACK IN", 3];
//�����չʾ��ʾ
[["Common", "GPS"]] call BIS_fnc_advHint;

//����һ����createGroup [�ߣ�deleteWhenEmpty] deleteWhenEmpty����Ϊtrueʱû�е�Ԫ��ɾ��
private _group = createGroup [east, true];
bis_group = createGroup Independent;
//������Ԫtype createUnit [λ�á��顢��ʼ�������ܡ��ȼ�]
//����Ĭ��Ϊ0.5�ȼ�Ĭ��PRIVATE
"B_soldier_M_F"  createUnit  [position  player , group player ,"myUnit = this" ] 
private _Adams = createGroup west;
"B_soldier_TL_F" createUnit [position player ,_Adams ,"BIS_Adams = this",1 ,"SERGEANT"];
BIS_Adams setGroupId ["Adams"];
BIS_Adams setName ["Adams","Adams","Adams"];
[BIS_Adams, "Martinez", "Male01ENGB", 1.0, "Adams"] call BIS_fnc_setIdentity;
[player] join BIS_Adams;

_unit createGroup west createUnit ["B_soldier_TL_F", [0,0,0], [], 0, "none"];
_unit domove [0,50,0]

//��Ļ����
screenshot "";
screenshot "testFile.png";

//������Ի�������,�����������ļ������½�һ���ĵ��������ļ���Ϊ��missionConversations.sqf  Ȼ��������������
case "01_Start": {
		
	player groupchat "text_1";
	sleep 2;
	player sideChat "test_2";	
};

//Ȼ�󷵻ر༭������ʼ��Ϸ������
"01_Start" spawn BIS_fnc_missionConversations;

//���·��
_wp1 = group player_heliD addwaypoint [getPos DemonLand ,0];
_wp1 setWaypointType "TR UNLOAD";

_wp2 = group player addwaypoint [getMarkerPos "marker_2",0];
_wp2 showWaypoint "NEVER";
_wp2 setWaypointVisible  false;
_wp2 setWaypointType "SAD";

//��Ӻ�����ʽ ������ setWaypointStatements [���������ʽ]
_wp2 setWaypointStatements ["true", "player setdamage 1"];

{
	_x = group player addwaypoint [getMarkerPos "marker_0",0];
	_x showWaypoint "NEVER";
	_x setWaypointVisible  false;
	_x setWaypointStatements ["true", "player setdamage 1"];
} forEach _wp1;


/*=======================================��ͼ����=======================================*/

[] spawn {
	openmap [true,false];//ǿ�ƴ򿪵�ͼ�������Թر�
	sleep 1.5;
	["Marker_0", getMarkerPos "Marker_1" , 1, 0] spawn BIS_fnc_movemarker;// һ�����ƶ���marker_1
	sleep 1;
	["marker_2", 1, 3] spawn BIS_fnc_blinkMarker ; // ʹ�á�3��������˸��10����

};

/*=====================================������====================================*/
//��鴥�����Ƿ�(�������true)
triggerActivated _tri;

//������ͬ������Ԫ���ߵ�Ԫ�б�
_acm synchronizeObjectsAdd player; //����������ģ�鱻ͬ�������
_acm synchronizeObjectsAdd units player; //����������ģ�鱻ͬ�������С�ӵ�ÿ����Ա
//ͬ������ɾ��
player synchronizeObjectsRemove [_object1, _object2, _object3];

/*=======================================================��������========================================================================*/
//չ����������
flatten [1, [2], [[3]], [[[4]]]]; //returns [1, 2, 3, 4]
//���ظ������������� typeName �κζ���
hint typeName 0;					//SCALAR
hint typeName "";					//STRING
hint typeName true;					//BOOL
hint typeName [];					//ARRAY
hint typeName {};					//CODE
hint typeName scriptNull;			//SCRIPT (since Arma 3 v1.32)
hint typeName objNull;				//OBJECT
hint typeName grpNull;				//GROUP
hint typeName controlNull;			//CONTROL
hint typeName teamMemberNull;		//TEAM_MEMBER
hint typeName displayNull;			//DISPLAY
hint typeName taskNull;				//TASK
hint typeName locationNull;			//LOCATION
hint typeName sideUnknown;			//SIDE
hint typeName text "";				//TEXT
hint typeName configFile;			//CONFIG
hint typeName configNull;			//CONFIG (since Arma 3 v1.54)
hint typeName missionNamespace;		//NAMESPACE
hint typeName diaryRecordNull;		//DIARY_RECORD (since Arma 3 v2.00)
hint typeName createHashMap;		//HASHMAP (since Arma 3 v2.02)

//������·�����ļ��Ƿ����
fileExists "\Modules_f_joe\Modules_shared\img\goddess_joe.paa";

//������ݣ��Ƚ�ʱ���ִ�Сд
0 in [1,2,3,0]; //true
"abc" in ["abc","a","d"]; //true
"A" in ["a","b","b"]; //false ���ִ�Сд
"door" in "door_01_rot" //true
_unit in _vehicle; //�ڳ��ڷ���true
private _isInside = [1000,2000,0] in MyLocation; //���λ���Ƿ���������
/*========================================����=========================================*/
//�������֣�����
5 fadeMusic 0.25;
playMusic "Track13_StageC_negative";
addMusicEventHandler ["MusicStop", "playMusic 'Track13_StageC_negative';"];
//���ݵ�ǰ��Ϸ���Է��ر��ػ��ַ�����ֵ,������language��ͷ��pbo�ҵ�stringtable.xml�ļ���
localize "str_a3_a_m02_45_keep_moving_alp_0";
format ["%1 - %2",localize "qsl_a3_Joe_Goddess_name",localize "qsl_a3_Joe_BigJoe_name"];
//ָ���ַ����Ƿ���б��ػ�����

isLocalized "str_a3_a_m02_45_keep_moving_alp_0";

//�Ѹñ�����ȫ��㲥,�����з���ֵ
publicVariable "BIS_myvar";

//��ϵRGBA��ɫ��
[0,0.3,0.6,1] 	//��ColorWEST	
[0.5,0,0,1]		//��ColorEAST	
[0,0.5,0,1]		//��ColorGUER	
[0.4,0,0.5,1]	//��ColorCIV	
[0.7,0.6,0,1]	//��ColorUNKNOWN	

//��ϵ��ɫ��ȡ,��һ��ֻ���Ϸ������־䷨ side call BIS_fnc_sideColor
side player call BIS_fnc_sideColor;
side vehicle player call BIS_fnc_sideColor;
side group player call BIS_fnc_sideColor;

//RGBAת HTML��ɫ
[0,0.5,0,1] call BIS_fnc_colorRGBtoHTML;

//���������ͻ�����ʹ���ķ���ֵת��Ϊ�ַ���,str �����ȼ������ߣ���Ҫʱ��Ҫת���Ĵ���������()
str 1; // "1"
str true; // "true"

//����ת�ַ���,�������в����ض�Ԫ��
[1,"2",true] joinString ""; // "12true"

//ִ���ַ�������
_codeString = "player setdamage 1";
_code = compile _code; // {player setdamage 1}; �ǲ��Ǻ���Ϥ��
call _code;

//�������ַ���ת��Ϊcode
_string = ["player", "sideChat", str "�����ҵĿ���" ] joinString " ";//ע��" "��""�ڶ�������һ���ո������Ľ��������������
"playersideChat""�����ҵĿ���"""; //������ȫ���ɵ�
//��ȷ�Ľ����
_code = compile _string;//compile "player sideChat ""�����ҵĿ���"""
_code; //{player sideChat "�����ҵĿ���" };

//�ַ����������
_str = "1,2 3" splitString ", "; //ָ��ʲô�ַ���Ϊ�ָ���"���",���ǻᱻɾ��,�����["1","2","3"]
"123456" splitString "24"; //["1","3","56"] 2��4���滻�ָ���
"ABCDEFG" splitString "DB";//["A","C","EFG"] D��E���滻Ϊ�ָ���
/*===================================�����趨===================================*/
//��ORBATģ����ӵ�ͼ�����һ���������类����
[missionconfigfile >> "CfgORBAT" >> "BIS" >> "B_1_C_2_4", "mil_destroy", [1,0,0,1], 1.2,1.2,45] call BIS_fnc_ORBATAddGroupOverlay;

//����ʱ��ϵ�� 0.1 - 120
setTimeMultiplier 0.5;
//����ģ���ٶ� û�ж������
setAccTime 0.1;
//����ʱ��
setDate [2034, 04, 24, 09, 45];

//���ƹ�����Ϊ���,���������light����,�������ڽ�����
{ 
	_x setLightBrightness 2.0;
	_x setLightAmbient [1.0, 0.1, 0.1];
	_x setLightColor [1.0, 0.1, 0.1];	
} foreach _lightsource;

//�ڼƻ��ռ���ִ�д���ĵȴ�ʱ����ʱʹ��call�ƺ�����
//callֻ����ζ�ţ���������ִ�д��롱�����������ʹ�� then ִ�д���(if (true) then _code) or do .��ˣ�������ı���뻷��
//����ζ��������������(������ʹ��)�����˷Ѻܶ����ܣ�
private _handle = _params spawn MY_fnc_Function;
waitUntil { scriptDone _handle };

//����Ҫ����Ϊ��򵥵���������������Ը�����MY_fnc_Function�в������κ�spawn��execVM����ô_code2���Ŷ���call��ɺ�
_code1;
_params call MY_fnc_Function;
_code2; 
//��ִ����ǰ��Ĵ�����ȫ��ͬ�����飬ֻ��û�д����µ�"���ȳ����߳�"���Һ����޷�ִ�У��ټ���ǰ���ᵽ�ĸ����������ơ�
//�����Ҫ�ڼƻ��⻷����ִ�д��룬�����ʹ�� isNil ���棺���۵�ǰ������Σ�MY_fnc_Functionʼ�հ��ƻ�ִ��
isNil {_params call MY_fnc_Function};

//�������û�в��������Լ򵥵���������
isNil MY_fnc_Function

/*===================================��˹===================================*/
//������˹��������пɱ༭����
private _moduleGroup = createGroup sideLogic;
"ModuleCurator_F" createUnit [
	getPosATL player,
	_moduleGroup,
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; myZues = this"
];
private _addons = curatorAddons myCurator;

myZues addCuratorEditableObjects [allMissionObjects "all",true ];

//��marker_0��Ǹ�����������ģ��
private _pos = markerpos "marker_0" getpos [50 + random 50, random 360];
private _grp = createGroup sideLogic;
"ModuleLightning_F" createUnit [
	_pos ,
	_grp,
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];"
];

//����������˹ģ��
_zeus = (entities "Logic") select { _x iskindof "ModuleCurator_F"};
//������༭���з��õ�ȫ����������������������˹������
{_x addCuratorEditableObjects [allMissionObjects "all",true ];} forEach _zeus

/*===================================MP===================================*/
//��ӣ��Ƴ�����λ��
_respawn = [west,[0,0,0],"������"] call BIS_fnc_addRespawnPosition; //[target,id]
[target,id] call BIS_fnc_removeRespawnPosition;

/*===================================����===================================*/
//������������ϵͳ
player enableStamina true;

/*=================================GUI===================================*/
//��������ʾ�����ı���û������
["Hello, hidden FX", 2, 3, [1,0,0,1], true] spawn BIS_fnc_WLSmoothText; 
//[�ı������ͬʱ��ʾ���С�����ʱ�䡢��ɫ������] spawn BIS_fnc_WLSmoothText

//�ֶ������½�չʾʱ���λ��OSD,���ƶ�������
[  
	[  
		["2035-08-09 ", " "],  
		["05:11","font='PuristaMedium'"],
		["", "<br/>"], 
		["Connor��½��", " "],  
		["", "<br/>"],  
		["�ϲ�Stratis", " "]  
	]  ,
	safeZoneX - 0.01,
	safeZoneY + (1 - 0.125) * safeZoneH,
	true,
	"<t align = 'right' size = '1' font = 'PuristaLight'>%1</t>"
] spawn BIS_fnc_typeText2;


//������Ӱ�߿򣬹���������޷��ƶ���������ʹ����������[ģʽ������ʱ�䡢��������ͼ] call BIS_fnc_cinemaBorder
//ģʽ��0 - ���룻1 - �뿪
[1, 1, ture , ture ] call BIS_fnc_cinemaBorder;

/*==================================�¼��������===================================*/
//ÿִ֡��һ�δ���
addMissionEventHandler ["EachFrame", { /*code*/}];
//���һ���¼��������������Ƿ񿪻�����ѭROE
player addEventHandler [ "Fired", {
	private ["_unit"];
	_unit = _this select 0;
	_weapon = _this select 1;
	if (_weapon in [primaryWeapon _unit, secondaryWeapon _unit]) then {
		_unit removeEventHandler ["Fired", 0]; 
		_unit setVariable ["BIS_firedEH", nil];
		BIS_failedROE = true;
	} 
}]; 
//��λ����
this addEventHandler ["HandleDamage", {  
  	params ["_unit", "_selection", "_damage"]; 
	
	damage _unit + _damage * 0.01;
}];
//����λ����Ʒ���������ʱ��������Ϊ����λ ���� ��Ŀ���ƣ�����λ���������и�����ҩʱ����Ҳ�ᴥ��ʱ��
player addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];

}];

/*==========================���󽻻��¼�============================*/

//�˺���ͨ��������ӡ���ȡ�鱨����Ӳ���������������Ϊ��ҿɼ������鱨����
[this] call BIS_fnc_initIntelObject;

//for init.sqf
if (isServer) then
{
	//�ռ�ͼƬ:
	this setVariable [
		"RscAttributeDiaryRecord_texture", //��Ҫ�޸�
		"a3\structures_f_epc\Items\Documents\Data\document_secret_01_co.paa", //ͼƬ·�����Զ���
		true
	];

	//�ռǱ��������:
	[
		this, 
		"RscAttributeDiaryRecord", //���ͣ������޸�
		["New Intel", "The enemies have a cave troll!"] //�����ʽ�� [����, ����]
	] call BIS_fnc_setServerVariable;

	//Diary entry shared with (follows MP target rules):
	this setVariable ["recipients", west, true];
	//Sides that can interact with the intel object:
	this setVariable ["RscAttributeOwners", [west], true];
};

//��ǰ�ͻ������holdkey�����������֮ǰ��ɫ�������ƶ���ʽ[findDisplay 46, ��������(57Ϊ�ո�), 2(��סʱ��), ��ɺ�ִ�еĴ���({���ʽ})] spawn BIS_fnc_holdKey;
[(findDisplay 46), 57, 2, { systemChat str player }] spawn BIS_fnc_holdKey;

/*
	�ٷ���û��ָ��������Ƴ�holdKey��ʽ����Ϊ��һ�������"�����׶�",�����δ�����Ҵ˽׶ν�����,�����û�������ˡ�
	����������ڳ����׶�,�·������ǿ��õĽ����ֶΡ�
	���ڶ�����Ϸ��,�������ں�̨ʱ����ִ��,��Ȼ�ܹ��ָ���������"��ס keyname �Լ���"�����᳤������Ļ�·���ʾ
*/
findDisplay 46 displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_holdKey_spaceEH"];
uiNamespace setVariable ["BIS_fnc_holdKey_spaceEH", nil];
missionNamespace setVariable [ "BIS_fnc_holdKey_onSkip", true ];


//�����������,����ӵĶ�����޷�����
private _actionId = player addAction ["��ֹ����", { systemChat str "δ������������"; }, nil, 6, true, true, "defaultAction"];
//����ID���룬���ڽ��
player setVariable ["BIS_disableWeaponAction", _actionId];
//��Ҫ�����������ʱ��
private _id = player getvariable ["BIS_disableWeaponAction", -1];
player removeAction _id;

//��������
["AmmoboxInit", [player, true, { _this distance _target  < 10 }]] call BIS_fnc_arsenal;


/*========================================================Config===============================================*/
//���ص�ǰ�Ĳ���б�
activatedAddons