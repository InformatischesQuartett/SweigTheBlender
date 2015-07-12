using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusee.Math;

namespace CsClient
{
    class Program
    {
        static void Main(string[] args)
        {
            var cppapixx = new CppApiWrapper.CppApiXX();
            var ret = cppapixx.TestArrayOut();
            ret = cppapixx.TestArrayInOut(new float3(7, 8, 9));
            Console.WriteLine("(x=" + ret.x + "; y=" + ret.y + "; z=" + ret.z + ")");
            cppapixx.TestArrayIn(new Fusee.Math.float3(5, 5, 5));
            ret = cppapixx.FooInArrayOut(new CppApiWrapper.Foo());
            Console.WriteLine("(x=" + ret.x + "; y=" + ret.x + "; z=" + ret.z + ")");
            Console.WriteLine("(x=" + ret.x + "; y=" + ret.x + "; z=" + ret.z + ")");
  
            
            Console.ReadKey();
        }
    }
}
