import 'package:flutter/material.dart';

class ViewStudentBill extends StatefulWidget {
  @override
  _ViewStudentBillState createState() => _ViewStudentBillState();
}

class _ViewStudentBillState extends State<ViewStudentBill> {
  bool _loading = false;
  String? selectedMess, selectedProgramme, selectedStatus, selectedBatch;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  List<Map<String, String>> messDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];
  List<Map<String, String>> batchDropDownItems = [
    {"text": "2021", "value": "2021"},
    {"text": "2022", "value": "2022"},
    {"text": "2023", "value": "2023"},
    {"text": "2024", "value": "2024"},
    {"text": "2025", "value": "2025"},
  ];
  List<Map<String, String>> programmeDropDownItems = [
    {"text": "B.Tech", "value": "btech"},
    {"text": "M.Tech", "value": "mtech"},
    {"text": "PHD", "value": "phd"},
    {"text": "B.Des", "value": "bdes"},
  ];
  List<Map<String, String>> statusDropDownItems = [
    {"text": "Registered", "value": "registered"},
    {"text": "Deregistered", "value": "deregistered"},
  ];
  List<Map<String, String>> tableData = [
    {
      'Name': 'Chandrashekhar',
      'Roll No': '21bcs064',
      'Program': 'B.Tech',
      'Balance': '0',
      'Mess': 'mess2',
      'View bills': '',
      'View payments': '',
    },
    {
      'Name': 'Adil',
      'Roll No': '21bcs133',
      'Program': 'B.Tech',
      'Balance': '0',
      'Mess': 'mess2',
      'View bills': '',
      'View payments': '',
    },
  ];
  List<Map<String, String>> billData = [
    {
      'Month': 'March',
      'Year': '2024',
      'Amount': '3150',
      'Rebate Count': '0',
      'Rebate Amount': '0',
      'Total Amount': '3150',
    },
  ];
  List<Map<String, String>> paymentData = [
    {
      'Month': 'March',
      'Year': '2024',
      'Amount Paid': '12000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select status',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select status" : null,
                      dropdownColor: Colors.white,
                      value: selectedProgramme,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProgramme = newValue!;
                        });
                      },
                      items: statusDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a programme',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a programme" : null,
                      dropdownColor: Colors.white,
                      value: selectedBatch,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBatch = newValue!;
                        });
                      },
                      items: programmeDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Mess',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a mess" : null,
                      dropdownColor: Colors.white,
                      value: selectedMess,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMess = newValue!;
                        });
                      },
                      items: messDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            setState(() {
                              _loading = true;
                            });
                          }
                        },
                        child: Text("Filter"))
                  ],
                ),
              ),
            ),
          ),
          _loading
              ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12,
                horizontalMargin: 8,
                columns: buildTableHeader(tableData),
                rows: buildTableRows(tableData),
              ),
            ),
          )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
  List<DataColumn> buildTableHeader(List<Map<String, String>> tableData) {
    return tableData.first.keys.map((key) {
      return DataColumn(
        label: Text(
          key,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> buildTableRows(List<Map<String, String>> tableData) {
    return tableData.map((data) {
      return DataRow(
        cells: data.keys.map((key) {
          if (key.toLowerCase() == 'view bills') {
            return DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // _showDialog('View Bills', data); // use this data to fetch information
                      _showDialog('View Bills', billData); // use this data to fetch information
                    },
                    child: Text('View bills'),
                  ),
                ],
              ),
            );
          } else if (key.toLowerCase() == "view payments") {
            return DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showDialog('View Payments', paymentData); // use data to fetch information
                      // _showDialog('View Payments', data); // use data to fetch information
                    },
                    child: Text('View Payments'),
                  ),
                ],
              ),
            );
          } else {
            return DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(data[key]!),
              ),
            );
          }
        }).toList(),
      );
    }).toList();
  }
  void _showDialog(String title, List<Map<String, String>> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      columnSpacing: 12,
                      horizontalMargin: 8,
                      columns: title == "View Payments" ? buildTableHeader(paymentData) : buildTableHeader(billData),
                      rows: title == "View Payments" ? buildDialogTableRow(paymentData) : buildDialogTableRow(billData),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  List<DataRow> buildDialogTableRow(List<Map<String, String>> dataList) {
    return dataList.map((data) {
      return DataRow(
        cells: data.keys.map((key) {
          return DataCell(
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(data[key]!),
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}
