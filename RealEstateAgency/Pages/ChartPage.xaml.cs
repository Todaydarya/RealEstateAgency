using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.DataVisualization.Charting;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RealEstateAgency.Pages
{
    /// <summary>
    /// Логика взаимодействия для ChartPage.xaml
    /// </summary>
    public partial class ChartPage : Page
    {
        private RealEstateAgencyEntities _context = new RealEstateAgencyEntities();
        public ChartPage()
        {
            InitializeComponent();
            TourChart.ChartAreas.Add(new ChartArea());

            var currentSeries = new Series()
            {
                IsValueShownAsLabel = true,
            };
            TourChart.Series.Add(currentSeries);

            cbChart.ItemsSource = Enum.GetValues(typeof(SeriesChartType));
        }

        private void cbChart_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbChart.SelectedItem is SeriesChartType currentType)
            {
                Series currentSeries = TourChart.Series.FirstOrDefault();
                currentSeries.ChartType = currentType;
                currentSeries.Points.Clear();

                var CountList = _context.Request.ToList();
                foreach (var Count in CountList)
                {
                    currentSeries.Points.AddXY(Count.Client.FirstName, Count.MaximumPrice);
                }
            }
        }
    }
}
