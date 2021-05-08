class ResVacuna {
  ResVacuna({
    this.nomTerritorio,
    this.cantidad,
    this.usoVacuna,
  });

  String nomTerritorio;
  String cantidad;
  String usoVacuna;

  factory ResVacuna.fromJson(Map<String, dynamic> json) => ResVacuna(
        nomTerritorio: json["nom_territorio"],
        cantidad: json["cantidad"],
        usoVacuna: json["usoVacuna"],
      );

  Map<String, dynamic> toJson() => {
        "nom_territorio": nomTerritorio,
        "cantidad": cantidad,
        "usoVacuna": usoVacuna,
      };
}
