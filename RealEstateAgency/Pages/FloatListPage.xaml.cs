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
    /// Логика взаимодействия для FloatListPage.xaml
    /// </summary>
    public partial class FloatListPage : Page
    {
        public FloatListPage()
        {
            InitializeComponent();
            lvRooms.ItemsSource = GetDBContext.GetContext().Flat.ToList();
            DataContext = GetDBContext.GetContext().Flat.ToList();
        }
    }
}
