
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char **argv)
{
  int i;

  if(argc < 1){
   0:	e3500000 	cmp	r0, #0
{
   4:	e92d4830 	push	{r4, r5, fp, lr}
   8:	e28db00c 	add	fp, sp, #12
  if(argc < 1){
   c:	da000009 	ble	38 <main+0x38>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  10:	e3500001 	cmp	r0, #1
  14:	10815100 	addne	r5, r1, r0, lsl #2
  18:	12814004 	addne	r4, r1, #4
  1c:	0a000004 	beq	34 <main+0x34>
    kill(atoi(argv[i]));
  20:	e4940004 	ldr	r0, [r4], #4
  24:	eb000081 	bl	230 <atoi>
  28:	eb0000fa 	bl	418 <kill>
  for(i=1; i<argc; i++)
  2c:	e1540005 	cmp	r4, r5
  30:	1afffffa 	bne	20 <main+0x20>
  exit();
  34:	eb0000a9 	bl	2e0 <exit>
    printf(2, "usage: kill pid...\n");
  38:	e3001b7c 	movw	r1, #2940	; 0xb7c
  3c:	e3a00002 	mov	r0, #2
  40:	e3401000 	movt	r1, #0
  44:	eb000206 	bl	864 <printf>
    exit();
  48:	eb0000a4 	bl	2e0 <exit>

0000004c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  50:	e2402001 	sub	r2, r0, #1
  54:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  58:	e4d13001 	ldrb	r3, [r1], #1
  5c:	e3530000 	cmp	r3, #0
  60:	e5e23001 	strb	r3, [r2, #1]!
  64:	1afffffb 	bne	58 <strcpy+0xc>
    ;
  return os;
}
  68:	e28bd000 	add	sp, fp, #0
  6c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  70:	e12fff1e 	bx	lr

00000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  74:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  78:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  7c:	e5d03000 	ldrb	r3, [r0]
  80:	e5d12000 	ldrb	r2, [r1]
  84:	e3530000 	cmp	r3, #0
  88:	1a000004 	bne	a0 <strcmp+0x2c>
  8c:	ea000005 	b	a8 <strcmp+0x34>
  90:	e5f03001 	ldrb	r3, [r0, #1]!
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e3530000 	cmp	r3, #0
  9c:	0a000001 	beq	a8 <strcmp+0x34>
  a0:	e1530002 	cmp	r3, r2
  a4:	0afffff9 	beq	90 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a8:	e0430002 	sub	r0, r3, r2
  ac:	e28bd000 	add	sp, fp, #0
  b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  b4:	e12fff1e 	bx	lr

000000b8 <strlen>:

uint
strlen(char *s)
{
  b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  bc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  c0:	e5d03000 	ldrb	r3, [r0]
  c4:	e3530000 	cmp	r3, #0
  c8:	01a00003 	moveq	r0, r3
  cc:	0a000006 	beq	ec <strlen+0x34>
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a03000 	mov	r3, #0
  d8:	e5f21001 	ldrb	r1, [r2, #1]!
  dc:	e2833001 	add	r3, r3, #1
  e0:	e3510000 	cmp	r1, #0
  e4:	e1a00003 	mov	r0, r3
  e8:	1afffffa 	bne	d8 <strlen+0x20>
    ;
  return n;
}
  ec:	e28bd000 	add	sp, fp, #0
  f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f4:	e12fff1e 	bx	lr

000000f8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
  f8:	e3520000 	cmp	r2, #0
{
  fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 100:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 104:	0a000004 	beq	11c <memset+0x24>
 108:	e6ef1071 	uxtb	r1, r1
 10c:	e0802002 	add	r2, r0, r2
 110:	e4c01001 	strb	r1, [r0], #1
 114:	e1520000 	cmp	r2, r0
 118:	1afffffc 	bne	110 <memset+0x18>
  return (void *)p;
}
 11c:	e28bd000 	add	sp, fp, #0
 120:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 124:	e12fff1e 	bx	lr

00000128 <strchr>:

char*
strchr(const char *s, char c)
{
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 130:	e5d02000 	ldrb	r2, [r0]
 134:	e3520000 	cmp	r2, #0
 138:	0a00000b 	beq	16c <strchr+0x44>
    if(*s == c)
 13c:	e1510002 	cmp	r1, r2
 140:	1a000002 	bne	150 <strchr+0x28>
 144:	ea000005 	b	160 <strchr+0x38>
 148:	e1530001 	cmp	r3, r1
 14c:	0a000003 	beq	160 <strchr+0x38>
  for(; *s; s++)
 150:	e5f03001 	ldrb	r3, [r0, #1]!
 154:	e3530000 	cmp	r3, #0
 158:	1afffffa 	bne	148 <strchr+0x20>
      return (char*)s;
  return 0;
 15c:	e1a00003 	mov	r0, r3
}
 160:	e28bd000 	add	sp, fp, #0
 164:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 168:	e12fff1e 	bx	lr
  return 0;
 16c:	e1a00002 	mov	r0, r2
 170:	eafffffa 	b	160 <strchr+0x38>

00000174 <gets>:

char*
gets(char *buf, int max)
{
 174:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 178:	e1a03000 	mov	r3, r0
 17c:	e28db014 	add	fp, sp, #20
 180:	e1a07000 	mov	r7, r0
 184:	e24dd008 	sub	sp, sp, #8
 188:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18c:	e3a04000 	mov	r4, #0
 190:	ea000008 	b	1b8 <gets+0x44>
    cc = read(0, &c, 1);
 194:	eb000078 	bl	37c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 198:	e1a03005 	mov	r3, r5
    if(cc < 1)
 19c:	e3500000 	cmp	r0, #0
 1a0:	da00000b 	ble	1d4 <gets+0x60>
    buf[i++] = c;
 1a4:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1a8:	e352000d 	cmp	r2, #13
 1ac:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1b0:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1b4:	0a00000b 	beq	1e8 <gets+0x74>
    cc = read(0, &c, 1);
 1b8:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1bc:	e0844002 	add	r4, r4, r2
 1c0:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1c4:	e24b1015 	sub	r1, fp, #21
 1c8:	e3a00000 	mov	r0, #0
 1cc:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1d0:	baffffef 	blt	194 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d4:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1d8:	e3a03000 	mov	r3, #0
 1dc:	e5c53000 	strb	r3, [r5]
}
 1e0:	e24bd014 	sub	sp, fp, #20
 1e4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1e8:	e0875004 	add	r5, r7, r4
 1ec:	eafffff8 	b	1d4 <gets+0x60>

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	e92d4830 	push	{r4, r5, fp, lr}
 1f4:	e1a04001 	mov	r4, r1
 1f8:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fc:	e3a01000 	mov	r1, #0
 200:	eb00009e 	bl	480 <open>
  if(fd < 0)
 204:	e2505000 	subs	r5, r0, #0
 208:	ba000006 	blt	228 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 20c:	e1a01004 	mov	r1, r4
 210:	eb0000c1 	bl	51c <fstat>
 214:	e1a04000 	mov	r4, r0
  close(fd);
 218:	e1a00005 	mov	r0, r5
 21c:	eb000070 	bl	3e4 <close>
  return r;
}
 220:	e1a00004 	mov	r0, r4
 224:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 228:	e3e04000 	mvn	r4, #0
 22c:	eafffffb 	b	220 <stat+0x30>

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 234:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 238:	e5d02000 	ldrb	r2, [r0]
 23c:	e2423030 	sub	r3, r2, #48	; 0x30
 240:	e3530009 	cmp	r3, #9
  n = 0;
 244:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 248:	8a000006 	bhi	268 <atoi+0x38>
    n = n*10 + *s++ - '0';
 24c:	e3a0c00a 	mov	ip, #10
 250:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 254:	e5f02001 	ldrb	r2, [r0, #1]!
 258:	e2421030 	sub	r1, r2, #48	; 0x30
 25c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 260:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 264:	9afffff9 	bls	250 <atoi+0x20>
  return n;
}
 268:	e1a00003 	mov	r0, r3
 26c:	e28bd000 	add	sp, fp, #0
 270:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 274:	e12fff1e 	bx	lr

00000278 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 278:	e3520000 	cmp	r2, #0
{
 27c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 280:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 284:	da000005 	ble	2a0 <memmove+0x28>
 288:	e0812002 	add	r2, r1, r2
 28c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 290:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 294:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 298:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 29c:	1afffffb 	bne	290 <memmove+0x18>
  return vdst;
}
 2a0:	e28bd000 	add	sp, fp, #0
 2a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a8:	e12fff1e 	bx	lr

000002ac <fork>:
 2ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2c0:	e3a00001 	mov	r0, #1
 2c4:	ef000040 	svc	0x00000040
 2c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2dc:	e12fff1e 	bx	lr

000002e0 <exit>:
 2e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f4:	e3a00002 	mov	r0, #2
 2f8:	ef000040 	svc	0x00000040
 2fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 300:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 304:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 308:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 30c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 310:	e12fff1e 	bx	lr

00000314 <wait>:
 314:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 318:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 31c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 320:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 324:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 328:	e3a00003 	mov	r0, #3
 32c:	ef000040 	svc	0x00000040
 330:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 334:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 338:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 33c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 340:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 344:	e12fff1e 	bx	lr

00000348 <pipe>:
 348:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 34c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 350:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 354:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 358:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 35c:	e3a00004 	mov	r0, #4
 360:	ef000040 	svc	0x00000040
 364:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 368:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 36c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 370:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 374:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 378:	e12fff1e 	bx	lr

0000037c <read>:
 37c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 380:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 384:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 388:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 38c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 390:	e3a00005 	mov	r0, #5
 394:	ef000040 	svc	0x00000040
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3ac:	e12fff1e 	bx	lr

000003b0 <write>:
 3b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c4:	e3a00010 	mov	r0, #16
 3c8:	ef000040 	svc	0x00000040
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e0:	e12fff1e 	bx	lr

000003e4 <close>:
 3e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f8:	e3a00015 	mov	r0, #21
 3fc:	ef000040 	svc	0x00000040
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 40c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 410:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 414:	e12fff1e 	bx	lr

00000418 <kill>:
 418:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 41c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 420:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 424:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 428:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 42c:	e3a00006 	mov	r0, #6
 430:	ef000040 	svc	0x00000040
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 440:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 444:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 448:	e12fff1e 	bx	lr

0000044c <exec>:
 44c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 450:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 454:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 458:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 45c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 460:	e3a00007 	mov	r0, #7
 464:	ef000040 	svc	0x00000040
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 474:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 478:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 47c:	e12fff1e 	bx	lr

00000480 <open>:
 480:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 484:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 488:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 48c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 490:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 494:	e3a0000f 	mov	r0, #15
 498:	ef000040 	svc	0x00000040
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b0:	e12fff1e 	bx	lr

000004b4 <mknod>:
 4b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c8:	e3a00011 	mov	r0, #17
 4cc:	ef000040 	svc	0x00000040
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e4:	e12fff1e 	bx	lr

000004e8 <unlink>:
 4e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4fc:	e3a00012 	mov	r0, #18
 500:	ef000040 	svc	0x00000040
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 510:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 514:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 518:	e12fff1e 	bx	lr

0000051c <fstat>:
 51c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 520:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 524:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 528:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 52c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 530:	e3a00008 	mov	r0, #8
 534:	ef000040 	svc	0x00000040
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 544:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 548:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 54c:	e12fff1e 	bx	lr

00000550 <link>:
 550:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 554:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 558:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 55c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 560:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 564:	e3a00013 	mov	r0, #19
 568:	ef000040 	svc	0x00000040
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 578:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 57c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 580:	e12fff1e 	bx	lr

00000584 <mkdir>:
 584:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 588:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 58c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 590:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 594:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 598:	e3a00014 	mov	r0, #20
 59c:	ef000040 	svc	0x00000040
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b4:	e12fff1e 	bx	lr

000005b8 <chdir>:
 5b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5cc:	e3a00009 	mov	r0, #9
 5d0:	ef000040 	svc	0x00000040
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e8:	e12fff1e 	bx	lr

000005ec <dup>:
 5ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 600:	e3a0000a 	mov	r0, #10
 604:	ef000040 	svc	0x00000040
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 614:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 618:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 61c:	e12fff1e 	bx	lr

00000620 <getpid>:
 620:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 624:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 628:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 62c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 630:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 634:	e3a0000b 	mov	r0, #11
 638:	ef000040 	svc	0x00000040
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 648:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 64c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 650:	e12fff1e 	bx	lr

00000654 <sbrk>:
 654:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 658:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 65c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 660:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 664:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 668:	e3a0000c 	mov	r0, #12
 66c:	ef000040 	svc	0x00000040
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 67c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 680:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 684:	e12fff1e 	bx	lr

00000688 <sleep>:
 688:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 68c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 690:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 694:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 698:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 69c:	e3a0000d 	mov	r0, #13
 6a0:	ef000040 	svc	0x00000040
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b8:	e12fff1e 	bx	lr

000006bc <uptime>:
 6bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d0:	e3a0000e 	mov	r0, #14
 6d4:	ef000040 	svc	0x00000040
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ec:	e12fff1e 	bx	lr

000006f0 <memfree>:
 6f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 700:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 704:	e3a00016 	mov	r0, #22
 708:	ef000040 	svc	0x00000040
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 718:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 71c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 720:	e12fff1e 	bx	lr

00000724 <setTraceFlag>:
 724:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 728:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 72c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 730:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 734:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 738:	e3a00017 	mov	r0, #23
 73c:	ef000040 	svc	0x00000040
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 748:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 74c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 750:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 754:	e12fff1e 	bx	lr

00000758 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 758:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 75c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 760:	e013afa1 	ands	sl, r3, r1, lsr #31
 764:	e24b4034 	sub	r4, fp, #52	; 0x34
 768:	e3009b90 	movw	r9, #2960	; 0xb90
    neg = 1;
    x = -xx;
 76c:	1261e000 	rsbne	lr, r1, #0
 770:	e3409000 	movt	r9, #0
{
 774:	e1a05000 	mov	r5, r0
    neg = 1;
 778:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 77c:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 780:	e3a08000 	mov	r8, #0
  b = base;
 784:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 788:	e3a06001 	mov	r6, #1
{
 78c:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 790:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 794:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 798:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 79c:	e1a0033e 	lsr	r0, lr, r3
 7a0:	e2000001 	and	r0, r0, #1
 7a4:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7a8:	e1520001 	cmp	r2, r1
            r = r - d;
 7ac:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7b0:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7b4:	e2533001 	subs	r3, r3, #1
 7b8:	2afffff7 	bcs	79c <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7bc:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7c0:	e35c0000 	cmp	ip, #0
 7c4:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7c8:	e2883001 	add	r3, r8, #1
 7cc:	e7d91001 	ldrb	r1, [r9, r1]
 7d0:	e4c71001 	strb	r1, [r7], #1
 7d4:	11a08003 	movne	r8, r3
 7d8:	1affffec 	bne	790 <printint+0x38>
  if(neg)
 7dc:	e35a0000 	cmp	sl, #0
 7e0:	0a000004 	beq	7f8 <printint+0xa0>
    buf[i++] = '-';
 7e4:	e24b2024 	sub	r2, fp, #36	; 0x24
 7e8:	e3a0102d 	mov	r1, #45	; 0x2d
 7ec:	e0822003 	add	r2, r2, r3
 7f0:	e2883002 	add	r3, r8, #2
 7f4:	e5421010 	strb	r1, [r2, #-16]
 7f8:	e0846003 	add	r6, r4, r3
 7fc:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 800:	e3a02001 	mov	r2, #1
 804:	e24b1035 	sub	r1, fp, #53	; 0x35
 808:	e1a00005 	mov	r0, r5
 80c:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 810:	ebfffee6 	bl	3b0 <write>

  while(--i >= 0)
 814:	e1540006 	cmp	r4, r6
 818:	1afffff7 	bne	7fc <printint+0xa4>
    putc(fd, buf[i]);
}
 81c:	e24bd020 	sub	sp, fp, #32
 820:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000824 <div>:
{
 824:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 828:	e3a02000 	mov	r2, #0
{
 82c:	e28db008 	add	fp, sp, #8
 830:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 834:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 838:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 83c:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 840:	e1a0c33e 	lsr	ip, lr, r3
 844:	e20cc001 	and	ip, ip, #1
 848:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 84c:	e1520001 	cmp	r2, r1
            r = r - d;
 850:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 854:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 858:	e2533001 	subs	r3, r3, #1
 85c:	38bd8810 	popcc	{r4, fp, pc}
 860:	eafffff6 	b	840 <div+0x1c>

00000864 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 864:	e92d000e 	push	{r1, r2, r3}
 868:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 86c:	e28db018 	add	fp, sp, #24
 870:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 874:	e59b5004 	ldr	r5, [fp, #4]
 878:	e5d54000 	ldrb	r4, [r5]
 87c:	e3540000 	cmp	r4, #0
 880:	0a00002b 	beq	934 <printf+0xd0>
 884:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 888:	e28b8008 	add	r8, fp, #8
  state = 0;
 88c:	e3a06000 	mov	r6, #0
 890:	ea00000a 	b	8c0 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 894:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 898:	01a06004 	moveq	r6, r4
      if(c == '%'){
 89c:	0a000004 	beq	8b4 <printf+0x50>
 8a0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 8a4:	e3a02001 	mov	r2, #1
 8a8:	e1a00007 	mov	r0, r7
 8ac:	e5614006 	strb	r4, [r1, #-6]!
 8b0:	ebfffebe 	bl	3b0 <write>
  for(i = 0; fmt[i]; i++){
 8b4:	e5f54001 	ldrb	r4, [r5, #1]!
 8b8:	e3540000 	cmp	r4, #0
 8bc:	0a00001c 	beq	934 <printf+0xd0>
    if(state == 0){
 8c0:	e3560000 	cmp	r6, #0
 8c4:	0afffff2 	beq	894 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8c8:	e3560025 	cmp	r6, #37	; 0x25
 8cc:	1afffff8 	bne	8b4 <printf+0x50>
      if(c == 'd'){
 8d0:	e3540064 	cmp	r4, #100	; 0x64
 8d4:	0a000030 	beq	99c <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8d8:	e20430f7 	and	r3, r4, #247	; 0xf7
 8dc:	e3530070 	cmp	r3, #112	; 0x70
 8e0:	0a000017 	beq	944 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8e4:	e3540073 	cmp	r4, #115	; 0x73
 8e8:	0a00001c 	beq	960 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8ec:	e3540063 	cmp	r4, #99	; 0x63
 8f0:	0a000037 	beq	9d4 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8f4:	e3540025 	cmp	r4, #37	; 0x25
 8f8:	0a00002e 	beq	9b8 <printf+0x154>
  write(fd, &c, 1);
 8fc:	e3a02001 	mov	r2, #1
 900:	e24b1019 	sub	r1, fp, #25
 904:	e1a00007 	mov	r0, r7
 908:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 90c:	ebfffea7 	bl	3b0 <write>
 910:	e3a02001 	mov	r2, #1
 914:	e24b101a 	sub	r1, fp, #26
 918:	e1a00007 	mov	r0, r7
 91c:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 920:	ebfffea2 	bl	3b0 <write>
  for(i = 0; fmt[i]; i++){
 924:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 928:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 92c:	e3540000 	cmp	r4, #0
 930:	1affffe2 	bne	8c0 <printf+0x5c>
    }
  }
}
 934:	e24bd018 	sub	sp, fp, #24
 938:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 93c:	e28dd00c 	add	sp, sp, #12
 940:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 944:	e3a03000 	mov	r3, #0
 948:	e3a02010 	mov	r2, #16
 94c:	e4981004 	ldr	r1, [r8], #4
 950:	e1a00007 	mov	r0, r7
 954:	ebffff7f 	bl	758 <printint>
      state = 0;
 958:	e3a06000 	mov	r6, #0
 95c:	eaffffd4 	b	8b4 <printf+0x50>
        s = (char*)*ap;
 960:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 964:	e3540000 	cmp	r4, #0
 968:	0a000021 	beq	9f4 <printf+0x190>
        while(*s != 0){
 96c:	e5d46000 	ldrb	r6, [r4]
 970:	e3560000 	cmp	r6, #0
 974:	0affffce 	beq	8b4 <printf+0x50>
  write(fd, &c, 1);
 978:	e3a02001 	mov	r2, #1
 97c:	e24b101d 	sub	r1, fp, #29
 980:	e1a00007 	mov	r0, r7
 984:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 988:	ebfffe88 	bl	3b0 <write>
        while(*s != 0){
 98c:	e5f46001 	ldrb	r6, [r4, #1]!
 990:	e3560000 	cmp	r6, #0
 994:	1afffff7 	bne	978 <printf+0x114>
 998:	eaffffc5 	b	8b4 <printf+0x50>
        printint(fd, *ap, 10, 1);
 99c:	e3a03001 	mov	r3, #1
 9a0:	e3a0200a 	mov	r2, #10
 9a4:	e4981004 	ldr	r1, [r8], #4
 9a8:	e1a00007 	mov	r0, r7
 9ac:	ebffff69 	bl	758 <printint>
      state = 0;
 9b0:	e3a06000 	mov	r6, #0
 9b4:	eaffffbe 	b	8b4 <printf+0x50>
 9b8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e1a00007 	mov	r0, r7
 9c4:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9c8:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9cc:	ebfffe77 	bl	3b0 <write>
 9d0:	eaffffb7 	b	8b4 <printf+0x50>
        putc(fd, *ap);
 9d4:	e4983004 	ldr	r3, [r8], #4
 9d8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9dc:	e3a02001 	mov	r2, #1
 9e0:	e1a00007 	mov	r0, r7
      state = 0;
 9e4:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9e8:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9ec:	ebfffe6f 	bl	3b0 <write>
 9f0:	eaffffaf 	b	8b4 <printf+0x50>
          s = "(null)";
 9f4:	e3004ba4 	movw	r4, #2980	; 0xba4
        while(*s != 0){
 9f8:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 9fc:	e3404000 	movt	r4, #0
 a00:	eaffffdc 	b	978 <printf+0x114>

00000a04 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a04:	e300cbac 	movw	ip, #2988	; 0xbac
 a08:	e340c000 	movt	ip, #0
{
 a0c:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a10:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a14:	e59c3000 	ldr	r3, [ip]
{
 a18:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	e1530001 	cmp	r3, r1
 a20:	e5932000 	ldr	r2, [r3]
 a24:	2a000017 	bcs	a88 <free+0x84>
 a28:	e1510002 	cmp	r1, r2
 a2c:	3a000001 	bcc	a38 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a30:	e1530002 	cmp	r3, r2
 a34:	3a000017 	bcc	a98 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a38:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a3c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a40:	e081418e 	add	r4, r1, lr, lsl #3
 a44:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a48:	05922004 	ldreq	r2, [r2, #4]
 a4c:	0082e00e 	addeq	lr, r2, lr
 a50:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a54:	05932000 	ldreq	r2, [r3]
 a58:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a5c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a60:	e5932004 	ldr	r2, [r3, #4]
 a64:	e083e182 	add	lr, r3, r2, lsl #3
 a68:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a6c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a70:	05101004 	ldreq	r1, [r0, #-4]
 a74:	00812002 	addeq	r2, r1, r2
 a78:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a7c:	05102008 	ldreq	r2, [r0, #-8]
 a80:	05832000 	streq	r2, [r3]
}
 a84:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a88:	e1530002 	cmp	r3, r2
 a8c:	3a000001 	bcc	a98 <free+0x94>
 a90:	e1510002 	cmp	r1, r2
 a94:	3affffe7 	bcc	a38 <free+0x34>
{
 a98:	e1a03002 	mov	r3, r2
 a9c:	eaffffde 	b	a1c <free+0x18>

00000aa0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 aa0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 aa4:	e3007bac 	movw	r7, #2988	; 0xbac
 aa8:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aac:	e2804007 	add	r4, r0, #7
{
 ab0:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 ab4:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab8:	e1a041a4 	lsr	r4, r4, #3
 abc:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ac0:	e3530000 	cmp	r3, #0
 ac4:	0a000027 	beq	b68 <malloc+0xc8>
 ac8:	e5930000 	ldr	r0, [r3]
 acc:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ad0:	e1540002 	cmp	r4, r2
 ad4:	9a000019 	bls	b40 <malloc+0xa0>
 ad8:	e3540a01 	cmp	r4, #4096	; 0x1000
 adc:	21a05004 	movcs	r5, r4
 ae0:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ae4:	e1a06185 	lsl	r6, r5, #3
 ae8:	ea000003 	b	afc <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aec:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 af0:	e5902004 	ldr	r2, [r0, #4]
 af4:	e1520004 	cmp	r2, r4
 af8:	2a000010 	bcs	b40 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 afc:	e5972000 	ldr	r2, [r7]
 b00:	e1a03000 	mov	r3, r0
 b04:	e1520000 	cmp	r2, r0
 b08:	1afffff7 	bne	aec <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b0c:	e1a00006 	mov	r0, r6
 b10:	ebfffecf 	bl	654 <sbrk>
 b14:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b18:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b1c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b20:	0a000004 	beq	b38 <malloc+0x98>
  hp->s.size = nu;
 b24:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b28:	ebffffb5 	bl	a04 <free>
  return freep;
 b2c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b30:	e3530000 	cmp	r3, #0
 b34:	1affffec 	bne	aec <malloc+0x4c>
        return 0;
 b38:	e3a00000 	mov	r0, #0
  }
}
 b3c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b40:	e1540002 	cmp	r4, r2
      freep = prevp;
 b44:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b48:	10422004 	subne	r2, r2, r4
 b4c:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b50:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b54:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b58:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b5c:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b60:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b64:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b68:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b6c:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b70:	e5870000 	str	r0, [r7]
 b74:	e5870004 	str	r0, [r7, #4]
 b78:	eaffffd6 	b	ad8 <malloc+0x38>
