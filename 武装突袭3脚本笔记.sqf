/*
	脚本介绍v1.0
	作者：浮生歇尽
	简介：个人搜集的wiki脚本命令与函数的一些用法, 较为简洁, 仅供学习参考使用。
	建议：使用VScode等专业编程软件，安装相关的SQF语法
	vscode 中的插件名称：
	senfo.sqflint 
	Armitxes.sqf
	HkonRRydland.a3cfgfunctions
	vlad333000.sqf
	--扩展安装完成后选择Armitxes.sqf扩展, 点击设置主题颜色, 之后将sqf文件与sqf语言关联
	如果你感兴趣，可以加入我的群聊一起学习。
	Aram3&武装突袭3:沙雕玩家群：781108732
	Qin的武装突袭三方联机群：	643134730
*/

/*=============================脚本=========================*/
// 开头的以及/**/包含的文本是注释类型, 如果你安装了相应的SQF插件，那么注释会以绿色高亮显示
/*
	包含注释在内的以下类型, 在编译时会被引擎自动忽略, 不会影响你的代码
	行或语句末尾的尾随空格
	空行
	评论
*/
// 评论是一元运算符comment生成的注释, 你要注意的是不应该它, 因为它实际上会被执行(需要时间来执行)使用它没有任何好处
comment "This is a commented line";	
/*=============================初始化顺序=========================*/
/* 
	编译函数或者recompile的函数最早执行
	其次是实体属性
	EDEN的初始化表达式始终早于init.sqf执行, 意味着init.sqf定义的函数不能通过在EDEN初始化调用。并且此时isplayer可能不起作用
	SP模式中init.sqf要早于场景属性被执行
	initServer.sqf在MP中要最先于init.sqf被执行, 然后是initPlayerLocal.sqf 在SP中init.sqf最早执行
*/

// 垫脚石步兵开场背景音乐 "LeadTrack02_F_EXP"
/*=============================单位身份============================*/
// 单人任务设置名字[名字，名字，姓氏], 用于取代玩家本机ID
player setName ["Tony Jackson", "Tony", "Jackson"];
player setName ["Ben Kerry", "Ben", "Kerry"];
[player, "Kirby", "Male08ENGB", 1.0, "Jackson"] call BIS_fnc_setIdentity;

// 剧情单位的特殊性，直接放置后进入游戏并非角色脸部。需要写入初始化：Identity身份包含了面部、音调、扬声器、眼镜、呼号信息
this setIdentity "EPC_B_Miller"; // "Miller"
this setIdentity "EPC_B_James"; // "James"
this setIdentity "EPB_I_Stavrou";
this setIdentity "EPA_B_Hardy";
this setidentity "EPA_B_Adams"; // Adams

// 设置面孔
_soldier setFace "WhiteHead_18";
player setface "WhiteHead_11"; // kirby脸部
BIS_BHQ setface"WhiteHead_07";
// 设置军衔
player setRank "CORPORAL"; // Sgt Jackson // SERGEANT 中士
// 设置音调
_unit setPitch 1;
// 设置扬声器, 单位没有扬声器时会出现静音情况
player setSpeaker "Male08ENGB"; // 美国英语08
// 设置呼号, 默认情况下，在下达命令时，单位按其编号寻址。设置 nameSound 后，它将用于对单元进行寻址。例如：从"2-停火!", 变成: "米勒, 停火!".
_unit setNameSound "Miller";
this setNameSound ""; // 这会重置单位的呼号声音
// 字符串类型可以使用个存在configfile >> "RadioProtocolENG" >> "Words"的任何词汇
// 可以使用getarray检查该词汇是否具有声音文件, 当返回值不为[]时, 那么组长就会正确的使用该名称来下达命令
getArray(configfile >> "RadioProtocolENG" >> "Words" >> "Kerry");
this setNameSound "Alpha";


// 设置单位徽章
[player, "111thID"] call BIS_fnc_setUnitInsignia;
[this, "GryffinRegiment"] call BIS_fnc_setUnitInsignia; // 格里芬团
[this, "CSAT_ScimitarRegiment"] call BIS_fnc_setUnitInsignia; // 弯刀军团
[this, "AAF_3rdRegiment"] call BIS_fnc_setUnitInsignia; // 第三支援团
[this, "AAF_1stRegiment"] call BIS_fnc_setUnitInsignia; // 第一团
[this, "TFAegis"] call BIS_fnc_setUnitInsignia; // 神盾特遣队

// 设置名称["姓名", "名字", "姓氏"]
player setName ["Jones Johnson", "Johnson", "Johnson"];
_soldier setFace "WhiteHead_18";
player setRank "CORPORAL";
// 启用或禁用特性或改变给定单位的特性。
player setUnitTrait ["Engineer", true]; // 工程师，可以维修车辆和拆除地雷
player setUnitTrait ["ExplosiveSpecialist", true]; // 爆炸专家 可以解除地雷
// 获取单位特征
getUnitTrait player;

// 在士兵背心中添加探雷器 
_soldier addItemToVest "itemGPS";

// 改变物体尺寸, 不适用于修改活动物体的大小，因为这会在物体变化后下一帧恢复原始大小。
this setObjectScale 10; // 限制为0.0001~65504倍
// 持久性的改变名称叫myUnit的单位的大小, 但注意此功能用于多人游戏时大量单位会严重影响性能，请谨慎使用。
addMissionEventHandler ["EachFrame", {
	myUnit setObjectScale 2;
}];
// 改变物体质量, 质量与原本质量相差太多时, 车辆和角色的移动可能会出现异常, 应该提前获取原本质量
_Object setMass 10;
// 获取物体质量
getMass _object; 

// 开门(建筑):对象 animate [动画门名称, 阶段(0~1), 速度];
_build animate ["Door_1_rot", 1];
// 无线电以及对话:
player groupChat "Hi there"; // 小队通讯，绿色 1"Hi there"
player sideChat "Show this text"; // 无线电通讯阵营频道的通话，蓝色 Alpha 1-1 "Show this text" 
player globalChat "globalChat"; // 全球频道(不使用设备)的通话，白色 OPFOR"globalChat"
player systemChat "这是系统提示"; // 灰色，没有前缀
vehicle player vehicleChat "车辆频道"; // 橙色 飞行员 "车辆频道"
player commandChat "Show this text"; // 指挥频道 黄色 Alpha 1-1 1 "Show this text"

(leader player) groupchat "text";

// 自定义无线电频道 radioChannelCreate[颜色数组, 标签, 类型("%UNIT_NAME":显示单位姓名 "%CHANNEL_LABEL":显示频道标签), 可以接收和发送消息的单位列表]
// 玩家使用side_2，颜色同样为白色，但说话时只显示电台名称，电台名称设置为角色名字。
side_1 = radioChannelCreate [[1, 1, 1, 1], "Direct Chat", "%UNIT_NAME", [WS1, WS2, leader player, player]];
// 显示自定义名称
player_radio = radioChannelCreate [[1, 1, 1, 1], "(Jackson)", "%CHANNEL_LABEL", units player];
WS1 customChat [side_1, "Bout fucking time you bundas"];
player customChat [side_2, "got here!"];
/* 
	customChat [side_1, ""];
	WS1(单位姓名) "Bout fucking time you bundas got here!"
*/
// 模拟载具电台
side_2 = radioChannelCreate [[1, 0.8, 0, 1], "Custom_2", "%UNIT_NAME", units player];
// 将单元从自定义频道删除
side_1 radioChannelRemove [blufor_unit_1, blufor_unit_2];
// 将单元添加到自定义频道
side_1 radioChannelAdd [player, _unit];


