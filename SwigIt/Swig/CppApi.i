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

// ignoring  string_to_* or *_to_string 
%rename("%(regex:/(\w*)string_to(\w*)/$ignore/)s") "";
%rename("%(regex:/(\w*)to_string(\w*)/$ignore/)s") "";

// ignoring base classes
%ignore pyObjRef;
%ignore PyObject;

// This converts std::Vector<int> in to a class called IntVector
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
	%template(String_ ## DATA_TYPE ## _Map) std::map<std::string, UniplugBL::DATA_TYPE>;
%enddef

%std_templates(Bone);
%std_templates(BoidRule);
%std_templates(BoidState);
%std_templates(CurveMapPoint);
%std_templates(CurveMap);
%std_templates(ColorRampElement);
%std_templates(ConstraintTarget);
%std_templates(Actuator);
%std_templates(Spline);
%std_templates(Material);
%std_templates(TextBox);
%std_templates(TextCharacterFormat);
%std_templates(SplinePoint);
%std_templates(BezierSplinePoint);
%std_templates(DynamicPaintSurface);
%std_templates(FCurveSample);
%std_templates(Keyframe);
%std_templates(FModifier);
%std_templates(DriverTarget);
%std_templates(DriverVariable);
%std_templates(FModifierEnvelopeControlPoint);
%std_templates(FluidMeshVertex);
%std_templates(GPencilLayer);
%std_templates(GPencilFrame);
%std_templates(GPencilStroke);
%std_templates(GPencilStrokePoint);
%std_templates(Object);
%std_templates(ImagePackedFile);
%std_templates(RenderSlot);
%std_templates(ShapeKey);
%std_templates(UnknownType);
%std_templates(LampTextureSlot);
%std_templates(LatticePoint);
%std_templates(VertexGroupElement);
%std_templates(LineStyleTextureSlot);
%std_templates(LineStyleColorModifier);
%std_templates(LineStyleAlphaModifier);
%std_templates(LineStyleThicknessModifier);
%std_templates(LineStyleGeometryModifier);
%std_templates(Camera);
%std_templates(Scene);
%std_templates(NodeTree);
%std_templates(Mesh);
%std_templates(Lamp);
%std_templates(Library);
%std_templates(Screen);
%std_templates(WindowManager);
%std_templates(Image);
%std_templates(Lattice);
%std_templates(Curve);
%std_templates(MetaBall);
%std_templates(VectorFont);
%std_templates(Texture);
%std_templates(Brush);
%std_templates(World);
%std_templates(Group);
%std_templates(Key);
%std_templates(ID);
%std_templates(Text);
%std_templates(Speaker);
%std_templates(Sound);
%std_templates(Armature);
%std_templates(Action);
%std_templates(ParticleSettings);
%std_templates(Palette);
%std_templates(GreasePencil);
%std_templates(MovieClip);
%std_templates(Mask);
%std_templates(FreestyleLineStyle);
%std_templates(MaterialTextureSlot);
%std_templates(TexPaintSlot);
%std_templates(MeshVertex);
%std_templates(MeshEdge);
%std_templates(MeshTessFace);
%std_templates(MeshLoop);
%std_templates(MeshPolygon);
%std_templates(MeshUVLoopLayer);
%std_templates(MeshTextureFaceLayer);
%std_templates(MeshTexturePolyLayer);
%std_templates(MeshColorLayer);
%std_templates(MeshLoopColorLayer);
%std_templates(MeshVertexFloatPropertyLayer);
%std_templates(MeshVertexIntPropertyLayer);
%std_templates(MeshVertexStringPropertyLayer);
%std_templates(MeshSkinVertexLayer);
%std_templates(MeshPaintMaskLayer);
%std_templates(MeshSkinVertex);
%std_templates(MeshPaintMaskProperty);
%std_templates(VertexGroupElement);
%std_templates(MeshUVLoop);
%std_templates(MeshTextureFace);
%std_templates(MeshColor);
%std_templates(MeshLoopColor);
%std_templates(MeshVertexFloatProperty);
%std_templates(MeshPolygonFloatProperty);
%std_templates(MeshVertexIntProperty);
%std_templates(MeshPolygonIntProperty);
%std_templates(MeshVertexStringProperty);
%std_templates(MeshPolygonStringProperty);
%std_templates(UVProjector);
%std_templates(NlaStrip);
%std_templates(NodeLink);
%std_templates(NodeOutputFileSlotFile);
%std_templates(NodeOutputFileSlotLayer);
%std_templates(MaterialSlot);
%std_templates(VertexGroup);
%std_templates(ParticleSystem);
%std_templates(DupliObject);
%std_templates(LodLevel);
%std_templates(Sensor);
%std_templates(GameProperty);
%std_templates(PoseBone);
%std_templates(BoneGroup);
%std_templates(RenderLayer);
%std_templates(RenderView);
%std_templates(RenderPass);
%std_templates(TimelineMarker);
%std_templates(TransformOrientation);
%std_templates(SceneRenderLayer);
%std_templates(SceneRenderView);
%std_templates(Area);
%std_templates(Space);
%std_templates(Region);
%std_templates(SequenceModifier);
%std_templates(RegionView3D);
%std_templates(ConsoleLine);
%std_templates(Addon);
%std_templates(PathCompare);
%std_templates(Macro);
%std_templates(KeyConfig);
%std_templates(KeyMap);
%std_templates(KeyMapItem);
%std_templates(WorldTextureSlot);

////////////////////////////////////////////////////////////////////////////////////
// Mapping POD VECTOR types to C#

%include "POD_Mapping.i"
%pod_typemaps(float, Vector_POD, Fusee.Math.float3)
%pod_typemaps(float, UniplugBL::VFLOAT2, Fusee.Math.float2);
%pod_typemaps(float, UniplugBL::VFLOAT3, Fusee.Math.float3);
%pod_typemaps(float, UniplugBL::VFLOAT4, Fusee.Math.float4);
%pod_typemaps(float, UniplugBL::VFLOAT16, Fusee.Math.float4x4);

////////////////////////////////////////////////////////////////////////////////////
// Mapping Array types to C#

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

//%include "CppApi.h";
%include "uniplug_blender_api.h";

