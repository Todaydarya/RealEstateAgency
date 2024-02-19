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
    /// Логика взаимодействия для RequestPage.xaml
    /// </summary>
    public partial class RequestPage : Page
    {
        public RequestPage()
        {
            InitializeComponent();
            dgRequest.ItemsSource = GetDBContext.GetContext().Request.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedRequest = dgRequest.SelectedItem as Request;
            Navigation.mainFrame.Navigate(new AddRequestPage(selectedRequest));
        }

        private void btnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var ReqDelete = dgRequest.SelectedItems.Cast<Request>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить этот элемент?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    GetDBContext.GetContext().Request.RemoveRange(ReqDelete);
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dgRequest.ItemsSource = GetDBContext.GetContext().Request.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка при удалении");
                }
            }
        }

        private void btnAddNewDev_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new AddRequestPage(null));
        }
    }
}
