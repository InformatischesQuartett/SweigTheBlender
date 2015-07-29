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
class Bar
{
	int theInt;
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


struct VFloat3
{
	float data[3];
	//int& operator[] (const int idx)
	//{
	//	return data[idx];
	//}
};


#include <array>
#include <vector>
#include <map>

class CPP_API_EXIM CppApiXX
{
public:

	enum fixed_oversample_items {
		fixed_oversample_items_5 = 5,
		fixed_oversample_items_8 = 8,
		fixed_oversample_items_11 = 11,
		fixed_oversample_items_16 = 16
	};

	std::map<std::string, int> create_string_to_fixed_oversample_items() {
		return{ { "5", fixed_oversample_items_5 }, { "8", fixed_oversample_items_8 }, { "11", fixed_oversample_items_11 }, { "16", fixed_oversample_items_16 } };
	};

	std::map<int, std::string> create_fixed_oversample_items_to_string() {
		return{ { fixed_oversample_items_5, "5" }, { fixed_oversample_items_8, "8" }, { fixed_oversample_items_11, "11" }, { fixed_oversample_items_16, "16" } };
	};

	const std::map<std::string, int> string_to_fixed_oversample_items = create_string_to_fixed_oversample_items();
	const std::map<int, std::string> fixed_oversample_items_to_string = create_fixed_oversample_items_to_string();


	void vertices(int values[4]);

	void TestArrayIn(Vector_POD);
	Vector_POD TestArrayOut();
	Vector_POD TestArrayInOut(Vector_POD myArray);
	Vector_POD FooInArrayOut(Foo f);

	std::string default_value();
	void default_value(const std::string& value);

	std::vector<int> createV3(int vx, int vy, int vz);
	std::vector<int> createList(std::vector<int> in);

	std::map<std::string, int> properties();
	std::map<std::string, Foo> mapSF();
	std::map<std::string, Bar> mapSB();

	void TestArrayInObsolete(std::array<float, 3> a);
	std::array<float,3> TestArrayOutObsolete();


};



