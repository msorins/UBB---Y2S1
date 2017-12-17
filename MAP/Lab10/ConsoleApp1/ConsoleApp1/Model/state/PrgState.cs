using System;
using System.Collections.Generic;
using System.Text;
using ConsoleApp1.Model.statements;
using System.IO;
using ToyInterpreter.Model.state;

namespace ConsoleApp1.Model.state
{
    class PrgState
    {
        private Stack<IStmt> exeStack;
        private Dictionary<String, Int64> symTable;
        private List<Int64> outList;
        private IStmt originalProgram;
        private Dictionary<Int64, FileTableData> fileTable;

        public PrgState(Stack<IStmt> exeStack, Dictionary<String, Int64> symTable, List<Int64> outList, IStmt originalProgram, Dictionary<Int64, FileTableData> fileTable) {
            this.exeStack = exeStack;
            this.symTable = symTable;
            this.outList = outList;
            this.originalProgram = originalProgram;
            this.fileTable = fileTable;

            this.exeStack.Push(originalProgram);
        }

        public Stack<IStmt> getExeStack()
        {
            return this.exeStack;
        }

        public List<long> getOut()
        {
            return this.outList;
        }

        public Dictionary<String, Int64> getSymTable()
        {
            return this.symTable;
        }

        public Dictionary<Int64, FileTableData> getFileTable()
        {
            return this.fileTable;
        }

        public override String ToString()
        {
            return  ": PrgState { " +
                    "\n \texeStack = " + string.Join(", ", exeStack) +
                    "\n \tsymTable = " + string.Join(":", symTable) +
                    "\n \tout = " + String.Join(", ", outList.ToArray())+
                    "\n \toriginalProgram = " + originalProgram.ToString() +
                    "\n } ";
        }

    }
}
