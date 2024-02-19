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
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public static Employee currentUser = null;
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void btnLogIn_Click(object sender, RoutedEventArgs e)
        {
            if (tbLogin.Text != "" && psbPassword.Password != "")
            {
                if (AuthCheck(tbLogin.Text, psbPassword.Password))
                {
                    AuthEmployee.currentEmployee = currentUser;
                    Navigation.mainFrame.Navigate(new DeveloperPage());
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            }
            else
            {
                MessageBox.Show("Введите логин или пароль!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool AuthCheck(string login, string password)
        {
            bool isAuth = false;
            try
            {
                currentUser = GetDBContext.GetContext().Employee.FirstOrDefault(admin => admin.Login == login && admin.Password == password);
                if (currentUser != null)
                {
                    isAuth = true;
                }
                else
                {
                    isAuth = false;
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
            return isAuth;
        }
    }
}