// 按照给定时间展示一定的字幕
[
	["Speaker1", "Subtitle1", 0], 
	["Speaker2", "Subtitle2", 5], 
	["Speaker3", "Subtitle3", 10], 
	["说话的人", "字母", 15]
] spawn BIS_fnc_EXP_camp_playSubtitles; // displays 4 subtitles with 5 seconds between them
["Speaker1", "Subtitle1"] call BIS_fnc_showSubtitle;
// 可以通过此命令强制关闭字幕
BIS_fnc_EXP_camp_playSubtitles_terminate = true;

// 检查一个单位是否有给定的武器在手上或背部，背心背包不记。例为MX ACO红色。
if !(player hasWeapon "arifle_MX_ACO_pointer_F") then {systemChat "他带有武器！"};

/*=================================载具================================*/
// 在战场上设置一个废弃车辆，它的炮塔默认位置会看起来很不生动，我们可以设定一个目标，让它看起来是在作战时被毁掉的。
soldierone doWatch eastsoldier; // 炮手soldierone看向敌人士兵eastsoldier的位置
soldierone doWatch markerPos "Marker_0"; // 士兵看向地图标记变量Mraker_0的位置
// 设置一个触发器，让该士兵有时间瞄准他的目标，随后，触发器生效。单位死亡，一个废弃的装甲车。
soldierone setDamage [1, false]; // false, 跳过破坏效果
// 但这不是最高效的做法, 为了优化场景, 应该使用简单对象
this animate ["mainturret", rad 290, true]; // 旋转炮塔
this animate ["maingun", rad 10, true]; // 设定武器仰角
// 设定破损纹理, 纹理可以在载具的pbo中看到, 每个载具都有对应的破损纹理(后缀为destruct的rvmat文件)，不同载具也可以通用, 单位了丰富性建议使用多样的纹理
{this setObjectMaterial [_foreachindex, _x];} foreach 
[
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_body_destruct.rvmat", 
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_turret_destruct.rvmat", 
	"A3\Armor_F_Gamma\MBT_02\Data\MBT_02_tracks_destruct.rvmat"
];

// 应用于初始化，将地图物件转化为简单对象(适用于选项中没有的对象，不适用于人物、装备、触发器模块。使用在建筑时，门会无法开启
_type = typeOf this;
_pos = getPosWorld this;
_dir = getDir this;
_vectorDirUp = [vectorDir this, vectorUp this];
deleteVehicle this;
_object = createSimpleObject [_type, _pos];
_object setPosWorld _pos;
_object setVectorDirAndUp _vectorDirUp;
_object setdir _dir;

// 删除指定载具，如果载具内仍有成员, 他们就被扔在原地
deleteVehicle _Vehicle
// 删除有成员的车辆时，应该使用。
{_car deleteVehicleCrew _x} forEach crew _car;
deleteVehicle _car;
// 从2.06版本开始可用此命令删除成员
DeleteVehicleCrew _vehicle;

// 派指士兵作为载具驾驶员，在此代码生效下，其他人进入载具时将不再选择驾驶员
_soldier1 assignAsDriver _tank;
// 分配一个单位作为车辆的成员。与orderGetIn一起使用让成员进入特定车辆。在使用此命令之前，单位不能进入车辆的。
_soldier1 assignAsCargo _truck;
// 分配货物索引，以小鸟直升机为例，0, 1两个位置为直升机后座，3, 4为左侧长凳，2 5反之。
player assignAsCargoIndex [resuceHeil, 1];
// 命令单位下车, 可以和orderGetIn true反复使用
[_unitOne, _unitTwo] orderGetIn true;
[_unitOne, _unitTwo] orderGetIn false;
// 但建议使用allowGetIn命令
units player allowGetIn false;

// 目标士兵立即进入载具；跳过进入动画和路程, 可以使用代替语法[载具, 位置索引]来强制单位进入某个座位
_soldier moveInCargo _jeep; 
_soldier moveInCargo [_vehicle, 2]; // 进入第三个位置而不是默认的第一个

// 单位立即进入载具的第一可用位置：与小队长命令的位置、3DEN和宙斯的拖动进入效果相同
// 按照驾驶员(moveInDriver) → 指挥官(moveInCommander) → 炮手(moveInGunner) → 炮塔(moveInTurret) → 乘客(moveInCargo)的顺序进入
player moveInAny _tank;
// 锁定载具，阻止玩家进出，但可以由团队队长的指令，和运输卸载路点来让玩家出去。
_veh lock true;
// 锁定载具的特定座位
_veh lockCargo [0, true];
// 弹出所有乘客，必须事先允许士兵离开载具，否则他们会再次乘上
{moveOut _x; _x leaveVehicle _vehicle} forEach units _grp;
_vehicle lockCargo [0, true];
// 载具引擎关闭
_heli action ["engineOFF", _heli];
// 载具引擎开启的两种方式
_vehicle action ["engineON", vehicle _vehicle];
_vehicle engineon true;
// 创建一个开始时在地面的直升机
[this, 0] call BIS_fnc_setHeight;
this engineOn true;

// 离开载具 参数可以是unit或者group
_unit leaveVehicle _vehicle;
_grp leaveVehicle _vehicle;

// 为车辆上的门制作动画。[门名，阶段，瞬时]
_object animateDoor ["Door_L", 1, true]; // 立即打开左门，无动画
_object animateDoor ["Door_L", 0]; // 关闭右门
// 当AnimateSource动画属性source为door时，必须改用animateDoor，否则无法启用门动画，此命令无法半开门，当类型为"User"时必须使用animateSource
this animateDoor ["Door_6_Source", 1];
// 带有“hit”控制器的源可以使用将 setHitPointDamage 命令应用于 hitpoint 属性中包含的名称进行动画处理。0~1代表伤害
vehicle player setHitPointDamage ["hitEngine2", 1.0];

// 更改舰艇机库大门状态
[this, 1] call BIS_fnc_destroyer01OperateHangarDoors; // to open doors
[this, 0] call BIS_fnc_destroyer01OperateHangarDoors; // to close doors


// 打开车辆车灯适用于无人载具
_vehicle setPilotLight true;
// 打开防撞灯
_heli setCollisionLight true;
// 设置载具弹药
_vehicle setvehicleammo 1;

// 在空中生成飞机
private _plane = createVehicle ["O_Plane_Fighter_02_F", getPosWorld player, [], 0, "FLY"];
// 创建载具成员
createVehicleCrew _plane;
// 如果可能，将载货车辆装载到车辆内，根据车辆是否能够装载返回布尔值。也可用于卸载特定装载车辆或所有装载车辆。
blackfish setVehicleCargo offroad;
private _success = objNull setVehicleCargo offroad; // 卸载特定装载的车辆(如果从高空掉落将降落伞)
private _success = blackfish setVehicleCargo objNull; // 卸载所有车辆(如果从高空掉落，将会降落伞)

