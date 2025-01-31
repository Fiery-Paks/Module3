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
using Module3.HelperClasses;
using Module3.ModelClasses;

namespace Module3.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        private ModelEF model { get; set; }
        public AdminPage(ModelEF _model)
        {
            InitializeComponent();
            model = _model;

        }
        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddUpdateAccountsPage(model, TypePage.Add));
        }
        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
