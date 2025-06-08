
class AppUser {
  final String uid;
  final String name;
  final String email;
  final String role;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
  });
}

class UserRoles {
  static const petOwner = "petOwner";
  static const veterinarian = "Veterinarian";
}
