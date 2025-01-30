using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DateTime date1 = new DateTime(2023, 05, 15); // Май 2023 года
            DateTime date2 = new DateTime(2024, 03, 10); // Март 2024 года
            TimeSpan result = date1 - date2;
            Console.WriteLine(Math.Abs( result.Days).ToString());
        }
    }
}
