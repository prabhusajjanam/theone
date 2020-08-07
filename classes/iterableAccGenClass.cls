global class iterableAccGenClass implements iterable<Account>
{
global iterator<account> iterator()
{
return new AccountGenerator(300);
}

}