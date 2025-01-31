using System;
using System.Windows;
using System.Windows.Controls;
using Module3.ModelClasses;

namespace Module3.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UpdatePasswordPage : Page
    {
        private Accounts account { get; set; }
        private ModelEF model { get; set; }
        public UpdatePasswordPage(ModelEF _model, Accounts _account)
        {
            InitializeComponent();
            account = _account;
            model = _model;
        }
        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            string psbox1text = PasswordBox1.Password;
            string psbox2text = PasswordBox2.Password;

            if (IsValidData(psbox1text, psbox2text))
            {
                account.Password = psbox1text;
                account.NewUser = false;
                try
                {
                    model.SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                MessageBox.Show("Пароль успешно изменён");
                this.NavigationService.Navigate(new UserPage());
            }
        }
        private bool IsValidData(string password1, string password2)
        {
            if (String.IsNullOrWhiteSpace(password1) && String.IsNullOrWhiteSpace(password2))
            {
                MessageBox.Show("Заполните поля все поля");
                return false;
            }
            if (password1 == password2 && account.Password != password1)
                return true;
            MessageBox.Show("Пароли должны быть одинаковыми и не совпадать с предыдущим паролем");
            return false;
        }
    }
}
