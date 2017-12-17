using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.View.commands
{
    class RunAllStepsCommand: Command
    {
        public RunAllStepsCommand(String key, String description, Controller.Controller controller): base(key, description, controller)
        {
      
        }


        public override void execute()
        {
            executeAllSteps();
            printProgram();
        }

        private int getNr(String msg)
        {
            Console.WriteLine(msg);

            return Convert.ToInt32(Console.ReadLine());
        }

        private void executeOneStep()
        {
            controller.oneStep(controller.getFirstProgram());
   
        }

        private void printProgram()
        {
            Console.WriteLine(controller.ToString());
        }

        private void executeAllSteps()
        {
            controller.allSteps();
        }
}
}
