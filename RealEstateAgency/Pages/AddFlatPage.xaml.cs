using RealEstateAgency.Classes;
using System;
using System.Collections.Generic;
using System.Drawing;
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
    /// Логика взаимодействия для AddFlatPage.xaml
    /// </summary>
    public partial class AddFlatPage : Page
    {
        Flat flatAdd = null;
        public AddFlatPage(Flat flat)
        {
            InitializeComponent();
            flatAdd = flat;
            if (flat != null)
            {
                DataContext = flat;
            }
            else
            {
                DataContext = null;
            }
            cbDistrict.ItemsSource = GetDBContext.GetContext().District.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(tbCost.Text) || string.IsNullOrEmpty(tbArea.Text) || string.IsNullOrEmpty(tbNumberOfRooms.Text) || string.IsNullOrEmpty(tbFloorNumber.Text) || string.IsNullOrEmpty(tbEntanceNumber.Text) || string.IsNullOrEmpty(cbDistrict.Text))
            {
                MessageBox.Show("Введите все данные!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                var selectedDistrict = GetDBContext.GetContext().Skyscraper.FirstOrDefault(p => p.District.Name == cbDistrict.Text);
                Flat flat = new Flat();

                flat.IdFlat = flat.IdFlat + 1;
                flat.Price = int.Parse(tbCost.Text);
                flat.Area = int.Parse(tbArea.Text);
                flat.NumberOfRooms = int.Parse(tbNumberOfRooms.Text);
                flat.FloorNumber = int.Parse(tbFloorNumber.Text);
                flat.EntanceNumber = int.Parse(tbEntanceNumber.Text);

                flat.Skyscraper = selectedDistrict;
                flat.Skyscraper.District.Name = selectedDistrict.Name;
                flat.ImagePreview = null;


                if (flatAdd == null)
                {
                    GetDBContext.GetContext().Flat.Add(flat);
                }
                else
                {
                    GetDBContext.GetContext().Entry(flatAdd).State = System.Data.Entity.EntityState.Modified;
                }
                try
                {
                    GetDBContext.GetContext().SaveChanges();
                    tbCost.Text = "";
                    tbArea.Text = "";
                    tbNumberOfRooms.Text = "";
                    tbFloorNumber.Text = "";
                    tbEntanceNumber.Text = "";
                    cbDistrict.Text = "";
                    Navigation.mainFrame.Navigate(new FloatPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
