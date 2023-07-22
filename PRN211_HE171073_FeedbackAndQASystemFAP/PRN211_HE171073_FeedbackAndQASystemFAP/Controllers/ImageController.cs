using Microsoft.AspNetCore.Mvc;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class ImageController : Controller
    {
        private const string ImagePath = "/img"; // Path to the images folder

        public IActionResult Index(int pageNumber = 1)
        {
            // Get all image filenames from the wwwroot/img folder
            var imageFiles = Directory.GetFiles($"{Directory.GetCurrentDirectory()}/wwwroot{ImagePath}")
                                     .Select(Path.GetFileName)
                                     .OrderBy(x => x)
                                     .ToList();

            int pageSize = 1; // Number of images per page

            // Calculate the total number of pages
            int totalPages = (int)Math.Ceiling((double)imageFiles.Count / pageSize);

            // Handle cases where pageNumber is greater than the total number of pages
            if (pageNumber > totalPages)
            {
                pageNumber = 1; // Reset to the first page
            }
            if (pageNumber == 0 )
            {
                pageNumber = totalPages; // Reset to the end page
            }

            // Validate the page number
            pageNumber = Math.Max(1, Math.Min(pageNumber, totalPages));

            // Get the filename of the image to be displayed on the current page
            string currentImage = imageFiles.Skip((pageNumber - 1) * pageSize).FirstOrDefault();

            // Pass the necessary data to the view
            ViewBag.CurrentImage = $"{ImagePath}/{currentImage}";
            ViewBag.PageNumber = pageNumber;
            ViewBag.TotalPages = totalPages;

            return View();
        }
    }
}