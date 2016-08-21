/*
 * Author: CPL.Brostrom.A 
 * This create diary records to all players.
 *
 * Arguments:
 *
 * Example:
 * [this] call cScripts_fnc_initDoc;
 */

#include "..\script_component.hpp";

waitUntil {!isNull player && player == player};

// Add New Topic (7th Cavalry)
if(player diarySubjectExists "7Cav")exitwith{};
player createDiarySubject ["7Cav","7th Cavalry"];

// Load diary records (The load order is reversed. So the top will be at the bottom after load.)
call FUNC(Doc_MissionControl); // Recommend to have at the bottom aka top.

call FUNC(Doc_OperationInfo);

// Add New Topic (Radio Reports)
if(player diarySubjectExists "radioReports")exitwith{};
player createDiarySubject ["radioReports","Radio Reports"];

// Load diary records (The load order is reversed. So the top will be at the bottom after load.)

call FUNC(DocRadio_LACEACE);
call FUNC(DocRadio_MEDEVAC);
call FUNC(DocRadio_ROTARYPICKUP);
call FUNC(DocRadio_SPOTREP);
