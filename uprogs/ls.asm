
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d4830 	push	{r4, r5, fp, lr}
   8:	c0815100 	addgt	r5, r1, r0, lsl #2
   c:	e28db00c 	add	fp, sp, #12
  10:	c2814004 	addgt	r4, r1, #4
  if(argc < 2){
  14:	da000004 	ble	2c <main+0x2c>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  18:	e4940004 	ldr	r0, [r4], #4
  1c:	eb000032 	bl	ec <ls>
  for(i=1; i<argc; i++)
  20:	e1540005 	cmp	r4, r5
  24:	1afffffb 	bne	18 <main+0x18>
  exit();
  28:	eb000145 	bl	544 <exit>
    ls(".");
  2c:	e3000e2c 	movw	r0, #3628	; 0xe2c
  30:	e3400000 	movt	r0, #0
  34:	eb00002c 	bl	ec <ls>
    exit();
  38:	eb000141 	bl	544 <exit>

0000003c <fmtname>:
{
  3c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  40:	e28db014 	add	fp, sp, #20
  44:	e1a04000 	mov	r4, r0
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  48:	eb0000b3 	bl	31c <strlen>
  4c:	e0942000 	adds	r2, r4, r0
  50:	2a00000c 	bcs	88 <fmtname+0x4c>
  54:	e7d43000 	ldrb	r3, [r4, r0]
  58:	e353002f 	cmp	r3, #47	; 0x2f
  5c:	0a000009 	beq	88 <fmtname+0x4c>
  60:	e2423001 	sub	r3, r2, #1
  64:	e2440001 	sub	r0, r4, #1
  68:	ea000002 	b	78 <fmtname+0x3c>
  6c:	e5d21000 	ldrb	r1, [r2]
  70:	e351002f 	cmp	r1, #47	; 0x2f
  74:	0a000003 	beq	88 <fmtname+0x4c>
  78:	e1530000 	cmp	r3, r0
  7c:	e1a02003 	mov	r2, r3
  80:	e2433001 	sub	r3, r3, #1
  84:	1afffff8 	bne	6c <fmtname+0x30>
  p++;
  88:	e2824001 	add	r4, r2, #1
  if(strlen(p) >= DIRSIZ)
  8c:	e1a00004 	mov	r0, r4
  90:	eb0000a1 	bl	31c <strlen>
  94:	e350000d 	cmp	r0, #13
  98:	8a000011 	bhi	e4 <fmtname+0xa8>
  memmove(buf, p, strlen(p));
  9c:	e1a00004 	mov	r0, r4
  a0:	e3005e4c 	movw	r5, #3660	; 0xe4c
  a4:	eb00009c 	bl	31c <strlen>
  a8:	e3405000 	movt	r5, #0
  ac:	e1a01004 	mov	r1, r4
  b0:	e1a02000 	mov	r2, r0
  b4:	e1a00005 	mov	r0, r5
  b8:	eb000107 	bl	4dc <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  bc:	e1a00004 	mov	r0, r4
  c0:	eb000095 	bl	31c <strlen>
  c4:	e1a06000 	mov	r6, r0
  c8:	e1a00004 	mov	r0, r4
  cc:	eb000092 	bl	31c <strlen>
  d0:	e3a01020 	mov	r1, #32
  return buf;
  d4:	e1a04005 	mov	r4, r5
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  d8:	e260200e 	rsb	r2, r0, #14
  dc:	e0850006 	add	r0, r5, r6
  e0:	eb00009d 	bl	35c <memset>
}
  e4:	e1a00004 	mov	r0, r4
  e8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000ec <ls>:
{
  ec:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  if((fd = open(path, 0)) < 0){
  f0:	e3a01000 	mov	r1, #0
{
  f4:	e28db020 	add	fp, sp, #32
  f8:	e24ddf8d 	sub	sp, sp, #564	; 0x234
  fc:	e1a05000 	mov	r5, r0
  if((fd = open(path, 0)) < 0){
 100:	eb000177 	bl	6e4 <open>
 104:	e2504000 	subs	r4, r0, #0
 108:	ba00000d 	blt	144 <ls+0x58>
  if(fstat(fd, &st) < 0){
 10c:	e24b1f8e 	sub	r1, fp, #568	; 0x238
 110:	eb00019a 	bl	780 <fstat>
 114:	e3500000 	cmp	r0, #0
 118:	ba000027 	blt	1bc <ls+0xd0>
  switch(st.type){
 11c:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 120:	e1d360f0 	ldrsh	r6, [r3]
 124:	e3560001 	cmp	r6, #1
 128:	0a000019 	beq	194 <ls+0xa8>
 12c:	e3560002 	cmp	r6, #2
 130:	0a00000a 	beq	160 <ls+0x74>
  close(fd);
 134:	e1a00004 	mov	r0, r4
 138:	eb000142 	bl	648 <close>
}
 13c:	e24bd020 	sub	sp, fp, #32
 140:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(2, "ls: cannot open %s\n", path);
 144:	e1a02005 	mov	r2, r5
 148:	e3a00002 	mov	r0, #2
 14c:	e3001de0 	movw	r1, #3552	; 0xde0
 150:	e3401000 	movt	r1, #0
 154:	eb00025b 	bl	ac8 <printf>
}
 158:	e24bd020 	sub	sp, fp, #32
 15c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 160:	e1a00005 	mov	r0, r5
 164:	ebffffb4 	bl	3c <fmtname>
 168:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 16c:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 170:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 174:	e3001e08 	movw	r1, #3592	; 0xe08
 178:	e3401000 	movt	r1, #0
 17c:	e1d330f0 	ldrsh	r3, [r3]
 180:	e88d1004 	stm	sp, {r2, ip}
 184:	e1a02000 	mov	r2, r0
 188:	e3a00001 	mov	r0, #1
 18c:	eb00024d 	bl	ac8 <printf>
    break;
 190:	eaffffe7 	b	134 <ls+0x48>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 194:	e1a00005 	mov	r0, r5
 198:	eb00005f 	bl	31c <strlen>
 19c:	e2800010 	add	r0, r0, #16
 1a0:	e3500c02 	cmp	r0, #512	; 0x200
 1a4:	9a00000d 	bls	1e0 <ls+0xf4>
      printf(1, "ls: path too long\n");
 1a8:	e1a00006 	mov	r0, r6
 1ac:	e3001e18 	movw	r1, #3608	; 0xe18
 1b0:	e3401000 	movt	r1, #0
 1b4:	eb000243 	bl	ac8 <printf>
      break;
 1b8:	eaffffdd 	b	134 <ls+0x48>
    printf(2, "ls: cannot stat %s\n", path);
 1bc:	e1a02005 	mov	r2, r5
 1c0:	e3a00002 	mov	r0, #2
 1c4:	e3001df4 	movw	r1, #3572	; 0xdf4
 1c8:	e3401000 	movt	r1, #0
 1cc:	eb00023d 	bl	ac8 <printf>
    close(fd);
 1d0:	e1a00004 	mov	r0, r4
 1d4:	eb00011b 	bl	648 <close>
}
 1d8:	e24bd020 	sub	sp, fp, #32
 1dc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strcpy(buf, path);
 1e0:	e24b6f89 	sub	r6, fp, #548	; 0x224
 1e4:	e1a01005 	mov	r1, r5
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 1e8:	e3008e08 	movw	r8, #3592	; 0xe08
        printf(1, "ls: cannot stat %s\n", buf);
 1ec:	e300adf4 	movw	sl, #3572	; 0xdf4
    strcpy(buf, path);
 1f0:	e1a00006 	mov	r0, r6
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 1f4:	e3408000 	movt	r8, #0
    strcpy(buf, path);
 1f8:	eb00002c 	bl	2b0 <strcpy>
    p = buf+strlen(buf);
 1fc:	e1a00006 	mov	r0, r6
 200:	eb000045 	bl	31c <strlen>
        printf(1, "ls: cannot stat %s\n", buf);
 204:	e340a000 	movt	sl, #0
 208:	e24b5f92 	sub	r5, fp, #584	; 0x248
    *p++ = '/';
 20c:	e3a0302f 	mov	r3, #47	; 0x2f
    p = buf+strlen(buf);
 210:	e0869000 	add	r9, r6, r0
    *p++ = '/';
 214:	e7c63000 	strb	r3, [r6, r0]
 218:	e2897001 	add	r7, r9, #1
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 21c:	e3a02010 	mov	r2, #16
 220:	e1a01005 	mov	r1, r5
 224:	e1a00004 	mov	r0, r4
 228:	eb0000ec 	bl	5e0 <read>
      memmove(p, de.name, DIRSIZ);
 22c:	e3a0200e 	mov	r2, #14
 230:	e2851002 	add	r1, r5, #2
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 234:	e3500010 	cmp	r0, #16
      memmove(p, de.name, DIRSIZ);
 238:	e1a00007 	mov	r0, r7
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 23c:	1affffbc 	bne	134 <ls+0x48>
      if(de.inum == 0)
 240:	e1d530b0 	ldrh	r3, [r5]
 244:	e3530000 	cmp	r3, #0
 248:	0afffff3 	beq	21c <ls+0x130>
      memmove(p, de.name, DIRSIZ);
 24c:	eb0000a2 	bl	4dc <memmove>
      p[DIRSIZ] = 0;
 250:	e3a03000 	mov	r3, #0
      if(stat(buf, &st) < 0){
 254:	e24b1f8e 	sub	r1, fp, #568	; 0x238
 258:	e1a00006 	mov	r0, r6
      p[DIRSIZ] = 0;
 25c:	e5c9300f 	strb	r3, [r9, #15]
      if(stat(buf, &st) < 0){
 260:	eb00007b 	bl	454 <stat>
 264:	e3500000 	cmp	r0, #0
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 268:	e1a00006 	mov	r0, r6
      if(stat(buf, &st) < 0){
 26c:	ba00000a 	blt	29c <ls+0x1b0>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 270:	ebffff71 	bl	3c <fmtname>
 274:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 278:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 27c:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 280:	e1a01008 	mov	r1, r8
 284:	e1d330f0 	ldrsh	r3, [r3]
 288:	e88d1004 	stm	sp, {r2, ip}
 28c:	e1a02000 	mov	r2, r0
 290:	e3a00001 	mov	r0, #1
 294:	eb00020b 	bl	ac8 <printf>
 298:	eaffffdf 	b	21c <ls+0x130>
        printf(1, "ls: cannot stat %s\n", buf);
 29c:	e1a02006 	mov	r2, r6
 2a0:	e1a0100a 	mov	r1, sl
 2a4:	e3a00001 	mov	r0, #1
 2a8:	eb000206 	bl	ac8 <printf>
        continue;
 2ac:	eaffffda 	b	21c <ls+0x130>

000002b0 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 2b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b4:	e2402001 	sub	r2, r0, #1
 2b8:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2bc:	e4d13001 	ldrb	r3, [r1], #1
 2c0:	e3530000 	cmp	r3, #0
 2c4:	e5e23001 	strb	r3, [r2, #1]!
 2c8:	1afffffb 	bne	2bc <strcpy+0xc>
    ;
  return os;
}
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d4:	e12fff1e 	bx	lr

000002d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2dc:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 2e0:	e5d03000 	ldrb	r3, [r0]
 2e4:	e5d12000 	ldrb	r2, [r1]
 2e8:	e3530000 	cmp	r3, #0
 2ec:	1a000004 	bne	304 <strcmp+0x2c>
 2f0:	ea000005 	b	30c <strcmp+0x34>
 2f4:	e5f03001 	ldrb	r3, [r0, #1]!
 2f8:	e5f12001 	ldrb	r2, [r1, #1]!
 2fc:	e3530000 	cmp	r3, #0
 300:	0a000001 	beq	30c <strcmp+0x34>
 304:	e1530002 	cmp	r3, r2
 308:	0afffff9 	beq	2f4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 30c:	e0430002 	sub	r0, r3, r2
 310:	e28bd000 	add	sp, fp, #0
 314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 318:	e12fff1e 	bx	lr

0000031c <strlen>:

uint
strlen(char *s)
{
 31c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 320:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 324:	e5d03000 	ldrb	r3, [r0]
 328:	e3530000 	cmp	r3, #0
 32c:	01a00003 	moveq	r0, r3
 330:	0a000006 	beq	350 <strlen+0x34>
 334:	e1a02000 	mov	r2, r0
 338:	e3a03000 	mov	r3, #0
 33c:	e5f21001 	ldrb	r1, [r2, #1]!
 340:	e2833001 	add	r3, r3, #1
 344:	e3510000 	cmp	r1, #0
 348:	e1a00003 	mov	r0, r3
 34c:	1afffffa 	bne	33c <strlen+0x20>
    ;
  return n;
}
 350:	e28bd000 	add	sp, fp, #0
 354:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 358:	e12fff1e 	bx	lr

0000035c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 35c:	e3520000 	cmp	r2, #0
{
 360:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 364:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 368:	0a000004 	beq	380 <memset+0x24>
 36c:	e6ef1071 	uxtb	r1, r1
 370:	e0802002 	add	r2, r0, r2
 374:	e4c01001 	strb	r1, [r0], #1
 378:	e1520000 	cmp	r2, r0
 37c:	1afffffc 	bne	374 <memset+0x18>
  return (void *)p;
}
 380:	e28bd000 	add	sp, fp, #0
 384:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 388:	e12fff1e 	bx	lr

0000038c <strchr>:

char*
strchr(const char *s, char c)
{
 38c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 390:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 394:	e5d02000 	ldrb	r2, [r0]
 398:	e3520000 	cmp	r2, #0
 39c:	0a00000b 	beq	3d0 <strchr+0x44>
    if(*s == c)
 3a0:	e1510002 	cmp	r1, r2
 3a4:	1a000002 	bne	3b4 <strchr+0x28>
 3a8:	ea000005 	b	3c4 <strchr+0x38>
 3ac:	e1530001 	cmp	r3, r1
 3b0:	0a000003 	beq	3c4 <strchr+0x38>
  for(; *s; s++)
 3b4:	e5f03001 	ldrb	r3, [r0, #1]!
 3b8:	e3530000 	cmp	r3, #0
 3bc:	1afffffa 	bne	3ac <strchr+0x20>
      return (char*)s;
  return 0;
 3c0:	e1a00003 	mov	r0, r3
}
 3c4:	e28bd000 	add	sp, fp, #0
 3c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3cc:	e12fff1e 	bx	lr
  return 0;
 3d0:	e1a00002 	mov	r0, r2
 3d4:	eafffffa 	b	3c4 <strchr+0x38>

000003d8 <gets>:

char*
gets(char *buf, int max)
{
 3d8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 3dc:	e1a03000 	mov	r3, r0
 3e0:	e28db014 	add	fp, sp, #20
 3e4:	e1a07000 	mov	r7, r0
 3e8:	e24dd008 	sub	sp, sp, #8
 3ec:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f0:	e3a04000 	mov	r4, #0
 3f4:	ea000008 	b	41c <gets+0x44>
    cc = read(0, &c, 1);
 3f8:	eb000078 	bl	5e0 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 3fc:	e1a03005 	mov	r3, r5
    if(cc < 1)
 400:	e3500000 	cmp	r0, #0
 404:	da00000b 	ble	438 <gets+0x60>
    buf[i++] = c;
 408:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 40c:	e352000d 	cmp	r2, #13
 410:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 414:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 418:	0a00000b 	beq	44c <gets+0x74>
    cc = read(0, &c, 1);
 41c:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 420:	e0844002 	add	r4, r4, r2
 424:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 428:	e24b1015 	sub	r1, fp, #21
 42c:	e3a00000 	mov	r0, #0
 430:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 434:	baffffef 	blt	3f8 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 438:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 43c:	e3a03000 	mov	r3, #0
 440:	e5c53000 	strb	r3, [r5]
}
 444:	e24bd014 	sub	sp, fp, #20
 448:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 44c:	e0875004 	add	r5, r7, r4
 450:	eafffff8 	b	438 <gets+0x60>

00000454 <stat>:

int
stat(char *n, struct stat *st)
{
 454:	e92d4830 	push	{r4, r5, fp, lr}
 458:	e1a04001 	mov	r4, r1
 45c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 460:	e3a01000 	mov	r1, #0
 464:	eb00009e 	bl	6e4 <open>
  if(fd < 0)
 468:	e2505000 	subs	r5, r0, #0
 46c:	ba000006 	blt	48c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 470:	e1a01004 	mov	r1, r4
 474:	eb0000c1 	bl	780 <fstat>
 478:	e1a04000 	mov	r4, r0
  close(fd);
 47c:	e1a00005 	mov	r0, r5
 480:	eb000070 	bl	648 <close>
  return r;
}
 484:	e1a00004 	mov	r0, r4
 488:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 48c:	e3e04000 	mvn	r4, #0
 490:	eafffffb 	b	484 <stat+0x30>

00000494 <atoi>:

int
atoi(const char *s)
{
 494:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 498:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 49c:	e5d02000 	ldrb	r2, [r0]
 4a0:	e2423030 	sub	r3, r2, #48	; 0x30
 4a4:	e3530009 	cmp	r3, #9
  n = 0;
 4a8:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 4ac:	8a000006 	bhi	4cc <atoi+0x38>
    n = n*10 + *s++ - '0';
 4b0:	e3a0c00a 	mov	ip, #10
 4b4:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 4b8:	e5f02001 	ldrb	r2, [r0, #1]!
 4bc:	e2421030 	sub	r1, r2, #48	; 0x30
 4c0:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 4c4:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 4c8:	9afffff9 	bls	4b4 <atoi+0x20>
  return n;
}
 4cc:	e1a00003 	mov	r0, r3
 4d0:	e28bd000 	add	sp, fp, #0
 4d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 4d8:	e12fff1e 	bx	lr

000004dc <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4dc:	e3520000 	cmp	r2, #0
{
 4e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4e4:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 4e8:	da000005 	ble	504 <memmove+0x28>
 4ec:	e0812002 	add	r2, r1, r2
 4f0:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 4f4:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 4f8:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 4fc:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 500:	1afffffb 	bne	4f4 <memmove+0x18>
  return vdst;
}
 504:	e28bd000 	add	sp, fp, #0
 508:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 50c:	e12fff1e 	bx	lr

00000510 <fork>:
 510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 514:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 518:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 51c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 520:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 524:	e3a00001 	mov	r0, #1
 528:	ef000040 	svc	0x00000040
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 538:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 53c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 540:	e12fff1e 	bx	lr

00000544 <exit>:
 544:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 548:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 54c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 550:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 554:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 558:	e3a00002 	mov	r0, #2
 55c:	ef000040 	svc	0x00000040
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 56c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 570:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 574:	e12fff1e 	bx	lr

00000578 <wait>:
 578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 57c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 580:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 584:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 588:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 58c:	e3a00003 	mov	r0, #3
 590:	ef000040 	svc	0x00000040
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a8:	e12fff1e 	bx	lr

000005ac <pipe>:
 5ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c0:	e3a00004 	mov	r0, #4
 5c4:	ef000040 	svc	0x00000040
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5dc:	e12fff1e 	bx	lr

000005e0 <read>:
 5e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f4:	e3a00005 	mov	r0, #5
 5f8:	ef000040 	svc	0x00000040
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 608:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 60c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 610:	e12fff1e 	bx	lr

00000614 <write>:
 614:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 618:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 61c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 620:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 624:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 628:	e3a00010 	mov	r0, #16
 62c:	ef000040 	svc	0x00000040
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 63c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 640:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 644:	e12fff1e 	bx	lr

00000648 <close>:
 648:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 64c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 650:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 654:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 658:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 65c:	e3a00015 	mov	r0, #21
 660:	ef000040 	svc	0x00000040
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 670:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 674:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 678:	e12fff1e 	bx	lr

0000067c <kill>:
 67c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 680:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 684:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 688:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 68c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 690:	e3a00006 	mov	r0, #6
 694:	ef000040 	svc	0x00000040
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ac:	e12fff1e 	bx	lr

000006b0 <exec>:
 6b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c4:	e3a00007 	mov	r0, #7
 6c8:	ef000040 	svc	0x00000040
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e0:	e12fff1e 	bx	lr

000006e4 <open>:
 6e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f8:	e3a0000f 	mov	r0, #15
 6fc:	ef000040 	svc	0x00000040
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 70c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 710:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 714:	e12fff1e 	bx	lr

00000718 <mknod>:
 718:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 71c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 720:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 724:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 728:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 72c:	e3a00011 	mov	r0, #17
 730:	ef000040 	svc	0x00000040
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 740:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 744:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 748:	e12fff1e 	bx	lr

0000074c <unlink>:
 74c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 750:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 754:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 758:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 75c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 760:	e3a00012 	mov	r0, #18
 764:	ef000040 	svc	0x00000040
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 770:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 774:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 778:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 77c:	e12fff1e 	bx	lr

00000780 <fstat>:
 780:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 784:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 788:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 78c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 790:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 794:	e3a00008 	mov	r0, #8
 798:	ef000040 	svc	0x00000040
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b0:	e12fff1e 	bx	lr

000007b4 <link>:
 7b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c8:	e3a00013 	mov	r0, #19
 7cc:	ef000040 	svc	0x00000040
 7d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e4:	e12fff1e 	bx	lr

000007e8 <mkdir>:
 7e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7fc:	e3a00014 	mov	r0, #20
 800:	ef000040 	svc	0x00000040
 804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 808:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 80c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 810:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 814:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 818:	e12fff1e 	bx	lr

0000081c <chdir>:
 81c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 820:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 824:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 828:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 82c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 830:	e3a00009 	mov	r0, #9
 834:	ef000040 	svc	0x00000040
 838:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 83c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 840:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 844:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 848:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 84c:	e12fff1e 	bx	lr

00000850 <dup>:
 850:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 854:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 858:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 85c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 860:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 864:	e3a0000a 	mov	r0, #10
 868:	ef000040 	svc	0x00000040
 86c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 870:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 874:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 878:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 87c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 880:	e12fff1e 	bx	lr

00000884 <getpid>:
 884:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 888:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 88c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 890:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 894:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 898:	e3a0000b 	mov	r0, #11
 89c:	ef000040 	svc	0x00000040
 8a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8b4:	e12fff1e 	bx	lr

000008b8 <sbrk>:
 8b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8cc:	e3a0000c 	mov	r0, #12
 8d0:	ef000040 	svc	0x00000040
 8d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8e8:	e12fff1e 	bx	lr

000008ec <sleep>:
 8ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 900:	e3a0000d 	mov	r0, #13
 904:	ef000040 	svc	0x00000040
 908:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 90c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 910:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 914:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 918:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 91c:	e12fff1e 	bx	lr

00000920 <uptime>:
 920:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 924:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 928:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 92c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 930:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 934:	e3a0000e 	mov	r0, #14
 938:	ef000040 	svc	0x00000040
 93c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 940:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 944:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 948:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 94c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 950:	e12fff1e 	bx	lr

00000954 <memfree>:
 954:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 958:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 95c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 960:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 964:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 968:	e3a00016 	mov	r0, #22
 96c:	ef000040 	svc	0x00000040
 970:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 974:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 978:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 97c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 980:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 984:	e12fff1e 	bx	lr

00000988 <setTraceFlag>:
 988:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 98c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 990:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 994:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 998:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 99c:	e3a00017 	mov	r0, #23
 9a0:	ef000040 	svc	0x00000040
 9a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9b8:	e12fff1e 	bx	lr

000009bc <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9bc:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 9c0:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 9c4:	e013afa1 	ands	sl, r3, r1, lsr #31
 9c8:	e24b4034 	sub	r4, fp, #52	; 0x34
 9cc:	e3009e30 	movw	r9, #3632	; 0xe30
    neg = 1;
    x = -xx;
 9d0:	1261e000 	rsbne	lr, r1, #0
 9d4:	e3409000 	movt	r9, #0
{
 9d8:	e1a05000 	mov	r5, r0
    neg = 1;
 9dc:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 9e0:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 9e4:	e3a08000 	mov	r8, #0
  b = base;
 9e8:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 9ec:	e3a06001 	mov	r6, #1
{
 9f0:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 9f4:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 9f8:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 9fc:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 a00:	e1a0033e 	lsr	r0, lr, r3
 a04:	e2000001 	and	r0, r0, #1
 a08:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 a0c:	e1520001 	cmp	r2, r1
            r = r - d;
 a10:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 a14:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 a18:	e2533001 	subs	r3, r3, #1
 a1c:	2afffff7 	bcs	a00 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a20:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 a24:	e35c0000 	cmp	ip, #0
 a28:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 a2c:	e2883001 	add	r3, r8, #1
 a30:	e7d91001 	ldrb	r1, [r9, r1]
 a34:	e4c71001 	strb	r1, [r7], #1
 a38:	11a08003 	movne	r8, r3
 a3c:	1affffec 	bne	9f4 <printint+0x38>
  if(neg)
 a40:	e35a0000 	cmp	sl, #0
 a44:	0a000004 	beq	a5c <printint+0xa0>
    buf[i++] = '-';
 a48:	e24b2024 	sub	r2, fp, #36	; 0x24
 a4c:	e3a0102d 	mov	r1, #45	; 0x2d
 a50:	e0822003 	add	r2, r2, r3
 a54:	e2883002 	add	r3, r8, #2
 a58:	e5421010 	strb	r1, [r2, #-16]
 a5c:	e0846003 	add	r6, r4, r3
 a60:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 a64:	e3a02001 	mov	r2, #1
 a68:	e24b1035 	sub	r1, fp, #53	; 0x35
 a6c:	e1a00005 	mov	r0, r5
 a70:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 a74:	ebfffee6 	bl	614 <write>

  while(--i >= 0)
 a78:	e1540006 	cmp	r4, r6
 a7c:	1afffff7 	bne	a60 <printint+0xa4>
    putc(fd, buf[i]);
}
 a80:	e24bd020 	sub	sp, fp, #32
 a84:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000a88 <div>:
{
 a88:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 a8c:	e3a02000 	mov	r2, #0
{
 a90:	e28db008 	add	fp, sp, #8
 a94:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 a98:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 a9c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 aa0:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 aa4:	e1a0c33e 	lsr	ip, lr, r3
 aa8:	e20cc001 	and	ip, ip, #1
 aac:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 ab0:	e1520001 	cmp	r2, r1
            r = r - d;
 ab4:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 ab8:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 abc:	e2533001 	subs	r3, r3, #1
 ac0:	38bd8810 	popcc	{r4, fp, pc}
 ac4:	eafffff6 	b	aa4 <div+0x1c>

00000ac8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 ac8:	e92d000e 	push	{r1, r2, r3}
 acc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 ad0:	e28db018 	add	fp, sp, #24
 ad4:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ad8:	e59b5004 	ldr	r5, [fp, #4]
 adc:	e5d54000 	ldrb	r4, [r5]
 ae0:	e3540000 	cmp	r4, #0
 ae4:	0a00002b 	beq	b98 <printf+0xd0>
 ae8:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 aec:	e28b8008 	add	r8, fp, #8
  state = 0;
 af0:	e3a06000 	mov	r6, #0
 af4:	ea00000a 	b	b24 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 af8:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 afc:	01a06004 	moveq	r6, r4
      if(c == '%'){
 b00:	0a000004 	beq	b18 <printf+0x50>
 b04:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 b08:	e3a02001 	mov	r2, #1
 b0c:	e1a00007 	mov	r0, r7
 b10:	e5614006 	strb	r4, [r1, #-6]!
 b14:	ebfffebe 	bl	614 <write>
  for(i = 0; fmt[i]; i++){
 b18:	e5f54001 	ldrb	r4, [r5, #1]!
 b1c:	e3540000 	cmp	r4, #0
 b20:	0a00001c 	beq	b98 <printf+0xd0>
    if(state == 0){
 b24:	e3560000 	cmp	r6, #0
 b28:	0afffff2 	beq	af8 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b2c:	e3560025 	cmp	r6, #37	; 0x25
 b30:	1afffff8 	bne	b18 <printf+0x50>
      if(c == 'd'){
 b34:	e3540064 	cmp	r4, #100	; 0x64
 b38:	0a000030 	beq	c00 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b3c:	e20430f7 	and	r3, r4, #247	; 0xf7
 b40:	e3530070 	cmp	r3, #112	; 0x70
 b44:	0a000017 	beq	ba8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b48:	e3540073 	cmp	r4, #115	; 0x73
 b4c:	0a00001c 	beq	bc4 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b50:	e3540063 	cmp	r4, #99	; 0x63
 b54:	0a000037 	beq	c38 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b58:	e3540025 	cmp	r4, #37	; 0x25
 b5c:	0a00002e 	beq	c1c <printf+0x154>
  write(fd, &c, 1);
 b60:	e3a02001 	mov	r2, #1
 b64:	e24b1019 	sub	r1, fp, #25
 b68:	e1a00007 	mov	r0, r7
 b6c:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 b70:	ebfffea7 	bl	614 <write>
 b74:	e3a02001 	mov	r2, #1
 b78:	e24b101a 	sub	r1, fp, #26
 b7c:	e1a00007 	mov	r0, r7
 b80:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 b84:	ebfffea2 	bl	614 <write>
  for(i = 0; fmt[i]; i++){
 b88:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b8c:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 b90:	e3540000 	cmp	r4, #0
 b94:	1affffe2 	bne	b24 <printf+0x5c>
    }
  }
}
 b98:	e24bd018 	sub	sp, fp, #24
 b9c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 ba0:	e28dd00c 	add	sp, sp, #12
 ba4:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 ba8:	e3a03000 	mov	r3, #0
 bac:	e3a02010 	mov	r2, #16
 bb0:	e4981004 	ldr	r1, [r8], #4
 bb4:	e1a00007 	mov	r0, r7
 bb8:	ebffff7f 	bl	9bc <printint>
      state = 0;
 bbc:	e3a06000 	mov	r6, #0
 bc0:	eaffffd4 	b	b18 <printf+0x50>
        s = (char*)*ap;
 bc4:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 bc8:	e3540000 	cmp	r4, #0
 bcc:	0a000021 	beq	c58 <printf+0x190>
        while(*s != 0){
 bd0:	e5d46000 	ldrb	r6, [r4]
 bd4:	e3560000 	cmp	r6, #0
 bd8:	0affffce 	beq	b18 <printf+0x50>
  write(fd, &c, 1);
 bdc:	e3a02001 	mov	r2, #1
 be0:	e24b101d 	sub	r1, fp, #29
 be4:	e1a00007 	mov	r0, r7
 be8:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 bec:	ebfffe88 	bl	614 <write>
        while(*s != 0){
 bf0:	e5f46001 	ldrb	r6, [r4, #1]!
 bf4:	e3560000 	cmp	r6, #0
 bf8:	1afffff7 	bne	bdc <printf+0x114>
 bfc:	eaffffc5 	b	b18 <printf+0x50>
        printint(fd, *ap, 10, 1);
 c00:	e3a03001 	mov	r3, #1
 c04:	e3a0200a 	mov	r2, #10
 c08:	e4981004 	ldr	r1, [r8], #4
 c0c:	e1a00007 	mov	r0, r7
 c10:	ebffff69 	bl	9bc <printint>
      state = 0;
 c14:	e3a06000 	mov	r6, #0
 c18:	eaffffbe 	b	b18 <printf+0x50>
 c1c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c20:	e3a02001 	mov	r2, #1
 c24:	e1a00007 	mov	r0, r7
 c28:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 c2c:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 c30:	ebfffe77 	bl	614 <write>
 c34:	eaffffb7 	b	b18 <printf+0x50>
        putc(fd, *ap);
 c38:	e4983004 	ldr	r3, [r8], #4
 c3c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c40:	e3a02001 	mov	r2, #1
 c44:	e1a00007 	mov	r0, r7
      state = 0;
 c48:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 c4c:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 c50:	ebfffe6f 	bl	614 <write>
 c54:	eaffffaf 	b	b18 <printf+0x50>
          s = "(null)";
 c58:	e3004e44 	movw	r4, #3652	; 0xe44
        while(*s != 0){
 c5c:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 c60:	e3404000 	movt	r4, #0
 c64:	eaffffdc 	b	bdc <printf+0x114>

00000c68 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c68:	e300ce5c 	movw	ip, #3676	; 0xe5c
 c6c:	e340c000 	movt	ip, #0
{
 c70:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 c74:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c78:	e59c3000 	ldr	r3, [ip]
{
 c7c:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c80:	e1530001 	cmp	r3, r1
 c84:	e5932000 	ldr	r2, [r3]
 c88:	2a000017 	bcs	cec <free+0x84>
 c8c:	e1510002 	cmp	r1, r2
 c90:	3a000001 	bcc	c9c <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c94:	e1530002 	cmp	r3, r2
 c98:	3a000017 	bcc	cfc <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c9c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ca0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 ca4:	e081418e 	add	r4, r1, lr, lsl #3
 ca8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 cac:	05922004 	ldreq	r2, [r2, #4]
 cb0:	0082e00e 	addeq	lr, r2, lr
 cb4:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 cb8:	05932000 	ldreq	r2, [r3]
 cbc:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 cc0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 cc4:	e5932004 	ldr	r2, [r3, #4]
 cc8:	e083e182 	add	lr, r3, r2, lsl #3
 ccc:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 cd0:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 cd4:	05101004 	ldreq	r1, [r0, #-4]
 cd8:	00812002 	addeq	r2, r1, r2
 cdc:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 ce0:	05102008 	ldreq	r2, [r0, #-8]
 ce4:	05832000 	streq	r2, [r3]
}
 ce8:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cec:	e1530002 	cmp	r3, r2
 cf0:	3a000001 	bcc	cfc <free+0x94>
 cf4:	e1510002 	cmp	r1, r2
 cf8:	3affffe7 	bcc	c9c <free+0x34>
{
 cfc:	e1a03002 	mov	r3, r2
 d00:	eaffffde 	b	c80 <free+0x18>

00000d04 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d04:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d08:	e3007e5c 	movw	r7, #3676	; 0xe5c
 d0c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d10:	e2804007 	add	r4, r0, #7
{
 d14:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 d18:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d1c:	e1a041a4 	lsr	r4, r4, #3
 d20:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d24:	e3530000 	cmp	r3, #0
 d28:	0a000027 	beq	dcc <malloc+0xc8>
 d2c:	e5930000 	ldr	r0, [r3]
 d30:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 d34:	e1540002 	cmp	r4, r2
 d38:	9a000019 	bls	da4 <malloc+0xa0>
 d3c:	e3540a01 	cmp	r4, #4096	; 0x1000
 d40:	21a05004 	movcs	r5, r4
 d44:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 d48:	e1a06185 	lsl	r6, r5, #3
 d4c:	ea000003 	b	d60 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d50:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d54:	e5902004 	ldr	r2, [r0, #4]
 d58:	e1520004 	cmp	r2, r4
 d5c:	2a000010 	bcs	da4 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d60:	e5972000 	ldr	r2, [r7]
 d64:	e1a03000 	mov	r3, r0
 d68:	e1520000 	cmp	r2, r0
 d6c:	1afffff7 	bne	d50 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 d70:	e1a00006 	mov	r0, r6
 d74:	ebfffecf 	bl	8b8 <sbrk>
 d78:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 d7c:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 d80:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 d84:	0a000004 	beq	d9c <malloc+0x98>
  hp->s.size = nu;
 d88:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 d8c:	ebffffb5 	bl	c68 <free>
  return freep;
 d90:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 d94:	e3530000 	cmp	r3, #0
 d98:	1affffec 	bne	d50 <malloc+0x4c>
        return 0;
 d9c:	e3a00000 	mov	r0, #0
  }
}
 da0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 da4:	e1540002 	cmp	r4, r2
      freep = prevp;
 da8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 dac:	10422004 	subne	r2, r2, r4
 db0:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 db4:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 db8:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 dbc:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 dc0:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 dc4:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 dc8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 dcc:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 dd0:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 dd4:	e5870000 	str	r0, [r7]
 dd8:	e5870004 	str	r0, [r7, #4]
 ddc:	eaffffd6 	b	d3c <malloc+0x38>
