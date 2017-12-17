using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.View.commands;

namespace ToyInterpreter.View.menu
{
    class TextMenu
    {
        private Dictionary<String, Command> commands;

        public TextMenu()
        {
            this.commands = new Dictionary<String, Command>();
        }

        public void addCommand(Command c)
        {
            commands.Add(c.getKey(), c);
        }

        private void printMenu()
        {
            foreach (Command com in this.commands.Values) {
                if (com == null)
                {
                    Console.WriteLine("Invalid Option");
                    continue;
                }

                Console.WriteLine(com.getKey() + ". " + com.getDescription());
            }
        }

        public void show()
        {
            while (true) {
                //OUTPUT
                printMenu();
                Console.WriteLine("\n\nInput the option: ");

                //INPUT
                String key = Console.ReadLine();
                Command com = commands[key];

                if (com == null) {
                    Console.WriteLine("Invalid Option");
                    continue;
                }

                com.execute();
            }
        }
    }
}
