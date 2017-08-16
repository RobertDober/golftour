package controllers

import javax.inject._
import play.api._
import play.api.mvc._

@Singleton
class HelloController extends Controller {

  def hello(tag: String) = Action { Ok(tag) } 

}

