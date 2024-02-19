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
    /// Логика взаимодействия для SkyscraperPage.xaml
    /// </summary>
    public partial class SkyscraperPage : Page
    {
        public SkyscraperPage()
        {
            InitializeComponent();
            dgSkyscraper.ItemsSource = GetDBContext.GetContext().Skyscraper.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var SkyScrDelete = dgSkyscraper.SelectedItems.Cast<Skyscraper>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить этот элемент?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    GetDBContext.GetContext().Skyscraper.RemoveRange(SkyScrDelete);
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dgSkyscraper.ItemsSource = GetDBContext.GetContext().Client.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка при удалении");
                }
            }
        }
    }
}
