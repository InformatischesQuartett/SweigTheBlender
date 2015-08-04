// ManagedBridge.h

#pragma once

using namespace System;
using namespace Reflection;
using namespace IO;

#using <mscorlib.dll>
#using "..\bin\CsClient.dll"

namespace ManagedBridge {
	public ref class ManagedPlugin
	{
		public:void Init();
	};
}