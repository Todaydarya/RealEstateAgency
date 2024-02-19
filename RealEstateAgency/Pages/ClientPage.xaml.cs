using RealEstateAgency.Classes;
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

namespace RealEstateAgency.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        public ClientPage()
        {
            InitializeComponent();
            dgClient.ItemsSource = GetDBContext.GetContext().Client.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedClient = dgClient.SelectedItem as Client;
            Navigation.mainFrame.Navigate(new AddClientPage(selectedClient));
        }

        private void btnAddNewClient_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new AddClientPage(null));
        }

        private void btnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var UserDelete = dgClient.SelectedItems.Cast<Client>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить этот элемент?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    GetDBContext.GetContext().Client.RemoveRange(UserDelete);
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dgClient.ItemsSource = GetDBContext.GetContext().Client.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка при удалении");
                }
            }
        }
    }
}
