using ConsoleApp1.Model.state;
using System;
using System.Collections.Generic;
using System.Text;
using ConsoleApp1.Model.statements;

namespace ToyInterpreter.Repository
{
    class Repository
    {
        public List<PrgState> programs;
        private string logFilePath;

        public Repository()
        {
            this.programs = new List<PrgState>();
            readLogFilePath();
        }

        public PrgState getCrtPrg()
        {
            if (programs.Count == 0)
                throw new Exception("There must be a program inserted");
            
            return this.programs[0];
        }

        public void addProgram(PrgState prg)
        {
            if (programs.Count == 0)
                this.programs.Add(prg);
            else
                throw new Exception("Only one program must exist");
        }

        public void readLogFilePath()
        {
            Console.WriteLine("Log file path: ");
            this.logFilePath = Console.ReadLine();
        }

        public void logPrgStateExec(PrgState state) {
            string logFileContent = "";

            logFileContent += state.ToString();

            System.IO.File.AppendAllText(this.logFilePath, logFileContent);
        }
}
}
