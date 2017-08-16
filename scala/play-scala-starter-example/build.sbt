name := """play-scala"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.11"

libraryDependencies += jdbc
libraryDependencies += cache
libraryDependencies += ws
libraryDependencies += specs2 % Test
libraryDependencies += "org.reactivemongo" %% "play2-reactivemongo" % "0.11.7.play24"


