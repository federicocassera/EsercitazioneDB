using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace BankomatSimulator
{
    class Program
    {
        static List<Utente> utenti = new List<Utente>();   
        static SortedList<int, Banca> banche= new SortedList<int, Banca>();
        static SqlConnection sqlConnection;

        /// <summary>
        /// Funzione di inizializzazione del Bankomat Simulator.
        /// </summary>
        private static void Inizializza()
        {
            //List<Banca> banche = new List<Banca>();
            //List<Utente> utenti = new List<Utente>();
            using (var ctx = new Bankomat2Entities1())
            {
                int key = 1;
                foreach (var b in ctx.Banche)
                {
                    
                    Banca banca = new Banca();
                    banca.Nome = b.Nome;
                    banche.Add(key, banca);
                    key++;

                    //foreach (var u in b.Utenti)
                    //{
                    //    Utente utente = new Utente();
                    //    utente.NomeUtente = u.NomeUtente;
                    //    utente.Password = u.Password;

                    //    var conto = u.ContiCorrente.First();
                    //    ContoCorrente contoCorrente = new ContoCorrente();
                    //    conto.Saldo = u.ContiCorrente.
                    //}
                }

                //foreach (var u in ctx.Utenti)
                //{
                //    Utente utente = new Utente();
                //    utente.NomeUtente = u.NomeUtente;
                //    utente.Password = u.Password;   
                //    utenti.Add(utente);
                //}
            }
            

        }
        static void Main(string[] args)
        {
            Inizializza();
            InterfacciaUtente interfacciaUtente = new InterfacciaUtente(banche);
            //var ctx = new Bankomat2Entities1();
            //Console.ReadLine();
            interfacciaUtente.Esegui();
        }
    }
}
