
using System;
using System.Collections.Generic;
using System.Linq;
using Sanjel.Jdt.Domain;
using Sanjel.Jdt.PDFGeneration;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting
{
    public class CommonDataReportDataSource : ReportDataSource
    {
        private readonly CommonJobData _commonData;
        private readonly Job _currentJob;

        public CommonDataReportDataSource(JobDesign jobDesign, string key = ModelKey.CommonData)
            : base(key)
        {
            _currentJob = jobDesign.CurrentJob;
            _commonData = jobDesign.CommonData;
        }

        public string HighProfileWell
        {
            get
            {
                return (_commonData.HighProfileWell == SolutionItems.SolutionEnums.NoYes.Yes) ? "HIGH PROFILE" : string.Empty;
            }
        }

        public string CustomerName
        {
            get
            {
                if (_commonData.Customer != null && (!string.IsNullOrWhiteSpace(_commonData.Customer.Name)))
                {
                    return _commonData.Customer.Name.ToUpper();
                }
                return string.Empty;
            }
        }

        public AddressInfo CustomerAddressInfo
        {
            get
            {
                var customer = _commonData.Customer;
                if (customer == null)
                {
                    return null;
                }
                if (customer.BillingAddress != null)
                {
                    var fields = customer.BillingAddress.FullAddressArray;
                    if (fields.Length > 0)
                    {
                        return customer.BillingAddress;
                    }
                }
                else if (customer.StreetAddress != null)
                {
                    var fields = customer.StreetAddress.FullAddressArray;
                    if (fields.Length > 0)
                    {
                        return customer.StreetAddress;
                    }
                }
                return null;
            }
        }

        public string[] FullCustomerAddressArray
        {
            get
            {
                var address = CustomerAddressInfo;
                if (address != null)
                {
                    return address.FullAddressArray;
                }
                return null;
            }
        }

        public string CustomerAddressLine1
        {
            get { return FullCustomerAddressArray.Length > 0 ? FullCustomerAddressArray[0] : string.Empty; }
        }

        public string CustomerAddressLine2
        {
            get { return FullCustomerAddressArray.Length > 1 ? FullCustomerAddressArray[1] : string.Empty; }
        }

        public string CustomerAddressLine3
        {
            get { return FullCustomerAddressArray.Length > 2 ? FullCustomerAddressArray[2] : string.Empty; }
        }

        public string CustomerAddressLine4
        {
            get { return FullCustomerAddressArray.Length > 3 ? FullCustomerAddressArray[3] : string.Empty; }
        }

        public string CustomerContactName
        {
            get
            {
                var contact = _commonData.CustomerContact;
                if (contact != null)
                {
                    if (!string.IsNullOrWhiteSpace(contact.FullName))
                    {
                        return string.Format("Attn: {0}", contact.FullName);
                    }
                }
                return "Attn:";
            }
        }

        public string CustomerContactPhone
        {
            get
            {
                var contact = _commonData.CustomerContact;
                if (contact != null)
                {
                    var phone = (from element in contact.CustomerContactInfos
                        where element.ContactType == SolutionItems.SolutionEnums.CustomerContactInfoType.Phone
                        select element).FirstOrDefault();
                    if (phone != null)
                    {
                        return string.Format("P: {0}", ConvertPhone(phone.NumberOrAddress));
                    }
                }
                return "P:";
            }
        }

        private string ConvertPhone(string phoneNumber)
        {
            var stripped = phoneNumber.Replace('-', '.').Replace(' ', ',');
            return stripped;
        }

        private string ConvertPhone(string phoneNumber, string extension)
        {
            if (string.IsNullOrWhiteSpace(extension)) { return ConvertPhone(phoneNumber); }
            return ConvertPhone(phoneNumber) + " x" + extension;
        }

        public string CustomerContactEmail
        {
            get
            {
                var contact = _commonData.CustomerContact;
                if (contact != null)
                {
                    var email = (from element in contact.CustomerContactInfos
                        where element.ContactType == SolutionItems.SolutionEnums.CustomerContactInfoType.Email
                        select element).FirstOrDefault();
                    if (email != null)
                    {
                        return string.Format("E: {0}", email.NumberOrAddress);
                    }
                }
                return "E:";
            }
        }

        public string QuotationId
        {
            get { return _currentJob.SalesQuote.QuotationId; }
        }

        public string ProposalDate
        {
            get { return DateTime.Now.ToString("MMMM dd, yyyy"); }
        }

        public string RevisionName
        {
            get { return _commonData.RevisionName; }
        }

        public string SurfaceLocation
        {
            get { return _commonData.SurfaceWellLSD; }
        }

        public string DownHoleLocation
        {
            get
            {
                return (!string.IsNullOrEmpty(_commonData.DownHoleWellLSD)) ? string.Format("Downhole: {0}", _commonData.DownHoleWellLSD) : string.Empty;
            }
        }

        public string WellNameAndLoc
        {
            get { return string.Format("{0} {1}", _commonData.WellName, SurfaceLocation); }
        }

        public string JobTypeName
        {
            get
            {
                return (_currentJob.CurrentJobType != null && (!string.IsNullOrWhiteSpace(_currentJob.CurrentJobType.Name)))
                    ? _currentJob.CurrentJobType.Name : string.Empty;
            }
        }

        public string JobDescription
        {
            get { return _currentJob.JobDescription; }
        }

        public string SaleTitle
        {
            get { return "CLIENT SOLUTIONS REPRESENTATIVE"; }
        }

        public string EmployeeSalesPersonName
        {
            get
            {
                return (_commonData.EmployeeSalesPerson == null || (string.IsNullOrWhiteSpace(_commonData.EmployeeSalesPerson.Name))) ?
                    string.Empty : _commonData.EmployeeSalesPerson.Name;
            }
        }

        public string EmployeeSalesPersonPhone
        {
            get
            {
                return (_commonData.EmployeeSalesPerson == null) ? string.Empty
                    : string.Format("P: {0} / C: {1}", ConvertPhone(_commonData.EmployeeSalesPerson.Phone,
                            _commonData.EmployeeSalesPerson.PhoneExtension), ConvertPhone(_commonData.EmployeeSalesPerson.Cell));
            }
        }

        public string EmployeeSalesPersonEmail
        {
            get
            {
                return (_commonData.EmployeeSalesPerson == null) ? string.Empty : string.Format("E: {0}", _commonData.EmployeeSalesPerson.Email);
            }
        }

        public string TechTitle
        {
            get { return "TECHNICAL SPECIALIST"; }
        }

        public string EmployeeEngineerName
        {
            get
            {
                return (_commonData.EmployeeEngineer == null || string.IsNullOrWhiteSpace(_commonData.EmployeeEngineer.Name)) ?
                    string.Empty : _commonData.EmployeeEngineer.Name;
            }
        }

        public string SanjelTsPhone
        {
            get
            {
                string phone = _commonData.EmployeeEngineer != null
                    ? ConvertPhone(_commonData.EmployeeEngineer.Phone, _commonData.EmployeeEngineer.PhoneExtension)
                    : string.Empty;
                string cell = _commonData.EmployeeEngineer != null
                    ? ConvertPhone(_commonData.EmployeeEngineer.Cell)
                    : string.Empty;
                return string.Format("P: {0} / C: {1}", phone, cell);
            }
        }

        public string SanjelTsEmail
        {
            get
            {
                string email = _commonData.EmployeeEngineer != null ? _commonData.EmployeeEngineer.Email : string.Empty;
                return string.Format("E: {0}", email);
            }
        }

        public string ServicePointTitle
        {
            get { return "PRIMARY SERVICE LOCATION"; }
        }

        public string ServicePoint
        {
            get
            {
                return _commonData.ServicePoint != null ? _commonData.ServicePoint.ToString() : string.Empty;
            }
        }
    }
}
