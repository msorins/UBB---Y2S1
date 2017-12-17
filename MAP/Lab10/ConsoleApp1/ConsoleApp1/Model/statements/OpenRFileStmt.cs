using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using ToyInterpreter.Model.state;

namespace ToyInterpreter.Model.statements
{
    class OpenRFileStmt: IStmt
    {
        private String var_file;
        private String filename;
        private static int nrFiles = 0;

        public OpenRFileStmt(String var_file, String filename)
        {
            this.var_file = var_file;
            this.filename = filename;
        }

        public PrgState execute(PrgState state)
        {
            Dictionary<Int64, FileTableData> fileTbl = state.getFileTable();

        //Check to see the file is not opened
        bool found = false;

        foreach(Int64 key in fileTbl.Keys) {
            if(fileTbl[key].Equals(filename) )
                throw  new StatementsExceptions("Filename already exists");
        }

        //Try to open the file
        try {
            //Create the buffer
            StreamReader streamReader = new StreamReader( filename );

            //Create a random Int key that is not found
            int uniqueIntKey = OpenRFileStmt.nrFiles++;

            fileTbl.Add(uniqueIntKey, new FileTableData(filename, streamReader));
        }
        catch (Exception e) {
            throw new StatementsExceptions("Error in reading filename: " + filename + ". " + e.ToString());
        }

        return state;
    }


    public override String ToString()
    {
        return "openRFileStmt( " + var_file + ", " + filename + ") ";
    }
    }
}
