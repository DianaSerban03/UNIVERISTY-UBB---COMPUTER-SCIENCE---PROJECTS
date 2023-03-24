package domain.validators;

import domain.Client;
import domain.Excursie;

public class ExcursieValidator implements Validator<Excursie>{
    @Override
    public void validate(Excursie entity) throws ValidationException {
        if (!entity.getObTuristic().matches("[a-zA-Z]+")) throw new ValidationException("Invalid name of obTuristic!");
    }
}
