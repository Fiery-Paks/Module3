using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Module3.ModelClasses;

namespace Module3.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        private ModelEF db { get; set; }
        public LoginPage()
        {
            InitializeComponent();
            db = new ModelEF();
        }
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTextBox.Text;
            string password = PasswordBox.Password;

            // Здесь должна быть логика проверки введенных данных
            Accounts accounts = IsValidCredentials(login, password);
            if (accounts != null)
            {
                switch (accounts.RoleID)
                {
                    case 1:
                        this.NavigationService.Navigate(new AdminPage());
                        break;
                    case 2:
                        this.NavigationService.Navigate(new UserPage());
                        break;
                    default:
                        MessageBox.Show("Роль не найдена");
                        break;
                }
            }
        }

        private int GetDateInterval(DateTime lastautorizaation)
        {
            return Math.Abs((lastautorizaation - DateTime.Now).Days);
        }
        private void BlockAccount(Accounts account)
        {
            account.StatusID = 2;
            db.SaveChanges();
            MessageBox.Show("Вы заблокированы. Обратитесь к администратору");
        }
        private void AddTryBadLogin(Accounts account)
        {
            account.BadLoginTry += 1;
            if (account.BadLoginTry == 3)
            {
                BlockAccount(account);
            }
            MessageBox.Show("Вы ввели неверный пароль.\n" +
            "Пожалуйста проверьте ещё раз введенные данные\n" +
            $"Оставшиеся попытки входа {3 - account.BadLoginTry}");
        }
        private Accounts IsValidUser(string login, string password)
        {
            Accounts accounts = null;
            accounts = db.Accounts.First(x => x.Login == login && x.Password == password);

            if (accounts != null)
            {
                if (accounts.StatusID == 2)
                {
                    MessageBox.Show("Вы заблокированы. Обратитесь к администратору");
                    return null;
                }
                if (GetDateInterval(accounts.LastDateAuthorization) >= 30)
                {
                    BlockAccount(accounts);
                    return null;
                }
                return accounts;
            }

            accounts = db.Accounts.First(x => x.Login == login);

            if (accounts != null)
            {
                AddTryBadLogin(accounts);
            }

            MessageBox.Show("Вы ввели неверный логин или пароль. " +
            "Пожалуйста проверьте ещё раз введенные данные");

            return null;
        }
        private Accounts IsValidCredentials(string login, string password)
        {
            if (String.IsNullOrWhiteSpace(login) || String.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Заполните поля Логин и Пароль");
                return null;
            }
            Accounts account = IsValidUser(login, password);
            return account;
        }
    }
}
