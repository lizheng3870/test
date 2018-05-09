
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	e28db014 	add	fp, sp, #20
  for(i = 1; i < argc; i++)
   c:	da000013 	ble	60 <main+0x60>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  10:	e3007b94 	movw	r7, #2964	; 0xb94
  14:	e3006b98 	movw	r6, #2968	; 0xb98
  18:	e0815100 	add	r5, r1, r0, lsl #2
  1c:	e2814004 	add	r4, r1, #4
  20:	e3407000 	movt	r7, #0
  24:	e3406000 	movt	r6, #0
  28:	ea000003 	b	3c <main+0x3c>
  2c:	e1a03007 	mov	r3, r7
  30:	e1a01006 	mov	r1, r6
  34:	e3a00001 	mov	r0, #1
  38:	eb00020f 	bl	87c <printf>
  3c:	e4942004 	ldr	r2, [r4], #4
  40:	e1540005 	cmp	r4, r5
  44:	1afffff8 	bne	2c <main+0x2c>
  48:	e3003ba0 	movw	r3, #2976	; 0xba0
  4c:	e3001b98 	movw	r1, #2968	; 0xb98
  50:	e3403000 	movt	r3, #0
  54:	e3401000 	movt	r1, #0
  58:	e3a00001 	mov	r0, #1
  5c:	eb000206 	bl	87c <printf>
  exit();
  60:	eb0000a4 	bl	2f8 <exit>

00000064 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  68:	e2402001 	sub	r2, r0, #1
  6c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  70:	e4d13001 	ldrb	r3, [r1], #1
  74:	e3530000 	cmp	r3, #0
  78:	e5e23001 	strb	r3, [r2, #1]!
  7c:	1afffffb 	bne	70 <strcpy+0xc>
    ;
  return os;
}
  80:	e28bd000 	add	sp, fp, #0
  84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  88:	e12fff1e 	bx	lr

