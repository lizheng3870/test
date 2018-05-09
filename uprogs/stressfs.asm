
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
   0:	e3003c64 	movw	r3, #3172	; 0xc64
   4:	e3403000 	movt	r3, #0
{
   8:	e92d4830 	push	{r4, r5, fp, lr}
   c:	e28db00c 	add	fp, sp, #12
  10:	e24dde21 	sub	sp, sp, #528	; 0x210
  char path[] = "stressfs0";
  14:	e8930007 	ldm	r3, {r0, r1, r2}
  18:	e24b3f86 	sub	r3, fp, #536	; 0x218
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  1c:	e3a04000 	mov	r4, #0
  char path[] = "stressfs0";
  20:	e8a30003 	stmia	r3!, {r0, r1}
  printf(1, "stressfs starting\n");
  24:	e3a00001 	mov	r0, #1
  28:	e3001c3c 	movw	r1, #3132	; 0xc3c
  2c:	e3401000 	movt	r1, #0
  char path[] = "stressfs0";
  30:	e1c320b0 	strh	r2, [r3]
  printf(1, "stressfs starting\n");
  34:	eb00023a 	bl	924 <printf>
  memset(data, 'a', sizeof(data));
  38:	e24b0f83 	sub	r0, fp, #524	; 0x20c
  3c:	e3a02c02 	mov	r2, #512	; 0x200
  40:	e3a01061 	mov	r1, #97	; 0x61
  44:	eb00005b 	bl	1b8 <memset>
    if(fork() > 0)
  48:	eb0000c7 	bl	36c <fork>
  4c:	e3500000 	cmp	r0, #0
  50:	ca00002b 	bgt	104 <main+0x104>
  for(i = 0; i < 4; i++)
  54:	e2844001 	add	r4, r4, #1
  58:	e3540004 	cmp	r4, #4
  5c:	1afffff9 	bne	48 <main+0x48>
  60:	e1a05004 	mov	r5, r4
      break;

  printf(1, "write %d\n", i);
  64:	e1a02004 	mov	r2, r4
  68:	e3a00001 	mov	r0, #1
  6c:	e3001c50 	movw	r1, #3152	; 0xc50
  70:	e3401000 	movt	r1, #0
  74:	eb00022a 	bl	924 <printf>

  path[8] += i;
  78:	e55b3210 	ldrb	r3, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  7c:	e3001202 	movw	r1, #514	; 0x202
  80:	e24b0f86 	sub	r0, fp, #536	; 0x218
  path[8] += i;
  84:	e0855003 	add	r5, r5, r3
  88:	e54b5210 	strb	r5, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  8c:	eb00012b 	bl	540 <open>
  90:	e3a04014 	mov	r4, #20
  94:	e1a05000 	mov	r5, r0
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  98:	e3a02c02 	mov	r2, #512	; 0x200
  9c:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  a0:	e1a00005 	mov	r0, r5
  a4:	eb0000f1 	bl	470 <write>
  for(i = 0; i < 20; i++)
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffff9 	bne	98 <main+0x98>
  close(fd);
  b0:	e1a00005 	mov	r0, r5

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  b4:	e3a05014 	mov	r5, #20
  close(fd);
  b8:	eb0000f9 	bl	4a4 <close>
  printf(1, "read\n");
  bc:	e3a00001 	mov	r0, #1
  c0:	e3001c5c 	movw	r1, #3164	; 0xc5c
  c4:	e3401000 	movt	r1, #0
  c8:	eb000215 	bl	924 <printf>
  fd = open(path, O_RDONLY);
  cc:	e1a01004 	mov	r1, r4
  d0:	e24b0f86 	sub	r0, fp, #536	; 0x218
  d4:	eb000119 	bl	540 <open>
  d8:	e1a04000 	mov	r4, r0
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  dc:	e3a02c02 	mov	r2, #512	; 0x200
  e0:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  e4:	e1a00004 	mov	r0, r4
  e8:	eb0000d3 	bl	43c <read>
  for (i = 0; i < 20; i++)
  ec:	e2555001 	subs	r5, r5, #1
  f0:	1afffff9 	bne	dc <main+0xdc>
  close(fd);
  f4:	e1a00004 	mov	r0, r4
  f8:	eb0000e9 	bl	4a4 <close>

  wait();
  fc:	eb0000b4 	bl	3d4 <wait>
  
  exit();
 100:	eb0000a6 	bl	3a0 <exit>
 104:	e6ef5074 	uxtb	r5, r4
 108:	eaffffd5 	b	64 <main+0x64>

0000010c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e2402001 	sub	r2, r0, #1
 114:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 118:	e4d13001 	ldrb	r3, [r1], #1
 11c:	e3530000 	cmp	r3, #0
 120:	e5e23001 	strb	r3, [r2, #1]!
 124:	1afffffb 	bne	118 <strcpy+0xc>
    ;
  return os;
}
 128:	e28bd000 	add	sp, fp, #0
 12c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 130:	e12fff1e 	bx	lr

00000134 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 13c:	e5d03000 	ldrb	r3, [r0]
 140:	e5d12000 	ldrb	r2, [r1]
 144:	e3530000 	cmp	r3, #0
 148:	1a000004 	bne	160 <strcmp+0x2c>
 14c:	ea000005 	b	168 <strcmp+0x34>
 150:	e5f03001 	ldrb	r3, [r0, #1]!
 154:	e5f12001 	ldrb	r2, [r1, #1]!
 158:	e3530000 	cmp	r3, #0
 15c:	0a000001 	beq	168 <strcmp+0x34>
 160:	e1530002 	cmp	r3, r2
 164:	0afffff9 	beq	150 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 168:	e0430002 	sub	r0, r3, r2
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strlen>:

uint
strlen(char *s)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 180:	e5d03000 	ldrb	r3, [r0]
 184:	e3530000 	cmp	r3, #0
 188:	01a00003 	moveq	r0, r3
 18c:	0a000006 	beq	1ac <strlen+0x34>
 190:	e1a02000 	mov	r2, r0
 194:	e3a03000 	mov	r3, #0
 198:	e5f21001 	ldrb	r1, [r2, #1]!
 19c:	e2833001 	add	r3, r3, #1
 1a0:	e3510000 	cmp	r1, #0
 1a4:	e1a00003 	mov	r0, r3
 1a8:	1afffffa 	bne	198 <strlen+0x20>
    ;
  return n;
}
 1ac:	e28bd000 	add	sp, fp, #0
 1b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b4:	e12fff1e 	bx	lr

000001b8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1b8:	e3520000 	cmp	r2, #0
{
 1bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c0:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1c4:	0a000004 	beq	1dc <memset+0x24>
 1c8:	e6ef1071 	uxtb	r1, r1
 1cc:	e0802002 	add	r2, r0, r2
 1d0:	e4c01001 	strb	r1, [r0], #1
 1d4:	e1520000 	cmp	r2, r0
 1d8:	1afffffc 	bne	1d0 <memset+0x18>
  return (void *)p;
}
 1dc:	e28bd000 	add	sp, fp, #0
 1e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e4:	e12fff1e 	bx	lr

000001e8 <strchr>:

char*
strchr(const char *s, char c)
{
 1e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ec:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1f0:	e5d02000 	ldrb	r2, [r0]
 1f4:	e3520000 	cmp	r2, #0
 1f8:	0a00000b 	beq	22c <strchr+0x44>
    if(*s == c)
 1fc:	e1510002 	cmp	r1, r2
 200:	1a000002 	bne	210 <strchr+0x28>
 204:	ea000005 	b	220 <strchr+0x38>
 208:	e1530001 	cmp	r3, r1
 20c:	0a000003 	beq	220 <strchr+0x38>
  for(; *s; s++)
 210:	e5f03001 	ldrb	r3, [r0, #1]!
 214:	e3530000 	cmp	r3, #0
 218:	1afffffa 	bne	208 <strchr+0x20>
      return (char*)s;
  return 0;
 21c:	e1a00003 	mov	r0, r3
}
 220:	e28bd000 	add	sp, fp, #0
 224:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 228:	e12fff1e 	bx	lr
  return 0;
 22c:	e1a00002 	mov	r0, r2
 230:	eafffffa 	b	220 <strchr+0x38>

00000234 <gets>:

char*
gets(char *buf, int max)
{
 234:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 238:	e1a03000 	mov	r3, r0
 23c:	e28db014 	add	fp, sp, #20
 240:	e1a07000 	mov	r7, r0
 244:	e24dd008 	sub	sp, sp, #8
 248:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24c:	e3a04000 	mov	r4, #0
 250:	ea000008 	b	278 <gets+0x44>
    cc = read(0, &c, 1);
 254:	eb000078 	bl	43c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 258:	e1a03005 	mov	r3, r5
    if(cc < 1)
 25c:	e3500000 	cmp	r0, #0
 260:	da00000b 	ble	294 <gets+0x60>
    buf[i++] = c;
 264:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 268:	e352000d 	cmp	r2, #13
 26c:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 270:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 274:	0a00000b 	beq	2a8 <gets+0x74>
    cc = read(0, &c, 1);
 278:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 27c:	e0844002 	add	r4, r4, r2
 280:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 284:	e24b1015 	sub	r1, fp, #21
 288:	e3a00000 	mov	r0, #0
 28c:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 290:	baffffef 	blt	254 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 294:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 298:	e3a03000 	mov	r3, #0
 29c:	e5c53000 	strb	r3, [r5]
}
 2a0:	e24bd014 	sub	sp, fp, #20
 2a4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 2a8:	e0875004 	add	r5, r7, r4
 2ac:	eafffff8 	b	294 <gets+0x60>

000002b0 <stat>:

int
stat(char *n, struct stat *st)
{
 2b0:	e92d4830 	push	{r4, r5, fp, lr}
 2b4:	e1a04001 	mov	r4, r1
 2b8:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2bc:	e3a01000 	mov	r1, #0
 2c0:	eb00009e 	bl	540 <open>
  if(fd < 0)
 2c4:	e2505000 	subs	r5, r0, #0
 2c8:	ba000006 	blt	2e8 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2cc:	e1a01004 	mov	r1, r4
 2d0:	eb0000c1 	bl	5dc <fstat>
 2d4:	e1a04000 	mov	r4, r0
  close(fd);
 2d8:	e1a00005 	mov	r0, r5
 2dc:	eb000070 	bl	4a4 <close>
  return r;
}
 2e0:	e1a00004 	mov	r0, r4
 2e4:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2e8:	e3e04000 	mvn	r4, #0
 2ec:	eafffffb 	b	2e0 <stat+0x30>

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2f4:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f8:	e5d02000 	ldrb	r2, [r0]
 2fc:	e2423030 	sub	r3, r2, #48	; 0x30
 300:	e3530009 	cmp	r3, #9
  n = 0;
 304:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 308:	8a000006 	bhi	328 <atoi+0x38>
    n = n*10 + *s++ - '0';
 30c:	e3a0c00a 	mov	ip, #10
 310:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 314:	e5f02001 	ldrb	r2, [r0, #1]!
 318:	e2421030 	sub	r1, r2, #48	; 0x30
 31c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 320:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 324:	9afffff9 	bls	310 <atoi+0x20>
  return n;
}
 328:	e1a00003 	mov	r0, r3
 32c:	e28bd000 	add	sp, fp, #0
 330:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 334:	e12fff1e 	bx	lr

00000338 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 338:	e3520000 	cmp	r2, #0
{
 33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 340:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 344:	da000005 	ble	360 <memmove+0x28>
 348:	e0812002 	add	r2, r1, r2
 34c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 350:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 354:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 358:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 35c:	1afffffb 	bne	350 <memmove+0x18>
  return vdst;
}
 360:	e28bd000 	add	sp, fp, #0
 364:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 368:	e12fff1e 	bx	lr

0000036c <fork>:
 36c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 370:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 374:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 378:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 37c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 380:	e3a00001 	mov	r0, #1
 384:	ef000040 	svc	0x00000040
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 394:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 398:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <exit>:
 3a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b4:	e3a00002 	mov	r0, #2
 3b8:	ef000040 	svc	0x00000040
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <wait>:
 3d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e8:	e3a00003 	mov	r0, #3
 3ec:	ef000040 	svc	0x00000040
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 404:	e12fff1e 	bx	lr

00000408 <pipe>:
 408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 40c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 410:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 414:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 418:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 41c:	e3a00004 	mov	r0, #4
 420:	ef000040 	svc	0x00000040
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 430:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 438:	e12fff1e 	bx	lr

0000043c <read>:
 43c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 440:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 444:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 448:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 44c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 450:	e3a00005 	mov	r0, #5
 454:	ef000040 	svc	0x00000040
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 464:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 468:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 46c:	e12fff1e 	bx	lr

00000470 <write>:
 470:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 474:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 478:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 47c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 480:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 484:	e3a00010 	mov	r0, #16
 488:	ef000040 	svc	0x00000040
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 498:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a0:	e12fff1e 	bx	lr

000004a4 <close>:
 4a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b8:	e3a00015 	mov	r0, #21
 4bc:	ef000040 	svc	0x00000040
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d4:	e12fff1e 	bx	lr

000004d8 <kill>:
 4d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ec:	e3a00006 	mov	r0, #6
 4f0:	ef000040 	svc	0x00000040
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 500:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 508:	e12fff1e 	bx	lr

0000050c <exec>:
 50c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 51c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 520:	e3a00007 	mov	r0, #7
 524:	ef000040 	svc	0x00000040
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 53c:	e12fff1e 	bx	lr

00000540 <open>:
 540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 54c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 554:	e3a0000f 	mov	r0, #15
 558:	ef000040 	svc	0x00000040
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 570:	e12fff1e 	bx	lr

00000574 <mknod>:
 574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 57c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 588:	e3a00011 	mov	r0, #17
 58c:	ef000040 	svc	0x00000040
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 59c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a4:	e12fff1e 	bx	lr

000005a8 <unlink>:
 5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5bc:	e3a00012 	mov	r0, #18
 5c0:	ef000040 	svc	0x00000040
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d8:	e12fff1e 	bx	lr

000005dc <fstat>:
 5dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f0:	e3a00008 	mov	r0, #8
 5f4:	ef000040 	svc	0x00000040
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 60c:	e12fff1e 	bx	lr

00000610 <link>:
 610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 61c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 624:	e3a00013 	mov	r0, #19
 628:	ef000040 	svc	0x00000040
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 63c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 640:	e12fff1e 	bx	lr

00000644 <mkdir>:
 644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 64c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 658:	e3a00014 	mov	r0, #20
 65c:	ef000040 	svc	0x00000040
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 66c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 674:	e12fff1e 	bx	lr

00000678 <chdir>:
 678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 67c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 68c:	e3a00009 	mov	r0, #9
 690:	ef000040 	svc	0x00000040
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a8:	e12fff1e 	bx	lr

000006ac <dup>:
 6ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c0:	e3a0000a 	mov	r0, #10
 6c4:	ef000040 	svc	0x00000040
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6dc:	e12fff1e 	bx	lr

000006e0 <getpid>:
 6e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f4:	e3a0000b 	mov	r0, #11
 6f8:	ef000040 	svc	0x00000040
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 70c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 710:	e12fff1e 	bx	lr

00000714 <sbrk>:
 714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 71c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 728:	e3a0000c 	mov	r0, #12
 72c:	ef000040 	svc	0x00000040
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 73c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 744:	e12fff1e 	bx	lr

00000748 <sleep>:
 748:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 74c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 750:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 754:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 758:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 75c:	e3a0000d 	mov	r0, #13
 760:	ef000040 	svc	0x00000040
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 770:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 774:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 778:	e12fff1e 	bx	lr

0000077c <uptime>:
 77c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 780:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 784:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 788:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 78c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 790:	e3a0000e 	mov	r0, #14
 794:	ef000040 	svc	0x00000040
 798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ac:	e12fff1e 	bx	lr

000007b0 <memfree>:
 7b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c4:	e3a00016 	mov	r0, #22
 7c8:	ef000040 	svc	0x00000040
 7cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e0:	e12fff1e 	bx	lr

000007e4 <setTraceFlag>:
 7e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7f8:	e3a00017 	mov	r0, #23
 7fc:	ef000040 	svc	0x00000040
 800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 808:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 80c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 810:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 814:	e12fff1e 	bx	lr

00000818 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 818:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 81c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 820:	e013afa1 	ands	sl, r3, r1, lsr #31
 824:	e24b4034 	sub	r4, fp, #52	; 0x34
 828:	e3009c70 	movw	r9, #3184	; 0xc70
    neg = 1;
    x = -xx;
 82c:	1261e000 	rsbne	lr, r1, #0
 830:	e3409000 	movt	r9, #0
{
 834:	e1a05000 	mov	r5, r0
    neg = 1;
 838:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 83c:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 840:	e3a08000 	mov	r8, #0
  b = base;
 844:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 848:	e3a06001 	mov	r6, #1
{
 84c:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 850:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 854:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 858:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 85c:	e1a0033e 	lsr	r0, lr, r3
 860:	e2000001 	and	r0, r0, #1
 864:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 868:	e1520001 	cmp	r2, r1
            r = r - d;
 86c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 870:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 874:	e2533001 	subs	r3, r3, #1
 878:	2afffff7 	bcs	85c <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 87c:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 880:	e35c0000 	cmp	ip, #0
 884:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 888:	e2883001 	add	r3, r8, #1
 88c:	e7d91001 	ldrb	r1, [r9, r1]
 890:	e4c71001 	strb	r1, [r7], #1
 894:	11a08003 	movne	r8, r3
 898:	1affffec 	bne	850 <printint+0x38>
  if(neg)
 89c:	e35a0000 	cmp	sl, #0
 8a0:	0a000004 	beq	8b8 <printint+0xa0>
    buf[i++] = '-';
 8a4:	e24b2024 	sub	r2, fp, #36	; 0x24
 8a8:	e3a0102d 	mov	r1, #45	; 0x2d
 8ac:	e0822003 	add	r2, r2, r3
 8b0:	e2883002 	add	r3, r8, #2
 8b4:	e5421010 	strb	r1, [r2, #-16]
 8b8:	e0846003 	add	r6, r4, r3
 8bc:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 8c0:	e3a02001 	mov	r2, #1
 8c4:	e24b1035 	sub	r1, fp, #53	; 0x35
 8c8:	e1a00005 	mov	r0, r5
 8cc:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 8d0:	ebfffee6 	bl	470 <write>

  while(--i >= 0)
 8d4:	e1540006 	cmp	r4, r6
 8d8:	1afffff7 	bne	8bc <printint+0xa4>
    putc(fd, buf[i]);
}
 8dc:	e24bd020 	sub	sp, fp, #32
 8e0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000008e4 <div>:
{
 8e4:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8e8:	e3a02000 	mov	r2, #0
{
 8ec:	e28db008 	add	fp, sp, #8
 8f0:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8f4:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8f8:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8fc:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 900:	e1a0c33e 	lsr	ip, lr, r3
 904:	e20cc001 	and	ip, ip, #1
 908:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 90c:	e1520001 	cmp	r2, r1
            r = r - d;
 910:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 914:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 918:	e2533001 	subs	r3, r3, #1
 91c:	38bd8810 	popcc	{r4, fp, pc}
 920:	eafffff6 	b	900 <div+0x1c>

00000924 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 924:	e92d000e 	push	{r1, r2, r3}
 928:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 92c:	e28db018 	add	fp, sp, #24
 930:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 934:	e59b5004 	ldr	r5, [fp, #4]
 938:	e5d54000 	ldrb	r4, [r5]
 93c:	e3540000 	cmp	r4, #0
 940:	0a00002b 	beq	9f4 <printf+0xd0>
 944:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 948:	e28b8008 	add	r8, fp, #8
  state = 0;
 94c:	e3a06000 	mov	r6, #0
 950:	ea00000a 	b	980 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 954:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 958:	01a06004 	moveq	r6, r4
      if(c == '%'){
 95c:	0a000004 	beq	974 <printf+0x50>
 960:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 964:	e3a02001 	mov	r2, #1
 968:	e1a00007 	mov	r0, r7
 96c:	e5614006 	strb	r4, [r1, #-6]!
 970:	ebfffebe 	bl	470 <write>
  for(i = 0; fmt[i]; i++){
 974:	e5f54001 	ldrb	r4, [r5, #1]!
 978:	e3540000 	cmp	r4, #0
 97c:	0a00001c 	beq	9f4 <printf+0xd0>
    if(state == 0){
 980:	e3560000 	cmp	r6, #0
 984:	0afffff2 	beq	954 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 988:	e3560025 	cmp	r6, #37	; 0x25
 98c:	1afffff8 	bne	974 <printf+0x50>
      if(c == 'd'){
 990:	e3540064 	cmp	r4, #100	; 0x64
 994:	0a000030 	beq	a5c <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 998:	e20430f7 	and	r3, r4, #247	; 0xf7
 99c:	e3530070 	cmp	r3, #112	; 0x70
 9a0:	0a000017 	beq	a04 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9a4:	e3540073 	cmp	r4, #115	; 0x73
 9a8:	0a00001c 	beq	a20 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ac:	e3540063 	cmp	r4, #99	; 0x63
 9b0:	0a000037 	beq	a94 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9b4:	e3540025 	cmp	r4, #37	; 0x25
 9b8:	0a00002e 	beq	a78 <printf+0x154>
  write(fd, &c, 1);
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e24b1019 	sub	r1, fp, #25
 9c4:	e1a00007 	mov	r0, r7
 9c8:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 9cc:	ebfffea7 	bl	470 <write>
 9d0:	e3a02001 	mov	r2, #1
 9d4:	e24b101a 	sub	r1, fp, #26
 9d8:	e1a00007 	mov	r0, r7
 9dc:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9e0:	ebfffea2 	bl	470 <write>
  for(i = 0; fmt[i]; i++){
 9e4:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9e8:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 9ec:	e3540000 	cmp	r4, #0
 9f0:	1affffe2 	bne	980 <printf+0x5c>
    }
  }
}
 9f4:	e24bd018 	sub	sp, fp, #24
 9f8:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9fc:	e28dd00c 	add	sp, sp, #12
 a00:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a04:	e3a03000 	mov	r3, #0
 a08:	e3a02010 	mov	r2, #16
 a0c:	e4981004 	ldr	r1, [r8], #4
 a10:	e1a00007 	mov	r0, r7
 a14:	ebffff7f 	bl	818 <printint>
      state = 0;
 a18:	e3a06000 	mov	r6, #0
 a1c:	eaffffd4 	b	974 <printf+0x50>
        s = (char*)*ap;
 a20:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a24:	e3540000 	cmp	r4, #0
 a28:	0a000021 	beq	ab4 <printf+0x190>
        while(*s != 0){
 a2c:	e5d46000 	ldrb	r6, [r4]
 a30:	e3560000 	cmp	r6, #0
 a34:	0affffce 	beq	974 <printf+0x50>
  write(fd, &c, 1);
 a38:	e3a02001 	mov	r2, #1
 a3c:	e24b101d 	sub	r1, fp, #29
 a40:	e1a00007 	mov	r0, r7
 a44:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 a48:	ebfffe88 	bl	470 <write>
        while(*s != 0){
 a4c:	e5f46001 	ldrb	r6, [r4, #1]!
 a50:	e3560000 	cmp	r6, #0
 a54:	1afffff7 	bne	a38 <printf+0x114>
 a58:	eaffffc5 	b	974 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a5c:	e3a03001 	mov	r3, #1
 a60:	e3a0200a 	mov	r2, #10
 a64:	e4981004 	ldr	r1, [r8], #4
 a68:	e1a00007 	mov	r0, r7
 a6c:	ebffff69 	bl	818 <printint>
      state = 0;
 a70:	e3a06000 	mov	r6, #0
 a74:	eaffffbe 	b	974 <printf+0x50>
 a78:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a7c:	e3a02001 	mov	r2, #1
 a80:	e1a00007 	mov	r0, r7
 a84:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 a88:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 a8c:	ebfffe77 	bl	470 <write>
 a90:	eaffffb7 	b	974 <printf+0x50>
        putc(fd, *ap);
 a94:	e4983004 	ldr	r3, [r8], #4
 a98:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a9c:	e3a02001 	mov	r2, #1
 aa0:	e1a00007 	mov	r0, r7
      state = 0;
 aa4:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 aa8:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 aac:	ebfffe6f 	bl	470 <write>
 ab0:	eaffffaf 	b	974 <printf+0x50>
          s = "(null)";
 ab4:	e3004c84 	movw	r4, #3204	; 0xc84
        while(*s != 0){
 ab8:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 abc:	e3404000 	movt	r4, #0
 ac0:	eaffffdc 	b	a38 <printf+0x114>

00000ac4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac4:	e300cc8c 	movw	ip, #3212	; 0xc8c
 ac8:	e340c000 	movt	ip, #0
{
 acc:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 ad0:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad4:	e59c3000 	ldr	r3, [ip]
{
 ad8:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 adc:	e1530001 	cmp	r3, r1
 ae0:	e5932000 	ldr	r2, [r3]
 ae4:	2a000017 	bcs	b48 <free+0x84>
 ae8:	e1510002 	cmp	r1, r2
 aec:	3a000001 	bcc	af8 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af0:	e1530002 	cmp	r3, r2
 af4:	3a000017 	bcc	b58 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 af8:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 afc:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b00:	e081418e 	add	r4, r1, lr, lsl #3
 b04:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b08:	05922004 	ldreq	r2, [r2, #4]
 b0c:	0082e00e 	addeq	lr, r2, lr
 b10:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b14:	05932000 	ldreq	r2, [r3]
 b18:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b1c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b20:	e5932004 	ldr	r2, [r3, #4]
 b24:	e083e182 	add	lr, r3, r2, lsl #3
 b28:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b2c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b30:	05101004 	ldreq	r1, [r0, #-4]
 b34:	00812002 	addeq	r2, r1, r2
 b38:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b3c:	05102008 	ldreq	r2, [r0, #-8]
 b40:	05832000 	streq	r2, [r3]
}
 b44:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b48:	e1530002 	cmp	r3, r2
 b4c:	3a000001 	bcc	b58 <free+0x94>
 b50:	e1510002 	cmp	r1, r2
 b54:	3affffe7 	bcc	af8 <free+0x34>
{
 b58:	e1a03002 	mov	r3, r2
 b5c:	eaffffde 	b	adc <free+0x18>

00000b60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b60:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b64:	e3007c8c 	movw	r7, #3212	; 0xc8c
 b68:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b6c:	e2804007 	add	r4, r0, #7
{
 b70:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b74:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b78:	e1a041a4 	lsr	r4, r4, #3
 b7c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b80:	e3530000 	cmp	r3, #0
 b84:	0a000027 	beq	c28 <malloc+0xc8>
 b88:	e5930000 	ldr	r0, [r3]
 b8c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b90:	e1540002 	cmp	r4, r2
 b94:	9a000019 	bls	c00 <malloc+0xa0>
 b98:	e3540a01 	cmp	r4, #4096	; 0x1000
 b9c:	21a05004 	movcs	r5, r4
 ba0:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ba4:	e1a06185 	lsl	r6, r5, #3
 ba8:	ea000003 	b	bbc <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bac:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 bb0:	e5902004 	ldr	r2, [r0, #4]
 bb4:	e1520004 	cmp	r2, r4
 bb8:	2a000010 	bcs	c00 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bbc:	e5972000 	ldr	r2, [r7]
 bc0:	e1a03000 	mov	r3, r0
 bc4:	e1520000 	cmp	r2, r0
 bc8:	1afffff7 	bne	bac <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 bcc:	e1a00006 	mov	r0, r6
 bd0:	ebfffecf 	bl	714 <sbrk>
 bd4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 bd8:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 bdc:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 be0:	0a000004 	beq	bf8 <malloc+0x98>
  hp->s.size = nu;
 be4:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 be8:	ebffffb5 	bl	ac4 <free>
  return freep;
 bec:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 bf0:	e3530000 	cmp	r3, #0
 bf4:	1affffec 	bne	bac <malloc+0x4c>
        return 0;
 bf8:	e3a00000 	mov	r0, #0
  }
}
 bfc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 c00:	e1540002 	cmp	r4, r2
      freep = prevp;
 c04:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c08:	10422004 	subne	r2, r2, r4
 c0c:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c10:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c14:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c18:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c1c:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c20:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c24:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c28:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c2c:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c30:	e5870000 	str	r0, [r7]
 c34:	e5870004 	str	r0, [r7, #4]
 c38:	eaffffd6 	b	b98 <malloc+0x38>
