part of '../core.dart';

abstract class Mapper<Entity, Model> {
  Model mapToModel(Entity entity);
  Entity mapToEntity(Model model);
}
