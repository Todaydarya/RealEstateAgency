using RealEstateAgency.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Xml.Linq;

namespace RealEstateAgency.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddRequestPage.xaml
    /// </summary>
    public partial class AddRequestPage : Page
    {
        Request requestAdd = null;
        public AddRequestPage(Request request)
        {
            InitializeComponent();
            requestAdd = request;
            if (request != null)
            {
                DataContext = request;
            }
            else
            {
                DataContext = null;
            }
            cbClient.ItemsSource = GetDBContext.GetContext().Client.ToList();
            cbRegion.ItemsSource = GetDBContext.GetContext().District.ToList();
            cbStatus.ItemsSource = GetDBContext.GetContext().RequestStatus.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(cbClient.Text) || string.IsNullOrEmpty(tbMinCost.Text) || string.IsNullOrEmpty(tbMaxCost.Text) || string.IsNullOrEmpty(tbCount.Text) || string.IsNullOrEmpty(tbMinArea.Text) || string.IsNullOrEmpty(tbMaxArea.Text) || string.IsNullOrEmpty(dpDate.Text) || string.IsNullOrEmpty(cbRegion.Text) || string.IsNullOrEmpty(cbStatus.Text))
            {
                MessageBox.Show("Введите все данные!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                DateTime? selectedDate = dpDate.SelectedDate;
                var selectedClient = GetDBContext.GetContext().Client.FirstOrDefault(p => p.FirstName == cbClient.Text);
                var selectedRegion = GetDBContext.GetContext().District.FirstOrDefault(p => p.Name == cbRegion.Text);
                Request request = new Request();

                if (selectedClient != null)
                {
                    request.Client = selectedClient;
                    request.Client.FirstName = selectedClient.FirstName;
                }

                request.MinimumPrice = decimal.Parse(tbMinCost.Text);
                request.MaximumPrice = decimal.Parse(tbMaxCost.Text);
                request.NumberOfRooms = int.Parse(tbCount.Text);
                request.MinimumArea = int.Parse(tbMinArea.Text);
                request.MaximumArea = int.Parse(tbMaxArea.Text);
                request.RequestDate = selectedDate.GetValueOrDefault();

                request.District = selectedRegion;
                request.District.Name = selectedRegion.Name;
                request.RequestStatus = (RealEstateAgency.RequestStatus)cbStatus.SelectedItem;
                request.IdEmployee = Classes.AuthEmployee.currentEmployee.IdEmployee;


                if (requestAdd == null)
                {
                    GetDBContext.GetContext().Request.Add(request);
                }
                else
                {
                    GetDBContext.GetContext().Entry(requestAdd).State = System.Data.Entity.EntityState.Modified;
                }
                try
                {
                    GetDBContext.GetContext().SaveChanges();
                    tbMinCost.Text = "";
                    tbMaxCost.Text = "";
                    tbCount.Text = "";
                    tbMinArea.Text = "";
                    tbMaxArea.Text = "";
                    dpDate.Text = "";
                    cbRegion.Text = "";
                    cbStatus.Text = "";
                    Navigation.mainFrame.Navigate(new RequestPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
