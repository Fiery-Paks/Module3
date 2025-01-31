﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using Module3.ModelClasses;
using Module3.HelperClasses;

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
            account = new Accounts();
            textBlockName.Text = "Добавление нового пользователя";
            LoadDataViewSourses();
            LoadAddStartData();
        }
        public AddUpdateAccountsPage(ModelEF _model, Accounts _account)
        {
            InitializeComponent();
            model = _model;
            type = TypePage.Update;
            account = _account;
            textBlockName.Text = $"Изменения пользователя пользователя c ID {account.ID}";
            LoadDataViewSourses();
        }
        private void LoadAddStartData()
        {
            badLoginTrySlider.Value = 0;
            newUserCheckBox.IsChecked = true;
            lastDateAuthorizationDatePicker.SelectedDate = DateTime.Now;
            lastDateAuthorizationDatePicker.Visibility = Visibility.Collapsed;
            rolesComboBox.SelectedIndex = 0;
            statusesComboBox.SelectedIndex = 0;
        }
        private void LoadDataViewSourses()
        {
            (Resources["statusesViewSource"] as CollectionViewSource).Source = model.Statuses.ToList();
            (Resources["rolesViewSource"] as CollectionViewSource).Source = model.Roles.ToList();
            (Resources["accountsViewSource"] as CollectionViewSource).Source = new List<Accounts>() { account };
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
        private bool InBoxesIsNotValidData()
        {
            if (String.IsNullOrWhiteSpace(account.Login)
            || String.IsNullOrWhiteSpace(account.Password)
            || String.IsNullOrWhiteSpace(account.FullName))
            {
                MessageBox.Show("Поля Логин, Пароль и ФИО должны быть обязательно заполнены");
                return true;
            }
            if (model.Accounts.Any(x => x.ID != account.ID && x.Login == account.Login))
            {
                MessageBox.Show("Данный Логин уже существует");
                return true;
            }

            return false;
        }
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var accountsViewSource = (CollectionViewSource)this.Resources["accountsViewSource"];
            account = (accountsViewSource.View.SourceCollection as List<Accounts>).First();

            if (InBoxesIsNotValidData())
                return;

            if (type == TypePage.Add)
                model.Accounts.Add(account);
            try
            {
                model.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            MessageBox.Show("Данные сохранены");
            if (type == TypePage.Add)
                this.NavigationService.GoBack();
        }
    }
}
