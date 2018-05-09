
_forktest:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  forktest();
   8:	eb00000e 	bl	48 <forktest>
  exit();
   c:	eb0000f4 	bl	3e4 <exit>

00000010 <printf>:
{
  10:	e92d000e 	push	{r1, r2, r3}
  14:	e92d4810 	push	{r4, fp, lr}
  18:	e28db008 	add	fp, sp, #8
  1c:	e1a04000 	mov	r4, r0
  write(fd, s, strlen(s));
  20:	e59b0004 	ldr	r0, [fp, #4]
  24:	eb000064 	bl	1bc <strlen>
  28:	e59b1004 	ldr	r1, [fp, #4]
  2c:	e1a02000 	mov	r2, r0
  30:	e1a00004 	mov	r0, r4
  34:	eb00011e 	bl	4b4 <write>
}
  38:	e24bd008 	sub	sp, fp, #8
  3c:	e8bd4810 	pop	{r4, fp, lr}
  40:	e28dd00c 	add	sp, sp, #12
  44:	e12fff1e 	bx	lr

00000048 <forktest>:
{
  48:	e92d4830 	push	{r4, r5, fp, lr}
  write(fd, s, strlen(s));
  4c:	e300085c 	movw	r0, #2140	; 0x85c
{
  50:	e28db00c 	add	fp, sp, #12
  write(fd, s, strlen(s));
  54:	e3400000 	movt	r0, #0
  58:	eb000057 	bl	1bc <strlen>
  5c:	e300185c 	movw	r1, #2140	; 0x85c
  60:	e3401000 	movt	r1, #0
  for(n=0; n<N; n++){
  64:	e3a04000 	mov	r4, #0
  write(fd, s, strlen(s));
  68:	e1a02000 	mov	r2, r0
  6c:	e3a00001 	mov	r0, #1
  70:	eb00010f 	bl	4b4 <write>
  74:	ea000003 	b	88 <forktest+0x40>
    if(pid == 0)
  78:	0a00002a 	beq	128 <forktest+0xe0>
  for(n=0; n<N; n++){
  7c:	e2844001 	add	r4, r4, #1
  80:	e3540ffa 	cmp	r4, #1000	; 0x3e8
  84:	0a000016 	beq	e4 <forktest+0x9c>
    pid = fork();
  88:	eb0000c8 	bl	3b0 <fork>
    if(pid < 0)
  8c:	e3500000 	cmp	r0, #0
  90:	aafffff8 	bge	78 <forktest+0x30>
  for(; n > 0; n--){
  94:	e3540000 	cmp	r4, #0
  98:	0a000004 	beq	b0 <forktest+0x68>
    if(wait() < 0){
  9c:	eb0000dd 	bl	418 <wait>
  a0:	e3500000 	cmp	r0, #0
  a4:	ba000017 	blt	108 <forktest+0xc0>
  for(; n > 0; n--){
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffffa 	bne	9c <forktest+0x54>
  if(wait() != -1){
  b0:	eb0000d8 	bl	418 <wait>
  b4:	e3700001 	cmn	r0, #1
  b8:	1a00001b 	bne	12c <forktest+0xe4>
  write(fd, s, strlen(s));
  bc:	e3000890 	movw	r0, #2192	; 0x890
  c0:	e3400000 	movt	r0, #0
  c4:	eb00003c 	bl	1bc <strlen>
  c8:	e3001890 	movw	r1, #2192	; 0x890
  cc:	e3401000 	movt	r1, #0
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a00001 	mov	r0, #1
}
  d8:	e24bd00c 	sub	sp, fp, #12
  dc:	e8bd4830 	pop	{r4, r5, fp, lr}
  write(fd, s, strlen(s));
  e0:	ea0000f3 	b	4b4 <write>
  e4:	e30008a0 	movw	r0, #2208	; 0x8a0
  e8:	e3400000 	movt	r0, #0
  ec:	eb000032 	bl	1bc <strlen>
  f0:	e30018a0 	movw	r1, #2208	; 0x8a0
  f4:	e3401000 	movt	r1, #0
  f8:	e1a02000 	mov	r2, r0
  fc:	e3a00001 	mov	r0, #1
 100:	eb0000eb 	bl	4b4 <write>
    exit();
 104:	eb0000b6 	bl	3e4 <exit>
  write(fd, s, strlen(s));
 108:	e3000868 	movw	r0, #2152	; 0x868
 10c:	e3400000 	movt	r0, #0
 110:	eb000029 	bl	1bc <strlen>
 114:	e3001868 	movw	r1, #2152	; 0x868
 118:	e3401000 	movt	r1, #0
 11c:	e1a02000 	mov	r2, r0
 120:	e3a00001 	mov	r0, #1
 124:	eb0000e2 	bl	4b4 <write>
      exit();
 128:	eb0000ad 	bl	3e4 <exit>
  write(fd, s, strlen(s));
 12c:	e300087c 	movw	r0, #2172	; 0x87c
 130:	e3400000 	movt	r0, #0
 134:	eb000020 	bl	1bc <strlen>
 138:	e300187c 	movw	r1, #2172	; 0x87c
 13c:	e3401000 	movt	r1, #0
 140:	e1a02000 	mov	r2, r0
 144:	e3a00001 	mov	r0, #1
 148:	eb0000d9 	bl	4b4 <write>
    exit();
 14c:	eb0000a4 	bl	3e4 <exit>

00000150 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 150:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 154:	e2402001 	sub	r2, r0, #1
 158:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15c:	e4d13001 	ldrb	r3, [r1], #1
 160:	e3530000 	cmp	r3, #0
 164:	e5e23001 	strb	r3, [r2, #1]!
 168:	1afffffb 	bne	15c <strcpy+0xc>
    ;
  return os;
}
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 180:	e5d03000 	ldrb	r3, [r0]
 184:	e5d12000 	ldrb	r2, [r1]
 188:	e3530000 	cmp	r3, #0
 18c:	1a000004 	bne	1a4 <strcmp+0x2c>
 190:	ea000005 	b	1ac <strcmp+0x34>
 194:	e5f03001 	ldrb	r3, [r0, #1]!
 198:	e5f12001 	ldrb	r2, [r1, #1]!
 19c:	e3530000 	cmp	r3, #0
 1a0:	0a000001 	beq	1ac <strcmp+0x34>
 1a4:	e1530002 	cmp	r3, r2
 1a8:	0afffff9 	beq	194 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1ac:	e0430002 	sub	r0, r3, r2
 1b0:	e28bd000 	add	sp, fp, #0
 1b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b8:	e12fff1e 	bx	lr

000001bc <strlen>:

uint
strlen(char *s)
{
 1bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1c4:	e5d03000 	ldrb	r3, [r0]
 1c8:	e3530000 	cmp	r3, #0
 1cc:	01a00003 	moveq	r0, r3
 1d0:	0a000006 	beq	1f0 <strlen+0x34>
 1d4:	e1a02000 	mov	r2, r0
 1d8:	e3a03000 	mov	r3, #0
 1dc:	e5f21001 	ldrb	r1, [r2, #1]!
 1e0:	e2833001 	add	r3, r3, #1
 1e4:	e3510000 	cmp	r1, #0
 1e8:	e1a00003 	mov	r0, r3
 1ec:	1afffffa 	bne	1dc <strlen+0x20>
    ;
  return n;
}
 1f0:	e28bd000 	add	sp, fp, #0
 1f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1f8:	e12fff1e 	bx	lr

000001fc <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1fc:	e3520000 	cmp	r2, #0
{
 200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 204:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 208:	0a000004 	beq	220 <memset+0x24>
 20c:	e6ef1071 	uxtb	r1, r1
 210:	e0802002 	add	r2, r0, r2
 214:	e4c01001 	strb	r1, [r0], #1
 218:	e1520000 	cmp	r2, r0
 21c:	1afffffc 	bne	214 <memset+0x18>
  return (void *)p;
}
 220:	e28bd000 	add	sp, fp, #0
 224:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 228:	e12fff1e 	bx	lr

0000022c <strchr>:

char*
strchr(const char *s, char c)
{
 22c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 230:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 234:	e5d02000 	ldrb	r2, [r0]
 238:	e3520000 	cmp	r2, #0
 23c:	0a00000b 	beq	270 <strchr+0x44>
    if(*s == c)
 240:	e1510002 	cmp	r1, r2
 244:	1a000002 	bne	254 <strchr+0x28>
 248:	ea000005 	b	264 <strchr+0x38>
 24c:	e1530001 	cmp	r3, r1
 250:	0a000003 	beq	264 <strchr+0x38>
  for(; *s; s++)
 254:	e5f03001 	ldrb	r3, [r0, #1]!
 258:	e3530000 	cmp	r3, #0
 25c:	1afffffa 	bne	24c <strchr+0x20>
      return (char*)s;
  return 0;
 260:	e1a00003 	mov	r0, r3
}
 264:	e28bd000 	add	sp, fp, #0
 268:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 26c:	e12fff1e 	bx	lr
  return 0;
 270:	e1a00002 	mov	r0, r2
 274:	eafffffa 	b	264 <strchr+0x38>

00000278 <gets>:

char*
gets(char *buf, int max)
{
 278:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 27c:	e1a03000 	mov	r3, r0
 280:	e28db014 	add	fp, sp, #20
 284:	e1a07000 	mov	r7, r0
 288:	e24dd008 	sub	sp, sp, #8
 28c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 290:	e3a04000 	mov	r4, #0
 294:	ea000008 	b	2bc <gets+0x44>
    cc = read(0, &c, 1);
 298:	eb000078 	bl	480 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 29c:	e1a03005 	mov	r3, r5
    if(cc < 1)
 2a0:	e3500000 	cmp	r0, #0
 2a4:	da00000b 	ble	2d8 <gets+0x60>
    buf[i++] = c;
 2a8:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 2ac:	e352000d 	cmp	r2, #13
 2b0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 2b4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 2b8:	0a00000b 	beq	2ec <gets+0x74>
    cc = read(0, &c, 1);
 2bc:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 2c0:	e0844002 	add	r4, r4, r2
 2c4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 2c8:	e24b1015 	sub	r1, fp, #21
 2cc:	e3a00000 	mov	r0, #0
 2d0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 2d4:	baffffef 	blt	298 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2d8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 2dc:	e3a03000 	mov	r3, #0
 2e0:	e5c53000 	strb	r3, [r5]
}
 2e4:	e24bd014 	sub	sp, fp, #20
 2e8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 2ec:	e0875004 	add	r5, r7, r4
 2f0:	eafffff8 	b	2d8 <gets+0x60>

000002f4 <stat>:

int
stat(char *n, struct stat *st)
{
 2f4:	e92d4830 	push	{r4, r5, fp, lr}
 2f8:	e1a04001 	mov	r4, r1
 2fc:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 300:	e3a01000 	mov	r1, #0
 304:	eb00009e 	bl	584 <open>
  if(fd < 0)
 308:	e2505000 	subs	r5, r0, #0
 30c:	ba000006 	blt	32c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 310:	e1a01004 	mov	r1, r4
 314:	eb0000c1 	bl	620 <fstat>
 318:	e1a04000 	mov	r4, r0
  close(fd);
 31c:	e1a00005 	mov	r0, r5
 320:	eb000070 	bl	4e8 <close>
  return r;
}
 324:	e1a00004 	mov	r0, r4
 328:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 32c:	e3e04000 	mvn	r4, #0
 330:	eafffffb 	b	324 <stat+0x30>

00000334 <atoi>:

int
atoi(const char *s)
{
 334:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 338:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33c:	e5d02000 	ldrb	r2, [r0]
 340:	e2423030 	sub	r3, r2, #48	; 0x30
 344:	e3530009 	cmp	r3, #9
  n = 0;
 348:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 34c:	8a000006 	bhi	36c <atoi+0x38>
    n = n*10 + *s++ - '0';
 350:	e3a0c00a 	mov	ip, #10
 354:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 358:	e5f02001 	ldrb	r2, [r0, #1]!
 35c:	e2421030 	sub	r1, r2, #48	; 0x30
 360:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 364:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 368:	9afffff9 	bls	354 <atoi+0x20>
  return n;
}
 36c:	e1a00003 	mov	r0, r3
 370:	e28bd000 	add	sp, fp, #0
 374:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 378:	e12fff1e 	bx	lr

0000037c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 37c:	e3520000 	cmp	r2, #0
{
 380:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 384:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 388:	da000005 	ble	3a4 <memmove+0x28>
 38c:	e0812002 	add	r2, r1, r2
 390:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 394:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 398:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 39c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3a0:	1afffffb 	bne	394 <memmove+0x18>
  return vdst;
}
 3a4:	e28bd000 	add	sp, fp, #0
 3a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3ac:	e12fff1e 	bx	lr

000003b0 <fork>:
 3b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c4:	e3a00001 	mov	r0, #1
 3c8:	ef000040 	svc	0x00000040
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e0:	e12fff1e 	bx	lr

000003e4 <exit>:
 3e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f8:	e3a00002 	mov	r0, #2
 3fc:	ef000040 	svc	0x00000040
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 40c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 410:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 414:	e12fff1e 	bx	lr

00000418 <wait>:
 418:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 41c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 420:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 424:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 428:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 42c:	e3a00003 	mov	r0, #3
 430:	ef000040 	svc	0x00000040
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 440:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 444:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 448:	e12fff1e 	bx	lr

0000044c <pipe>:
 44c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 450:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 454:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 458:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 45c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 460:	e3a00004 	mov	r0, #4
 464:	ef000040 	svc	0x00000040
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 474:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 478:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 47c:	e12fff1e 	bx	lr

00000480 <read>:
 480:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 484:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 488:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 48c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 490:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 494:	e3a00005 	mov	r0, #5
 498:	ef000040 	svc	0x00000040
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b0:	e12fff1e 	bx	lr

000004b4 <write>:
 4b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c8:	e3a00010 	mov	r0, #16
 4cc:	ef000040 	svc	0x00000040
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e4:	e12fff1e 	bx	lr

000004e8 <close>:
 4e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4fc:	e3a00015 	mov	r0, #21
 500:	ef000040 	svc	0x00000040
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 510:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 514:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 518:	e12fff1e 	bx	lr

0000051c <kill>:
 51c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 520:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 524:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 528:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 52c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 530:	e3a00006 	mov	r0, #6
 534:	ef000040 	svc	0x00000040
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 544:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 548:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 54c:	e12fff1e 	bx	lr

00000550 <exec>:
 550:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 554:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 558:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 55c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 560:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 564:	e3a00007 	mov	r0, #7
 568:	ef000040 	svc	0x00000040
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 578:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 57c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 580:	e12fff1e 	bx	lr

00000584 <open>:
 584:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 588:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 58c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 590:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 594:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 598:	e3a0000f 	mov	r0, #15
 59c:	ef000040 	svc	0x00000040
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b4:	e12fff1e 	bx	lr

000005b8 <mknod>:
 5b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5cc:	e3a00011 	mov	r0, #17
 5d0:	ef000040 	svc	0x00000040
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e8:	e12fff1e 	bx	lr

000005ec <unlink>:
 5ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 600:	e3a00012 	mov	r0, #18
 604:	ef000040 	svc	0x00000040
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 614:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 618:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 61c:	e12fff1e 	bx	lr

00000620 <fstat>:
 620:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 624:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 628:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 62c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 630:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 634:	e3a00008 	mov	r0, #8
 638:	ef000040 	svc	0x00000040
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 648:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 64c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 650:	e12fff1e 	bx	lr

00000654 <link>:
 654:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 658:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 65c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 660:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 664:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 668:	e3a00013 	mov	r0, #19
 66c:	ef000040 	svc	0x00000040
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 67c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 680:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 684:	e12fff1e 	bx	lr

00000688 <mkdir>:
 688:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 68c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 690:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 694:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 698:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 69c:	e3a00014 	mov	r0, #20
 6a0:	ef000040 	svc	0x00000040
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b8:	e12fff1e 	bx	lr

000006bc <chdir>:
 6bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d0:	e3a00009 	mov	r0, #9
 6d4:	ef000040 	svc	0x00000040
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ec:	e12fff1e 	bx	lr

000006f0 <dup>:
 6f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 700:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 704:	e3a0000a 	mov	r0, #10
 708:	ef000040 	svc	0x00000040
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 718:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 71c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 720:	e12fff1e 	bx	lr

00000724 <getpid>:
 724:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 728:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 72c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 730:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 734:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 738:	e3a0000b 	mov	r0, #11
 73c:	ef000040 	svc	0x00000040
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 748:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 74c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 750:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 754:	e12fff1e 	bx	lr

00000758 <sbrk>:
 758:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 75c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 760:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 764:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 768:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 76c:	e3a0000c 	mov	r0, #12
 770:	ef000040 	svc	0x00000040
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 77c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 780:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 784:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 788:	e12fff1e 	bx	lr

0000078c <sleep>:
 78c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 790:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 794:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 798:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 79c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a0:	e3a0000d 	mov	r0, #13
 7a4:	ef000040 	svc	0x00000040
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7bc:	e12fff1e 	bx	lr

000007c0 <uptime>:
 7c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d4:	e3a0000e 	mov	r0, #14
 7d8:	ef000040 	svc	0x00000040
 7dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f0:	e12fff1e 	bx	lr

000007f4 <memfree>:
 7f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 800:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 804:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 808:	e3a00016 	mov	r0, #22
 80c:	ef000040 	svc	0x00000040
 810:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 814:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 818:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 81c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 820:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 824:	e12fff1e 	bx	lr

00000828 <setTraceFlag>:
 828:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 82c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 830:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 834:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 838:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 83c:	e3a00017 	mov	r0, #23
 840:	ef000040 	svc	0x00000040
 844:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 848:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 84c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 850:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 854:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 858:	e12fff1e 	bx	lr