// 强制设定车辆的热度 0是最冷状态，1是最热状态。三个参数分别是[引擎/车身, 履带/车轮, 炮塔]
this setVehicleTiPars [1, 1, 1];
{_x setVehicleTiPars [1, 1, 1]} forEach vehicles;
/*====================================================路点篇==============================================*/
// 单位被命令移动到指定位置(必须为地图标记变量，否则下属将拒绝)
[_soldier1, _soldier2] commandMove getMarkerPos "Marker1";
// 单位主动向指定位置移动(必须为地图标记变量，否则下属将拒绝)
this doMove (getMarkerPos "Marker1");
// 命令给定的单位移动到给定的位置(通过无线电)，该命令不会放置可见的航路点标记。
// 可以将小队长与队员的命令分开，这样讲会看到发送无线电消息
[_soldier] commandMove getMarkerPos "Marker_0";
[_soldier1, _soldier2] commandMove getMarkerPos "Marker_0";

// 添加路径点 位置 优先级(0为当前)
Alpha addWaypoint [getposATL w1, 0];
// 设置标记路径点不可见
[Alpha, 0] setWaypointVisible false;
/*================================================单元控制/对象操作===========================================*/
// 为编辑中所选的第一个单位执行动画
((get3DENSelected "object") # 0) switchMove "动画名称";

// 设置动画速度
_unit setAnimSpeedCoef 1;

// 单位加入不存在的小组(离开当前小队)
[_unitOne, _unitTwo] join grpNull;

// 将单元加入给定的组，如果位置 id 可用，则使用该组。不提示"x 加入团队"这样的无线电通信。
player joinAsSilent [_group, 4];
// 将阵列中的所有单元静默加入给定组(无无线电消息)。
[_unitOne, _unitTwo] joinSilent (group player);

// 设置玩家与原先团队分离，然后成为团队队长，并且为一号位时。
// 先建立第一个小队(玩家不为队长，团队呼号默认Alpha 1-1)，然后设置脚本：
[player] join grpNull; // 玩家进入不存在的小组
// 此时打开团队信息时发现，玩家会显示Alpha 1-2 x.团队队长(x为原始小队的序号)，我们再让玩家加入一次小队
player joinAs [player, 1];
// 此时就会变为 Alpha 1-2 1.团队队长
// 然后再让其他成员加入即可
[soldier2, soldier3] join _group;
// 设置团队呼号
group player setGroupId ["Kerry"]; // Kerry 1.团队队长
// 结合使用
[player] join grpNull;
player joinAs [player, 1];
group player setGroupId ["Jackson"];
// 为玩家团队选择一个领导者，可以是小队中的任意一人。
group player selectLeader _soldier1;

// 切换玩家的武器姿态，安全/警戒
player action ["WeaponOnBack", player];
// 为玩家添加三个弹夹然后强制重新加载
player addMagazine ["30Rnd_65x39_caseless_mag", 3];
reload player;
// 设置单位姿态
_soldier setUnitPos "UP";
// "UP" 	站起
// "MIDDLE" 	跪地，如果单位没有武器，则不会跪下
// "DOWN" 	卧倒
// "AUTO"	自主选择姿态

// 为小队设置姿态，同时不会有无线电消息
{_x setUnitPos "MIDDLE"} forEach units player;


// 设置单位技能 0~1
_soldier setskill 0.7;
// 士兵监视目标
_soldier doWatch player;
// 命令士兵标准指定目标
_ESoldier1 doTarget _WSoldier1;
// 控制单元正在查看的内容(目标或位置)。如果目标被使用，它将被完全暴露。
_someSoldier lookAt _otherSoldier;
// 控制单位的视线(目标或位置)。如果目标被使用，它将被完全暴露。部队在那里扫视的频率取决于行为。
_someSoldier glanceAt _otherSoldier;
// 命令士兵开火
_ESoldier1 doFire _WSoldier1;
// 强制单位开火_unit forceWeaponFire [枪口, 模式]; [对象, 枪口] call BIS_fnc_fire;
_unit forceWeaponFire [primaryWeapon _unit, currentWeaponMode _unit];
[BIS_inf, currentMuzzle BIS_inf] call BIS_fnc_fire;
[BIS_tank, "cannon_120mm"] call BIS_fnc_fire;
[BIS_tank, "SmokeLauncher"] call BIS_fnc_fire; // 坦克发射弹幕

// 直升机降落 [组、位置、目标(停机坪对象)]
[group player, [0, 0, 0], BIS_vehicle] spawn BIS_fnc_wpLand;

// 禁止士兵移动
_soldierOne disableAI "Move";

// 使用setCaptive命令可以阻止敌方单位向目标单位开火。被视为属于平民，但仍然会射击他的敌人，不会移除武器，不会影响小队分配；如果单位是车辆，则标记指挥官。
_soldier setCaptive true; // _soldier 可以向敌人射击，但敌人不会还击
_soldier1 setCaptive 1; // 设置士兵为俘虏(数值非零即设置俘虏)
// 您可以通过取消俘虏状态重新激活敌意。
_soldier setCaptive false; // _soldier 将再次被敌方单位射击
// 东西方 CSAT与NATO关系，0为敌对；1为友好
east setFriend [west, 1];
west setFriend [east, 1];

// 相应的被俘虏站姿
_unit switchMove "Acts_JetsShooterIdle"; 
_unit switchMove "Acts_JetsShooterIdle_m";
_unit switchMove "Acts_JetsShooterIdle2";
// 举手放在后脑勺(无需设置重复，单位会保持在最后一帧)
this switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
// 移除单位所有武器和弹夹
removeAllWeapons player;
// 火力压制
_soldier doSuppressiveFire tar_1; // 单位不断射击目标
// 设置弹夹剩余子弹 单位 setAmmo [枪口, 数量]
bis_miller setAmmo [currentWeapon bis_miller, 0];
// 为玩家主武器添加弹药
player addMagazines [primaryWeaponMagazine player select 0, 3];
// 移除玩家主武器的所有弹药
player removeMagazines (currentMagazine player);
player removePrimaryWeaponItem (currentMagazine player); 


// 目标enableGunLights手电筒/激光灯模式
// "Auto"		- 取决于战斗模式
// "ForceOn"	- 始终开启
// "ForceOff"	- 始终关闭
_unit enableGunLights "Auto";
// 设置单个单元或小队行为为安全
unit1 setCombatBehaviour "SAFE";
group setCombatBehaviour "AWARE";	
this setCombatBehaviour "Careless"; // 漫不经心
// 设置单位无意识
_unit setUnconscious true;
// 命令一个炮兵部队在给定的位置(无声地)开火。但位置需要在大炮射程内, 如果火炮正在换弹, 那么开火次数将被忽略
Mortar doArtilleryFire [[3000, 120, 0], "8Rnd_82mm_Mo_shells", 3]; 

// 如果人物进入动画后自动退出，可以使用禁用AI动画
soldier1 disableAI "anim";

// 需要恢复时使用
soldier1 enableAI "anim";
// 禁止AI移动和转向，包括AI操纵的车辆
soldier1 disableAI "Move"; // 恢复同enableAI
// "autocombat" 禁止AI发现威胁后切换到战斗状态，可以让AI更快到达目的地
// "NVG" 	禁止AI佩戴夜视仪
// "path"	禁止AI移动，但不禁止他看向目标

// 士兵丧失意识
_soldier setUnconscious true;

// 设置允许害怕 0~1越小士兵越不容易逃跑
this allowFleeing 0;
// 设置战斗模式
_grp setCombatMode "YELLOW";
// 设置单位战斗模式unit setUnitCombatMode mode;
// "Blue" 永不开火并保持队形
// "Green" 停火并保持队形
// "White" 停火但可以自由选择目标
// "Yellow" 自由开火并保持队形
// "Red" 自由开火，自由接战

// 设置车辆成员和炮手是否在战斗状态时下车，如果为ture，单位会立即下车
_veh setUnloadInCombat [true, false]; // setUnloadInCombat [allowCargo, allowTurrets]
// 设置车辆在履带/车轮受损时是否下车，但在车辆溺水、即将爆炸或倒置一段时间，他们仍然会离开
_vehicle allowCrewInImmobile true; // allowCrewInImmobile [brokenWheels, upsideDown]

// 保留的单位
bis_endUnits = ([BIS_air, BIS_inf] + units group BIS_officerHeliD + units group BIS_heli2D + BIS_heli2Team + units group BIS_ambHeli1D + units group BIS_ambHeli2D);
// 删除不必要的单位
{deleteVehicle _x} forEach ((allUnits + vehicles) - BIS_endUnits);


// 合理使用forEach代码可以缩减不必要的任务量，逐行执行代码的响应速度始终比foreach快, 但编译速度可能比foreach慢
[_unitOne, _unitTwo, _unitThr] orderGetIn true;
{_x assignAsCargo _veh} forEach units player;

// 删除多个小队
{deletevehicle _x} forEach (units group1 + units group2);
// 同时删除多个载具和载具成员
{deletevehicleCrew _x;deletevehicle _x} forEach [_veh1, _veh2, _veh3];
// 同时生效到多个不同小队的单位或者同一个小队的某些单位
{_x allowdammage false; _x setCaptive true;} forEach [leaderplayer, teamplayer1, teamplayer2, staygroup];
units player orderGetIn true; 
// 设置位置
_obj SetPos [0, 0, 0];
// 隐藏物体
hideObject _obj; _obj hideObject false;
// 启用/禁用模拟
player enableSimulation false;

// 多人游戏要使用专用命令启用模拟并显示物体，
_obj hideObjectGlobal false; _obj enableSimulationGlobal true;
// 设置载具燃料(0~1)
_veh setfuel 0.5;
// 创建地雷并杀死玩家
_mine = createMine ["APERSMine", getposASL player, [], 0, "CAN_COLLIDE"]; // 要获取精确位置，请使用ASL
_mine setdammage 1;
player setdammage 1;
// 创建炮弹杀死玩家
createVehicle ["M_Mo_120mm_AT", getPosATL player, [], 0, "CAN_COLLIDE"];
player setdammage 1;
// 为指定武器设定重新填装时间，仅当次有效 车辆 setWeaponReloadingTime [炮手, 枪口名称]
_vehicle setWeaponReloadingTime [_gunner, currentMuzzle _gunner, 0.5];

// 要始终调整改武器的重装时间时：
this addEventHandler ["Fired", 
{
	params ["_vehicle"];
	_gunner = gunner _vehicle;
	_vehicle setWeaponReloadingTime [_gunner, currentMuzzle _gunner, 0.25]; 
}];

// 添加一个事件处理程序，让单位发射的导弹锁定固定目标
this addEventHandler ["Fired", {
	params ["_unit", "", "", "", "", "", "_projectile"];
	_projectile setMissileTarget _target;
}];

// 普通警车灯不会发出红光和蓝光，但如果您想使用它们的话。如果您希望灯从一开始就亮，只需将其放入 init 字段即可。
this animate ["BeaconsStart", 1]; // 对于警察越野
this animateSource ["lights_em_hide", 1]; // 对于警察和救护车
// 打开越野车和货车的警报器
[this, "CustomSoundController1", 1, 0.2] remoteExec ["BIS_fnc_setCustomSoundController"];
// 关闭警报器
[this, "CustomSoundController1", 0, 0.4] remoteExec ["BIS_fnc_setCustomSoundController"];

// 强迫电磁炮武器开火, 不适用于玩家在炮手位置
vehicle player fireAtTarget [vehicle player, "cannon_railgun_fake"]
gunner _veh fire "cannon_railgun_fake";
gunner _veh forceWeaponFire ["cannon_railgun_fake", "ai"];

// 设置壁炉的状态 true表示让其燃烧
_object inflame true;

// 限制车辆速度
this limitSPeed 60; // 60km/h
this limitSpeed -1; // 小于零的任何数字用于解除限速

// 限制玩家车辆度速度 此命令使用 PID 控制器覆盖车辆的推力/制动输入来实现的
this setCruiseControl [50, false]; // 车辆永远不会超过50Km/h
// 限制飞行器高度 object flyInHeight [高度, 强制];默认不强制，即[100, false]
this flyInHeight 80; // 飞行器按照80高度飞行
this flyInHeight [60, true]; // 强制飞行器在60高度飞行

// 返回组长正在选择的下属
groupSelectedUnits player;

// -- 返回对象LOD的命名属性
_object namedProperties ["Memory"]
// -- 返回对象指定LOD的顶点名称(selectnames)允许按照
_obeject selectionNames "Memory";
get3DENSelected "Object"# 0 selectionNames "Memory"
// 创建光源
_pos = BIS_boxType modelToWorld (BIS_boxtype selectionPosition ["Light_1_pos", "Memory"]);
// 火炮武器枪口位置
"usti hlavne"
// 将object1附加到object2，保持其相对位置和方向
[_object1, _object2] call BIS_fnc_attachToRelative;

// 设置物体方向朝下，例如导弹垂直落地
_missile = createVehicle ["Rocket_04_AP_F", player modelToWorld [0, 50, 100]];
_missile setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
// 方向反向
_missile = createVehicle ["M_NLAW_AT_F", player modelToWorld [0, 10, 20]];
_missile setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
/*==============================数据============================*/
// 复制字符串到剪切板
copyToClipboard "你好！";
// 如果需要特殊字符，例如中文的复制，请使用：
forceUnicode 1;
copyToClipboard str _data;
/*============================检测============================*/
// 返回单位当前使用的枪口;
currentMuzzle _unit; // "Missile_AGM_02_Plane_CAS_01_F"空对地导弹

// 返回单位炮塔方向
_array = vehicle player weaponDirection currentWeapon (vehicle player);
_dir_degrees = (_array select 0) atan2 (_array select 1);
_dir_degrees;

// 创建一个激光靶，并在指定时间内提示
_laser = "LaserTargetW" createVehicle (getPosATL BIS_target); // westbase LaserTargetW
_laser attachTo [BIS_Target, [0, 0, 1]]; // 将激光靶附加在目标上
west reportRemoteTarget [_laser, 3600];
// 光标目标 返回玩家准心位置的目标
cursorTarget;
// 返回对象相对于地形的位置
getPosATL _obj; getPos _obj;
// 返回以对象为中心的海平面高度
getPosWorld _obj; getPosALS _obj;
// 设置对象高度
[this, 10] call BIS_fnc_setHeight;
// 获取单位类型 
_type = typeOf player; // "B_Story_Protagonist_F";
// 从数组中随机选择
selectrandom [1, 2, 3, 4]; // 结果可以是其中任何一个
// 生成随机数 random 数字。
random 3; // 根据随机分布生成 0 < x < 3的数字
// 通过全局变量永久性保存玩家装备到本地
// 获取玩家装备
private _varsToSave = getUnitLoadout player; 
// 将玩家装备保存至名为"testsave_1"的本地变量内
profileNamespace setVariable ["testsave_1", _varsToSave];
// 强制保存
saveProfileNamespace;

// 再次读取
BIS_playerInventory = profileNamespace getVariable "testsave_1";
// 加载玩家装备
player setUnitLoadout BIS_playerInventory;
// 清空保存的本地变量
profileNamespace setVariable ["testsave_1", nil];

// 检查玩家是否携带武器
primaryWeapon player == "";
secondaryWeapon player == "";
// 检查玩家是否携带手枪
handgunWeapon player == "";
// 返回单位主武器
primaryWeapon player;
// 返回武器兼容的弹药
compatibleMagazines ["arifle_Katiba_GL_F", "this"]; // compatibleMagazines [武器，枪口]

// 检查单位主武器加载的弹药
primaryWeaponMagazine _units;
// 获取单位正在监视的目标
getAttackTarget _unit;
// 需要触发器条件和状态都完成时才触发
_var && this; // &&两个条件都为真时返回为true

(alive player) || this; // ||两个条件之一为真时返回为true

// 同时定义多个条件都为真时返回true
(((!alive soldier1) && (!alive soldier2)) && ((!alive soldier3) && (!alive soldier4)))
// 更简单的方式
(alive soldier1) && (soldier1 in BIS_car) && (triggerActivated _tri) && (!alive soldier4) && (!alive soldier5)
// 检测玩家与地图标记的距离
(player distance markerpos "marker_0") <= 15;

// 检查触发器是否激活，若已激活将返回true
triggerActivated _trg;

// 以秒为单位暂停给定时间的代码执行。睡眠精度由帧率给出，给出的延迟是预期的最小延迟。必须在计划环境调用，即由execVM或spawn执行的脚本等。
sleep 1; // 暂停一秒

// 地震，等级为1~4
[4] spawn BIS_fnc_earthquake;
// (检测目标是否接触地面)
isTouchingGround player;
// 如果检查在车辆中的单位，应该使用
isTouchingGround (vehicle player); // anytime is true

isTouchingGround vehicle; // True when on the ground
itemsWithMagazines player || (items player + assignedItems player);
// 检查单位库存.要注意的是，库存物品代码和资源管理器的名称未必相同，要获取其项目名称，需要使用检查库存来获取。
// 如果单位拥有GPS，则返回true
"ToolKit" in (items player + assignedItems player)
// 工具箱 代码 ToolKit
 
("ToolKit" in (items player + assignedItems player)) 


// 检测地雷是否处于活动状态
mineActive _mine;
if (mineActive _mine) then {} else {hint "这是假的"};
// 返回单位的小队长
leader player;

// 取指定物体后触发 _item后面为物体代码
player addEventHandler ["Take", 
{
	params ["_unit", "", "_item"];
	if (_item == "B_AssaultPack_rgr") then 
	{
		_code;
	};
}];
// 检测多个目标的状态
{alive _x} count [BIS_AA1, BIS_AA2] == 0;
// 检查小队人数状态
{alive _x} count units _group == count units _group;

// 检查车辆燃料
if (fuel vehicle player == 0) then {hint "您的载具没有燃料了！"};

openMap [true, false]; // 正常打开地图
openMap [false, false]; // 正常关闭打开的地图
openMap [true, true]; // 强制打开地图并保持打开状态(用户无法自行关闭)

// 检查对象是否属于某个类型
_obj isKindOf "MRAP_02_base_F"; // CSAT运输载具MRAP
_obj isKindOf "MRAP_01_base_F"; // NATO的MRAP，其中01为北约使用 02为CSAT使用 03则是AAF
"LSV_02_base_F" // CSAT轻型突击车
"Tank" // 全部坦克的类型，以及防空载具类型
"Wheeled_APC_F" // 轮式装甲车

// 检查对象类型
_type = typeof _object; 

// 检查玩家车辆是否属于给定类型
vheicle player iskindof "Truck_02_base_F";

// 返回单位或车辆的给定或当前选择的武器状态
_wsPlayer = weaponState player;
// ["arifle_MXC_ACO_F", "arifle_MXC_ACO_F", "Single", "30Rnd_65x39_caseless_mag", 30, 0, 0]
// 单位当前武器模式
_muzzle = weaponState player select 2; // 枪口
_weaponMode = currentWeaponMode player; // 模式

// 随机选择
_projectiles = [1, 2, 3, 4];
selectRandom _projectiles; // 将随机返回1~4的任意一个

// 将会从四个类型的载具中随机创建一个
_projectiles = ["C_Truck_02_box_F", "C_Truck_02_transport_F", "C_Truck_02_fuel_F", "C_Truck_02_covered_F"]; 
_class = 
if (typeName _projectiles != "ARRAY") then {_projectiles;} else {selectRandom _projectiles;};
_projectile = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];

