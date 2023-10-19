using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BankomatSimulator.ContoCorrente;

namespace BankomatSimulator
{

    class Banca
    {
        public enum Funzionalita
        {
            Versamento,
            Prelievo,
            ReportSaldo,
            Sblocco,
            Uscita
        }


        public enum EsitoLogin
        {
            AccessoConsentito,
            UtentePasswordErrati,
            PasswordErrata,
            AccountBloccato
        }


        private string _nome;
        private List<Utente> _utenti;
        private SortedList<int, Funzionalita> _funzionalita;


        private Utente _utenteCorrente;

        public string Nome { get => _nome; set => _nome = value; }

        public List<Utente> Utenti { get => _utenti; set => _utenti = value; }
        public Utente UtenteCorrente { get => _utenteCorrente; set => _utenteCorrente = value; }
        internal SortedList<int, Funzionalita> ElencoFunzionalita { get => _funzionalita; set => _funzionalita = value; }

        /// <summary>
        /// Verifica che sia presente un utente con NomeUtente uguale a quello indicato
        /// e, nel caso, verifica la password.
        /// </summary>
        /// <param name="credenziali">Dati inseriti dall'utente </param>
        /// <returns></returns>
        public EsitoLogin Login(Utente credenziali, out Utente utente)
        {
            Bankomat2Entities1 ctx = new Bankomat2Entities1();
            Utente utenteDaValidare = new Utente();
            //ricerco utente sul 
            utente = null;

            foreach (var elem in ctx.Utenti)
            {
                if (elem.NomeUtente == credenziali.NomeUtente)
                {
                    Utente u = new Utente();
                    u.NomeUtente = elem.NomeUtente;
                    u.Password = elem.Password;
                    utenteDaValidare = u;
                    break;
                }
            }
            if (utenteDaValidare == null)
            {
                return EsitoLogin.UtentePasswordErrati;
            }


            if (credenziali.Password != utenteDaValidare.Password)
            {
                utente = utenteDaValidare;
                utenteDaValidare.TentativiDiAccessoErrati++;
                if (utenteDaValidare.Bloccato)
                {
                    return EsitoLogin.AccountBloccato;
                }
                return EsitoLogin.PasswordErrata;
            }
            else
            {
                Utente u = new Utente();
                u.NomeUtente = utenteDaValidare.NomeUtente;
                u.Password = utenteDaValidare.Password;
                u.contoCorrente = utenteDaValidare.contoCorrente;
                u.TentativiDiAccessoErrati = utenteDaValidare.TentativiDiAccessoErrati;
                utente = u;

                if (utenteDaValidare.Bloccato)
                {
                    return EsitoLogin.AccountBloccato;
                }
                utenteDaValidare.TentativiDiAccessoErrati = 0;
                return EsitoLogin.AccessoConsentito;
            }
        }



    }
}
