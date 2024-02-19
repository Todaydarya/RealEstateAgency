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
using RealEstateAgency.Pages;

namespace RealEstateAgency
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            mainFrame.Navigate(new AuthorizationPage());
            Classes.Navigation.mainFrame = mainFrame;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void mainFrame_ContentRendered(object sender, EventArgs e)
        {
            
            if (AuthEmployee.currentEmployee != null)
            {
             
                spMenuList.Visibility = Visibility.Visible;
                DataContext = AuthEmployee.currentEmployee;
            }
            else
            {
                
                spMenuList.Visibility = Visibility.Collapsed;
            }
        }

        private void btnGoToChart_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new ChartPage());
        }

        private void btnClient_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new ClientPage());
        }

        private void btnRequest_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new RequestPage());
        }

        private void btnFloat_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new FloatPage());
        }

        private void btnSkyscrapes_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new SkyscraperPage());
        }

        private void btnDeveloper_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new DeveloperPage());
        }

        private void btnHelpFindFloat_Click(object sender, RoutedEventArgs e)
        {
            Navigation.mainFrame.Navigate(new FloatListPage());
        }

        private void btnChangeAccount_Click(object sender, RoutedEventArgs e)
        {
            AuthEmployee.currentEmployee = null;
            Navigation.mainFrame.Navigate(new AuthorizationPage());
        }
    }
}
