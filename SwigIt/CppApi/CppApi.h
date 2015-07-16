// Cpp.h : Declares the exported functions for the DLL application.
//

#ifdef BUILDING_CPP_API
#define CPP_API_EXIM   __declspec( dllexport ) 
#else
#define CPP_API_EXIM   __declspec( dllimport ) 
#endif

class Foo
{
	int level42;
};


// Genaugenommen kein POD (plain old Datatype), weil definierte Konstruktoren. Scheint aber trotzdem von der .NET-CLI / p/invoke zur Laufzeit 
// verkraftet zu werden...
struct Vector_POD
{
	// Notwendig, weil auch ein Nicht-Standard-Konstruktor definiert ist.
	Vector_POD()
	{}

	// Notwendig, damit ein von SWIG generiertes "return 0" in einen Rückgabewert vom Typ "Vector_POD" cast-bar ist.
	Vector_POD(int i)
	{
		x = y = z = i;
	}

	// Verzichtbar, aber hilfreich, weil durch die expliziten Konstruktoren eine Initialisierung mit {} nicht mehr geht...
	Vector_POD(float x_, float y_, float z_)
	{
		x = x_; y = y_; z=z_;
	}



	float x, y, z;
};

#include <array>
#include <vector>
#include <map>

class CPP_API_EXIM CppApiXX
{
public:
	void TestArrayIn(Vector_POD);
	Vector_POD TestArrayOut();
	Vector_POD TestArrayInOut(Vector_POD myArray);
	Vector_POD FooInArrayOut(Foo f);

	std::string default_value();
	void default_value(const std::string& value);

	std::vector<int> createV3(int vx, int vy, int vz);

	std::map<std::string, int> properties();

	void TestArrayInObsolete(std::array<float, 3> a);
	std::array<float,3> TestArrayOutObsolete();

	std::array<float, 3> FooInArrayOutObsolete(Foo f);
};



