////////////////////////////////////////////////////////////////////////////////////
// The module definition. "directors" (= two-way wrapper classes) are allowed and the overall module name is CppApi
%module (directors="1") CppApi

////////////////////////////////////////////////////////////////////////////////////
// This code gets verbatim copied into the generated C++ bridge file (CppApiWrapper.cpp). Header files included here
// with the "normal" #include are not wrapped (yet), although most of them will appear in some later %include; section.
%{
	#pragma warning(disable:4190)

	/* Includes the header in the wrapper code */
	//#include "CppApi.h"
	#include "uniplug_blender_api.h"
%}

%include <windows.i>

/* converting std::string */
%include "std_string.i"

// ignoring  string_to_* or *_to_string 
%rename("%(regex:/(\w*)string_to(\w*)/$ignore/)s") "";
%rename("%(regex:/(\w*)to_string(\w*)/$ignore/)s") "";

// ignoring base class
%ignore pyObjRef;

// dummy PyObject class
%rename(SWIGTYPE_p_PyObject) PyObject;

////////////////////////////////////////////////////////////////////////////////////
// Mapping POD VECTOR types to C#

%include "POD_Mapping.i"
%pod_typemaps(float, Vector_POD, Fusee.Math.float3)
%pod_typemaps(float, UniplugBL::VFLOAT2, Fusee.Math.float2);
%pod_typemaps(float, UniplugBL::VFLOAT3, Fusee.Math.float3);
%pod_typemaps(float, UniplugBL::VFLOAT4, Fusee.Math.float4);
%pod_typemaps(float, UniplugBL::VFLOAT16, Fusee.Math.float4x4);

////////////////////////////////////////////////////////////////////////////////////
// Mapping Array and Vector<T> types to C#

// Map int $1[ANY] TO  int[]
%typemap(cstype, out="$csclassname") int[ANY] "int[] /* int[]_cstype */"
%typemap(csin) int[ANY] " $csinput /* int[]_csin */"
%typemap(imtype) int[ANY] "int[] /* int[]_imtype */"

// Map float $1[ANY] TO  float[]
%typemap(cstype, out="$csclassname") float[ANY] "float[] /* float[]_cstype */"
%typemap(csin) float[ANY] " $csinput /* float[]_csin */"
%typemap(imtype) float[ANY] "float[] /* float[]_imtype */"

// Map bool $1[ANY] TO  bool[]
%typemap(cstype, out="$csclassname") bool[ANY] "bool[] /* bool[]_cstype */"
%typemap(csin) bool[ANY] " $csinput /* bool[]_csin */"
%typemap(imtype) bool[ANY] "bool[] /* bool[]_imtype */"

// This converts std::Vector<int> in to a class called IntVector
// IntVector implemnts IEnumerable<> and IList<>
// It would be nice if it was possible to use directly List<int> on the C# side instead of IntVector

%include "std_vector.i"

%template(IntVector) std::vector<int>;
%template(FloatVector) std::vector<float>;
%template(DoubleVector) std::vector<double>;

////////////////////////////////////////////////////////////////////////////////////
// Mapping std::map<std::string, ANY> maps to C#

// This converts std::map<string, int> in to a class called String_Int_Map
// "The C# wrapper is made to look and feel like a C# System.Collections.Generic.IDictionary<>." [ref: std_map.i]
// TODO: std::map<std::string, Foo> / TODO: std::map<std::string, T> | T can be any self defined class i.e. Foo

%include "std_map.i"

%template(String_Int_Map)  std::map<std::string, int>;
%template(Int_String_Map)  std::map<int, std::string>;

%define %std_templates(DATA_TYPE)
	%template(String_ ## DATA_TYPE ## _Map) std::map<std::string, UniplugBL::DATA_TYPE>;
%enddef

%include "uniplug_blender_api_swig.i"

////////////////////////////////////////////////////////////////////////////////////
// Finally: include the header file for wrapping

//%include "CppApi.h";
%include "uniplug_blender_api.h";