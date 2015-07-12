using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsClient
{
    class Program
    {
        static void Main(string[] args)
        {
            var cppapixx = new CppApiWrapper.CppApiXX();
            var ret = cppapixx.TestArrayOut();
            Console.WriteLine("(x=" + ret.x + "; y=" + ret.x + "; z=" + ret.z + ")");

            ret = cppapixx.FooInArrayOut(new CppApiWrapper.Foo());
            Console.WriteLine("(x=" + ret.x + "; y=" + ret.x + "; z=" + ret.z + ")");
  
            
            Console.ReadKey();
        }
    }
}