// 观察员为狙击手报告目标[狙击手, 观察员]
[player, unitSpotter] call BIS_fnc_spotter;

// 在玩家前方创建相机并对准玩家 
bis_camera = "camera" camCreate (player modelToWorld [0, 5, 1]); // 类型 camCreate 位置
bis_camera cameraEffect ["internal", "back"]; // 进入相机视图
bis_camera camPrepareTarget player; // 设置相机目标
BIS_camear camCommitPrepared 0; // 相机定位目标和位置需要花费多久:0秒

bis_camera cameraEffect ["terminate", "back"]; // 李开箱机视图
camDestroy bis_camera; // 删除相机
// 定义任务显示哪些HUD图标
showHUD [
	true, // scriptedHUD 包括准星、滚轮菜单
	false, // 显示车辆、士兵和武器信息
	true, // 车辆雷达
	true, // 车辆罗盘
	true, // 油箱指示
	true, // HC相关命令菜单
	true, // group
	true, // 武器HUD光标
	true, // 自定义信息
	true, // kills
	true // showIcon3D
];
showHUD [true, false, true, true, true, true, false, true, false, false, true];
showHUD [false, false, false, false, false, false, false, false, false, false, false];
// 建立任务开头虚拟无人机效果
[player, "Sytar", 300, 250, 75, 1, [], 0, true] spawn BIS_fnc_establishingShot;

