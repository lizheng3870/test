
_strace:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h" 
#include "user.h" 

int
main(int argc, char *argv[]) 
{ 
   0:	e92d4870 	push	{r4, r5, r6, fp, lr}
   4:	e28db010 	add	fp, sp, #16
	char *args[2];
	int id;

	for (int i = 1; i < 999; i ++) {
		printf(0, "");
   8:	e3006b90 	movw	r6, #2960	; 0xb90
   c:	e24b401c 	sub	r4, fp, #28
  10:	e3406000 	movt	r6, #0
{ 
  14:	e1a05001 	mov	r5, r1
  18:	e24dd00c 	sub	sp, sp, #12
		printf(0, "");
  1c:	e1a01006 	mov	r1, r6
  20:	e3a00000 	mov	r0, #0
  24:	eb000213 	bl	878 <printf>
		args[i-1] = argv[i];
  28:	e5b53004 	ldr	r3, [r5, #4]!
		if (argv[i] == 0) {
  2c:	e3530000 	cmp	r3, #0
		args[i-1] = argv[i];
  30:	e4843004 	str	r3, [r4], #4
		if (argv[i] == 0) {
  34:	1afffff8 	bne	1c <main+0x1c>
			break;
		}
	}
	id = fork();
  38:	eb0000a0 	bl	2c0 <fork>
	if (id == 0) {
  3c:	e3500000 	cmp	r0, #0
  40:	1a000004 	bne	58 <main+0x58>
		// Child
		setTraceFlag();
  44:	eb0001bb 	bl	738 <setTraceFlag>
		exec(args[0], args);
  48:	e24b101c 	sub	r1, fp, #28
  4c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
  50:	eb000102 	bl	460 <exec>
		exit();
  54:	eb0000a6 	bl	2f4 <exit>
	} else {
		// Parent
		id = wait();
  58:	eb0000b2 	bl	328 <wait>
	}
    exit(); 
  5c:	eb0000a4 	bl	2f4 <exit>

00000060 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  64:	e2402001 	sub	r2, r0, #1
  68:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6c:	e4d13001 	ldrb	r3, [r1], #1
  70:	e3530000 	cmp	r3, #0
  74:	e5e23001 	strb	r3, [r2, #1]!
  78:	1afffffb 	bne	6c <strcpy+0xc>
    ;
  return os;
}
  7c:	e28bd000 	add	sp, fp, #0
  80:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  84:	e12fff1e 	bx	lr

00000088 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  88:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  8c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  90:	e5d03000 	ldrb	r3, [r0]
  94:	e5d12000 	ldrb	r2, [r1]
  98:	e3530000 	cmp	r3, #0
  9c:	1a000004 	bne	b4 <strcmp+0x2c>
  a0:	ea000005 	b	bc <strcmp+0x34>
  a4:	e5f03001 	ldrb	r3, [r0, #1]!
  a8:	e5f12001 	ldrb	r2, [r1, #1]!
  ac:	e3530000 	cmp	r3, #0
  b0:	0a000001 	beq	bc <strcmp+0x34>
  b4:	e1530002 	cmp	r3, r2
  b8:	0afffff9 	beq	a4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  bc:	e0430002 	sub	r0, r3, r2
  c0:	e28bd000 	add	sp, fp, #0
  c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c8:	e12fff1e 	bx	lr

000000cc <strlen>:

uint
strlen(char *s)
{
  cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  d4:	e5d03000 	ldrb	r3, [r0]
  d8:	e3530000 	cmp	r3, #0
  dc:	01a00003 	moveq	r0, r3
  e0:	0a000006 	beq	100 <strlen+0x34>
  e4:	e1a02000 	mov	r2, r0
  e8:	e3a03000 	mov	r3, #0
  ec:	e5f21001 	ldrb	r1, [r2, #1]!
  f0:	e2833001 	add	r3, r3, #1
  f4:	e3510000 	cmp	r1, #0
  f8:	e1a00003 	mov	r0, r3
  fc:	1afffffa 	bne	ec <strlen+0x20>
    ;
  return n;
}
 100:	e28bd000 	add	sp, fp, #0
 104:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 108:	e12fff1e 	bx	lr

0000010c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 10c:	e3520000 	cmp	r2, #0
{
 110:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 114:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 118:	0a000004 	beq	130 <memset+0x24>
 11c:	e6ef1071 	uxtb	r1, r1
 120:	e0802002 	add	r2, r0, r2
 124:	e4c01001 	strb	r1, [r0], #1
 128:	e1520000 	cmp	r2, r0
 12c:	1afffffc 	bne	124 <memset+0x18>
  return (void *)p;
}
 130:	e28bd000 	add	sp, fp, #0
 134:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 138:	e12fff1e 	bx	lr

0000013c <strchr>:

char*
strchr(const char *s, char c)
{
 13c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 140:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 144:	e5d02000 	ldrb	r2, [r0]
 148:	e3520000 	cmp	r2, #0
 14c:	0a00000b 	beq	180 <strchr+0x44>
    if(*s == c)
 150:	e1510002 	cmp	r1, r2
 154:	1a000002 	bne	164 <strchr+0x28>
 158:	ea000005 	b	174 <strchr+0x38>
 15c:	e1530001 	cmp	r3, r1
 160:	0a000003 	beq	174 <strchr+0x38>
  for(; *s; s++)
 164:	e5f03001 	ldrb	r3, [r0, #1]!
 168:	e3530000 	cmp	r3, #0
 16c:	1afffffa 	bne	15c <strchr+0x20>
      return (char*)s;
  return 0;
 170:	e1a00003 	mov	r0, r3
}
 174:	e28bd000 	add	sp, fp, #0
 178:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 17c:	e12fff1e 	bx	lr
  return 0;
 180:	e1a00002 	mov	r0, r2
 184:	eafffffa 	b	174 <strchr+0x38>

00000188 <gets>:

char*
gets(char *buf, int max)
{
 188:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 18c:	e1a03000 	mov	r3, r0
 190:	e28db014 	add	fp, sp, #20
 194:	e1a07000 	mov	r7, r0
 198:	e24dd008 	sub	sp, sp, #8
 19c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a0:	e3a04000 	mov	r4, #0
 1a4:	ea000008 	b	1cc <gets+0x44>
    cc = read(0, &c, 1);
 1a8:	eb000078 	bl	390 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1ac:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1b0:	e3500000 	cmp	r0, #0
 1b4:	da00000b 	ble	1e8 <gets+0x60>
    buf[i++] = c;
 1b8:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1bc:	e352000d 	cmp	r2, #13
 1c0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1c4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1c8:	0a00000b 	beq	1fc <gets+0x74>
    cc = read(0, &c, 1);
 1cc:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1d0:	e0844002 	add	r4, r4, r2
 1d4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1d8:	e24b1015 	sub	r1, fp, #21
 1dc:	e3a00000 	mov	r0, #0
 1e0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1e4:	baffffef 	blt	1a8 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1ec:	e3a03000 	mov	r3, #0
 1f0:	e5c53000 	strb	r3, [r5]
}
 1f4:	e24bd014 	sub	sp, fp, #20
 1f8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1fc:	e0875004 	add	r5, r7, r4
 200:	eafffff8 	b	1e8 <gets+0x60>

00000204 <stat>:

int
stat(char *n, struct stat *st)
{
 204:	e92d4830 	push	{r4, r5, fp, lr}
 208:	e1a04001 	mov	r4, r1
 20c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 210:	e3a01000 	mov	r1, #0
 214:	eb00009e 	bl	494 <open>
  if(fd < 0)
 218:	e2505000 	subs	r5, r0, #0
 21c:	ba000006 	blt	23c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 220:	e1a01004 	mov	r1, r4
 224:	eb0000c1 	bl	530 <fstat>
 228:	e1a04000 	mov	r4, r0
  close(fd);
 22c:	e1a00005 	mov	r0, r5
 230:	eb000070 	bl	3f8 <close>
  return r;
}
 234:	e1a00004 	mov	r0, r4
 238:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 23c:	e3e04000 	mvn	r4, #0
 240:	eafffffb 	b	234 <stat+0x30>

00000244 <atoi>:

int
atoi(const char *s)
{
 244:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 248:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 24c:	e5d02000 	ldrb	r2, [r0]
 250:	e2423030 	sub	r3, r2, #48	; 0x30
 254:	e3530009 	cmp	r3, #9
  n = 0;
 258:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 25c:	8a000006 	bhi	27c <atoi+0x38>
    n = n*10 + *s++ - '0';
 260:	e3a0c00a 	mov	ip, #10
 264:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 268:	e5f02001 	ldrb	r2, [r0, #1]!
 26c:	e2421030 	sub	r1, r2, #48	; 0x30
 270:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 274:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 278:	9afffff9 	bls	264 <atoi+0x20>
  return n;
}
 27c:	e1a00003 	mov	r0, r3
 280:	e28bd000 	add	sp, fp, #0
 284:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 288:	e12fff1e 	bx	lr

0000028c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28c:	e3520000 	cmp	r2, #0
{
 290:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 294:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 298:	da000005 	ble	2b4 <memmove+0x28>
 29c:	e0812002 	add	r2, r1, r2
 2a0:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2a4:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2a8:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2ac:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2b0:	1afffffb 	bne	2a4 <memmove+0x18>
  return vdst;
}
 2b4:	e28bd000 	add	sp, fp, #0
 2b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2bc:	e12fff1e 	bx	lr

000002c0 <fork>:
 2c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2d4:	e3a00001 	mov	r0, #1
 2d8:	ef000040 	svc	0x00000040
 2dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2f0:	e12fff1e 	bx	lr

000002f4 <exit>:
 2f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 300:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 304:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 308:	e3a00002 	mov	r0, #2
 30c:	ef000040 	svc	0x00000040
 310:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 314:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 318:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 31c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 320:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 324:	e12fff1e 	bx	lr

00000328 <wait>:
 328:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 32c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 330:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 334:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 338:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 33c:	e3a00003 	mov	r0, #3
 340:	ef000040 	svc	0x00000040
 344:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 350:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 354:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 358:	e12fff1e 	bx	lr

0000035c <pipe>:
 35c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 360:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 364:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 368:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 36c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 370:	e3a00004 	mov	r0, #4
 374:	ef000040 	svc	0x00000040
 378:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 384:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 388:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 38c:	e12fff1e 	bx	lr

00000390 <read>:
 390:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 394:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 398:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 39c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a4:	e3a00005 	mov	r0, #5
 3a8:	ef000040 	svc	0x00000040
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c0:	e12fff1e 	bx	lr

000003c4 <write>:
 3c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d8:	e3a00010 	mov	r0, #16
 3dc:	ef000040 	svc	0x00000040
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f4:	e12fff1e 	bx	lr

000003f8 <close>:
 3f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 400:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 404:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 408:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 40c:	e3a00015 	mov	r0, #21
 410:	ef000040 	svc	0x00000040
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 420:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 424:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 428:	e12fff1e 	bx	lr

0000042c <kill>:
 42c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 430:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 434:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 438:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 43c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 440:	e3a00006 	mov	r0, #6
 444:	ef000040 	svc	0x00000040
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 454:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 458:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 45c:	e12fff1e 	bx	lr

00000460 <exec>:
 460:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 464:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 468:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 46c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 470:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 474:	e3a00007 	mov	r0, #7
 478:	ef000040 	svc	0x00000040
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 488:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 48c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 490:	e12fff1e 	bx	lr

00000494 <open>:
 494:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 498:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 49c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a8:	e3a0000f 	mov	r0, #15
 4ac:	ef000040 	svc	0x00000040
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c4:	e12fff1e 	bx	lr

000004c8 <mknod>:
 4c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4dc:	e3a00011 	mov	r0, #17
 4e0:	ef000040 	svc	0x00000040
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <unlink>:
 4fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 500:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 504:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 508:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 50c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 510:	e3a00012 	mov	r0, #18
 514:	ef000040 	svc	0x00000040
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 524:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 52c:	e12fff1e 	bx	lr

00000530 <fstat>:
 530:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 534:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 538:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 53c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 540:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 544:	e3a00008 	mov	r0, #8
 548:	ef000040 	svc	0x00000040
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 558:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 55c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 560:	e12fff1e 	bx	lr

00000564 <link>:
 564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 568:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 56c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 570:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 574:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 578:	e3a00013 	mov	r0, #19
 57c:	ef000040 	svc	0x00000040
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 58c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 590:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 594:	e12fff1e 	bx	lr

00000598 <mkdir>:
 598:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 59c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ac:	e3a00014 	mov	r0, #20
 5b0:	ef000040 	svc	0x00000040
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c8:	e12fff1e 	bx	lr

000005cc <chdir>:
 5cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e0:	e3a00009 	mov	r0, #9
 5e4:	ef000040 	svc	0x00000040
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5fc:	e12fff1e 	bx	lr

00000600 <dup>:
 600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 604:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 608:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 60c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 610:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 614:	e3a0000a 	mov	r0, #10
 618:	ef000040 	svc	0x00000040
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 628:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 62c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 630:	e12fff1e 	bx	lr

00000634 <getpid>:
 634:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 638:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 63c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 640:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 644:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 648:	e3a0000b 	mov	r0, #11
 64c:	ef000040 	svc	0x00000040
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 65c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 660:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 664:	e12fff1e 	bx	lr

00000668 <sbrk>:
 668:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 66c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 670:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 678:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 67c:	e3a0000c 	mov	r0, #12
 680:	ef000040 	svc	0x00000040
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 690:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 694:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 698:	e12fff1e 	bx	lr

0000069c <sleep>:
 69c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b0:	e3a0000d 	mov	r0, #13
 6b4:	ef000040 	svc	0x00000040
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6cc:	e12fff1e 	bx	lr

000006d0 <uptime>:
 6d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e4:	e3a0000e 	mov	r0, #14
 6e8:	ef000040 	svc	0x00000040
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 700:	e12fff1e 	bx	lr

00000704 <memfree>:
 704:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 708:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 70c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 710:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 714:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 718:	e3a00016 	mov	r0, #22
 71c:	ef000040 	svc	0x00000040
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 72c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 730:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 734:	e12fff1e 	bx	lr

00000738 <setTraceFlag>:
 738:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 73c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 740:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 744:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 748:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 74c:	e3a00017 	mov	r0, #23
 750:	ef000040 	svc	0x00000040
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 760:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 764:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 768:	e12fff1e 	bx	lr

0000076c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 76c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 770:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 774:	e013afa1 	ands	sl, r3, r1, lsr #31
 778:	e24b4034 	sub	r4, fp, #52	; 0x34
 77c:	e3009b94 	movw	r9, #2964	; 0xb94
    neg = 1;
    x = -xx;
 780:	1261e000 	rsbne	lr, r1, #0
 784:	e3409000 	movt	r9, #0
{
 788:	e1a05000 	mov	r5, r0
    neg = 1;
 78c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 790:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 794:	e3a08000 	mov	r8, #0
  b = base;
 798:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 79c:	e3a06001 	mov	r6, #1
{
 7a0:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 7a4:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 7a8:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7ac:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 7b0:	e1a0033e 	lsr	r0, lr, r3
 7b4:	e2000001 	and	r0, r0, #1
 7b8:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7bc:	e1520001 	cmp	r2, r1
            r = r - d;
 7c0:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7c4:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7c8:	e2533001 	subs	r3, r3, #1
 7cc:	2afffff7 	bcs	7b0 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7d0:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7d4:	e35c0000 	cmp	ip, #0
 7d8:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7dc:	e2883001 	add	r3, r8, #1
 7e0:	e7d91001 	ldrb	r1, [r9, r1]
 7e4:	e4c71001 	strb	r1, [r7], #1
 7e8:	11a08003 	movne	r8, r3
 7ec:	1affffec 	bne	7a4 <printint+0x38>
  if(neg)
 7f0:	e35a0000 	cmp	sl, #0
 7f4:	0a000004 	beq	80c <printint+0xa0>
    buf[i++] = '-';
 7f8:	e24b2024 	sub	r2, fp, #36	; 0x24
 7fc:	e3a0102d 	mov	r1, #45	; 0x2d
 800:	e0822003 	add	r2, r2, r3
 804:	e2883002 	add	r3, r8, #2
 808:	e5421010 	strb	r1, [r2, #-16]
 80c:	e0846003 	add	r6, r4, r3
 810:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 814:	e3a02001 	mov	r2, #1
 818:	e24b1035 	sub	r1, fp, #53	; 0x35
 81c:	e1a00005 	mov	r0, r5
 820:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 824:	ebfffee6 	bl	3c4 <write>

  while(--i >= 0)
 828:	e1540006 	cmp	r4, r6
 82c:	1afffff7 	bne	810 <printint+0xa4>
    putc(fd, buf[i]);
}
 830:	e24bd020 	sub	sp, fp, #32
 834:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000838 <div>:
{
 838:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 83c:	e3a02000 	mov	r2, #0
{
 840:	e28db008 	add	fp, sp, #8
 844:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 848:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 84c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 850:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 854:	e1a0c33e 	lsr	ip, lr, r3
 858:	e20cc001 	and	ip, ip, #1
 85c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 860:	e1520001 	cmp	r2, r1
            r = r - d;
 864:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 868:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 86c:	e2533001 	subs	r3, r3, #1
 870:	38bd8810 	popcc	{r4, fp, pc}
 874:	eafffff6 	b	854 <div+0x1c>

00000878 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 878:	e92d000e 	push	{r1, r2, r3}
 87c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 880:	e28db018 	add	fp, sp, #24
 884:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 888:	e59b5004 	ldr	r5, [fp, #4]
 88c:	e5d54000 	ldrb	r4, [r5]
 890:	e3540000 	cmp	r4, #0
 894:	0a00002b 	beq	948 <printf+0xd0>
 898:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 89c:	e28b8008 	add	r8, fp, #8
  state = 0;
 8a0:	e3a06000 	mov	r6, #0
 8a4:	ea00000a 	b	8d4 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8a8:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8ac:	01a06004 	moveq	r6, r4
      if(c == '%'){
 8b0:	0a000004 	beq	8c8 <printf+0x50>
 8b4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 8b8:	e3a02001 	mov	r2, #1
 8bc:	e1a00007 	mov	r0, r7
 8c0:	e5614006 	strb	r4, [r1, #-6]!
 8c4:	ebfffebe 	bl	3c4 <write>
  for(i = 0; fmt[i]; i++){
 8c8:	e5f54001 	ldrb	r4, [r5, #1]!
 8cc:	e3540000 	cmp	r4, #0
 8d0:	0a00001c 	beq	948 <printf+0xd0>
    if(state == 0){
 8d4:	e3560000 	cmp	r6, #0
 8d8:	0afffff2 	beq	8a8 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8dc:	e3560025 	cmp	r6, #37	; 0x25
 8e0:	1afffff8 	bne	8c8 <printf+0x50>
      if(c == 'd'){
 8e4:	e3540064 	cmp	r4, #100	; 0x64
 8e8:	0a000030 	beq	9b0 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8ec:	e20430f7 	and	r3, r4, #247	; 0xf7
 8f0:	e3530070 	cmp	r3, #112	; 0x70
 8f4:	0a000017 	beq	958 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8f8:	e3540073 	cmp	r4, #115	; 0x73
 8fc:	0a00001c 	beq	974 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 900:	e3540063 	cmp	r4, #99	; 0x63
 904:	0a000037 	beq	9e8 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 908:	e3540025 	cmp	r4, #37	; 0x25
 90c:	0a00002e 	beq	9cc <printf+0x154>
  write(fd, &c, 1);
 910:	e3a02001 	mov	r2, #1
 914:	e24b1019 	sub	r1, fp, #25
 918:	e1a00007 	mov	r0, r7
 91c:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 920:	ebfffea7 	bl	3c4 <write>
 924:	e3a02001 	mov	r2, #1
 928:	e24b101a 	sub	r1, fp, #26
 92c:	e1a00007 	mov	r0, r7
 930:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 934:	ebfffea2 	bl	3c4 <write>
  for(i = 0; fmt[i]; i++){
 938:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 93c:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 940:	e3540000 	cmp	r4, #0
 944:	1affffe2 	bne	8d4 <printf+0x5c>
    }
  }
}
 948:	e24bd018 	sub	sp, fp, #24
 94c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 950:	e28dd00c 	add	sp, sp, #12
 954:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 958:	e3a03000 	mov	r3, #0
 95c:	e3a02010 	mov	r2, #16
 960:	e4981004 	ldr	r1, [r8], #4
 964:	e1a00007 	mov	r0, r7
 968:	ebffff7f 	bl	76c <printint>
      state = 0;
 96c:	e3a06000 	mov	r6, #0
 970:	eaffffd4 	b	8c8 <printf+0x50>
        s = (char*)*ap;
 974:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 978:	e3540000 	cmp	r4, #0
 97c:	0a000021 	beq	a08 <printf+0x190>
        while(*s != 0){
 980:	e5d46000 	ldrb	r6, [r4]
 984:	e3560000 	cmp	r6, #0
 988:	0affffce 	beq	8c8 <printf+0x50>
  write(fd, &c, 1);
 98c:	e3a02001 	mov	r2, #1
 990:	e24b101d 	sub	r1, fp, #29
 994:	e1a00007 	mov	r0, r7
 998:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 99c:	ebfffe88 	bl	3c4 <write>
        while(*s != 0){
 9a0:	e5f46001 	ldrb	r6, [r4, #1]!
 9a4:	e3560000 	cmp	r6, #0
 9a8:	1afffff7 	bne	98c <printf+0x114>
 9ac:	eaffffc5 	b	8c8 <printf+0x50>
        printint(fd, *ap, 10, 1);
 9b0:	e3a03001 	mov	r3, #1
 9b4:	e3a0200a 	mov	r2, #10
 9b8:	e4981004 	ldr	r1, [r8], #4
 9bc:	e1a00007 	mov	r0, r7
 9c0:	ebffff69 	bl	76c <printint>
      state = 0;
 9c4:	e3a06000 	mov	r6, #0
 9c8:	eaffffbe 	b	8c8 <printf+0x50>
 9cc:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9d0:	e3a02001 	mov	r2, #1
 9d4:	e1a00007 	mov	r0, r7
 9d8:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9dc:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9e0:	ebfffe77 	bl	3c4 <write>
 9e4:	eaffffb7 	b	8c8 <printf+0x50>
        putc(fd, *ap);
 9e8:	e4983004 	ldr	r3, [r8], #4
 9ec:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9f0:	e3a02001 	mov	r2, #1
 9f4:	e1a00007 	mov	r0, r7
      state = 0;
 9f8:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9fc:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 a00:	ebfffe6f 	bl	3c4 <write>
 a04:	eaffffaf 	b	8c8 <printf+0x50>
          s = "(null)";
 a08:	e3004ba8 	movw	r4, #2984	; 0xba8
        while(*s != 0){
 a0c:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 a10:	e3404000 	movt	r4, #0
 a14:	eaffffdc 	b	98c <printf+0x114>

00000a18 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	e300cbb0 	movw	ip, #2992	; 0xbb0
 a1c:	e340c000 	movt	ip, #0
{
 a20:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a24:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a28:	e59c3000 	ldr	r3, [ip]
{
 a2c:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a30:	e1530001 	cmp	r3, r1
 a34:	e5932000 	ldr	r2, [r3]
 a38:	2a000017 	bcs	a9c <free+0x84>
 a3c:	e1510002 	cmp	r1, r2
 a40:	3a000001 	bcc	a4c <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a44:	e1530002 	cmp	r3, r2
 a48:	3a000017 	bcc	aac <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a4c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a50:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a54:	e081418e 	add	r4, r1, lr, lsl #3
 a58:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a5c:	05922004 	ldreq	r2, [r2, #4]
 a60:	0082e00e 	addeq	lr, r2, lr
 a64:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a68:	05932000 	ldreq	r2, [r3]
 a6c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a70:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a74:	e5932004 	ldr	r2, [r3, #4]
 a78:	e083e182 	add	lr, r3, r2, lsl #3
 a7c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a80:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a84:	05101004 	ldreq	r1, [r0, #-4]
 a88:	00812002 	addeq	r2, r1, r2
 a8c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a90:	05102008 	ldreq	r2, [r0, #-8]
 a94:	05832000 	streq	r2, [r3]
}
 a98:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9c:	e1530002 	cmp	r3, r2
 aa0:	3a000001 	bcc	aac <free+0x94>
 aa4:	e1510002 	cmp	r1, r2
 aa8:	3affffe7 	bcc	a4c <free+0x34>
{
 aac:	e1a03002 	mov	r3, r2
 ab0:	eaffffde 	b	a30 <free+0x18>

00000ab4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ab8:	e3007bb0 	movw	r7, #2992	; 0xbb0
 abc:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac0:	e2804007 	add	r4, r0, #7
{
 ac4:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 ac8:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 acc:	e1a041a4 	lsr	r4, r4, #3
 ad0:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ad4:	e3530000 	cmp	r3, #0
 ad8:	0a000027 	beq	b7c <malloc+0xc8>
 adc:	e5930000 	ldr	r0, [r3]
 ae0:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ae4:	e1540002 	cmp	r4, r2
 ae8:	9a000019 	bls	b54 <malloc+0xa0>
 aec:	e3540a01 	cmp	r4, #4096	; 0x1000
 af0:	21a05004 	movcs	r5, r4
 af4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 af8:	e1a06185 	lsl	r6, r5, #3
 afc:	ea000003 	b	b10 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b00:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b04:	e5902004 	ldr	r2, [r0, #4]
 b08:	e1520004 	cmp	r2, r4
 b0c:	2a000010 	bcs	b54 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b10:	e5972000 	ldr	r2, [r7]
 b14:	e1a03000 	mov	r3, r0
 b18:	e1520000 	cmp	r2, r0
 b1c:	1afffff7 	bne	b00 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b20:	e1a00006 	mov	r0, r6
 b24:	ebfffecf 	bl	668 <sbrk>
 b28:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b2c:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b30:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b34:	0a000004 	beq	b4c <malloc+0x98>
  hp->s.size = nu;
 b38:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b3c:	ebffffb5 	bl	a18 <free>
  return freep;
 b40:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b44:	e3530000 	cmp	r3, #0
 b48:	1affffec 	bne	b00 <malloc+0x4c>
        return 0;
 b4c:	e3a00000 	mov	r0, #0
  }
}
 b50:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b54:	e1540002 	cmp	r4, r2
      freep = prevp;
 b58:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b5c:	10422004 	subne	r2, r2, r4
 b60:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b64:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b68:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b6c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b70:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b74:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b78:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b7c:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b80:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b84:	e5870000 	str	r0, [r7]
 b88:	e5870004 	str	r0, [r7, #4]
 b8c:	eaffffd6 	b	aec <malloc+0x38>
