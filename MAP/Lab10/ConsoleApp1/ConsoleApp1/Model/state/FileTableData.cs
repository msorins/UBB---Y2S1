using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ToyInterpreter.Model.state
{
    class FileTableData
    {
        public String filename;
        public StreamReader streamReader;

        public FileTableData(String filename, StreamReader streamReader)
        {
            this.filename = filename;
            this.streamReader = streamReader;
        }

        public FileTableData()
        {
        }
    }
}
