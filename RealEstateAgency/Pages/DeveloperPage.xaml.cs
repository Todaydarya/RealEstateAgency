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
    /// Логика взаимодействия для DeveloperPage.xaml
    /// </summary>
    public partial class DeveloperPage : Page
    {
        public DeveloperPage()
        {
            InitializeComponent();
            dgDeveloper.ItemsSource = GetDBContext.GetContext().Developer.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var DeveloperDelete = dgDeveloper.SelectedItems.Cast<Developer>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить этот элемент?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    GetDBContext.GetContext().Developer.RemoveRange(DeveloperDelete);
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dgDeveloper.ItemsSource = GetDBContext.GetContext().Developer.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка при удалении");
                }
            }
        }
    }
}
