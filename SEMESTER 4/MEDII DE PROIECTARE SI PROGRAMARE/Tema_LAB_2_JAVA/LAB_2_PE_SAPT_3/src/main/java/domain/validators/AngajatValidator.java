package domain.validators;

import domain.Angajat;

public class AngajatValidator implements Validator<Angajat>{
    @Override
    public void validate(Angajat entity) throws ValidationException
    {
        if(!entity.getUsername().matches("\\w+@\\w+\\.com") && !entity.getUsername().matches("\\w+@\\w+\\.ro"))
        {
            throw new ValidationException("Invalid email!");
        }
    }
}
