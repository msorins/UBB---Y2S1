using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using ToyInterpreter;
using ToyInterpreter.Exceptions;
using ToyInterpreter.Model.state;
using ToyInterpreter.Repository;

namespace ToyInterpreter.Controller
{
    class Controller
    {
        private Repository.Repository repo;

        public Controller()
        {
            repo = new Repository.Repository();
        }

        public Controller(Repository.Repository repo)
        {
            this.repo = repo;
        }

        public PrgState oneStep(PrgState state)
        {
            //Get exe stack
            Stack<IStmt> exeStack = state.getExeStack();
            if(exeStack.Count == 0)
            {
                throw new StmtExecException("Exe stack is empty");
            }
                
            //Pop last element from exe stack
            IStmt crtStmt = exeStack.Pop();

            //Execute the element
            return crtStmt.execute(state);

        }

        public void allSteps()
        {
            PrgState crtPrg = repo.getCrtPrg();

            try
            {
                while(true)
                {
                    oneStep(crtPrg);
                    repo.logPrgStateExec(crtPrg);
                }
            }
            catch(StmtExecException e)
            {

            }
        }

        public void addProgram(IStmt prg)
        {
            PrgState newProg = new PrgState(
               new Stack<IStmt>(),
               new Dictionary<String, Int64>(),
               new List<Int64>(),
               prg,
               new Dictionary<Int64, FileTableData>()
             );

            this.repo.addProgram(newProg);
        }

        public PrgState getFirstProgram()
        {
            return this.repo.getCrtPrg();
        }

        public override string ToString()
        {
            return this.repo.getCrtPrg().ToString();
        }
    }
}
