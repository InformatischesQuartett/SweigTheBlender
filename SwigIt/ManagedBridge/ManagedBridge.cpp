#include "ManagedBridge.h"

void ManagedBridge::ManagedPlugin::Init()
{
	CsClient::Plugin::Init();
	return;
}

__declspec(dllexport) void InitUniplug()
{
	ManagedBridge::ManagedPlugin plugin;
	plugin.Init();
}