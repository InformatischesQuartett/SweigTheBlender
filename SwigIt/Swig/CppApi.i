////////////////////////////////////////////////////////////////////////////////////
// The module definition. "directors" (= two-way wrapper classes) are allowed and the overall module name is CppApi
%module (directors="1") CppApi


////////////////////////////////////////////////////////////////////////////////////
// This code gets verbatim copied into the generated C++ bridge file (CppApiWrapper.cpp). Header files included here
// with the "normal" #include are not wrapped (yet), although most of them will appear in some later %include; section.
%{
/* Includes the header in the wrapper code */
//#include "CppApi.h"
#include "uniplug_blender_api.h"

%}
%include <windows.i>
/* converting std::string */
%include "std_string.i"

//ignoring  string_to_* or *_to_string 
%rename("%(regex:/(\w*)string_to(\w*)/$ignore/)s") "";
%rename("%(regex:/(\w*)to_string(\w*)/$ignore/)s") "";





//This converts std::Vector<int> in to a class called IntVector
// IntVector implemnts IEnumerable<> and IList<>#
// It would be nice if it was possible to use directly List<int> on the C# side instead of IntVector 
%include "std_vector.i"
%template(IntVector) std::vector<int>;
%template(FloatVector) std::vector<float>;
%template(DoubleVector) std::vector<double>;




//This converts std::map<string, int> in to a class called String_Int_Map
// "The C# wrapper is made to look and feel like a C# System.Collections.Generic.IDictionary<>." [ref: std_map.i]
// TODO: std::map<std::string, Foo> / TODO: std::map<std::string, T> | T can be any self defined class i.e. Foo
%include "std_map.i"
%template(String_Int_Map)  std::map<std::string, int>;
%template(Int_String_Map)  std::map<int, std::string>;


////////////////////////////////////////////////////////////////////////////////////
// Mapping std::map<std::string, ANY> maps to C#

