using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(yodaAirlines.WebUI.Startup))]
namespace yodaAirlines.WebUI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
