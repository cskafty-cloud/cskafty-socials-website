using System.Diagnostics;

const string site = "https://cskafty-cloud.github.io/cskafty-socials-website/";
try
{
    Process.Start(new ProcessStartInfo(site) { UseShellExecute = true });
}
catch (Exception ex)
{
    Console.Error.WriteLine("Could not open CSKAFTY website: " + ex.Message);
    Console.WriteLine("Press any key to close.");
    Console.ReadKey();
}
