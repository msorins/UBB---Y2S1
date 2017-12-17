using System;
using System.Runtime.Serialization;

namespace ToyInterpreter.Model.statements
{
    [Serializable]
    internal class StatementsExceptions : Exception
    {
        public StatementsExceptions()
        {
        }

        public StatementsExceptions(string message) : base(message)
        {
        }

        public StatementsExceptions(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected StatementsExceptions(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}