0000008c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  90:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  94:	e5d03000 	ldrb	r3, [r0]
  98:	e5d12000 	ldrb	r2, [r1]
  9c:	e3530000 	cmp	r3, #0
  a0:	1a000004 	bne	b8 <strcmp+0x2c>
  a4:	ea000005 	b	c0 <strcmp+0x34>
  a8:	e5f03001 	ldrb	r3, [r0, #1]!
  ac:	e5f12001 	ldrb	r2, [r1, #1]!
  b0:	e3530000 	cmp	r3, #0
  b4:	0a000001 	beq	c0 <strcmp+0x34>
  b8:	e1530002 	cmp	r3, r2
  bc:	0afffff9 	beq	a8 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c0:	e0430002 	sub	r0, r3, r2
  c4:	e28bd000 	add	sp, fp, #0
  c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  cc:	e12fff1e 	bx	lr

000000d0 <strlen>:

uint
strlen(char *s)
{
  d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  d8:	e5d03000 	ldrb	r3, [r0]
  dc:	e3530000 	cmp	r3, #0
  e0:	01a00003 	moveq	r0, r3
  e4:	0a000006 	beq	104 <strlen+0x34>
  e8:	e1a02000 	mov	r2, r0
  ec:	e3a03000 	mov	r3, #0
  f0:	e5f21001 	ldrb	r1, [r2, #1]!
  f4:	e2833001 	add	r3, r3, #1
  f8:	e3510000 	cmp	r1, #0
  fc:	e1a00003 	mov	r0, r3
 100:	1afffffa 	bne	f0 <strlen+0x20>
    ;
  return n;
}
 104:	e28bd000 	add	sp, fp, #0
 108:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 10c:	e12fff1e 	bx	lr

00000110 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 110:	e3520000 	cmp	r2, #0
{
 114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 118:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 11c:	0a000004 	beq	134 <memset+0x24>
 120:	e6ef1071 	uxtb	r1, r1
 124:	e0802002 	add	r2, r0, r2
 128:	e4c01001 	strb	r1, [r0], #1
 12c:	e1520000 	cmp	r2, r0
 130:	1afffffc 	bne	128 <memset+0x18>
  return (void *)p;
}
 134:	e28bd000 	add	sp, fp, #0
 138:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 13c:	e12fff1e 	bx	lr

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 144:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 148:	e5d02000 	ldrb	r2, [r0]
 14c:	e3520000 	cmp	r2, #0
 150:	0a00000b 	beq	184 <strchr+0x44>
    if(*s == c)
 154:	e1510002 	cmp	r1, r2
 158:	1a000002 	bne	168 <strchr+0x28>
 15c:	ea000005 	b	178 <strchr+0x38>
 160:	e1530001 	cmp	r3, r1
 164:	0a000003 	beq	178 <strchr+0x38>
  for(; *s; s++)
 168:	e5f03001 	ldrb	r3, [r0, #1]!
 16c:	e3530000 	cmp	r3, #0
 170:	1afffffa 	bne	160 <strchr+0x20>
      return (char*)s;
  return 0;
 174:	e1a00003 	mov	r0, r3
}
 178:	e28bd000 	add	sp, fp, #0
 17c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 180:	e12fff1e 	bx	lr
  return 0;
 184:	e1a00002 	mov	r0, r2
 188:	eafffffa 	b	178 <strchr+0x38>

0000018c <gets>:

char*
gets(char *buf, int max)
{
 18c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 190:	e1a03000 	mov	r3, r0
 194:	e28db014 	add	fp, sp, #20
 198:	e1a07000 	mov	r7, r0
 19c:	e24dd008 	sub	sp, sp, #8
 1a0:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	e3a04000 	mov	r4, #0
 1a8:	ea000008 	b	1d0 <gets+0x44>
    cc = read(0, &c, 1);
 1ac:	eb000078 	bl	394 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1b0:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1b4:	e3500000 	cmp	r0, #0
 1b8:	da00000b 	ble	1ec <gets+0x60>
    buf[i++] = c;
 1bc:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1c0:	e352000d 	cmp	r2, #13
 1c4:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1c8:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1cc:	0a00000b 	beq	200 <gets+0x74>
    cc = read(0, &c, 1);
 1d0:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1d4:	e0844002 	add	r4, r4, r2
 1d8:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1dc:	e24b1015 	sub	r1, fp, #21
 1e0:	e3a00000 	mov	r0, #0
 1e4:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1e8:	baffffef 	blt	1ac <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1ec:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1f0:	e3a03000 	mov	r3, #0
 1f4:	e5c53000 	strb	r3, [r5]
}
 1f8:	e24bd014 	sub	sp, fp, #20
 1fc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 200:	e0875004 	add	r5, r7, r4
 204:	eafffff8 	b	1ec <gets+0x60>

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	e92d4830 	push	{r4, r5, fp, lr}
 20c:	e1a04001 	mov	r4, r1
 210:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 214:	e3a01000 	mov	r1, #0
 218:	eb00009e 	bl	498 <open>
  if(fd < 0)
 21c:	e2505000 	subs	r5, r0, #0
 220:	ba000006 	blt	240 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 224:	e1a01004 	mov	r1, r4
 228:	eb0000c1 	bl	534 <fstat>
 22c:	e1a04000 	mov	r4, r0
  close(fd);
 230:	e1a00005 	mov	r0, r5
 234:	eb000070 	bl	3fc <close>
  return r;
}
 238:	e1a00004 	mov	r0, r4
 23c:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 240:	e3e04000 	mvn	r4, #0
 244:	eafffffb 	b	238 <stat+0x30>

00000248 <atoi>:

int
atoi(const char *s)
{
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 250:	e5d02000 	ldrb	r2, [r0]
 254:	e2423030 	sub	r3, r2, #48	; 0x30
 258:	e3530009 	cmp	r3, #9
  n = 0;
 25c:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 260:	8a000006 	bhi	280 <atoi+0x38>
    n = n*10 + *s++ - '0';
 264:	e3a0c00a 	mov	ip, #10
 268:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 26c:	e5f02001 	ldrb	r2, [r0, #1]!
 270:	e2421030 	sub	r1, r2, #48	; 0x30
 274:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 278:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 27c:	9afffff9 	bls	268 <atoi+0x20>
  return n;
}
 280:	e1a00003 	mov	r0, r3
 284:	e28bd000 	add	sp, fp, #0
 288:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 28c:	e12fff1e 	bx	lr

00000290 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 290:	e3520000 	cmp	r2, #0
{
 294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 298:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 29c:	da000005 	ble	2b8 <memmove+0x28>
 2a0:	e0812002 	add	r2, r1, r2
 2a4:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2a8:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2ac:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2b0:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2b4:	1afffffb 	bne	2a8 <memmove+0x18>
  return vdst;
}
 2b8:	e28bd000 	add	sp, fp, #0
 2bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c0:	e12fff1e 	bx	lr

000002c4 <fork>:
 2c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2d8:	e3a00001 	mov	r0, #1
 2dc:	ef000040 	svc	0x00000040
 2e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2f4:	e12fff1e 	bx	lr

000002f8 <exit>:
 2f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 300:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 304:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 308:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 30c:	e3a00002 	mov	r0, #2
 310:	ef000040 	svc	0x00000040
 314:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 318:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 31c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 320:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 324:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 328:	e12fff1e 	bx	lr

0000032c <wait>:
 32c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 330:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 334:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 338:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 33c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 340:	e3a00003 	mov	r0, #3
 344:	ef000040 	svc	0x00000040
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 350:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 354:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 358:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <pipe>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00004 	mov	r0, #4
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <read>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00005 	mov	r0, #5
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <write>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00010 	mov	r0, #16
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <close>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00015 	mov	r0, #21
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <kill>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00006 	mov	r0, #6
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <exec>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00007 	mov	r0, #7
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <open>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a0000f 	mov	r0, #15
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <mknod>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00011 	mov	r0, #17
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <unlink>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00012 	mov	r0, #18
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <fstat>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00008 	mov	r0, #8
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <link>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00013 	mov	r0, #19
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <mkdir>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00014 	mov	r0, #20
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <chdir>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00009 	mov	r0, #9
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <dup>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a0000a 	mov	r0, #10
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <getpid>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a0000b 	mov	r0, #11
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <sbrk>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a0000c 	mov	r0, #12
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <sleep>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a0000d 	mov	r0, #13
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <uptime>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a0000e 	mov	r0, #14
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <memfree>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a00016 	mov	r0, #22
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <setTraceFlag>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a00017 	mov	r0, #23
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 774:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 778:	e013afa1 	ands	sl, r3, r1, lsr #31
 77c:	e24b4034 	sub	r4, fp, #52	; 0x34
 780:	e3009ba4 	movw	r9, #2980	; 0xba4
    neg = 1;
    x = -xx;
 784:	1261e000 	rsbne	lr, r1, #0
 788:	e3409000 	movt	r9, #0
{
 78c:	e1a05000 	mov	r5, r0
    neg = 1;
 790:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 794:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 798:	e3a08000 	mov	r8, #0
  b = base;
 79c:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 7a0:	e3a06001 	mov	r6, #1
{
 7a4:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 7a8:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 7ac:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7b0:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 7b4:	e1a0033e 	lsr	r0, lr, r3
 7b8:	e2000001 	and	r0, r0, #1
 7bc:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7c0:	e1520001 	cmp	r2, r1
            r = r - d;
 7c4:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7c8:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7cc:	e2533001 	subs	r3, r3, #1
 7d0:	2afffff7 	bcs	7b4 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7d4:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7d8:	e35c0000 	cmp	ip, #0
 7dc:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7e0:	e2883001 	add	r3, r8, #1
 7e4:	e7d91001 	ldrb	r1, [r9, r1]
 7e8:	e4c71001 	strb	r1, [r7], #1
 7ec:	11a08003 	movne	r8, r3
 7f0:	1affffec 	bne	7a8 <printint+0x38>
  if(neg)
 7f4:	e35a0000 	cmp	sl, #0
 7f8:	0a000004 	beq	810 <printint+0xa0>
    buf[i++] = '-';
 7fc:	e24b2024 	sub	r2, fp, #36	; 0x24
 800:	e3a0102d 	mov	r1, #45	; 0x2d
 804:	e0822003 	add	r2, r2, r3
 808:	e2883002 	add	r3, r8, #2
 80c:	e5421010 	strb	r1, [r2, #-16]
 810:	e0846003 	add	r6, r4, r3
 814:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 818:	e3a02001 	mov	r2, #1
 81c:	e24b1035 	sub	r1, fp, #53	; 0x35
 820:	e1a00005 	mov	r0, r5
 824:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 828:	ebfffee6 	bl	3c8 <write>

  while(--i >= 0)
 82c:	e1540006 	cmp	r4, r6
 830:	1afffff7 	bne	814 <printint+0xa4>
    putc(fd, buf[i]);
}
 834:	e24bd020 	sub	sp, fp, #32
 838:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000083c <div>:
{
 83c:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 840:	e3a02000 	mov	r2, #0
{
 844:	e28db008 	add	fp, sp, #8
 848:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 84c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 850:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 854:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 858:	e1a0c33e 	lsr	ip, lr, r3
 85c:	e20cc001 	and	ip, ip, #1
 860:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 864:	e1520001 	cmp	r2, r1
            r = r - d;
 868:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 86c:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 870:	e2533001 	subs	r3, r3, #1
 874:	38bd8810 	popcc	{r4, fp, pc}
 878:	eafffff6 	b	858 <div+0x1c>

0000087c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 87c:	e92d000e 	push	{r1, r2, r3}
 880:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 884:	e28db018 	add	fp, sp, #24
 888:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 88c:	e59b5004 	ldr	r5, [fp, #4]
 890:	e5d54000 	ldrb	r4, [r5]
 894:	e3540000 	cmp	r4, #0
 898:	0a00002b 	beq	94c <printf+0xd0>
 89c:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 8a0:	e28b8008 	add	r8, fp, #8
  state = 0;
 8a4:	e3a06000 	mov	r6, #0
 8a8:	ea00000a 	b	8d8 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8ac:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8b0:	01a06004 	moveq	r6, r4
      if(c == '%'){
 8b4:	0a000004 	beq	8cc <printf+0x50>
 8b8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 8bc:	e3a02001 	mov	r2, #1
 8c0:	e1a00007 	mov	r0, r7
 8c4:	e5614006 	strb	r4, [r1, #-6]!
 8c8:	ebfffebe 	bl	3c8 <write>
  for(i = 0; fmt[i]; i++){
 8cc:	e5f54001 	ldrb	r4, [r5, #1]!
 8d0:	e3540000 	cmp	r4, #0
 8d4:	0a00001c 	beq	94c <printf+0xd0>
    if(state == 0){
 8d8:	e3560000 	cmp	r6, #0
 8dc:	0afffff2 	beq	8ac <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8e0:	e3560025 	cmp	r6, #37	; 0x25
 8e4:	1afffff8 	bne	8cc <printf+0x50>
      if(c == 'd'){
 8e8:	e3540064 	cmp	r4, #100	; 0x64
 8ec:	0a000030 	beq	9b4 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8f0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8f4:	e3530070 	cmp	r3, #112	; 0x70
 8f8:	0a000017 	beq	95c <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8fc:	e3540073 	cmp	r4, #115	; 0x73
 900:	0a00001c 	beq	978 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 904:	e3540063 	cmp	r4, #99	; 0x63
 908:	0a000037 	beq	9ec <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 90c:	e3540025 	cmp	r4, #37	; 0x25
 910:	0a00002e 	beq	9d0 <printf+0x154>
  write(fd, &c, 1);
 914:	e3a02001 	mov	r2, #1
 918:	e24b1019 	sub	r1, fp, #25
 91c:	e1a00007 	mov	r0, r7
 920:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 924:	ebfffea7 	bl	3c8 <write>
 928:	e3a02001 	mov	r2, #1
 92c:	e24b101a 	sub	r1, fp, #26
 930:	e1a00007 	mov	r0, r7
 934:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 938:	ebfffea2 	bl	3c8 <write>
  for(i = 0; fmt[i]; i++){
 93c:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 940:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 944:	e3540000 	cmp	r4, #0
 948:	1affffe2 	bne	8d8 <printf+0x5c>
    }
  }
}
 94c:	e24bd018 	sub	sp, fp, #24
 950:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 954:	e28dd00c 	add	sp, sp, #12
 958:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 95c:	e3a03000 	mov	r3, #0
 960:	e3a02010 	mov	r2, #16
 964:	e4981004 	ldr	r1, [r8], #4
 968:	e1a00007 	mov	r0, r7
 96c:	ebffff7f 	bl	770 <printint>
      state = 0;
 970:	e3a06000 	mov	r6, #0
 974:	eaffffd4 	b	8cc <printf+0x50>
        s = (char*)*ap;
 978:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 97c:	e3540000 	cmp	r4, #0
 980:	0a000021 	beq	a0c <printf+0x190>
        while(*s != 0){
 984:	e5d46000 	ldrb	r6, [r4]
 988:	e3560000 	cmp	r6, #0
 98c:	0affffce 	beq	8cc <printf+0x50>
  write(fd, &c, 1);
 990:	e3a02001 	mov	r2, #1
 994:	e24b101d 	sub	r1, fp, #29
 998:	e1a00007 	mov	r0, r7
 99c:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 9a0:	ebfffe88 	bl	3c8 <write>
        while(*s != 0){
 9a4:	e5f46001 	ldrb	r6, [r4, #1]!
 9a8:	e3560000 	cmp	r6, #0
 9ac:	1afffff7 	bne	990 <printf+0x114>
 9b0:	eaffffc5 	b	8cc <printf+0x50>
        printint(fd, *ap, 10, 1);
 9b4:	e3a03001 	mov	r3, #1
 9b8:	e3a0200a 	mov	r2, #10
 9bc:	e4981004 	ldr	r1, [r8], #4
 9c0:	e1a00007 	mov	r0, r7
 9c4:	ebffff69 	bl	770 <printint>
      state = 0;
 9c8:	e3a06000 	mov	r6, #0
 9cc:	eaffffbe 	b	8cc <printf+0x50>
 9d0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9d4:	e3a02001 	mov	r2, #1
 9d8:	e1a00007 	mov	r0, r7
 9dc:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9e0:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9e4:	ebfffe77 	bl	3c8 <write>
 9e8:	eaffffb7 	b	8cc <printf+0x50>
        putc(fd, *ap);
 9ec:	e4983004 	ldr	r3, [r8], #4
 9f0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9f4:	e3a02001 	mov	r2, #1
 9f8:	e1a00007 	mov	r0, r7
      state = 0;
 9fc:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 a00:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 a04:	ebfffe6f 	bl	3c8 <write>
 a08:	eaffffaf 	b	8cc <printf+0x50>
          s = "(null)";
 a0c:	e3004bb8 	movw	r4, #3000	; 0xbb8
        while(*s != 0){
 a10:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 a14:	e3404000 	movt	r4, #0
 a18:	eaffffdc 	b	990 <printf+0x114>

00000a1c <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	e300cbc0 	movw	ip, #3008	; 0xbc0
 a20:	e340c000 	movt	ip, #0
{
 a24:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a28:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a2c:	e59c3000 	ldr	r3, [ip]
{
 a30:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a34:	e1530001 	cmp	r3, r1
 a38:	e5932000 	ldr	r2, [r3]
 a3c:	2a000017 	bcs	aa0 <free+0x84>
 a40:	e1510002 	cmp	r1, r2
 a44:	3a000001 	bcc	a50 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a48:	e1530002 	cmp	r3, r2
 a4c:	3a000017 	bcc	ab0 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a50:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a54:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a58:	e081418e 	add	r4, r1, lr, lsl #3
 a5c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a60:	05922004 	ldreq	r2, [r2, #4]
 a64:	0082e00e 	addeq	lr, r2, lr
 a68:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a6c:	05932000 	ldreq	r2, [r3]
 a70:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a74:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a78:	e5932004 	ldr	r2, [r3, #4]
 a7c:	e083e182 	add	lr, r3, r2, lsl #3
 a80:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a84:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a88:	05101004 	ldreq	r1, [r0, #-4]
 a8c:	00812002 	addeq	r2, r1, r2
 a90:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a94:	05102008 	ldreq	r2, [r0, #-8]
 a98:	05832000 	streq	r2, [r3]
}
 a9c:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa0:	e1530002 	cmp	r3, r2
 aa4:	3a000001 	bcc	ab0 <free+0x94>
 aa8:	e1510002 	cmp	r1, r2
 aac:	3affffe7 	bcc	a50 <free+0x34>
{
 ab0:	e1a03002 	mov	r3, r2
 ab4:	eaffffde 	b	a34 <free+0x18>

00000ab8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 abc:	e3007bc0 	movw	r7, #3008	; 0xbc0
 ac0:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac4:	e2804007 	add	r4, r0, #7
{
 ac8:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 acc:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad0:	e1a041a4 	lsr	r4, r4, #3
 ad4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ad8:	e3530000 	cmp	r3, #0
 adc:	0a000027 	beq	b80 <malloc+0xc8>
 ae0:	e5930000 	ldr	r0, [r3]
 ae4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ae8:	e1540002 	cmp	r4, r2
 aec:	9a000019 	bls	b58 <malloc+0xa0>
 af0:	e3540a01 	cmp	r4, #4096	; 0x1000
 af4:	21a05004 	movcs	r5, r4
 af8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 afc:	e1a06185 	lsl	r6, r5, #3
 b00:	ea000003 	b	b14 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b04:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b08:	e5902004 	ldr	r2, [r0, #4]
 b0c:	e1520004 	cmp	r2, r4
 b10:	2a000010 	bcs	b58 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b14:	e5972000 	ldr	r2, [r7]
 b18:	e1a03000 	mov	r3, r0
 b1c:	e1520000 	cmp	r2, r0
 b20:	1afffff7 	bne	b04 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b24:	e1a00006 	mov	r0, r6
 b28:	ebfffecf 	bl	66c <sbrk>
 b2c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b30:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b34:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b38:	0a000004 	beq	b50 <malloc+0x98>
  hp->s.size = nu;
 b3c:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b40:	ebffffb5 	bl	a1c <free>
  return freep;
 b44:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b48:	e3530000 	cmp	r3, #0
 b4c:	1affffec 	bne	b04 <malloc+0x4c>
        return 0;
 b50:	e3a00000 	mov	r0, #0
  }
}
 b54:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b58:	e1540002 	cmp	r4, r2
      freep = prevp;
 b5c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b60:	10422004 	subne	r2, r2, r4
 b64:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b68:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b6c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b70:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b74:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b78:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b7c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b80:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b84:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b88:	e5870000 	str	r0, [r7]
 b8c:	e5870004 	str	r0, [r7, #4]
 b90:	eaffffd6 	b	af0 <malloc+0x38>
