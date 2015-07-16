using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CppApiWrapper;
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

            var bla = cppapixx.default_value();
            var s = "narf";
            cppapixx.default_value(s);

            
            var theVector = cppapixx.createV3(4, 5, 6);
            Console.WriteLine("theVector[0]=" + theVector[0] + " theVector[1]= " + theVector[1] +" theVector[2]= " + theVector[2]);


            var map = cppapixx.properties();
            int val;
            var retmap = map.TryGetValue("first", out val);
            Console.WriteLine("map= " + map+ " val= " + val+ " retmap= " + retmap);

            cppapixx.TestArrayInObsolete(ret);
            var t = cppapixx.TestArrayOutObsolete();
            t = cppapixx.FooInArrayOutObsolete(new Foo());
            Console.ReadKey();


        }
    }
}
