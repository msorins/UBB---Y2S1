using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;

namespace ToyInterpreter.Model.state
{
    class ReadFileStmt: IStmt
    {
        private IExp exp_file_id;
        private String var_name;

        public ReadFileStmt(IExp exp_file_id, String var_name)
        {
            this.exp_file_id = exp_file_id;
            this.var_name = var_name;
        }

  
        public PrgState execute(PrgState state)
        {
            Dictionary<Int64, FileTableData> fileTbl = state.getFileTable();
            Dictionary<String, Int64> symDict = state.getSymTable();
            Dictionary<String, Int64> symTbl = state.getSymTable();

            //Eval expression
            int fileId = exp_file_id.eval(symDict);

            //Find fileId in the fileTabel
            if(!fileTbl.ContainsKey(fileId))
                throw new ExpressionExceptions("No file with given id");

            FileTableData fileTableData = fileTbl[fileId];

            //Read next line
            String line = fileTableData.streamReader.ReadLine();
            int readValue;

            if(line.Length == 0) {
                readValue = 0;
            } else {
                readValue = (int) Int64.Parse(line);
            }

            symTbl.Add(var_name, readValue);

            return state;
        }

        public override String ToString()
        {
            return "ReadFileStmt( " + exp_file_id.ToString() + ", " + var_name + " )";
        }
    }
}
