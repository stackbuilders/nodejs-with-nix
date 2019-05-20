{
  webserver = { ... }: {
    services.nginx.enable = true;

    users.users.admin = {
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkFQ1XlTlAEj+TqMH0rgJyRqR8ADumMAF2XOUKQnP84QT3YRrJGNKhvzfNSSeePVTePXxTfyKjmeGF+RgeEhl5u76Wd/L58iZWjNAokA2qYdN1gPeR5TIg7LWZPhQeVRExMfvR/9bgj43f6xmdO1o+IPl2vNSP9x4Uxzs4c0w6Nwjp/DPvD87xF6tk9koPPXEdVaZsOl0z9USAmaxtpUFQl4QvxWP+y6pcunIKF2wcCYKvI1Y7YPuj4pIHVHYXuwwjKxJbknz1nZzXpqY3oiKB9A7SaFAf3wwsHXkln8fyX1ECEJ69vKeyQ5gBBrHkZth6VD0bmcTlzfgyJ8w4V+gJ"
      ];
    };
  };

  dbserver = { ... }: {
    services.postgresql.enable = true;

    users.users.admin = {
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkFQ1XlTlAEj+TqMH0rgJyRqR8ADumMAF2XOUKQnP84QT3YRrJGNKhvzfNSSeePVTePXxTfyKjmeGF+RgeEhl5u76Wd/L58iZWjNAokA2qYdN1gPeR5TIg7LWZPhQeVRExMfvR/9bgj43f6xmdO1o+IPl2vNSP9x4Uxzs4c0w6Nwjp/DPvD87xF6tk9koPPXEdVaZsOl0z9USAmaxtpUFQl4QvxWP+y6pcunIKF2wcCYKvI1Y7YPuj4pIHVHYXuwwjKxJbknz1nZzXpqY3oiKB9A7SaFAf3wwsHXkln8fyX1ECEJ69vKeyQ5gBBrHkZth6VD0bmcTlzfgyJ8w4V+gJ"
      ];
    };
  };
}
