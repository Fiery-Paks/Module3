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
using Module3.HelperClasses;
using System.Runtime.InteropServices;

namespace Module3.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddUpdateAccountsPage.xaml
    /// </summary>
    public partial class AddUpdateAccountsPage : Page
    {
        private ModelEF model { get; set; }
        private TypePage type { get; set; }
        private Accounts account { get; set; }
        public AddUpdateAccountsPage(ModelEF _model)
        {
            InitializeComponent();
            model = _model;
            type = TypePage.Add;
            textBlockName.Text = "Добавление нового пользователя";
            account = new Accounts();
        }
        public AddUpdateAccountsPage(ModelEF _model, Accounts _account)
        {
            InitializeComponent();
            model = _model;
            type = TypePage.Update;
            textBlockName.Text = "Изменения пользователя пользователя";
            account = _account;

        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