[player, "Sytar", 0, 0, 0, 0, [], 0, true] spawn BIS_fnc_establishingShot;
// 在简报中添加可指向地图的链接
<marker name='marker_0'>文字</marker>
// 像对象添加交互动作, 并且对后续加游戏的玩家生效
[
	player, // 目标对象
	"Hack Laptop", // 动作标题
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 	// 开始动作时使用的图标
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 	// 过程中使用的图标
	"_this distance _target < 3", 	// 触发动作的条件
	"_caller distance _target < 3", 	 // 完成动作时的距离
	{}, // 动作开始时执行的代码
	{}, // 执行动作的每个间隔时执行的代码
	{}, // 动作完成时执行的代码
	{}, // 动作中断时执行的代码
	[], // Arguments passed to the scripts as _this select 3
	12, // 完成动作所需时间
	0, // Priority
	true, // 执行后删除
	false // 是否能在无意识状态下使用
] remoteExec ["BIS_fnc_holdActionAdd", 0, player];	// MP兼容
// 单人游戏只需要这么做即可
[
	BIS_toCam, 
	"查看", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", 
	"_this distance _target < 3", 
	"_caller distance _target < 3", 
	{}, 
	{}, 
	{execVM "vedio_Complete.sqf"}, 
	{}, 
	[], 
	3, 
	0, 
	true, 
	false
] call BIS_fnc_holdActionAdd;

"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa" // 搜索
"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa" // 谈话

// 启用保存游戏
enableSaving [true, true];

// 设置地图标记可见性/颜色
"marker" setMarkerAlphaLocal 0.5;
"marker" setMarkerAlpha 0.5;
// 在玩家面前创建一个直升机停机坪
createVehicle ["Land_HelipadSquare_F", player modelToWorld [0, 10, 0]];
"Land_HelipadEmpty_F";
/*===================================动作捕捉=======================================*/

