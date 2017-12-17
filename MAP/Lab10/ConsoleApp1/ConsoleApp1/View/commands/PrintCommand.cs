using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Controller;

namespace ToyInterpreter.View.commands
{
    class PrintCommand: Command
    {
        public PrintCommand(String key, String description, Controller.Controller controller): base(key, description, controller)
        {
            
        }

        public override void execute()
        {
            printPrograms();
        }

        public void printPrograms()
        {
            Console.WriteLine( controller.ToString() );
        }
    }
}
