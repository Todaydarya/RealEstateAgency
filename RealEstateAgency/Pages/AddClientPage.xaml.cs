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
    /// Логика взаимодействия для AddClientPage.xaml
    /// </summary>
    public partial class AddClientPage : Page
    {
        Client clientAdd = null;
        public AddClientPage(Client client)
        {
            InitializeComponent();
            clientAdd = client;
            if (client != null)
            {

                DataContext = client;
            }
            else
            {
                DataContext = null;
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(tbName.Text) || string.IsNullOrEmpty(tbLastName.Text) || string.IsNullOrEmpty(tbMiddleName.Text) || string.IsNullOrEmpty(tbPhone.Text))
            {
                MessageBox.Show("Введите все данные!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Client client = new Client();
                client.FirstName = tbName.Text;
                client.LastName = tbLastName.Text;
                client.Patronymic = tbMiddleName.Text;
                client.Phone = tbPhone.Text;
                if (clientAdd == null)
                {
                    GetDBContext.GetContext().Client.Add(client);
                }
                else
                {
                    GetDBContext.GetContext().Entry(clientAdd).State = System.Data.Entity.EntityState.Modified;
                }
                try
                {
                    GetDBContext.GetContext().SaveChanges();
                    MessageBox.Show("Пользователь добавлен!", "Информация");
                    tbName.Text = "";
                    tbLastName.Text = "";
                    tbMiddleName.Text = "";
                    tbPhone.Text = "";
                    Navigation.mainFrame.Navigate(new ClientPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