// 录制载具BIS_vehicle的轨迹
[vehicle player, 240] spawn BIS_fnc_UnitCapture;

// 录制载具轨迹，Esc结束后，使用F1复制数据。创建一个scenes.sqf的文件，打开并粘贴数据后保存
// 在init.sqf
myscenes = call compile preprocessfile "scenes.sqf";

// 进入游戏执行命令
[BIS_vehicle, myscenes] spawn BIS_fnc_Unitplay;
// 让载具回放录制的路线 [载具, 数据, nil, nil, nil, nil, 跳过多长时间]
[BIS_vehicle, rescue, nil, nil, nil, nil, 5] spawn BIS_fnc_Unitplay;

// 在简报结束后播放视频
["a3\missions_f_epa\video\a_m01_quotation.ogv"] spawn BIS_fnc_quotations;
// a3\missions_f_epa\video\c_out2_sometime_later.ogv
// init.sqf:如果需要，等待任务开头影片消失后执行。返回为true
waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

// 进入黑屏
cutText ["", "BLACK FADED", 10e10];
// 屏幕文字 [文本, 类型, 持续时间]
cutText ["文本", "BLACK FADED", 3];
// 3秒后淡出黑屏, 恢复画面
cutText ["", "BLACK IN", 3];
// 向玩家展示提示
[["Common", "GPS"]] call BIS_fnc_advHint;

创建一个组createGroup [边，deleteWhenEmpty] deleteWhenEmpty设置为true时没有单元会删除
private _group = createGroup [east, true];
bis_group = createGroup Independent;
// 创建单元type createUnit [位置、组、初始化、技能、等级]
// 技能默认为0.5等级默认PRIVATE
"B_soldier_M_F" createUnit [position player, group player, "myUnit = this"] 
private _Adams = createGroup west;
"B_soldier_TL_F" createUnit [position player, _Adams, "BIS_Adams = this", 1, "SERGEANT"];
BIS_Adams setGroupId ["Adams"];
BIS_Adams setName ["Adams", "Adams", "Adams"];
[BIS_Adams, "Martinez", "Male01ENGB", 1.0, "Adams"] call BIS_fnc_setIdentity;
[player] join BIS_Adams;

_unit createGroup west createUnit ["B_soldier_TL_F", [0, 0, 0], [], 0, "none"];
_unit domove [0, 50, 0]

// 屏幕捕获
screenshot "";
screenshot "testFile.png";

// 任务对话的制作, 首先在任务文件夹内新建一个文档，更改文件名为：missionConversations.sqf 然后输入以下内容
case "01_Start":
{
	// 禁用角色自主无线电
	enableSentences false;
	// 聊天文本
	player groupchat "text_1";
	// 上一句话和下一句话中间暂停多少秒
	sleep 2;
	player sideChat "test_2";
	sleep 3;
	// 对话结束后重新启用聊天
	enableSentences true;
};

// 每段对话格式为 case "序号_标题" : {聊天内容};
case "02_InHeli":
{
	enableSentences false;
	BIS_player sideChat "左方安全，右方安全，后方安全。";
	sleep 4;
	enableSentences true;
};


// 返回编辑器并开始游戏，输入case和:之间的字符串+ spawn BIS_fnc_missionConversations;执行便可以生成对话
"01_Start" spawn BIS_fnc_missionConversations;
"02_InHeli" spawn BIS_fnc_missionConversations;

// 添加路点
_wp1 = group player_heliD addwaypoint [getPos DemonLand, 0];
_wp1 setWaypointType "TR UNLOAD";

_wp2 = group player addwaypoint [getMarkerPos "marker_2", 0];
_wp2 showWaypoint "NEVER";
_wp2 setWaypointVisible false;
_wp2 setWaypointType "SAD";

// 添加航点表达式：航点 setWaypointStatements [条件，表达式]
_wp2 setWaypointStatements ["true", "player setdamage 1"];

{
	_x = group player addwaypoint [getMarkerPos "marker_0", 0];
	_x showWaypoint "NEVER";
	_x setWaypointVisible false;
	_x setWaypointStatements ["true", "player setdamage 1"];
} forEach _wp1;

// 为实体添加按钮操作
this addAction
[
	"title", 
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
	}, 
	nil, 
	1.5, 	// 优先级
	true, 	// 在条件满足时提示文字
	true, 	// 选择后是否隐藏菜单, (该操作不会被移除)
	"", 		// 快捷键 如果设置了快捷键，此按键将仅触发菜单
	"true", 	// 条件，该字段可用参数_target - 操作附加对象 _this 操作者 _originalTarget 原始对象 _actionId 操作ID
	50, 		// 触发半径(最大50)
	false, 	// 是否向昏迷的玩家显示
	"", 		// 来自Gemmetry的顶点名称
	""		// 来自Memory的顶点名称，如果Gemoetry存在，则不使用此项
];

/*=======================================地图与标记=======================================*/

[] spawn {
	openmap [true, false]; // 强制打开地图，但可以关闭
	sleep 1.5;
	["Marker_0", getMarkerPos "Marker_1", 1, 0] spawn BIS_fnc_movemarker; // 一秒内移动到marker_1
	sleep 1;
	["marker_2", 1, 3] spawn BIS_fnc_blinkMarker; // 使用“3”秒间隔闪烁“10”次

};

/*=====================================触发器====================================*/
// 检查触发器是否活动(被激活返回true)
triggerActivated _tri;

// 将对象同步至单元或者单元列表
_acm synchronizeObjectsAdd player; // 触发器或者模块被同步到玩家
_acm synchronizeObjectsAdd units player; // 触发器或者模块被同步到玩家小队的每个成员
// 同步对象删除
player synchronizeObjectsRemove [_object1, _object2, _object3];
// 检查实体同步的对象列表
synchronizedObjects _logic;
/*=======================================================数据类型========================================================================*/
// 展开给定数组
flatten [1, [2], [[3]], [[[4]]]]; // returns [1, 2, 3, 4]
// 返回给定变量的类型 typeName 任何东西
hint typeName 0;					// SCALAR
hint typeName "";					// STRING
hint typeName true;					// BOOL
hint typeName [];					// ARRAY
hint typeName {};					// CODE
hint typeName scriptNull;			// SCRIPT (since Arma 3 v1.32)
hint typeName objNull;				// OBJECT
hint typeName grpNull;				// GROUP
hint typeName controlNull;			// CONTROL
hint typeName teamMemberNull;		// TEAM_MEMBER
hint typeName displayNull;			// DISPLAY
hint typeName taskNull;				// TASK
hint typeName locationNull;			// LOCATION
hint typeName sideUnknown;			// SIDE
hint typeName text "";				// TEXT
hint typeName configFile;			// CONFIG
hint typeName configNull;			// CONFIG (since Arma 3 v1.54)
hint typeName missionNamespace;		// NAMESPACE
hint typeName diaryRecordNull;		// DIARY_RECORD (since Arma 3 v2.00)
hint typeName createHashMap;		// HASHMAP (since Arma 3 v2.02)

// 检查给定路径的文件是否存在
fileExists "\Modules_f_joe\Modules_shared\img\goddess_joe.paa";

// 检查数据，比较时区分大小写
0 in [1, 2, 3, 0]; // true
"abc" in ["abc", "a", "d"]; // true
"A" in ["a", "b", "b"]; // false 区分大小写
"door" in "door_01_rot" // true
_unit in _vehicle; // 在车内返回true
private _isInside = [1000, 2000, 0] in MyLocation; // 检查位置是否在区域内