%define %std_templates(DATA_TYPE)
%template(String_ ## DATA_TYPE ## _Map) std::map<std::string, DATA_TYPE>;
%enddef

%my_templates(Bone);
%my_templates(BoidRule);
%my_templates(BoidState);
%my_templates(CurveMapPoint);
%my_templates(CurveMap);
%my_templates(ColorRampElement);
%my_templates(ConstraintTarget);
%my_templates(Actuator);
%my_templates(Spline);
%my_templates(Material);
%my_templates(TextBox);
%my_templates(TextCharacterFormat);
%my_templates(SplinePoint);
%my_templates(BezierSplinePoint);
%my_templates(DynamicPaintSurface);
%my_templates(FCurveSample);
%my_templates(Keyframe);
%my_templates(FModifier);
%my_templates(DriverTarget);
%my_templates(DriverVariable);
%my_templates(FModifierEnvelopeControlPoint);
%my_templates(FluidMeshVertex);
%my_templates(GPencilLayer);
%my_templates(GPencilFrame);
%my_templates(GPencilStroke);
%my_templates(GPencilStrokePoint);
%my_templates(Object);
%my_templates(ImagePackedFile);
%my_templates(RenderSlot);
%my_templates(ShapeKey);
%my_templates(UnknownType);
%my_templates(LampTextureSlot);
%my_templates(LatticePoint);
%my_templates(VertexGroupElement);
%my_templates(LineStyleTextureSlot);
%my_templates(LineStyleColorModifier);
%my_templates(LineStyleAlphaModifier);
%my_templates(LineStyleThicknessModifier);
%my_templates(LineStyleGeometryModifier);
%my_templates(Camera);
%my_templates(Scene);
%my_templates(NodeTree);
%my_templates(Mesh);
%my_templates(Lamp);
%my_templates(Library);
%my_templates(Screen);
%my_templates(WindowManager);
%my_templates(Image);
%my_templates(Lattice);
%my_templates(Curve);
%my_templates(MetaBall);
%my_templates(VectorFont);
%my_templates(Texture);
%my_templates(Brush);
%my_templates(World);
%my_templates(Group);
%my_templates(Key);
%my_templates(ID);
%my_templates(Text);
%my_templates(Speaker);
%my_templates(Sound);
%my_templates(Armature);
%my_templates(Action);
%my_templates(ParticleSettings);
%my_templates(Palette);
%my_templates(GreasePencil);
%my_templates(MovieClip);
%my_templates(Mask);
%my_templates(FreestyleLineStyle);
%my_templates(MaterialTextureSlot);
%my_templates(TexPaintSlot);
%my_templates(MeshVertex);
%my_templates(MeshEdge);
%my_templates(MeshTessFace);
%my_templates(MeshLoop);
%my_templates(MeshPolygon);
%my_templates(MeshUVLoopLayer);
%my_templates(MeshTextureFaceLayer);
%my_templates(MeshTexturePolyLayer);
%my_templates(MeshColorLayer);
%my_templates(MeshLoopColorLayer);
%my_templates(MeshVertexFloatPropertyLayer);
%my_templates(MeshVertexIntPropertyLayer);
%my_templates(MeshVertexStringPropertyLayer);
%my_templates(MeshSkinVertexLayer);
%my_templates(MeshPaintMaskLayer);
%my_templates(MeshSkinVertex);
%my_templates(MeshPaintMaskProperty);
%my_templates(VertexGroupElement);
%my_templates(MeshUVLoop);
%my_templates(MeshTextureFace);
%my_templates(MeshColor);
%my_templates(MeshLoopColor);
%my_templates(MeshVertexFloatProperty);
%my_templates(MeshPolygonFloatProperty);
%my_templates(MeshVertexIntProperty);
%my_templates(MeshPolygonIntProperty);
%my_templates(MeshVertexStringProperty);
%my_templates(MeshPolygonStringProperty);
%my_templates(UVProjector);
%my_templates(NlaStrip);
%my_templates(NodeLink);
%my_templates(NodeOutputFileSlotFile);
%my_templates(NodeOutputFileSlotLayer);
%my_templates(MaterialSlot);
%my_templates(VertexGroup);
%my_templates(ParticleSystem);
%my_templates(DupliObject);
%my_templates(LodLevel);
%my_templates(Sensor);
%my_templates(GameProperty);
%my_templates(PoseBone);
%my_templates(BoneGroup);
%my_templates(RenderLayer);
%my_templates(RenderView);
%my_templates(RenderPass);
%my_templates(TimelineMarker);
%my_templates(TransformOrientation);
%my_templates(SceneRenderLayer);
%my_templates(SceneRenderView);
%my_templates(Area);
%my_templates(Space);
%my_templates(Region);
%my_templates(SequenceModifier);
%my_templates(RegionView3D);
%my_templates(ConsoleLine);
%my_templates(Addon);
%my_templates(PathCompare);
%my_templates(Macro);
%my_templates(KeyConfig);
%my_templates(KeyMap);
%my_templates(KeyMapItem);
%my_templates(WorldTextureSlot);



// Map Vector_POD   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* Vector_POD_cstype_out */") Vector_POD "Fusee.Math.float3 /* Vector_POD_cstype */"
%typemap(csout, excode=SWIGEXCODE) Vector_POD 
%{ {  /* <Vector_POD_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <Vector_POD_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* Vector_POD_imtype_out */") Vector_POD "Fusee.Math.float3 /* Vector_POD_imtype */"
%typemap(ctype, out="Vector_POD /* Vector_POD_ctype_out */") Vector_POD "Vector_POD /* Vector_POD_ctype */"
%typemap(directorout) Vector_POD
%{ /* <Vector_POD_directorout> */
   $result = *((Vector_POD *)&($input)); 
   /* </Vector_POD_directorout> */
 %}
%typemap(directorin) Vector_POD 
%{ /* <Vector_POD_directorin> */
   $input = *((Vector_POD *)&($1)); 
   /* </Vector_POD_directorin> */ 
%}
%typemap(out) Vector_POD 
%{
	/* <Vector_POD_out> */
	$result = *((Vector_POD *)&($1));
	/* </Vector_POD_out> */
%}
%typemap(in) Vector_POD 
%{
	/* <Vector_POD_in> */
	$1 = *((Vector_POD *)&($input));
	/* </Vector_POD_in> */
%}
%typemap(csin) Vector_POD "$csinput /* Vector_POD_csin */"
%typemap(csdirectorin, 
   pre="/* NOP Vector_POD_csdirectorin_pre */"
  ) Vector_POD
  "$iminput /* Vector_POD_csdirectorin */"
%typemap(csdirectorout) Vector_POD "$cscall /* Vector_POD_csdirectorout */"
%typemap(csvarin) Vector_POD %{
    /* <Vector_POD_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </Vector_POD_csvarin> */  %}
%typemap(csvarout) Vector_POD %{ 
   /* <Vector_POD_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <Vector_POD_csvarout> */ %}


// Map VFLOAT2   TO   Fusee.Math.float2
%typemap(cstype, out="Fusee.Math.float2 /* VFLOAT2_cstype_out */") VFLOAT2 "Fusee.Math.float2 /* VFLOAT2_cstype */"
%typemap(csout, excode=SWIGEXCODE) VFLOAT2 
%{ {  /* <VFLOAT2_csout> */
      Fusee.Math.float2 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT2_csout> */ %}
%typemap(imtype, out="Fusee.Math.float2 /* VFLOAT2_imtype_out */") VFLOAT2 "Fusee.Math.float2 /* VFLOAT2_imtype */"
%typemap(ctype, out="VFLOAT2 /* VFLOAT2_ctype_out */") VFLOAT2 "VFLOAT2 /* VFLOAT2_ctype */"
%typemap(directorout) VFLOAT2
%{ /* <VFLOAT2_directorout> */
   $result = *((VFLOAT2 *)&($input)); 
   /* </VFLOAT2_directorout> */
 %}
%typemap(directorin) VFLOAT2 
%{ /* <VFLOAT2_directorin> */
   $input = *((VFLOAT2 *)&($1)); 
   /* </VFLOAT2_directorin> */ 
%}
%typemap(out, null="VFLOAT2()")    VFLOAT2
%{ 
	/* VFLOAT2 out*/
	$result = $1;
	/* VFLOAT2 out*/
%}
%typemap(in) VFLOAT2 
%{
	/* <VFLOAT2_in> */
	$1 = *((VFLOAT2 *)&($input));
	/* </VFLOAT2_in> */
%}
%typemap(csin) VFLOAT2 "$csinput /* VFLOAT2_csin */"
%typemap(csdirectorin, 
   pre="/* NOP VFLOAT2_csdirectorin_pre */"
  ) VFLOAT2
  "$iminput /* VFLOAT2_csdirectorin */"
%typemap(csdirectorout) VFLOAT2 "$cscall /* VFLOAT2_csdirectorout */"
%typemap(csvarin) VFLOAT2 %{
    /* <VFLOAT2_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </VFLOAT2_csvarin> */  %}
%typemap(csvarout) VFLOAT2 %{ 
   /* <VFLOAT2_csvarout> */
   get
   {  
      Fusee.Math.float2 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT2_csvarout> */ %}



// Map VFLOAT3   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* VFLOAT3_cstype_out */") VFLOAT3 "Fusee.Math.float3 /* VFLOAT3_cstype */"
%typemap(csout, excode=SWIGEXCODE) VFLOAT3 
%{ {  /* <VFLOAT3_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT3_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* VFLOAT3_imtype_out */") VFLOAT3 "Fusee.Math.float3 /* VFLOAT3_imtype */"
%typemap(ctype, out="VFLOAT3 /* VFLOAT3_ctype_out */") VFLOAT3 "VFLOAT3 /* VFLOAT3_ctype */"
%typemap(directorout) VFLOAT3
%{ /* <VFLOAT3_directorout> */
   $result = *((VFLOAT3 *)&($input)); 
   /* </VFLOAT3_directorout> */
 %}
%typemap(directorin) VFLOAT3 
%{ /* <VFLOAT3_directorin> */
   $input = *((VFLOAT3 *)&($1)); 
   /* </VFLOAT3_directorin> */ 
%}
%typemap(out, null="VFLOAT3()")    VFLOAT3
%{ 
	/* VFLOAT3 out*/
	$result = $1;
	/* VFLOAT3 out*/
%}
%typemap(in) VFLOAT3 
%{
	/* <VFLOAT3_in> */
	$1 = *((VFLOAT3 *)&($input));
	/* </VFLOAT3_in> */
%}
%typemap(csin) VFLOAT3 "$csinput /* VFLOAT3_csin */"
%typemap(csdirectorin, 
   pre="/* NOP VFLOAT3_csdirectorin_pre */"
  ) VFLOAT3
  "$iminput /* VFLOAT3_csdirectorin */"
%typemap(csdirectorout) VFLOAT3 "$cscall /* VFLOAT3_csdirectorout */"
%typemap(csvarin) VFLOAT3 %{
    /* <VFLOAT3_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </VFLOAT3_csvarin> */  %}
%typemap(csvarout) VFLOAT3 %{ 
   /* <VFLOAT3_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT3_csvarout> */ %}



// Map VFLOAT4   TO   Fusee.Math.float4
%typemap(cstype, out="Fusee.Math.float4 /* VFLOAT4_cstype_out */") VFLOAT4 "Fusee.Math.float4 /* VFLOAT4_cstype */"
%typemap(csout, excode=SWIGEXCODE) VFLOAT4 
%{ {  /* <VFLOAT4_csout> */
      Fusee.Math.float4 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT4_csout> */ %}
%typemap(imtype, out="Fusee.Math.float4 /* VFLOAT4_imtype_out */") VFLOAT4 "Fusee.Math.float4 /* VFLOAT4_imtype */"
%typemap(ctype, out="VFLOAT4 /* VFLOAT4_ctype_out */") VFLOAT4 "VFLOAT4 /* VFLOAT4_ctype */"
%typemap(directorout) VFLOAT4
%{ /* <VFLOAT4_directorout> */
   $result = *((VFLOAT4 *)&($input)); 
   /* </VFLOAT4_directorout> */
 %}
%typemap(directorin) VFLOAT4 
%{ /* <VFLOAT4_directorin> */
   $input = *((VFLOAT4 *)&($1)); 
   /* </VFLOAT4_directorin> */ 
%}
%typemap(out, null="VFLOAT4()")    VFLOAT4
%{ 
	/* VFLOAT4 out*/
	$result = $1;
	/* VFLOAT4 out*/
%}
%typemap(in) VFLOAT4 
%{
	/* <VFLOAT4_in> */
	$1 = *((VFLOAT4 *)&($input));
	/* </VFLOAT4_in> */
%}
%typemap(csin) VFLOAT4 "$csinput /* VFLOAT4_csin */"
%typemap(csdirectorin, 
   pre="/* NOP VFLOAT4_csdirectorin_pre */"
  ) VFLOAT4
  "$iminput /* VFLOAT4_csdirectorin */"
%typemap(csdirectorout) VFLOAT4 "$cscall /* VFLOAT4_csdirectorout */"
%typemap(csvarin) VFLOAT4 %{
    /* <VFLOAT4_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </VFLOAT4_csvarin> */  %}
%typemap(csvarout) VFLOAT4 %{ 
   /* <VFLOAT4_csvarout> */
   get
   {  
      Fusee.Math.float4 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT4_csvarout> */ %}


// Map VFLOAT16   TO   Fusee.Math.float4x4
%typemap(cstype, out="Fusee.Math.float4x4 /* VFLOAT16_cstype_out */") VFLOAT16 "Fusee.Math.float4x4 /* VFLOAT16_cstype */"
%typemap(csout, excode=SWIGEXCODE) VFLOAT16 
%{ {  /* <VFLOAT16_csout> */
      Fusee.Math.float4x4 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT16_csout> */ %}
%typemap(imtype, out="Fusee.Math.float4x4 /* VFLOAT16_imtype_out */") VFLOAT16 "Fusee.Math.float4x4 /* VFLOAT16_imtype */"
%typemap(ctype, out="VFLOAT16 /* VFLOAT16_ctype_out */") VFLOAT16 "VFLOAT16 /* VFLOAT16_ctype */"
%typemap(directorout) VFLOAT16
%{ /* <VFLOAT16_directorout> */
   $result = *((VFLOAT16 *)&($input)); 
   /* </VFLOAT16_directorout> */
 %}
%typemap(directorin) VFLOAT16 
%{ /* <VFLOAT16_directorin> */
   $input = *((VFLOAT16 *)&($1)); 
   /* </VFLOAT16_directorin> */ 
%}
%typemap(out, null="VFLOAT16()")    VFLOAT16
%{ 
	/* VFLOAT16 out*/
	$result = $1;
	/* VFLOAT16 out*/
%}
%typemap(in) VFLOAT16 
%{
	/* <VFLOAT16_in> */
	$1 = *((VFLOAT16 *)&($input));
	/* </VFLOAT16_in> */
%}
%typemap(csin) VFLOAT16 "$csinput /* VFLOAT16_csin */"
%typemap(csdirectorin, 
   pre="/* NOP VFLOAT16_csdirectorin_pre */"
  ) VFLOAT16
  "$iminput /* VFLOAT16_csdirectorin */"
%typemap(csdirectorout) VFLOAT16 "$cscall /* VFLOAT16_csdirectorout */"
%typemap(csvarin) VFLOAT16 %{
    /* <VFLOAT16_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </VFLOAT16_csvarin> */  %}
%typemap(csvarout) VFLOAT16 %{ 
   /* <VFLOAT16_csvarout> */
   get
   {  
      Fusee.Math.float4x4 ret = $imcall;$excode
      return ret;
   } /* <VFLOAT16_csvarout> */ %}



// Map std::array<float, 3>   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* std::array<float, 3>_cstype_out */") std::array<float, 3> "Fusee.Math.float3 /* std::array<float, 3>_cstype */"
%typemap(csout, excode=SWIGEXCODE) std::array<float, 3> 
%{ {  /* <std::array<float, 3>_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <std::array<float, 3>_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* std::array<float, 3>_imtype_out */") std::array<float, 3> "Fusee.Math.float3 /* std::array<float, 3>_imtype */"
%typemap(ctype, out="std::array<float, 3> /* std::array<float, 3>_ctype_out */") std::array<float, 3> "std::array<float, 3> /* std::array<float, 3>_ctype */"
%typemap(directorout) std::array<float, 3>
%{ /* <std::array<float, 3>_directorout> */
   $result = *((std::array<float, 3> *)&($input)); 
   /* </std::array<float, 3>_directorout> */
 %}
%typemap(directorin) std::array<float, 3> 
%{ /* <std::array<float, 3>_directorin> */
   $input = *((std::array<float, 3> *)&($1)); 
   /* </std::array<float, 3>_directorin> */ 
%}
%typemap(out, null="std::array<float, 3>()")    std::array<float, 3>
%{ 
	/* Fusee.Math.float3 out*/
	$result = $1;
	/* Fusee.Math.float3 out*/
%}
%typemap(in) std::array<float, 3> 
%{
	/* <std::array<float, 3>_in> */
	$1 = *((std::array<float, 3> *)&($input));
	/* </std::array<float, 3>_in> */
%}
%typemap(csin) std::array<float, 3> "$csinput /* std::array<float, 3>_csin */"
%typemap(csdirectorin, 
   pre="/* NOP std::array<float, 3>_csdirectorin_pre */"
  ) std::array<float, 3>
  "$iminput /* std::array<float, 3>_csdirectorin */"
%typemap(csdirectorout) std::array<float, 3> "$cscall /* std::array<float, 3>_csdirectorout */"
%typemap(csvarin) std::array<float, 3> %{
    /* <std::array<float, 3>_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </std::array<float, 3>_csvarin> */  %}
%typemap(csvarout) std::array<float, 3> %{ 
   /* <std::array<float, 3>_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode /*Fusee.Math.float3 ret = $imcall*/
      return ret;
   } /* <std::array<float, 3>_csvarout> */ %}



// Map int $1[ANY] TO  int[]
%typemap(cstype, out="$csclassname") int[ANY] "int[] /* int[]_cstype */"
%typemap(csin) int[ANY] " $csinput /* int[]_csin */"
%typemap(imtype) int[ANY] "int[] /* int[]_imtype */"

// Map float $1[ANY] TO  float[]
//%typemap(cstype, out="$csclassname") float[ANY] "float[] /* float[]_cstype */"
//%typemap(csin) float[ANY] " $csinput /* float[]_csin */"
//%typemap(imtype) float[ANY] "float[] /* float[]_imtype */"

// Map bool $1[ANY] TO  bool[]
%typemap(cstype, out="$csclassname") bool[ANY] "bool[] /* bool[]_cstype */"
%typemap(csin) bool[ANY] " $csinput /* bool[]_csin */"
%typemap(imtype) bool[ANY] "bool[] /* bool[]_imtype */"

//%include "CppApi.h";
%include "uniplug_blender_api.h";

