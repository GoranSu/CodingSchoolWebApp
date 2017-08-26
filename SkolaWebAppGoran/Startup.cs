using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SkolaWebAppGoran.Startup))]
namespace SkolaWebAppGoran
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
