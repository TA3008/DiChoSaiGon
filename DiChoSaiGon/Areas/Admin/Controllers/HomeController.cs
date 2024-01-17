using Microsoft.AspNetCore.Mvc;

namespace DiChoSaiGon.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        [Route("/admin", Name ="admin")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
