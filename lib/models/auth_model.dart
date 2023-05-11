class AuthModel {
   String? token;
   String? userId;
   String? userName;
   String? userEmail;
   String? userPassword;

  AuthModel(
      { this.token,
       this.userId,
       this.userName,
       this.userEmail,
       this.userPassword});
}
