import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.List;
import java.util.ArrayList;

public class App{

  public  static void main(String[] args){
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/index.vtl");
      model.put("persons", Person.all());
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/persons", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String email = request.queryParams("email");
      Person newPerson = new Person(name, email);
      newPerson.save();
      model.put("template", "templates/person-success.vtl");
      model.put("newPerson", newPerson);
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());



  }
}
