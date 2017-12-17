using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;

namespace ToyInterpreter.Model.state
{
    class CloseRFileStmt: IStmt
    {
        private IExp exp_file_id;

        public CloseRFileStmt(IExp exp_file_id)
        {
            this.exp_file_id = exp_file_id;
        }


        public PrgState execute(PrgState state)
        {
            Dictionary<Int64, FileTableData> fileTbl = state.getFileTable();
            Dictionary<String, Int64> symDict = state.getSymTable();
          

            //Eval expression
            int fileId = exp_file_id.eval(symDict);

            //Find fileId in the fileTabel
            if(!fileTbl.ContainsKey(fileId))
                throw new ExpressionExceptions("No file with given id");

            FileTableData fileTableData = fileTbl[fileId];

            //Call close on that file
            fileTableData.streamReader.Close();

            //Delete entry from FileTable
            fileTbl.Remove(fileId);

            return state;
        }

        public override String ToString()
        {
            return "CloseRFileStmt( " + exp_file_id.ToString() + " )";
        }
    }
}