// 检查给定配置的来源(CfgPatches)的插件数组
configSourceAddonList (configFile >> "CfgVehicles" >> "Man"); // returns ["A3_Data_F", "A3_Characters_F", "A3_Data_F_Curator", "A3_Air_F_Heli"]
// 返回包含设备所属插件的列表。
unitAddons typeOf player; // ["A3_Characters_F_BLUFOR"]

// 更高效的编译脚本 compileScript [路径, 最终(默认false), prefixHeader]
JLS_fnc_myScript = compileScript ["a3\props_f_enoch\military\equipment\scripts\meteo.sqf"];

// 将元素添加到数组末尾，不会添加重复元素
_arr = [1, 2, 3];
_index = _arr pushBackUnique 3;
hint str [_index, _arr]; // [-1, [1, 2, 3]] 
/*========================================其他=========================================*/
// 播放音乐：警报
5 fadeMusic 0.25;
playMusic "Track13_StageC_negative";
addMusicEventHandler ["MusicStop", "playMusic 'Track13_StageC_negative';"];
// 根据当前游戏语言返回本地化字符串的值, 名称在language开头的pbo找到stringtable.xml文件中
localize "str_a3_a_m02_45_keep_moving_alp_0";
format ["%1 - %2", localize "qsl_a3_Joe_Goddess_name", localize "qsl_a3_Joe_BigJoe_name"];
// 指定字符串是否具有本地化名称

isLocalized "str_a3_a_m02_45_keep_moving_alp_0";

// 把该变量向全球广播, 必须有返回值
publicVariable "BIS_myvar";

// 派系RGBA颜色表
[0, 0.3, 0.6, 1] 	// 蓝ColorWEST	
[0.5, 0, 0, 1]		// 红ColorEAST	
[0, 0.5, 0, 1]		// 绿ColorGUER	
[0.4, 0, 0.5, 1]	// 紫ColorCIV	
[0.7, 0.6, 0, 1]	// 黄ColorUNKNOWN	

// 派系颜色获取, 但一般只有上方的五种句法 side call BIS_fnc_sideColor
side player call BIS_fnc_sideColor;
side vehicle player call BIS_fnc_sideColor;
side group player call BIS_fnc_sideColor;

// RGBA转 HTML颜色
[0, 0.5, 0, 1] call BIS_fnc_colorRGBtoHTML;

// 将数据类型或变量和代码的返回值转换为字符串, str 的优先级并不高，需要时将要转化的代码用括号()
str 1; // "1"
str true; // "true"

// 数组转字符串, 并在其中插入特定元素
[1, "2", true] joinString ""; // "12true"

// 执行字符串命令
_codeString = "player setdamage 1";
_code = compile _code; // {player setdamage 1}; 是不是很熟悉？
call _code;

// 给定的字符串转化为code
_string = ["player", "sideChat", str "这是我的看法"] joinString " "; // 注意" "比""内多输入了一个空格否则你的结果会变成下面那样
"playersideChat""这是我的看法"""; // 这是完全不可的
// 正确的结果是
_code = compile _string; // compile "player sideChat ""这是我的看法"""
_code; // {player sideChat "这是我的看法"};

// 字符串拆分数组
_str = "1, 2 3" splitString ", "; // 指定什么字符做为分隔的"标点", 他们会被删除, 结果：["1", "2", "3"]
"123456" splitString "24"; // ["1", "3", "56"] 2和4被替换分隔符
"ABCDEFG" splitString "DB"; // ["A", "C", "EFG"] D和E被替换为分隔符
// 移动EDEN相机位置为true时相机以观看视角移动、为false时相机移动到精确位置
move3DENCamera [[5956.5049, 19.958897, 6662.6099], true]
/*===================================任务设定===================================*/
// 给ORBAT模块添加的图标添加一个纹理，比如被消灭
[missionconfigfile >> "CfgORBAT" >> "BIS" >> "B_1_C_2_4", "mil_destroy", [1, 0, 0, 1], 1.2, 1.2, 45] call BIS_fnc_ORBATAddGroupOverlay;

// 设置时间系数 0.1 - 120
setTimeMultiplier 0.5;
// 设置模拟速度 没有定义快慢
setAccTime 0.1;
// 设置时间
setDate [2034, 04, 24, 09, 45];

// 将灯光设置为红光, 对象必须是light类型, 不适用于建筑灯
{
	_x setLightBrightness 2.0;
	_x setLightAmbient [1.0, 0.1, 0.1];
	_x setLightColor [1.0, 0.1, 0.1];	
} foreach _lightsource;

// 在计划空间中执行代码的等待时，有时使用call似乎更好
// call只是意味着：“在这里执行代码”，就像你如何使用 then 执行代码(if (true) then _code) or do .因此，它不会改变代码环境
// 这意味着做这样的事情(经常被使用)，会浪费很多性能：
private _handle = _params spawn MY_fnc_Function;
waitUntil {scriptDone _handle};

// 不需要，因为与简单地这样做，如你所愿，如果MY_fnc_Function中不包含任何spawn、execVM，那么_code2将排队至call完成后
_code1;
_params call MY_fnc_Function;
_code2; 
// 它执行与前面的代码完全相同的事情，只是没有创建新的"调度程序线程"并且函数无缝执行，再加上前面提到的附加性能优势。
// 如果需要在计划外环境中执行代码，则可以使用 isNil 代替：无论当前环境如何，MY_fnc_Function始终按计划执行
isNil {_params call MY_fnc_Function};

// 或者如果没有参数，可以简单地这样做：
isNil MY_fnc_Function

// 获取当前任务路径
getMissionPath "";

// 在触发器区域撞见指定类型的事件 参数_density表示敌人密度，默认：1
_density call BIS_fnc_prepareAO;
/*
触发器文本的可用项:
GEN_infantry	生成随机步兵巡逻，触发器必须是大于500m的圆形
GEN_patrolVeh	生成随机车辆，如果触发器同步用平民车辆，其路点将被生成车辆使用
	在触发器激活中可定义生成载具类型 car-汽车 APC-装甲车 Tank 坦克
GEN_ammo		生成随机数量的弹药箱
GEN_civilCar	随机生成一辆平民汽车
*/ 

// 在玩家位置随机生成五个蓝方单元 返回值：生成的组
BIS_grpStalkers = [getPosATL player, east, 5] call BIS_fnc_spawnGroup;  
// 强制一个组跟踪另一个组 [跟踪的组, 被跟踪的组, 目标更新频率(默认10), 路点精度, 条件(完成条件将停止跟随), 停止或目标不存在时] spawn BIS_fnc_stalk;
// 停止或目标不存在时: 数字-0返回原始路点, 1搜索50米范围, 2仅回到原始位置 也可以填标记、物体或位置作为目的地。该组会向目的地移动
private _stalking = [BIS_grpStalkers, group player] spawn BIS_fnc_stalk;
/*===================================宙斯===================================*/
// 创建宙斯并添加所有可编辑物体
private _moduleGroup = createGroup sideLogic;
"ModuleCurator_F" createUnit [
	getPosATL player, 
	_moduleGroup, 
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; BIS_Zeus = this"
];
bis_curator = player;
BIS_Zeus setvariable ["owner","bis_curator"];
BIS_Zeus addCuratorEditableObjects [allMissionObjects "all", true];

