using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Antlr4.Runtime;

namespace LangDialectsNoPredicates {
    class Program {
        static void Main(string[] args) {
            StreamReader s = new StreamReader(args[0]);
            AntlrInputStream astr = new AntlrInputStream(s);
            LangDialectsNPLexer lexer = new LangDialectsNPLexer(astr);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            LangDialectsNPParser parser = new LangDialectsNPParser(tokens);
            if (args.Length > 1 && args[1] == "java5") {
                LangDialectsNPLexer.java5 = true;
                Console.WriteLine("Using java5 switch enum declarations are enabled");
            } else {
                Console.WriteLine("Ommitting java5 switch enum declarations are unsupported");
            }
            parser.compileUnit();
        }
    }
}
