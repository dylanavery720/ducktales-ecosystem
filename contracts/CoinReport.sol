pragma solidity ^0.4.8;

contract CoinReport {

  CoinReport[] public reports;

  struct CoinReport {
    bytes32 usdreport;
    bytes32 btcreport;
    uint date;
  }

  function saveReport(bytes32 _usdreport, bytes32 _btcreport, uint _date) returns (bool success) {

    CoinReport memory newReport;
    newReport.usdreport = _usdreport;
    newReport.btcreport = _btcreport;
    newReport.date = _date;

    reports.push(newReport);
    return true;
  }

  function getReports() constant returns (bytes32[], bytes32[], uint[]) {
    
    uint length = reports.length;
    bytes32[] memory usdreport= new bytes32[](length);
    bytes32[] memory btcreport= new bytes32[](length);
    uint[] memory date = new uint[](length);
    
    for (uint i = 0; i < reports.length; i++) {
      CoinReport memory currentReport;
      currentReport = reports[i];
      usdreport[i] = currentReport.usdreport;
      btcreport[i] = currentReport.btcreport;
      date[i] = currentReport.date;
    }
       return (usdreport, btcreport, date);
  }
}