// private _addons = curatorAddons myCurator;
// 在marker_0标记附近创建闪电模块
private _pos = markerpos "marker_0" getpos [50 + random 50, random 360];
private _grp = createGroup sideLogic;
"ModuleLightning_F" createUnit [
	_pos, 
	_grp, 
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];"
];

// 在指定位置创建模块
private _pos = getPosATL player;
private _grp = createGroup sideLogic;
"ModuleEndMission_F" createUnit [
	_pos, 
	_grp, 
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];"
];

// 查找所有宙斯模块
_zeus = (entities "Logic") select {_x iskindof "ModuleCurator_F"};
// 将任务编辑器中放置的全部对象添加至任务的所有宙斯操作者
{
	player assignCurator _x;
	_x addCuratorEditableObjects [allMissionObjects "all", true];
} forEach _zeus;

/*===================================MP===================================*/
// 添加，移除重生位置
_respawn = [west, [0, 0, 0], "重生点"] call BIS_fnc_addRespawnPosition; // [target, id]
[target, id] call BIS_fnc_removeRespawnPosition;

/*===================================耐力===================================*/
// 设置启用耐力系统
player enableStamina true;

/*=================================GUI===================================*/
// 在屏幕中央显示一个非常基本的消息对话框。在按下“继续”之前，玩家的控制权将被剥夺。消息对话框可以在屏幕上拖动。按下“继续”后，内容将在正常提示中显示。
"我暂停了你的游戏" hintC 
[
	"原因：", 
	"按下“继续”按钮回到游戏", 
	"此消息会在右侧继续展示一段时间"
];
// 流畅的显示给定文本，没有声音
["Hello, hidden FX", 2, 3, [1, 0, 0, 1], true] spawn BIS_fnc_WLSmoothText; 
// [文本、最多同时显示几行、持续时间、颜色、轮廓] spawn BIS_fnc_WLSmoothText

// 在屏幕上添加流血效果
[5] call BIS_fnc_bloodEffect; // 显示5秒
// 在屏幕上创建爆炸效果 参数 - [受伤者, 造成的伤害] 使用nil用于单纯的屏幕效果
[nil, 0.5] call BIS_fnc_dirtEffect;
// 给指定单位添加IFF效果, 用于非玩家团队AI
[units player] call BIS_fnc_EXP_camp_IFF;
// 手动为单位添加图标效果
_unit setVariable ["BIS_iconAlways", true];	// 始终展示
_unit setVariable ["BIS_iconShow", false];	// 隐藏图标
_unit setVariable ["BIS_iconName", false];	// 隐藏名称
// 手动在右下角展示时间和位置OSD, 类似东风任务
[
	[
		["2035-08-09 ", " "], 
		["05:11", "font='PuristaMedium'"], 
		["", "<br/>"], 
		["Connor着陆区", " "], 
		["", "<br/>"], 
		["南部Stratis", " "] 
	], 
	safeZoneX - 0.01, 
	safeZoneY + (1 - 0.125) * safeZoneH, 
	true, 
	"<t align = 'right' size = '1' font = 'PuristaLight'>%1</t>"
] spawn BIS_fnc_typeText2;


// 创建电影边框，过程中玩家无法移动，但可以使用武器开火。[模式、持续时间、声音、视图] call BIS_fnc_cinemaBorder
// 模式：0 - 进入；1 - 离开
[1, 1.5, true, true] call BIS_fnc_cinemaBorder;

// 在任务中途调出加载界面
[] spawn {

	startLoadingScreen ["Loading My Mission"]; // 在Arma3中并不会显示此文本
	uisleep 0.5;
	progressLoadingScreen 0.5; // 设置任务加载进度
	uisleep 0.1; 
	endLoadingScreen;
};

// 强制弹出加载屏幕
findDisplay 46 createDisplay "RscDisplayClient";
// 弹出Zeus Ping
cutRsc ["RscCuratorPing", "PLAIN", 2];

/*==================================事件处理程序===================================*/
// 每帧执行一次代码>>注意代码效率，不要在帧循环中执行过多的代码！
addMissionEventHandler ["EachFrame", {/*code*/}];
// 添加一个事件处理程序检测玩家是否开火，以遵循ROE
player addEventHandler ["Fired", {
	private ["_unit"];
	_unit = _this select 0;
	_weapon = _this select 1;
	if (_weapon in [primaryWeapon _unit, secondaryWeapon _unit]) then {
		_unit removeEventHandler ["Fired", 0]; 
		_unit setVariable ["BIS_firedEH", nil];
		BIS_failedROE = true;
	} 
}]; 
// 单位减伤
this addEventHandler ["HandleDamage", {
 	params ["_unit", "_selection", "_damage"]; 
	
	damage _unit + _damage * 0.01;
}];
// 当单位将物品放入货物箱时触发参数为：单位 容器 项目名称，当单位在自身库存中更换弹药时可能也会触发时间
player addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];

}];

/*==========================对象交互事件============================*/

// 此函数通过向其添加“获取情报”添加操作，将对象设置为玩家可检索的情报对象。
[this] call BIS_fnc_initIntelObject;

// for init.sqf
if (isServer) then
{
	// 日记图片:
	this setVariable [
		"RscAttributeDiaryRecord_texture", // 不要修改
		"a3\structures_f_epc\Items\Documents\Data\document_secret_01_co.paa", // 图片路径，自定义
		true
	];

	// 日记标题和描述:
	[
		this, 
		"RscAttributeDiaryRecord", // 类型，不可修改
		["New Intel", "The enemies have a cave troll!"] // 数组格式的 [标题, 描述]
	] call BIS_fnc_setServerVariable;

	// Diary entry shared with (follows MP target rules):
	this setVariable ["recipients", west, true];
	// Sides that can interact with the intel object:
	this setVariable ["RscAttributeOwners", [west], true];
};

// 向当前客户端添加holdkey动作，在完成之前角色将不会移动格式[findDisplay 46, 按键名称(57为空格), 2(按住时间), 完成后执行的代码({表达式})] spawn BIS_fnc_holdKey;
[(findDisplay 46), 57, 2, {systemChat str player}] spawn BIS_fnc_holdKey;

/*
	官方并没有指出额外的移除holdKey方式，因为他一般出现在"开场阶段", 当玩家未跳过且此阶段结束后, 代码就没有作用了。
	但如果你用在场景阶段, 下方代码是可用的结束手段。
	但在多人游戏中, 如果玩家在后台时代码执行, 虽然能够恢复操作，但"按住 keyname 以继续"字样会长期在屏幕下方显示
*/
findDisplay 46 displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_holdKey_spaceEH"];
uiNamespace setVariable ["BIS_fnc_holdKey_spaceEH", nil];
missionNamespace setVariable ["BIS_fnc_holdKey_onSkip", true];


// 添加武器保险, 被添加的对象会无法开火
private _actionId = player addAction ["禁止开火", {systemChat str "未开启武器保险";}, nil, 6, true, true, "defaultAction"];
// 保存ID号码，用于解除
player setVariable ["BIS_disableWeaponAction", _actionId];
// 需要解除武器保险时：
private _id = player getvariable ["BIS_disableWeaponAction", -1];
player removeAction _id;

// 虚拟军火库
["AmmoboxInit", [player, true, {_this distance _target < 10}]] call BIS_fnc_arsenal;

this addAction ["军火库", {["Open", [true]] call BIS_fnc_arsenal}];
/*========================================================Config===============================================*/
// 返回当前的插件列表
activatedAddons