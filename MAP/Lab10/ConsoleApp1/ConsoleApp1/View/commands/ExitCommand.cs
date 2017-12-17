using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.View.commands
{
    class ExitCommand: Command
    {
        public ExitCommand(String key, String description, Controller.Controller controller): base(key, description, controller)
        {
            
        }

        public override void execute()
        {
            Environment.Exit(0);
        }
    }
}
