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
    /// Логика взаимодействия для FloatPage.xaml
    /// </summary>
    public partial class FloatPage : Page
    {
        public FloatPage()
        {
            InitializeComponent();
            dgFloat.ItemsSource = GetDBContext.GetContext().Flat.ToList();
            DataContext = GetDBContext.GetContext().Flat.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedFlat = dgFloat.SelectedItem as Flat;
            Navigation.mainFrame.Navigate(new AddFlatPage(selectedFlat));
        }

        private void btnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var FlatDelete = dgFloat.SelectedItems.Cast<Flat>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить этот элемент?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    GetDBContext.GetContext().Flat.RemoveRange(FlatDelete);
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dgFloat.ItemsSource = GetDBContext.GetContext().Flat.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка при удалении");
                }
            }
        }

        private void btnAddNewDev_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new AddFlatPage(null));
        }
    }
}
