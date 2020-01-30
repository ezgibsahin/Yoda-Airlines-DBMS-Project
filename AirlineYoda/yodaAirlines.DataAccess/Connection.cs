using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yodaAirlines.DataAccess
{
    class Connection
    {
       public static readonly SqlConnection Con = new SqlConnection("server=DESKTOP-VTGNFDV\\SQLEXPRESS;database=YodaAirlines;Trusted_Connection=true;MultipleActiveResultSets=True");
    }

}
