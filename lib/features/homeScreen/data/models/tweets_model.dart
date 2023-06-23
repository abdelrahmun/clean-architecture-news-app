import 'package:equatable/equatable.dart';
class TweetsModel extends Equatable{

  final int id;
  final String userName;
  final String arTweetBody;
  final String enTweetBody;
  final String accountName;
  final String accountLogo;

  const TweetsModel( {required this.enTweetBody,required this.id,required this.accountLogo,required this.accountName,required this.arTweetBody,required this.userName});


  @override
  // TODO: implement props
  List<Object?> get props => [id,userName,arTweetBody,accountName,accountLogo,enTweetBody];

}