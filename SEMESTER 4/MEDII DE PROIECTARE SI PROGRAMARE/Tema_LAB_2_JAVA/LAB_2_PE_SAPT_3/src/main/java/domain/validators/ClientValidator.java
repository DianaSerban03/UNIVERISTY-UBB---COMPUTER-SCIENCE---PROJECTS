package domain.validators;

import domain.Client;

public class ClientValidator implements Validator<Client>{
    @Override
    public void validate(Client entity) throws ValidationException
    {
        if (!entity.getNume().matches("[a-zA-Z]+")) throw new ValidationException("Invalid name!");
        if (String.valueOf(entity.getTelefon()).length() > 10) throw new ValidationException("Invalid telefon!");
    }
}
