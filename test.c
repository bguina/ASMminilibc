#include <stdlib.h>
#include <assert.h>

#include <string.h>

#define ASMSUCCESS(call)    printf("%s -> success\n", #call)

#define myasm_
#define ASMASSERT(call)  do {assert(call == myasm_##call); ASMSUCCESS(call); } while (0)

int main()
{
    char *s;
    long r;

    s = malloc(500);
    strcpy(s, "1234567");
    
    ASMASSERT(strlen(s));

    ASMASSERT(strchr("1234567", '!'));
    ASMASSERT(strchr("123456378", '3'));
    ASMASSERT(strchr("1234567", 0));
    ASMASSERT(strchr("", '4'));

    r = myasm_memset(s, 'a', 2);
    assert(strcmp(s, "aa34567") == 0);
    assert(r == s);
    ASMSUCCESS(memset(s, 'a', 2));
    
    r = myasm_memcpy(s, "123456789", 9);
    assert(strcmp(s, "123456789") == 0);
    assert(r == s);
    ASMSUCCESS(memcpy(s, "123456789", 9));

    ASMASSERT(strcmp("abc", "abc"));
    ASMASSERT(strcmp("abc", "ABC"));
    ASMASSERT(strcmp("ABC", "abc"));
    ASMASSERT(strcmp("abc", "abcd"));
    ASMASSERT(strcmp("abcd", "abc"));
    ASMASSERT(strcmp("", "42"));

    ASMASSERT(strncmp("abc0", "abc1", 3));
    ASMASSERT(strncmp("abc0", "abc1", 50));
    ASMASSERT(strncmp("abc0", "abc0", 50));
    ASMASSERT(strncmp("ab", "abcd", 4));
    ASMASSERT(strncmp("abc0", "abc0", 2));
    ASMASSERT(strncmp("a", "b", 0));

    ASMASSERT(strcasecmp("abc", "abc"));
    ASMASSERT(strcasecmp("abc", "ABC"));
    ASMASSERT(strcasecmp("ABC", "abc"));
    ASMASSERT(strcasecmp("Abc", "Abcd"));
    ASMASSERT(strcasecmp("aBcd", "aBc"));

    ASMASSERT(rindex("", '8'));
    ASMASSERT(rindex("123424", '2'));
    ASMASSERT(rindex("123424", '5'));
    ASMASSERT(rindex("123424", 0));

    ASMASSERT(strstr("abcd", "bc"));
    ASMASSERT(strstr("abcd", "cde"));
    ASMASSERT(strstr("abcd", "abce"));
    ASMASSERT(strstr("abcd", "bcd"));
    ASMASSERT(strstr("abc", ""));
    ASMASSERT(strstr("", "abc"));

    ASMASSERT(strpbrk("hello", "l"));
    ASMASSERT(strpbrk("not", "!!?"));
    ASMASSERT(strpbrk("", "empty"));
    ASMASSERT(strpbrk("blgekga", ""));
    ASMASSERT(strpbrk("hello", "ol"));
    ASMASSERT(strpbrk("hello", "ho"));

    ASMASSERT(strcspn("abc", "b"));
    ASMASSERT(strcspn("abc", "123"));
    ASMASSERT(strcspn("", "123"));
    ASMASSERT(strcspn("123", ""));

    return (0);
}
