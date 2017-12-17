using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.View.commands
{
    class RunOneStepCommand: Command
    {
        public RunOneStepCommand(String key, String description, Controller.Controller controller): base(key, description, controller)
        {
        }


        public override void execute()
        {
            executeOneStep();
            printProgram();
        }

        private int getNr(String msg)
        {
            Console.WriteLine(msg);
  
            return Int32.Parse(Console.ReadLine());
        }

        private void executeOneStep()
        {
            controller.oneStep(controller.getFirstProgram());
        }

        private void printProgram()
        {
            Console.WriteLine(controller.getFirstProgram());
        }
    }
}
