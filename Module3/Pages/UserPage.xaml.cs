using System.Windows;
using System.Windows.Controls;

namespace Module3.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
        }
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new LoginPage());
        }
    }
}
