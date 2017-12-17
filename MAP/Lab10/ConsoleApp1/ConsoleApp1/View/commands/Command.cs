using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.View.commands
{
    abstract class Command
    {
        protected Controller.Controller controller;
        protected String key, description;

        public Command(String key, String description, Controller.Controller controller)
        {
            this.key = key;
            this.description = description;
            this.Controller = controller;
        }

        public abstract void execute();

        protected Controller.Controller Controller { get => controller; set => controller = value; }

        public String getKey() { return key; }
        public String getDescription() { return description; }
    }
}
