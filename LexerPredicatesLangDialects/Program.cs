using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Antlr4.Runtime;

namespace LexerPredicatesLangDialects {
    class Program {
        static void Main(string[] args) {
            StreamReader s = new StreamReader(args[0]);
            AntlrInputStream astr = new AntlrInputStream(s);
            LexDialectsLexer lexer = new LexDialectsLexer(astr);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            LexDialectsParser parser = new LexDialectsParser(tokens);
            if (args.Length > 1 && args[1] == "java5") {
                LexDialectsLexer.java5 = true;
                Console.WriteLine("Using java5 switch enum declarations are enabled");
            } else {
                Console.WriteLine("Ommitting java5 switch enum declarations are unsupported");
            }
            parser.compileUnit();
        }
    }
}
