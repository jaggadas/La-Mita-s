class GetLinks{
  getGoogleFormLink(String name,String email,String site, String date, String type, String month, String year,String mode,String amount,String remarks){
      var url='https://docs.google.com/forms/d/e/1FAIpQLScivJGAW1qHmfExYXX6kS02z0M-Z4kjGGQEjmB7PzN7t6yASw/viewform? embedded=true&usp=pp_url&entry.1954222588=$name&entry.272357216=$email&entry.801505793=$site&entry.805476922=$date&entry.696912350=$type&entry.2032859835=$month&entry.1124685331=$year&entry.646244278=$mode&entry.754880737=$amount&entry.1314161380=$remarks';
      var url1='https://docs.google.com/forms/d/e/1FAIpQLScivJGAW1qHmfExYXX6kS02z0M-Z4kjGGQEjmB7PzN7t6yASw/viewform? embedded=true&usp=pp_url&entry.1954222588=jay&entry.272357216=jay@jay.com&entry.801505793=BKC&entry.805476922=2022-04-27&entry.696912350=RENT&entry.2032859835=FEBRUARY&entry.1124685331=2023&entry.646244278=GPAY&entry.754880737=AMOUNT&entry.1314161380=REMARKS';

      print(url);
      return url;
  }
}