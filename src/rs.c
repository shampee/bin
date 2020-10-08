#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct abuf {
	char* b;
	int	  len;
};

#define ABUF_INIT                                                              \
	{                                                                          \
		NULL, 0                                                                \
	}

void ab_append(struct abuf* ab, const char* s, int len)
{
	char* new = realloc(ab->b, ab->len + len);

	if (new == NULL)
		return;
	memcpy(&new[ab->len], s, len);
	ab->b = new;
	ab->len += len;
}

void ab_free(struct abuf* ab)
{
	free(ab->b);
}

int main(int argc, char** argv)
{
	if (argc == 1) {
		system("redshift -x 1>/dev/null");
	} else {
		u_int8_t	n	= atoi(argv[1]);
		struct abuf ab	= ABUF_INIT;
		const char* rso = "redshift -x 1>/dev/null; redshift -O ";
		const char* dn	= " 1>/dev/null";
		char		buf[5];
		ab_append(&ab, rso, strlen(rso));
		if (n < 10) {
			snprintf(buf, 5, "%d", n * 1000);
			ab_append(&ab, buf, 4);
			ab_append(&ab, dn, strlen(dn));
			system(ab.b);
			ab_free(&ab);
		} else {
			snprintf(buf, 5, "%d", n * 100);
			ab_append(&ab, buf, 4);
			ab_append(&ab, dn, strlen(dn));
			system(ab.b);
			ab_free(&ab);
		}
	}
	return 0;
}
