
test:     file format elf32-i386


Disassembly of section .interp:

08048154 <.interp>:
 8048154:	2f                   	das    
 8048155:	6c                   	ins    BYTE PTR es:[edi],dx
 8048156:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 804815d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 8048164:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .note.ABI-tag:

08048168 <.note.ABI-tag>:
 8048168:	04 00                	add    al,0x0
 804816a:	00 00                	add    BYTE PTR [eax],al
 804816c:	10 00                	adc    BYTE PTR [eax],al
 804816e:	00 00                	add    BYTE PTR [eax],al
 8048170:	01 00                	add    DWORD PTR [eax],eax
 8048172:	00 00                	add    BYTE PTR [eax],al
 8048174:	47                   	inc    edi
 8048175:	4e                   	dec    esi
 8048176:	55                   	push   ebp
 8048177:	00 00                	add    BYTE PTR [eax],al
 8048179:	00 00                	add    BYTE PTR [eax],al
 804817b:	00 03                	add    BYTE PTR [ebx],al
 804817d:	00 00                	add    BYTE PTR [eax],al
 804817f:	00 02                	add    BYTE PTR [edx],al
 8048181:	00 00                	add    BYTE PTR [eax],al
 8048183:	00 00                	add    BYTE PTR [eax],al
 8048185:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .note.gnu.build-id:

08048188 <.note.gnu.build-id>:
 8048188:	04 00                	add    al,0x0
 804818a:	00 00                	add    BYTE PTR [eax],al
 804818c:	14 00                	adc    al,0x0
 804818e:	00 00                	add    BYTE PTR [eax],al
 8048190:	03 00                	add    eax,DWORD PTR [eax]
 8048192:	00 00                	add    BYTE PTR [eax],al
 8048194:	47                   	inc    edi
 8048195:	4e                   	dec    esi
 8048196:	55                   	push   ebp
 8048197:	00 86 91 37 d2 2f    	add    BYTE PTR [esi+0x2fd23791],al
 804819d:	6d                   	ins    DWORD PTR es:[edi],dx
 804819e:	88 5e b4             	mov    BYTE PTR [esi-0x4c],bl
 80481a1:	08 43 72             	or     BYTE PTR [ebx+0x72],al
 80481a4:	71 bb                	jno    8048161 <_init-0x167>
 80481a6:	db 6c fb 1b          	fld    TBYTE PTR [ebx+edi*8+0x1b]
 80481aa:	24 49                	and    al,0x49

Disassembly of section .gnu.hash:

080481ac <.gnu.hash>:
 80481ac:	02 00                	add    al,BYTE PTR [eax]
 80481ae:	00 00                	add    BYTE PTR [eax],al
 80481b0:	04 00                	add    al,0x0
 80481b2:	00 00                	add    BYTE PTR [eax],al
 80481b4:	01 00                	add    DWORD PTR [eax],eax
 80481b6:	00 00                	add    BYTE PTR [eax],al
 80481b8:	05 00 00 00 00       	add    eax,0x0
 80481bd:	24 40                	and    al,0x40
 80481bf:	20 04 00             	and    BYTE PTR [eax+eax*1],al
 80481c2:	00 00                	add    BYTE PTR [eax],al
 80481c4:	05 00 00 00 cb       	add    eax,0xcb000000
 80481c9:	96                   	xchg   esi,eax
 80481ca:	93                   	xchg   ebx,eax
 80481cb:	1c ad                	sbb    al,0xad
 80481cd:	4b                   	dec    ebx
 80481ce:	e3 c0                	jecxz  8048190 <_init-0x138>

Disassembly of section .dynsym:

080481d0 <.dynsym>:
	...
 80481e0:	21 00                	and    DWORD PTR [eax],eax
	...
 80481ea:	00 00                	add    BYTE PTR [eax],al
 80481ec:	12 00                	adc    al,BYTE PTR [eax]
 80481ee:	00 00                	add    BYTE PTR [eax],al
 80481f0:	44                   	inc    esp
	...
 80481f9:	00 00                	add    BYTE PTR [eax],al
 80481fb:	00 20                	add    BYTE PTR [eax],ah
 80481fd:	00 00                	add    BYTE PTR [eax],al
 80481ff:	00 28                	add    BYTE PTR [eax],ch
	...
 8048209:	00 00                	add    BYTE PTR [eax],al
 804820b:	00 12                	add    BYTE PTR [edx],dl
 804820d:	00 00                	add    BYTE PTR [eax],al
 804820f:	00 1a                	add    BYTE PTR [edx],bl
 8048211:	00 00                	add    BYTE PTR [eax],al
 8048213:	00 46 84             	add    BYTE PTR [esi-0x7c],al
 8048216:	04 08                	add    al,0x8
 8048218:	35 00 00 00 12       	xor    eax,0x12000000
 804821d:	00 0e                	add    BYTE PTR [esi],cl
 804821f:	00 0b                	add    BYTE PTR [ebx],cl
 8048221:	00 00                	add    BYTE PTR [eax],al
 8048223:	00 5c 85 04          	add    BYTE PTR [ebp+eax*4+0x4],bl
 8048227:	08 04 00             	or     BYTE PTR [eax+eax*1],al
 804822a:	00 00                	add    BYTE PTR [eax],al
 804822c:	11 00                	adc    DWORD PTR [eax],eax
 804822e:	10 00                	adc    BYTE PTR [eax],al

Disassembly of section .dynstr:

08048230 <.dynstr>:
 8048230:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 8048234:	63 2e                	arpl   WORD PTR [esi],bp
 8048236:	73 6f                	jae    80482a7 <_init-0x21>
 8048238:	2e 36 00 5f 49       	cs add BYTE PTR ss:[edi+0x49],bl
 804823d:	4f                   	dec    edi
 804823e:	5f                   	pop    edi
 804823f:	73 74                	jae    80482b5 <_init-0x13>
 8048241:	64 69 6e 5f 75 73 65 	imul   ebp,DWORD PTR fs:[esi+0x5f],0x64657375
 8048248:	64 
 8048249:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 804824c:	72 63                	jb     80482b1 <_init-0x17>
 804824e:	70 79                	jo     80482c9 <_init+0x1>
 8048250:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 8048253:	69 6e 74 66 00 5f 5f 	imul   ebp,DWORD PTR [esi+0x74],0x5f5f0066
 804825a:	6c                   	ins    BYTE PTR es:[edi],dx
 804825b:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [edx+0x63],0x6174735f
 8048262:	72 74                	jb     80482d8 <_init+0x10>
 8048264:	5f                   	pop    edi
 8048265:	6d                   	ins    DWORD PTR es:[edi],dx
 8048266:	61                   	popa   
 8048267:	69 6e 00 47 4c 49 42 	imul   ebp,DWORD PTR [esi+0x0],0x42494c47
 804826e:	43                   	inc    ebx
 804826f:	5f                   	pop    edi
 8048270:	32 2e                	xor    ch,BYTE PTR [esi]
 8048272:	30 00                	xor    BYTE PTR [eax],al
 8048274:	5f                   	pop    edi
 8048275:	5f                   	pop    edi
 8048276:	67 6d                	ins    DWORD PTR es:[di],dx
 8048278:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8048279:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804827a:	5f                   	pop    edi
 804827b:	73 74                	jae    80482f1 <.plt+0x1>
 804827d:	61                   	popa   
 804827e:	72 74                	jb     80482f4 <.plt+0x4>
 8048280:	5f                   	pop    edi
 8048281:	5f                   	pop    edi
	...

Disassembly of section .gnu.version:

08048284 <.gnu.version>:
 8048284:	00 00                	add    BYTE PTR [eax],al
 8048286:	02 00                	add    al,BYTE PTR [eax]
 8048288:	00 00                	add    BYTE PTR [eax],al
 804828a:	02 00                	add    al,BYTE PTR [eax]
 804828c:	01 00                	add    DWORD PTR [eax],eax
 804828e:	01 00                	add    DWORD PTR [eax],eax

Disassembly of section .gnu.version_r:

08048290 <.gnu.version_r>:
 8048290:	01 00                	add    DWORD PTR [eax],eax
 8048292:	01 00                	add    DWORD PTR [eax],eax
 8048294:	01 00                	add    DWORD PTR [eax],eax
 8048296:	00 00                	add    BYTE PTR [eax],al
 8048298:	10 00                	adc    BYTE PTR [eax],al
 804829a:	00 00                	add    BYTE PTR [eax],al
 804829c:	00 00                	add    BYTE PTR [eax],al
 804829e:	00 00                	add    BYTE PTR [eax],al
 80482a0:	10 69 69             	adc    BYTE PTR [ecx+0x69],ch
 80482a3:	0d 00 00 02 00       	or     eax,0x20000
 80482a8:	3a 00                	cmp    al,BYTE PTR [eax]
 80482aa:	00 00                	add    BYTE PTR [eax],al
 80482ac:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

080482b0 <.rel.dyn>:
 80482b0:	fc                   	cld    
 80482b1:	9f                   	lahf   
 80482b2:	04 08                	add    al,0x8
 80482b4:	06                   	push   es
 80482b5:	02 00                	add    al,BYTE PTR [eax]
	...

Disassembly of section .rel.plt:

080482b8 <.rel.plt>:
 80482b8:	0c a0                	or     al,0xa0
 80482ba:	04 08                	add    al,0x8
 80482bc:	07                   	pop    es
 80482bd:	01 00                	add    DWORD PTR [eax],eax
 80482bf:	00 10                	add    BYTE PTR [eax],dl
 80482c1:	a0 04 08 07 03       	mov    al,ds:0x3070804
	...

Disassembly of section .init:

080482c8 <_init>:
 80482c8:	53                   	push   ebx
 80482c9:	83 ec 08             	sub    esp,0x8
 80482cc:	e8 af 00 00 00       	call   8048380 <__x86.get_pc_thunk.bx>
 80482d1:	81 c3 2f 1d 00 00    	add    ebx,0x1d2f
 80482d7:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 80482dd:	85 c0                	test   eax,eax
 80482df:	74 05                	je     80482e6 <_init+0x1e>
 80482e1:	e8 3a 00 00 00       	call   8048320 <__gmon_start__@plt>
 80482e6:	83 c4 08             	add    esp,0x8
 80482e9:	5b                   	pop    ebx
 80482ea:	c3                   	ret    

Disassembly of section .plt:

080482f0 <.plt>:
 80482f0:	ff 35 04 a0 04 08    	push   DWORD PTR ds:0x804a004
 80482f6:	ff 25 08 a0 04 08    	jmp    DWORD PTR ds:0x804a008
 80482fc:	00 00                	add    BYTE PTR [eax],al
	...

08048300 <printf@plt>:
 8048300:	ff 25 0c a0 04 08    	jmp    DWORD PTR ds:0x804a00c
 8048306:	68 00 00 00 00       	push   0x0
 804830b:	e9 e0 ff ff ff       	jmp    80482f0 <.plt>

08048310 <__libc_start_main@plt>:
 8048310:	ff 25 10 a0 04 08    	jmp    DWORD PTR ds:0x804a010
 8048316:	68 08 00 00 00       	push   0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <.plt>

Disassembly of section .plt.got:

08048320 <__gmon_start__@plt>:
 8048320:	ff 25 fc 9f 04 08    	jmp    DWORD PTR ds:0x8049ffc
 8048326:	66 90                	xchg   ax,ax

Disassembly of section .text:

08048330 <_start>:
 8048330:	31 ed                	xor    ebp,ebp
 8048332:	5e                   	pop    esi
 8048333:	89 e1                	mov    ecx,esp
 8048335:	83 e4 f0             	and    esp,0xfffffff0
 8048338:	50                   	push   eax
 8048339:	54                   	push   esp
 804833a:	52                   	push   edx
 804833b:	e8 23 00 00 00       	call   8048363 <_start+0x33>
 8048340:	81 c3 c0 1c 00 00    	add    ebx,0x1cc0
 8048346:	8d 83 40 e5 ff ff    	lea    eax,[ebx-0x1ac0]
 804834c:	50                   	push   eax
 804834d:	8d 83 e0 e4 ff ff    	lea    eax,[ebx-0x1b20]
 8048353:	50                   	push   eax
 8048354:	51                   	push   ecx
 8048355:	56                   	push   esi
 8048356:	c7 c0 7b 84 04 08    	mov    eax,0x804847b
 804835c:	50                   	push   eax
 804835d:	e8 ae ff ff ff       	call   8048310 <__libc_start_main@plt>
 8048362:	f4                   	hlt    
 8048363:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8048366:	c3                   	ret    
 8048367:	66 90                	xchg   ax,ax
 8048369:	66 90                	xchg   ax,ax
 804836b:	66 90                	xchg   ax,ax
 804836d:	66 90                	xchg   ax,ax
 804836f:	90                   	nop

08048370 <_dl_relocate_static_pie>:
 8048370:	f3 c3                	repz ret 
 8048372:	66 90                	xchg   ax,ax
 8048374:	66 90                	xchg   ax,ax
 8048376:	66 90                	xchg   ax,ax
 8048378:	66 90                	xchg   ax,ax
 804837a:	66 90                	xchg   ax,ax
 804837c:	66 90                	xchg   ax,ax
 804837e:	66 90                	xchg   ax,ax

08048380 <__x86.get_pc_thunk.bx>:
 8048380:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8048383:	c3                   	ret    
 8048384:	66 90                	xchg   ax,ax
 8048386:	66 90                	xchg   ax,ax
 8048388:	66 90                	xchg   ax,ax
 804838a:	66 90                	xchg   ax,ax
 804838c:	66 90                	xchg   ax,ax
 804838e:	66 90                	xchg   ax,ax

08048390 <deregister_tm_clones>:
 8048390:	b8 1c a0 04 08       	mov    eax,0x804a01c
 8048395:	3d 1c a0 04 08       	cmp    eax,0x804a01c
 804839a:	74 24                	je     80483c0 <deregister_tm_clones+0x30>
 804839c:	b8 00 00 00 00       	mov    eax,0x0
 80483a1:	85 c0                	test   eax,eax
 80483a3:	74 1b                	je     80483c0 <deregister_tm_clones+0x30>
 80483a5:	55                   	push   ebp
 80483a6:	89 e5                	mov    ebp,esp
 80483a8:	83 ec 14             	sub    esp,0x14
 80483ab:	68 1c a0 04 08       	push   0x804a01c
 80483b0:	ff d0                	call   eax
 80483b2:	83 c4 10             	add    esp,0x10
 80483b5:	c9                   	leave  
 80483b6:	c3                   	ret    
 80483b7:	89 f6                	mov    esi,esi
 80483b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 80483c0:	f3 c3                	repz ret 
 80483c2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 80483c9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

080483d0 <register_tm_clones>:
 80483d0:	b8 1c a0 04 08       	mov    eax,0x804a01c
 80483d5:	2d 1c a0 04 08       	sub    eax,0x804a01c
 80483da:	c1 f8 02             	sar    eax,0x2
 80483dd:	89 c2                	mov    edx,eax
 80483df:	c1 ea 1f             	shr    edx,0x1f
 80483e2:	01 d0                	add    eax,edx
 80483e4:	d1 f8                	sar    eax,1
 80483e6:	74 20                	je     8048408 <register_tm_clones+0x38>
 80483e8:	ba 00 00 00 00       	mov    edx,0x0
 80483ed:	85 d2                	test   edx,edx
 80483ef:	74 17                	je     8048408 <register_tm_clones+0x38>
 80483f1:	55                   	push   ebp
 80483f2:	89 e5                	mov    ebp,esp
 80483f4:	83 ec 10             	sub    esp,0x10
 80483f7:	50                   	push   eax
 80483f8:	68 1c a0 04 08       	push   0x804a01c
 80483fd:	ff d2                	call   edx
 80483ff:	83 c4 10             	add    esp,0x10
 8048402:	c9                   	leave  
 8048403:	c3                   	ret    
 8048404:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048408:	f3 c3                	repz ret 
 804840a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

08048410 <__do_global_dtors_aux>:
 8048410:	80 3d 1c a0 04 08 00 	cmp    BYTE PTR ds:0x804a01c,0x0
 8048417:	75 17                	jne    8048430 <__do_global_dtors_aux+0x20>
 8048419:	55                   	push   ebp
 804841a:	89 e5                	mov    ebp,esp
 804841c:	83 ec 08             	sub    esp,0x8
 804841f:	e8 6c ff ff ff       	call   8048390 <deregister_tm_clones>
 8048424:	c6 05 1c a0 04 08 01 	mov    BYTE PTR ds:0x804a01c,0x1
 804842b:	c9                   	leave  
 804842c:	c3                   	ret    
 804842d:	8d 76 00             	lea    esi,[esi+0x0]
 8048430:	f3 c3                	repz ret 
 8048432:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 8048439:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048440 <frame_dummy>:
 8048440:	55                   	push   ebp
 8048441:	89 e5                	mov    ebp,esp
 8048443:	5d                   	pop    ebp
 8048444:	eb 8a                	jmp    80483d0 <register_tm_clones>

08048446 <strcpy>:
 8048446:	55                   	push   ebp
 8048447:	89 e5                	mov    ebp,esp
 8048449:	e8 87 00 00 00       	call   80484d5 <__x86.get_pc_thunk.ax>
 804844e:	05 b2 1b 00 00       	add    eax,0x1bb2
 8048453:	eb 13                	jmp    8048468 <strcpy+0x22>
 8048455:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048458:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 804845b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 804845e:	88 10                	mov    BYTE PTR [eax],dl
 8048460:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 8048464:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 8048468:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 804846b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 804846e:	84 c0                	test   al,al
 8048470:	75 e3                	jne    8048455 <strcpy+0xf>
 8048472:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 8048475:	c6 00 00             	mov    BYTE PTR [eax],0x0
 8048478:	90                   	nop
 8048479:	5d                   	pop    ebp
 804847a:	c3                   	ret    

0804847b <main>:
 804847b:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 804847f:	83 e4 f0             	and    esp,0xfffffff0
 8048482:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048485:	55                   	push   ebp
 8048486:	89 e5                	mov    ebp,esp
 8048488:	53                   	push   ebx
 8048489:	51                   	push   ecx
 804848a:	83 ec 30             	sub    esp,0x30
 804848d:	e8 ee fe ff ff       	call   8048380 <__x86.get_pc_thunk.bx>
 8048492:	81 c3 6e 1b 00 00    	add    ebx,0x1b6e
 8048498:	8d 83 60 e5 ff ff    	lea    eax,[ebx-0x1aa0]
 804849e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80484a1:	8d 45 d4             	lea    eax,[ebp-0x2c]
 80484a4:	50                   	push   eax
 80484a5:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 80484a8:	e8 99 ff ff ff       	call   8048446 <strcpy>
 80484ad:	83 c4 08             	add    esp,0x8
 80484b0:	83 ec 08             	sub    esp,0x8
 80484b3:	8d 45 d4             	lea    eax,[ebp-0x2c]
 80484b6:	50                   	push   eax
 80484b7:	8d 83 74 e5 ff ff    	lea    eax,[ebx-0x1a8c]
 80484bd:	50                   	push   eax
 80484be:	e8 3d fe ff ff       	call   8048300 <printf@plt>
 80484c3:	83 c4 10             	add    esp,0x10
 80484c6:	b8 00 00 00 00       	mov    eax,0x0
 80484cb:	8d 65 f8             	lea    esp,[ebp-0x8]
 80484ce:	59                   	pop    ecx
 80484cf:	5b                   	pop    ebx
 80484d0:	5d                   	pop    ebp
 80484d1:	8d 61 fc             	lea    esp,[ecx-0x4]
 80484d4:	c3                   	ret    

080484d5 <__x86.get_pc_thunk.ax>:
 80484d5:	8b 04 24             	mov    eax,DWORD PTR [esp]
 80484d8:	c3                   	ret    
 80484d9:	66 90                	xchg   ax,ax
 80484db:	66 90                	xchg   ax,ax
 80484dd:	66 90                	xchg   ax,ax
 80484df:	90                   	nop

080484e0 <__libc_csu_init>:
 80484e0:	55                   	push   ebp
 80484e1:	57                   	push   edi
 80484e2:	56                   	push   esi
 80484e3:	53                   	push   ebx
 80484e4:	e8 97 fe ff ff       	call   8048380 <__x86.get_pc_thunk.bx>
 80484e9:	81 c3 17 1b 00 00    	add    ebx,0x1b17
 80484ef:	83 ec 0c             	sub    esp,0xc
 80484f2:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 80484f6:	8d b3 10 ff ff ff    	lea    esi,[ebx-0xf0]
 80484fc:	e8 c7 fd ff ff       	call   80482c8 <_init>
 8048501:	8d 83 0c ff ff ff    	lea    eax,[ebx-0xf4]
 8048507:	29 c6                	sub    esi,eax
 8048509:	c1 fe 02             	sar    esi,0x2
 804850c:	85 f6                	test   esi,esi
 804850e:	74 25                	je     8048535 <__libc_csu_init+0x55>
 8048510:	31 ff                	xor    edi,edi
 8048512:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 8048518:	83 ec 04             	sub    esp,0x4
 804851b:	55                   	push   ebp
 804851c:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 8048520:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 8048524:	ff 94 bb 0c ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf4]
 804852b:	83 c7 01             	add    edi,0x1
 804852e:	83 c4 10             	add    esp,0x10
 8048531:	39 fe                	cmp    esi,edi
 8048533:	75 e3                	jne    8048518 <__libc_csu_init+0x38>
 8048535:	83 c4 0c             	add    esp,0xc
 8048538:	5b                   	pop    ebx
 8048539:	5e                   	pop    esi
 804853a:	5f                   	pop    edi
 804853b:	5d                   	pop    ebp
 804853c:	c3                   	ret    
 804853d:	8d 76 00             	lea    esi,[esi+0x0]

08048540 <__libc_csu_fini>:
 8048540:	f3 c3                	repz ret 

Disassembly of section .fini:

08048544 <_fini>:
 8048544:	53                   	push   ebx
 8048545:	83 ec 08             	sub    esp,0x8
 8048548:	e8 33 fe ff ff       	call   8048380 <__x86.get_pc_thunk.bx>
 804854d:	81 c3 b3 1a 00 00    	add    ebx,0x1ab3
 8048553:	83 c4 08             	add    esp,0x8
 8048556:	5b                   	pop    ebx
 8048557:	c3                   	ret    

Disassembly of section .rodata:

08048558 <_fp_hw>:
 8048558:	03 00                	add    eax,DWORD PTR [eax]
	...

0804855c <_IO_stdin_used>:
 804855c:	01 00                	add    DWORD PTR [eax],eax
 804855e:	02 00                	add    al,BYTE PTR [eax]
 8048560:	43                   	inc    ebx
 8048561:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8048562:	70 79                	jo     80485dd <__GNU_EH_FRAME_HDR+0x65>
 8048564:	20 74 68 69          	and    BYTE PTR [eax+ebp*2+0x69],dh
 8048568:	73 20                	jae    804858a <__GNU_EH_FRAME_HDR+0x12>
 804856a:	73 74                	jae    80485e0 <__GNU_EH_FRAME_HDR+0x68>
 804856c:	72 69                	jb     80485d7 <__GNU_EH_FRAME_HDR+0x5f>
 804856e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804856f:	67 20 3a             	and    BYTE PTR [bp+si],bh
 8048572:	29 00                	sub    DWORD PTR [eax],eax
 8048574:	25                   	.byte 0x25
 8048575:	73 00                	jae    8048577 <_IO_stdin_used+0x1b>

Disassembly of section .eh_frame_hdr:

08048578 <__GNU_EH_FRAME_HDR>:
 8048578:	01 1b                	add    DWORD PTR [ebx],ebx
 804857a:	03 3b                	add    edi,DWORD PTR [ebx]
 804857c:	48                   	dec    eax
 804857d:	00 00                	add    BYTE PTR [eax],al
 804857f:	00 08                	add    BYTE PTR [eax],cl
 8048581:	00 00                	add    BYTE PTR [eax],al
 8048583:	00 78 fd             	add    BYTE PTR [eax-0x3],bh
 8048586:	ff                   	(bad)  
 8048587:	ff                   	(bad)  
 8048588:	78 00                	js     804858a <__GNU_EH_FRAME_HDR+0x12>
 804858a:	00 00                	add    BYTE PTR [eax],al
 804858c:	a8 fd                	test   al,0xfd
 804858e:	ff                   	(bad)  
 804858f:	ff 9c 00 00 00 f8 fd 	call   FWORD PTR [eax+eax*1-0x2080000]
 8048596:	ff                   	(bad)  
 8048597:	ff 64 00 00          	jmp    DWORD PTR [eax+eax*1+0x0]
 804859b:	00 ce                	add    dh,cl
 804859d:	fe                   	(bad)  
 804859e:	ff                   	(bad)  
 804859f:	ff b0 00 00 00 03    	push   DWORD PTR [eax+0x3000000]
 80485a5:	ff                   	(bad)  
 80485a6:	ff                   	(bad)  
 80485a7:	ff d0                	call   eax
 80485a9:	00 00                	add    BYTE PTR [eax],al
 80485ab:	00 5d ff             	add    BYTE PTR [ebp-0x1],bl
 80485ae:	ff                   	(bad)  
 80485af:	ff 04 01             	inc    DWORD PTR [ecx+eax*1]
 80485b2:	00 00                	add    BYTE PTR [eax],al
 80485b4:	68 ff ff ff 18       	push   0x18ffffff
 80485b9:	01 00                	add    DWORD PTR [eax],eax
 80485bb:	00 c8                	add    al,cl
 80485bd:	ff                   	(bad)  
 80485be:	ff                   	(bad)  
 80485bf:	ff 64 01 00          	jmp    DWORD PTR [ecx+eax*1+0x0]
	...

Disassembly of section .eh_frame:

080485c4 <__FRAME_END__-0x12c>:
 80485c4:	14 00                	adc    al,0x0
 80485c6:	00 00                	add    BYTE PTR [eax],al
 80485c8:	00 00                	add    BYTE PTR [eax],al
 80485ca:	00 00                	add    BYTE PTR [eax],al
 80485cc:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 80485cf:	00 01                	add    BYTE PTR [ecx],al
 80485d1:	7c 08                	jl     80485db <__GNU_EH_FRAME_HDR+0x63>
 80485d3:	01 1b                	add    DWORD PTR [ebx],ebx
 80485d5:	0c 04                	or     al,0x4
 80485d7:	04 88                	add    al,0x88
 80485d9:	01 00                	add    DWORD PTR [eax],eax
 80485db:	00 10                	add    BYTE PTR [eax],dl
 80485dd:	00 00                	add    BYTE PTR [eax],al
 80485df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 80485e2:	00 00                	add    BYTE PTR [eax],al
 80485e4:	8c fd                	mov    ebp,?
 80485e6:	ff                   	(bad)  
 80485e7:	ff 02                	inc    DWORD PTR [edx]
 80485e9:	00 00                	add    BYTE PTR [eax],al
 80485eb:	00 00                	add    BYTE PTR [eax],al
 80485ed:	00 00                	add    BYTE PTR [eax],al
 80485ef:	00 20                	add    BYTE PTR [eax],ah
 80485f1:	00 00                	add    BYTE PTR [eax],al
 80485f3:	00 30                	add    BYTE PTR [eax],dh
 80485f5:	00 00                	add    BYTE PTR [eax],al
 80485f7:	00 f8                	add    al,bh
 80485f9:	fc                   	cld    
 80485fa:	ff                   	(bad)  
 80485fb:	ff 30                	push   DWORD PTR [eax]
 80485fd:	00 00                	add    BYTE PTR [eax],al
 80485ff:	00 00                	add    BYTE PTR [eax],al
 8048601:	0e                   	push   cs
 8048602:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 8048605:	0c 4a                	or     al,0x4a
 8048607:	0f 0b                	ud2    
 8048609:	74 04                	je     804860f <__GNU_EH_FRAME_HDR+0x97>
 804860b:	78 00                	js     804860d <__GNU_EH_FRAME_HDR+0x95>
 804860d:	3f                   	aas    
 804860e:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 8048610:	2a 32                	sub    dh,BYTE PTR [edx]
 8048612:	24 22                	and    al,0x22
 8048614:	10 00                	adc    BYTE PTR [eax],al
 8048616:	00 00                	add    BYTE PTR [eax],al
 8048618:	54                   	push   esp
 8048619:	00 00                	add    BYTE PTR [eax],al
 804861b:	00 04 fd ff ff 08 00 	add    BYTE PTR [edi*8+0x8ffff],al
 8048622:	00 00                	add    BYTE PTR [eax],al
 8048624:	00 00                	add    BYTE PTR [eax],al
 8048626:	00 00                	add    BYTE PTR [eax],al
 8048628:	1c 00                	sbb    al,0x0
 804862a:	00 00                	add    BYTE PTR [eax],al
 804862c:	68 00 00 00 16       	push   0x16000000
 8048631:	fe                   	(bad)  
 8048632:	ff                   	(bad)  
 8048633:	ff 35 00 00 00 00    	push   DWORD PTR ds:0x0
 8048639:	41                   	inc    ecx
 804863a:	0e                   	push   cs
 804863b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 8048641:	71 c5                	jno    8048608 <__GNU_EH_FRAME_HDR+0x90>
 8048643:	0c 04                	or     al,0x4
 8048645:	04 00                	add    al,0x0
 8048647:	00 30                	add    BYTE PTR [eax],dh
 8048649:	00 00                	add    BYTE PTR [eax],al
 804864b:	00 88 00 00 00 2b    	add    BYTE PTR [eax+0x2b000000],cl
 8048651:	fe                   	(bad)  
 8048652:	ff                   	(bad)  
 8048653:	ff 5a 00             	call   FWORD PTR [edx+0x0]
 8048656:	00 00                	add    BYTE PTR [eax],al
 8048658:	00 44 0c 01          	add    BYTE PTR [esp+ecx*1+0x1],al
 804865c:	00 47 10             	add    BYTE PTR [edi+0x10],al
 804865f:	05 02 75 00 44       	add    eax,0x44007502
 8048664:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 8048668:	06                   	push   es
 8048669:	10 03                	adc    BYTE PTR [ebx],al
 804866b:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 804866e:	02 45 c1             	add    al,BYTE PTR [ebp-0x3f]
 8048671:	0c 01                	or     al,0x1
 8048673:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 8048676:	41                   	inc    ecx
 8048677:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 804867a:	04 04                	add    al,0x4
 804867c:	10 00                	adc    BYTE PTR [eax],al
 804867e:	00 00                	add    BYTE PTR [eax],al
 8048680:	bc 00 00 00 51       	mov    esp,0x51000000
 8048685:	fe                   	(bad)  
 8048686:	ff                   	(bad)  
 8048687:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
 804868a:	00 00                	add    BYTE PTR [eax],al
 804868c:	00 00                	add    BYTE PTR [eax],al
 804868e:	00 00                	add    BYTE PTR [eax],al
 8048690:	48                   	dec    eax
 8048691:	00 00                	add    BYTE PTR [eax],al
 8048693:	00 d0                	add    al,dl
 8048695:	00 00                	add    BYTE PTR [eax],al
 8048697:	00 48 fe             	add    BYTE PTR [eax-0x2],cl
 804869a:	ff                   	(bad)  
 804869b:	ff 5d 00             	call   FWORD PTR [ebp+0x0]
 804869e:	00 00                	add    BYTE PTR [eax],al
 80486a0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 80486a3:	08 85 02 41 0e 0c    	or     BYTE PTR [ebp+0xc0e4102],al
 80486a9:	87 03                	xchg   DWORD PTR [ebx],eax
 80486ab:	41                   	inc    ecx
 80486ac:	0e                   	push   cs
 80486ad:	10 86 04 41 0e 14    	adc    BYTE PTR [esi+0x140e4104],al
 80486b3:	83 05 4e 0e 20 69 0e 	add    DWORD PTR ds:0x69200e4e,0xe
 80486ba:	24 41                	and    al,0x41
 80486bc:	0e                   	push   cs
 80486bd:	28 44 0e 2c          	sub    BYTE PTR [esi+ecx*1+0x2c],al
 80486c1:	44                   	inc    esp
 80486c2:	0e                   	push   cs
 80486c3:	30 4d 0e             	xor    BYTE PTR [ebp+0xe],cl
 80486c6:	20 47 0e             	and    BYTE PTR [edi+0xe],al
 80486c9:	14 41                	adc    al,0x41
 80486cb:	c3                   	ret    
 80486cc:	0e                   	push   cs
 80486cd:	10 41 c6             	adc    BYTE PTR [ecx-0x3a],al
 80486d0:	0e                   	push   cs
 80486d1:	0c 41                	or     al,0x41
 80486d3:	c7                   	(bad)  
 80486d4:	0e                   	push   cs
 80486d5:	08 41 c5             	or     BYTE PTR [ecx-0x3b],al
 80486d8:	0e                   	push   cs
 80486d9:	04 00                	add    al,0x0
 80486db:	00 10                	add    BYTE PTR [eax],dl
 80486dd:	00 00                	add    BYTE PTR [eax],al
 80486df:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
 80486e2:	00 00                	add    BYTE PTR [eax],al
 80486e4:	5c                   	pop    esp
 80486e5:	fe                   	(bad)  
 80486e6:	ff                   	(bad)  
 80486e7:	ff 02                	inc    DWORD PTR [edx]
 80486e9:	00 00                	add    BYTE PTR [eax],al
 80486eb:	00 00                	add    BYTE PTR [eax],al
 80486ed:	00 00                	add    BYTE PTR [eax],al
	...

080486f0 <__FRAME_END__>:
 80486f0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .init_array:

08049f0c <__frame_dummy_init_array_entry>:
 8049f0c:	40                   	inc    eax
 8049f0d:	84 04 08             	test   BYTE PTR [eax+ecx*1],al

Disassembly of section .fini_array:

08049f10 <__do_global_dtors_aux_fini_array_entry>:
 8049f10:	10                   	.byte 0x10
 8049f11:	84 04 08             	test   BYTE PTR [eax+ecx*1],al

Disassembly of section .dynamic:

08049f14 <_DYNAMIC>:
 8049f14:	01 00                	add    DWORD PTR [eax],eax
 8049f16:	00 00                	add    BYTE PTR [eax],al
 8049f18:	01 00                	add    DWORD PTR [eax],eax
 8049f1a:	00 00                	add    BYTE PTR [eax],al
 8049f1c:	0c 00                	or     al,0x0
 8049f1e:	00 00                	add    BYTE PTR [eax],al
 8049f20:	c8 82 04 08          	enter  0x482,0x8
 8049f24:	0d 00 00 00 44       	or     eax,0x44000000
 8049f29:	85 04 08             	test   DWORD PTR [eax+ecx*1],eax
 8049f2c:	19 00                	sbb    DWORD PTR [eax],eax
 8049f2e:	00 00                	add    BYTE PTR [eax],al
 8049f30:	0c 9f                	or     al,0x9f
 8049f32:	04 08                	add    al,0x8
 8049f34:	1b 00                	sbb    eax,DWORD PTR [eax]
 8049f36:	00 00                	add    BYTE PTR [eax],al
 8049f38:	04 00                	add    al,0x0
 8049f3a:	00 00                	add    BYTE PTR [eax],al
 8049f3c:	1a 00                	sbb    al,BYTE PTR [eax]
 8049f3e:	00 00                	add    BYTE PTR [eax],al
 8049f40:	10 9f 04 08 1c 00    	adc    BYTE PTR [edi+0x1c0804],bl
 8049f46:	00 00                	add    BYTE PTR [eax],al
 8049f48:	04 00                	add    al,0x0
 8049f4a:	00 00                	add    BYTE PTR [eax],al
 8049f4c:	f5                   	cmc    
 8049f4d:	fe                   	(bad)  
 8049f4e:	ff 6f ac             	jmp    FWORD PTR [edi-0x54]
 8049f51:	81 04 08 05 00 00 00 	add    DWORD PTR [eax+ecx*1],0x5
 8049f58:	30 82 04 08 06 00    	xor    BYTE PTR [edx+0x60804],al
 8049f5e:	00 00                	add    BYTE PTR [eax],al
 8049f60:	d0 81 04 08 0a 00    	rol    BYTE PTR [ecx+0xa0804],1
 8049f66:	00 00                	add    BYTE PTR [eax],al
 8049f68:	53                   	push   ebx
 8049f69:	00 00                	add    BYTE PTR [eax],al
 8049f6b:	00 0b                	add    BYTE PTR [ebx],cl
 8049f6d:	00 00                	add    BYTE PTR [eax],al
 8049f6f:	00 10                	add    BYTE PTR [eax],dl
 8049f71:	00 00                	add    BYTE PTR [eax],al
 8049f73:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 8049f79:	00 00                	add    BYTE PTR [eax],al
 8049f7b:	00 03                	add    BYTE PTR [ebx],al
 8049f7d:	00 00                	add    BYTE PTR [eax],al
 8049f7f:	00 00                	add    BYTE PTR [eax],al
 8049f81:	a0 04 08 02 00       	mov    al,ds:0x20804
 8049f86:	00 00                	add    BYTE PTR [eax],al
 8049f88:	10 00                	adc    BYTE PTR [eax],al
 8049f8a:	00 00                	add    BYTE PTR [eax],al
 8049f8c:	14 00                	adc    al,0x0
 8049f8e:	00 00                	add    BYTE PTR [eax],al
 8049f90:	11 00                	adc    DWORD PTR [eax],eax
 8049f92:	00 00                	add    BYTE PTR [eax],al
 8049f94:	17                   	pop    ss
 8049f95:	00 00                	add    BYTE PTR [eax],al
 8049f97:	00 b8 82 04 08 11    	add    BYTE PTR [eax+0x11080482],bh
 8049f9d:	00 00                	add    BYTE PTR [eax],al
 8049f9f:	00 b0 82 04 08 12    	add    BYTE PTR [eax+0x12080482],dh
 8049fa5:	00 00                	add    BYTE PTR [eax],al
 8049fa7:	00 08                	add    BYTE PTR [eax],cl
 8049fa9:	00 00                	add    BYTE PTR [eax],al
 8049fab:	00 13                	add    BYTE PTR [ebx],dl
 8049fad:	00 00                	add    BYTE PTR [eax],al
 8049faf:	00 08                	add    BYTE PTR [eax],cl
 8049fb1:	00 00                	add    BYTE PTR [eax],al
 8049fb3:	00 fe                	add    dh,bh
 8049fb5:	ff                   	(bad)  
 8049fb6:	ff 6f 90             	jmp    FWORD PTR [edi-0x70]
 8049fb9:	82 04 08 ff          	add    BYTE PTR [eax+ecx*1],0xff
 8049fbd:	ff                   	(bad)  
 8049fbe:	ff 6f 01             	jmp    FWORD PTR [edi+0x1]
 8049fc1:	00 00                	add    BYTE PTR [eax],al
 8049fc3:	00 f0                	add    al,dh
 8049fc5:	ff                   	(bad)  
 8049fc6:	ff 6f 84             	jmp    FWORD PTR [edi-0x7c]
 8049fc9:	82 04 08 00          	add    BYTE PTR [eax+ecx*1],0x0
	...

Disassembly of section .got:

08049ffc <.got>:
 8049ffc:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .got.plt:

0804a000 <_GLOBAL_OFFSET_TABLE_>:
 804a000:	14 9f                	adc    al,0x9f
 804a002:	04 08                	add    al,0x8
	...
 804a00c:	06                   	push   es
 804a00d:	83 04 08 16          	add    DWORD PTR [eax+ecx*1],0x16
 804a011:	83                   	.byte 0x83
 804a012:	04 08                	add    al,0x8

Disassembly of section .data:

0804a014 <__data_start>:
 804a014:	00 00                	add    BYTE PTR [eax],al
	...

0804a018 <__dso_handle>:
 804a018:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .bss:

0804a01c <__bss_start>:
 804a01c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 55 62             	sub    BYTE PTR [ebp+0x62],dl
   8:	75 6e                	jne    78 <_init-0x8048250>
   a:	74 75                	je     81 <_init-0x8048247>
   c:	20 37                	and    BYTE PTR [edi],dh
   e:	2e 35 2e 30 2d 33    	cs xor eax,0x332d302e
  14:	75 62                	jne    78 <_init-0x8048250>
  16:	75 6e                	jne    86 <_init-0x8048242>
  18:	74 75                	je     8f <_init-0x8048239>
  1a:	31 7e 31             	xor    DWORD PTR [esi+0x31],edi
  1d:	38 2e                	cmp    BYTE PTR [esi],ch
  1f:	30 34 29             	xor    BYTE PTR [ecx+ebp*1],dh
  22:	20 37                	and    BYTE PTR [edi],dh
  24:	2e                   	cs
  25:	35                   	.byte 0x35
  26:	2e 30 00             	xor    BYTE PTR cs:[eax],al

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    al,0x0
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 00                	add    al,0x0
   c:	00 00                	add    BYTE PTR [eax],al
   e:	00 00                	add    BYTE PTR [eax],al
  10:	46                   	inc    esi
  11:	84 04 08             	test   BYTE PTR [eax+ecx*1],al
  14:	8f 00                	pop    DWORD PTR [eax]
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
   1:	03 00                	add    eax,DWORD PTR [eax]
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	95                   	xchg   ebp,eax
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 83             	add    BYTE PTR [ebx+eax*4],cl
  12:	01 00                	add    DWORD PTR [eax],eax
  14:	00 24 01             	add    BYTE PTR [ecx+eax*1],ah
  17:	00 00                	add    BYTE PTR [eax],al
  19:	46                   	inc    esi
  1a:	84 04 08             	test   BYTE PTR [eax+ecx*1],al
  1d:	8f 00                	pop    DWORD PTR [eax]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 41 00             	add    al,BYTE PTR [ecx+0x0]
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	02 d8                	add    bl,al
  2c:	30 00                	xor    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	03 04 07             	add    eax,DWORD PTR [edi+eax*1]
  33:	99                   	cdq    
  34:	01 00                	add    DWORD PTR [eax],eax
  36:	00 03                	add    BYTE PTR [ebx],al
  38:	01 08                	add    DWORD PTR [eax],ecx
  3a:	75 01                	jne    3d <_init-0x804828b>
  3c:	00 00                	add    BYTE PTR [eax],al
  3e:	03 02                	add    eax,DWORD PTR [edx]
  40:	07                   	pop    es
  41:	ef                   	out    dx,eax
  42:	01 00                	add    DWORD PTR [eax],eax
  44:	00 03                	add    BYTE PTR [ebx],al
  46:	04 07                	add    al,0x7
  48:	94                   	xchg   esp,eax
  49:	01 00                	add    DWORD PTR [eax],eax
  4b:	00 03                	add    BYTE PTR [ebx],al
  4d:	01 06                	add    DWORD PTR [esi],eax
  4f:	77 01                	ja     52 <_init-0x8048276>
  51:	00 00                	add    BYTE PTR [eax],al
  53:	03 02                	add    eax,DWORD PTR [edx]
  55:	05 37 00 00 00       	add    eax,0x37
  5a:	04 04                	add    al,0x4
  5c:	05 69 6e 74 00       	add    eax,0x746e69
  61:	03 08                	add    ecx,DWORD PTR [eax]
  63:	05 87 00 00 00       	add    eax,0x87
  68:	03 08                	add    ecx,DWORD PTR [eax]
  6a:	07                   	pop    es
  6b:	8f 01                	pop    DWORD PTR [ecx]
  6d:	00 00                	add    BYTE PTR [eax],al
  6f:	02 0c 00             	add    cl,BYTE PTR [eax+eax*1]
  72:	00 00                	add    BYTE PTR [eax],al
  74:	03 37                	add    esi,DWORD PTR [edi]
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	48                   	dec    eax
  7c:	02 00                	add    al,BYTE PTR [eax]
  7e:	00 03                	add    BYTE PTR [ebx],al
  80:	8c 85 00 00 00 03    	mov    WORD PTR [ebp+0x3000000],es
  86:	04 05                	add    al,0x5
  88:	8c 00                	mov    WORD PTR [eax],es
  8a:	00 00                	add    BYTE PTR [eax],al
  8c:	02 3e                	add    bh,BYTE PTR [esi]
  8e:	02 00                	add    al,BYTE PTR [eax]
  90:	00 03                	add    BYTE PTR [ebx],al
  92:	8d 6f 00             	lea    ebp,[edi+0x0]
  95:	00 00                	add    BYTE PTR [eax],al
  97:	05 04 06 04 9f       	add    eax,0x9f040604
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	00 03                	add    BYTE PTR [ebx],al
  a0:	01 06                	add    DWORD PTR [esi],eax
  a2:	7e 01                	jle    a5 <_init-0x8048223>
  a4:	00 00                	add    BYTE PTR [eax],al
  a6:	07                   	pop    es
  a7:	9f                   	lahf   
  a8:	00 00                	add    BYTE PTR [eax],al
  aa:	00 08                	add    BYTE PTR [eax],cl
  ac:	1b 01                	sbb    eax,DWORD PTR [ecx]
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	94                   	xchg   esp,eax
  b1:	04 f5                	add    al,0xf5
  b3:	2b 02                	sub    eax,DWORD PTR [edx]
  b5:	00 00                	add    BYTE PTR [eax],al
  b7:	09 56 00             	or     DWORD PTR [esi+0x0],edx
  ba:	00 00                	add    BYTE PTR [eax],al
  bc:	04 f6                	add    al,0xf6
  be:	5a                   	pop    edx
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	00 00                	add    BYTE PTR [eax],al
  c3:	09 e2                	or     edx,esp
  c5:	01 00                	add    DWORD PTR [eax],eax
  c7:	00 04 fb             	add    BYTE PTR [ebx+edi*8],al
  ca:	99                   	cdq    
  cb:	00 00                	add    BYTE PTR [eax],al
  cd:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
  d0:	73 00                	jae    d2 <_init-0x80481f6>
  d2:	00 00                	add    BYTE PTR [eax],al
  d4:	04 fc                	add    al,0xfc
  d6:	99                   	cdq    
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	00 08                	add    BYTE PTR [eax],cl
  db:	09 7b 02             	or     DWORD PTR [ebx+0x2],edi
  de:	00 00                	add    BYTE PTR [eax],al
  e0:	04 fd                	add    al,0xfd
  e2:	99                   	cdq    
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
  e8:	ca 01 00             	retf   0x1
  eb:	00 04 fe             	add    BYTE PTR [esi+edi*8],al
  ee:	99                   	cdq    
  ef:	00 00                	add    BYTE PTR [eax],al
  f1:	00 10                	add    BYTE PTR [eax],dl
  f3:	09 48 00             	or     DWORD PTR [eax+0x0],ecx
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	04 ff                	add    al,0xff
  fa:	99                   	cdq    
  fb:	00 00                	add    BYTE PTR [eax],al
  fd:	00 14 0a             	add    BYTE PTR [edx+ecx*1],dl
 100:	30 02                	xor    BYTE PTR [edx],al
 102:	00 00                	add    BYTE PTR [eax],al
 104:	04 00                	add    al,0x0
 106:	01 99 00 00 00 18    	add    DWORD PTR [ecx+0x18000000],ebx
 10c:	0a 5d 00             	or     bl,BYTE PTR [ebp+0x0]
 10f:	00 00                	add    BYTE PTR [eax],al
 111:	04 01                	add    al,0x1
 113:	01 99 00 00 00 1c    	add    DWORD PTR [ecx+0x1c000000],ebx
 119:	0a 00                	or     al,BYTE PTR [eax]
 11b:	00 00                	add    BYTE PTR [eax],al
 11d:	00 04 02             	add    BYTE PTR [edx+eax*1],al
 120:	01 99 00 00 00 20    	add    DWORD PTR [ecx+0x20000000],ebx
 126:	0a 9f 02 00 00 04    	or     bl,BYTE PTR [edi+0x4000002]
 12c:	04 01                	add    al,0x1
 12e:	99                   	cdq    
 12f:	00 00                	add    BYTE PTR [eax],al
 131:	00 24 0a             	add    BYTE PTR [edx+ecx*1],ah
 134:	57                   	push   edi
 135:	02 00                	add    al,BYTE PTR [eax]
 137:	00 04 05 01 99 00 00 	add    BYTE PTR [eax*1+0x9901],al
 13e:	00 28                	add    BYTE PTR [eax],ch
 140:	0a 2a                	or     ch,BYTE PTR [edx]
 142:	00 00                	add    BYTE PTR [eax],al
 144:	00 04 06             	add    BYTE PTR [esi+eax*1],al
 147:	01 99 00 00 00 2c    	add    DWORD PTR [ecx+0x2c000000],ebx
 14d:	0a 6a 00             	or     ch,BYTE PTR [edx+0x0]
 150:	00 00                	add    BYTE PTR [eax],al
 152:	04 08                	add    al,0x8
 154:	01 63 02             	add    DWORD PTR [ebx+0x2],esp
 157:	00 00                	add    BYTE PTR [eax],al
 159:	30 0a                	xor    BYTE PTR [edx],cl
 15b:	50                   	push   eax
 15c:	02 00                	add    al,BYTE PTR [eax]
 15e:	00 04 0a             	add    BYTE PTR [edx+ecx*1],al
 161:	01 69 02             	add    DWORD PTR [ecx+0x2],ebp
 164:	00 00                	add    BYTE PTR [eax],al
 166:	34 0a                	xor    al,0xa
 168:	b9 02 00 00 04       	mov    ecx,0x4000002
 16d:	0c 01                	or     al,0x1
 16f:	5a                   	pop    edx
 170:	00 00                	add    BYTE PTR [eax],al
 172:	00 38                	add    BYTE PTR [eax],bh
 174:	0a 6d 02             	or     ch,BYTE PTR [ebp+0x2]
 177:	00 00                	add    BYTE PTR [eax],al
 179:	04 10                	add    al,0x10
 17b:	01 5a 00             	add    DWORD PTR [edx+0x0],ebx
 17e:	00 00                	add    BYTE PTR [eax],al
 180:	3c 0a                	cmp    al,0xa
 182:	15 00 00 00 04       	adc    eax,0x4000000
 187:	12 01                	adc    al,BYTE PTR [ecx]
 189:	7a 00                	jp     18b <_init-0x804813d>
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	40                   	inc    eax
 18e:	0a e1                	or     ah,cl
 190:	00 00                	add    BYTE PTR [eax],al
 192:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 195:	01 3e                	add    DWORD PTR [esi],edi
 197:	00 00                	add    BYTE PTR [eax],al
 199:	00 44 0a 89          	add    BYTE PTR [edx+ecx*1-0x77],al
 19d:	02 00                	add    al,BYTE PTR [eax]
 19f:	00 04 17             	add    BYTE PTR [edi+edx*1],al
 1a2:	01 4c 00 00          	add    DWORD PTR [eax+eax*1+0x0],ecx
 1a6:	00 46 0a             	add    BYTE PTR [esi+0xa],al
 1a9:	c0 01 00             	rol    BYTE PTR [ecx],0x0
 1ac:	00 04 18             	add    BYTE PTR [eax+ebx*1],al
 1af:	01 6f 02             	add    DWORD PTR [edi+0x2],ebp
 1b2:	00 00                	add    BYTE PTR [eax],al
 1b4:	47                   	inc    edi
 1b5:	0a db                	or     bl,bl
 1b7:	00 00                	add    BYTE PTR [eax],al
 1b9:	00 04 1c             	add    BYTE PTR [esp+ebx*1],al
 1bc:	01 7f 02             	add    DWORD PTR [edi+0x2],edi
 1bf:	00 00                	add    BYTE PTR [eax],al
 1c1:	48                   	dec    eax
 1c2:	0a 19                	or     bl,BYTE PTR [ecx]
 1c4:	00 00                	add    BYTE PTR [eax],al
 1c6:	00 04 25 01 8c 00 00 	add    BYTE PTR [eiz*1+0x8c01],al
 1cd:	00 4c 0a 0d          	add    BYTE PTR [edx+ecx*1+0xd],cl
 1d1:	02 00                	add    al,BYTE PTR [eax]
 1d3:	00 04 2d 01 97 00 00 	add    BYTE PTR [ebp*1+0x9701],al
 1da:	00 54 0a 14          	add    BYTE PTR [edx+ecx*1+0x14],dl
 1de:	02 00                	add    al,BYTE PTR [eax]
 1e0:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
 1e3:	01 97 00 00 00 58    	add    DWORD PTR [edi+0x58000000],edx
 1e9:	0a 1b                	or     bl,BYTE PTR [ebx]
 1eb:	02 00                	add    al,BYTE PTR [eax]
 1ed:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
 1f0:	01 97 00 00 00 5c    	add    DWORD PTR [edi+0x5c000000],edx
 1f6:	0a 22                	or     ah,BYTE PTR [edx]
 1f8:	02 00                	add    al,BYTE PTR [eax]
 1fa:	00 04 30             	add    BYTE PTR [eax+esi*1],al
 1fd:	01 97 00 00 00 60    	add    DWORD PTR [edi+0x60000000],edx
 203:	0a 29                	or     ch,BYTE PTR [ecx]
 205:	02 00                	add    al,BYTE PTR [eax]
 207:	00 04 32             	add    BYTE PTR [edx+esi*1],al
 20a:	01 25 00 00 00 64    	add    DWORD PTR ds:0x64000000,esp
 210:	0a 75 02             	or     dh,BYTE PTR [ebp+0x2]
 213:	00 00                	add    BYTE PTR [eax],al
 215:	04 33                	add    al,0x33
 217:	01 5a 00             	add    DWORD PTR [edx+0x0],ebx
 21a:	00 00                	add    BYTE PTR [eax],al
 21c:	68 0a d9 01 00       	push   0x1d90a
 221:	00 04 35 01 85 02 00 	add    BYTE PTR [esi*1+0x28501],al
 228:	00 6c 00 0b          	add    BYTE PTR [eax+eax*1+0xb],ch
 22c:	d8 02                	fadd   DWORD PTR [edx]
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	04 9a                	add    al,0x9a
 232:	08 b5 01 00 00 0c    	or     BYTE PTR [ebp+0xc000001],dh
 238:	04 a0                	add    al,0xa0
 23a:	63 02                	arpl   WORD PTR [edx],ax
 23c:	00 00                	add    BYTE PTR [eax],al
 23e:	09 07                	or     DWORD PTR [edi],eax
 240:	02 00                	add    al,BYTE PTR [eax]
 242:	00 04 a1             	add    BYTE PTR [ecx+eiz*4],al
 245:	63 02                	arpl   WORD PTR [edx],ax
 247:	00 00                	add    BYTE PTR [eax],al
 249:	00 09                	add    BYTE PTR [ecx],cl
 24b:	15 01 00 00 04       	adc    eax,0x4000001
 250:	a2 69 02 00 00       	mov    ds:0x269,al
 255:	04 09                	add    al,0x9
 257:	0b 01                	or     eax,DWORD PTR [ecx]
 259:	00 00                	add    BYTE PTR [eax],al
 25b:	04 a6                	add    al,0xa6
 25d:	5a                   	pop    edx
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	00 08                	add    BYTE PTR [eax],cl
 262:	00 06                	add    BYTE PTR [esi],al
 264:	04 32                	add    al,0x32
 266:	02 00                	add    al,BYTE PTR [eax]
 268:	00 06                	add    BYTE PTR [esi],al
 26a:	04 ab                	add    al,0xab
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 0c 9f             	add    BYTE PTR [edi+ebx*4],cl
 271:	00 00                	add    BYTE PTR [eax],al
 273:	00 7f 02             	add    BYTE PTR [edi+0x2],bh
 276:	00 00                	add    BYTE PTR [eax],al
 278:	0d 30 00 00 00       	or     eax,0x30
 27d:	00 00                	add    BYTE PTR [eax],al
 27f:	06                   	push   es
 280:	04 2b                	add    al,0x2b
 282:	02 00                	add    al,BYTE PTR [eax]
 284:	00 0c 9f             	add    BYTE PTR [edi+ebx*4],cl
 287:	00 00                	add    BYTE PTR [eax],al
 289:	00 95 02 00 00 0d    	add    BYTE PTR [ebp+0xd000002],dl
 28f:	30 00                	xor    BYTE PTR [eax],al
 291:	00 00                	add    BYTE PTR [eax],al
 293:	27                   	daa    
 294:	00 0e                	add    BYTE PTR [esi],cl
 296:	fd                   	std    
 297:	00 00                	add    BYTE PTR [eax],al
 299:	00 0f                	add    BYTE PTR [edi],cl
 29b:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 29c:	01 00                	add    DWORD PTR [eax],eax
 29e:	00 04 3f             	add    BYTE PTR [edi+edi*1],al
 2a1:	01 95 02 00 00 0f    	add    DWORD PTR [ebp+0xf000002],edx
 2a7:	c8 02 00 00          	enter  0x2,0x0
 2ab:	04 40                	add    al,0x40
 2ad:	01 95 02 00 00 0f    	add    DWORD PTR [ebp+0xf000002],edx
 2b3:	ed                   	in     eax,dx
 2b4:	00 00                	add    BYTE PTR [eax],al
 2b6:	00 04 41             	add    BYTE PTR [ecx+eax*2],al
 2b9:	01 95 02 00 00 06    	add    DWORD PTR [ebp+0x6000002],edx
 2bf:	04 a6                	add    al,0xa6
 2c1:	00 00                	add    BYTE PTR [eax],al
 2c3:	00 07                	add    BYTE PTR [edi],al
 2c5:	be 02 00 00 10       	mov    esi,0x10000002
 2ca:	67 02 00             	add    al,BYTE PTR [bx+si]
 2cd:	00 05 87 69 02 00    	add    BYTE PTR ds:0x26987,al
 2d3:	00 10                	add    BYTE PTR [eax],dl
 2d5:	c1 02 00             	rol    DWORD PTR [edx],0x0
 2d8:	00 05 88 69 02 00    	add    BYTE PTR ds:0x26988,al
 2de:	00 10                	add    BYTE PTR [eax],dl
 2e0:	80 00 00             	add    BYTE PTR [eax],0x0
 2e3:	00 05 89 69 02 00    	add    BYTE PTR ds:0x26989,al
 2e9:	00 10                	add    BYTE PTR [eax],dl
 2eb:	21 00                	and    DWORD PTR [eax],eax
 2ed:	00 00                	add    BYTE PTR [eax],al
 2ef:	06                   	push   es
 2f0:	1a 5a 00             	sbb    bl,BYTE PTR [edx+0x0]
 2f3:	00 00                	add    BYTE PTR [eax],al
 2f5:	0c c4                	or     al,0xc4
 2f7:	02 00                	add    al,BYTE PTR [eax]
 2f9:	00 00                	add    BYTE PTR [eax],al
 2fb:	03 00                	add    eax,DWORD PTR [eax]
 2fd:	00 11                	add    BYTE PTR [ecx],dl
 2ff:	00 07                	add    BYTE PTR [edi],al
 301:	f5                   	cmc    
 302:	02 00                	add    al,BYTE PTR [eax]
 304:	00 10                	add    BYTE PTR [eax],dl
 306:	ad                   	lods   eax,DWORD PTR ds:[esi]
 307:	02 00                	add    al,BYTE PTR [eax]
 309:	00 06                	add    BYTE PTR [esi],al
 30b:	1b 00                	sbb    eax,DWORD PTR [eax]
 30d:	03 00                	add    eax,DWORD PTR [eax]
 30f:	00 12                	add    BYTE PTR [edx],dl
 311:	02 02                	add    al,BYTE PTR [edx]
 313:	00 00                	add    BYTE PTR [eax],al
 315:	01 0e                	add    DWORD PTR [esi],ecx
 317:	5a                   	pop    edx
 318:	00 00                	add    BYTE PTR [eax],al
 31a:	00 7b 84             	add    BYTE PTR [ebx-0x7c],bh
 31d:	04 08                	add    al,0x8
 31f:	5a                   	pop    edx
 320:	00 00                	add    BYTE PTR [eax],al
 322:	00 01                	add    BYTE PTR [ecx],al
 324:	9c                   	pushf  
 325:	62 03                	bound  eax,QWORD PTR [ebx]
 327:	00 00                	add    BYTE PTR [eax],al
 329:	13 8a 01 00 00 01    	adc    ecx,DWORD PTR [edx+0x1000001]
 32f:	0e                   	push   cs
 330:	5a                   	pop    edx
 331:	00 00                	add    BYTE PTR [eax],al
 333:	00 02                	add    BYTE PTR [edx],al
 335:	91                   	xchg   ecx,eax
 336:	00 13                	add    BYTE PTR [ebx],dl
 338:	10 01                	adc    BYTE PTR [ecx],al
 33a:	00 00                	add    BYTE PTR [eax],al
 33c:	01 0e                	add    DWORD PTR [esi],ecx
 33e:	62 03                	bound  eax,QWORD PTR [ebx]
 340:	00 00                	add    BYTE PTR [eax],al
 342:	02 91 04 14 73 74    	add    dl,BYTE PTR [ecx+0x74731404]
 348:	72 00                	jb     34a <_init-0x8047f7e>
 34a:	01 10                	add    DWORD PTR [eax],edx
 34c:	99                   	cdq    
 34d:	00 00                	add    BYTE PTR [eax],al
 34f:	00 02                	add    BYTE PTR [edx],al
 351:	75 74                	jne    3c7 <_init-0x8047f01>
 353:	14 64                	adc    al,0x64
 355:	73 74                	jae    3cb <_init-0x8047efd>
 357:	00 01                	add    BYTE PTR [ecx],al
 359:	11 68 03             	adc    DWORD PTR [eax+0x3],ebp
 35c:	00 00                	add    BYTE PTR [eax],al
 35e:	02 75 54             	add    dh,BYTE PTR [ebp+0x54]
 361:	00 06                	add    BYTE PTR [esi],al
 363:	04 99                	add    al,0x99
 365:	00 00                	add    BYTE PTR [eax],al
 367:	00 0c 9f             	add    BYTE PTR [edi+ebx*4],cl
 36a:	00 00                	add    BYTE PTR [eax],al
 36c:	00 78 03             	add    BYTE PTR [eax+0x3],bh
 36f:	00 00                	add    BYTE PTR [eax],al
 371:	0d 30 00 00 00       	or     eax,0x30
 376:	1f                   	pop    ds
 377:	00 15 98 02 00 00    	add    BYTE PTR ds:0x298,dl
 37d:	01 03                	add    DWORD PTR [ebx],eax
 37f:	97                   	xchg   edi,eax
 380:	00 00                	add    BYTE PTR [eax],al
 382:	00 46 84             	add    BYTE PTR [esi-0x7c],al
 385:	04 08                	add    al,0x8
 387:	35 00 00 00 01       	xor    eax,0x1000000
 38c:	9c                   	pushf  
 38d:	16                   	push   ss
 38e:	73 74                	jae    404 <_init-0x8047ec4>
 390:	72 00                	jb     392 <_init-0x8047f36>
 392:	01 03                	add    DWORD PTR [ebx],eax
 394:	99                   	cdq    
 395:	00 00                	add    BYTE PTR [eax],al
 397:	00 02                	add    BYTE PTR [edx],al
 399:	91                   	xchg   ecx,eax
 39a:	00 16                	add    BYTE PTR [esi],dl
 39c:	64 73 74             	fs jae 413 <_init-0x8047eb5>
 39f:	00 01                	add    BYTE PTR [ecx],al
 3a1:	03 99 00 00 00 02    	add    ebx,DWORD PTR [ecx+0x2000000]
 3a7:	91                   	xchg   ecx,eax
 3a8:	04 00                	add    al,0x0
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    DWORD PTR [ecx],edx
   2:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
   8:	0e                   	push   cs
   9:	1b 0e                	sbb    ecx,DWORD PTR [esi]
   b:	11 01                	adc    DWORD PTR [ecx],eax
   d:	12 06                	adc    al,BYTE PTR [esi]
   f:	10 17                	adc    BYTE PTR [edi],dl
  11:	00 00                	add    BYTE PTR [eax],al
  13:	02 16                	add    dl,BYTE PTR [esi]
  15:	00 03                	add    BYTE PTR [ebx],al
  17:	0e                   	push   cs
  18:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  1a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  1c:	49                   	dec    ecx
  1d:	13 00                	adc    eax,DWORD PTR [eax]
  1f:	00 03                	add    BYTE PTR [ebx],al
  21:	24 00                	and    al,0x0
  23:	0b 0b                	or     ecx,DWORD PTR [ebx]
  25:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  28:	0e                   	push   cs
  29:	00 00                	add    BYTE PTR [eax],al
  2b:	04 24                	add    al,0x24
  2d:	00 0b                	add    BYTE PTR [ebx],cl
  2f:	0b 3e                	or     edi,DWORD PTR [esi]
  31:	0b 03                	or     eax,DWORD PTR [ebx]
  33:	08 00                	or     BYTE PTR [eax],al
  35:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
  3b:	00 00                	add    BYTE PTR [eax],al
  3d:	06                   	push   es
  3e:	0f 00 0b             	str    WORD PTR [ebx]
  41:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  44:	00 00                	add    BYTE PTR [eax],al
  46:	07                   	pop    es
  47:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
  4b:	00 00                	add    BYTE PTR [eax],al
  4d:	08 13                	or     BYTE PTR [ebx],dl
  4f:	01 03                	add    DWORD PTR [ebx],eax
  51:	0e                   	push   cs
  52:	0b 0b                	or     ecx,DWORD PTR [ebx]
  54:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  56:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  58:	01 13                	add    DWORD PTR [ebx],edx
  5a:	00 00                	add    BYTE PTR [eax],al
  5c:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
  62:	0b 3b                	or     edi,DWORD PTR [ebx]
  64:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  67:	38 0b                	cmp    BYTE PTR [ebx],cl
  69:	00 00                	add    BYTE PTR [eax],al
  6b:	0a 0d 00 03 0e 3a    	or     cl,BYTE PTR ds:0x3a0e0300
  71:	0b 3b                	or     edi,DWORD PTR [ebx]
  73:	05 49 13 38 0b       	add    eax,0xb381349
  78:	00 00                	add    BYTE PTR [eax],al
  7a:	0b 16                	or     edx,DWORD PTR [esi]
  7c:	00 03                	add    BYTE PTR [ebx],al
  7e:	0e                   	push   cs
  7f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  81:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  83:	00 00                	add    BYTE PTR [eax],al
  85:	0c 01                	or     al,0x1
  87:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
  8a:	01 13                	add    DWORD PTR [ebx],edx
  8c:	00 00                	add    BYTE PTR [eax],al
  8e:	0d 21 00 49 13       	or     eax,0x13490021
  93:	2f                   	das    
  94:	0b 00                	or     eax,DWORD PTR [eax]
  96:	00 0e                	add    BYTE PTR [esi],cl
  98:	13 00                	adc    eax,DWORD PTR [eax]
  9a:	03 0e                	add    ecx,DWORD PTR [esi]
  9c:	3c 19                	cmp    al,0x19
  9e:	00 00                	add    BYTE PTR [eax],al
  a0:	0f 34                	sysenter 
  a2:	00 03                	add    BYTE PTR [ebx],al
  a4:	0e                   	push   cs
  a5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a7:	3b 05 49 13 3f 19    	cmp    eax,DWORD PTR ds:0x193f1349
  ad:	3c 19                	cmp    al,0x19
  af:	00 00                	add    BYTE PTR [eax],al
  b1:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
  b4:	03 0e                	add    ecx,DWORD PTR [esi]
  b6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  ba:	49                   	dec    ecx
  bb:	13 3f                	adc    edi,DWORD PTR [edi]
  bd:	19 3c 19             	sbb    DWORD PTR [ecx+ebx*1],edi
  c0:	00 00                	add    BYTE PTR [eax],al
  c2:	11 21                	adc    DWORD PTR [ecx],esp
  c4:	00 00                	add    BYTE PTR [eax],al
  c6:	00 12                	add    BYTE PTR [edx],dl
  c8:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  cb:	19 03                	sbb    DWORD PTR [ebx],eax
  cd:	0e                   	push   cs
  ce:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  d2:	27                   	daa    
  d3:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  d6:	11 01                	adc    DWORD PTR [ecx],eax
  d8:	12 06                	adc    al,BYTE PTR [esi]
  da:	40                   	inc    eax
  db:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  e1:	00 00                	add    BYTE PTR [eax],al
  e3:	13 05 00 03 0e 3a    	adc    eax,DWORD PTR ds:0x3a0e0300
  e9:	0b 3b                	or     edi,DWORD PTR [ebx]
  eb:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  ee:	02 18                	add    bl,BYTE PTR [eax]
  f0:	00 00                	add    BYTE PTR [eax],al
  f2:	14 34                	adc    al,0x34
  f4:	00 03                	add    BYTE PTR [ebx],al
  f6:	08 3a                	or     BYTE PTR [edx],bh
  f8:	0b 3b                	or     edi,DWORD PTR [ebx]
  fa:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  fd:	02 18                	add    bl,BYTE PTR [eax]
  ff:	00 00                	add    BYTE PTR [eax],al
 101:	15 2e 01 3f 19       	adc    eax,0x193f012e
 106:	03 0e                	add    ecx,DWORD PTR [esi]
 108:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 10a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 10c:	27                   	daa    
 10d:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 110:	11 01                	adc    DWORD PTR [ecx],eax
 112:	12 06                	adc    al,BYTE PTR [esi]
 114:	40                   	inc    eax
 115:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
 11b:	16                   	push   ss
 11c:	05 00 03 08 3a       	add    eax,0x3a080300
 121:	0b 3b                	or     edi,DWORD PTR [ebx]
 123:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 126:	02 18                	add    bl,BYTE PTR [eax]
 128:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	c4 00                	les    eax,FWORD PTR [eax]
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	a2 00 00 00 01       	mov    ds:0x1000000,al
   b:	01 fb                	add    ebx,edi
   d:	0e                   	push   cs
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [eax],eax
  15:	00 00                	add    BYTE PTR [eax],al
  17:	01 00                	add    DWORD PTR [eax],eax
  19:	00 01                	add    BYTE PTR [ecx],al
  1b:	2f                   	das    
  1c:	75 73                	jne    91 <_init-0x8048237>
  1e:	72 2f                	jb     4f <_init-0x8048279>
  20:	6c                   	ins    BYTE PTR es:[edi],dx
  21:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  28:	78 38                	js     62 <_init-0x8048266>
  2a:	36 5f                	ss pop edi
  2c:	36 34 2d             	ss xor al,0x2d
  2f:	6c                   	ins    BYTE PTR es:[edi],dx
  30:	69 6e 75 78 2d 67 6e 	imul   ebp,DWORD PTR [esi+0x75],0x6e672d78
  37:	75 2f                	jne    68 <_init-0x8048260>
  39:	37                   	aaa    
  3a:	2f                   	das    
  3b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  42:	00 2f                	add    BYTE PTR [edi],ch
  44:	75 73                	jne    b9 <_init-0x804820f>
  46:	72 2f                	jb     77 <_init-0x8048251>
  48:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  4f:	2f                   	das    
  50:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
  53:	73 00                	jae    55 <_init-0x8048273>
  55:	2f                   	das    
  56:	75 73                	jne    cb <_init-0x80481fd>
  58:	72 2f                	jb     89 <_init-0x804823f>
  5a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  61:	00 00                	add    BYTE PTR [eax],al
  63:	74 65                	je     ca <_init-0x80481fe>
  65:	73 74                	jae    db <_init-0x80481ed>
  67:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
  6a:	00 00                	add    BYTE PTR [eax],al
  6c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  6f:	64 64 65 66 2e 68 00 	fs fs gs cs pushw 0x100
  76:	01 
  77:	00 00                	add    BYTE PTR [eax],al
  79:	74 79                	je     f4 <_init-0x80481d4>
  7b:	70 65                	jo     e2 <_init-0x80481e6>
  7d:	73 2e                	jae    ad <_init-0x804821b>
  7f:	68 00 02 00 00       	push   0x200
  84:	6c                   	ins    BYTE PTR es:[edi],dx
  85:	69 62 69 6f 2e 68 00 	imul   esp,DWORD PTR [edx+0x69],0x682e6f
  8c:	02 00                	add    al,BYTE PTR [eax]
  8e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  91:	64 69 6f 2e 68 00 03 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x30068
  98:	00 
  99:	00 73 79             	add    BYTE PTR [ebx+0x79],dh
  9c:	73 5f                	jae    fd <_init-0x80481cb>
  9e:	65 72 72             	gs jb  113 <_init-0x80481b5>
  a1:	6c                   	ins    BYTE PTR es:[edi],dx
  a2:	69 73 74 2e 68 00 02 	imul   esi,DWORD PTR [ebx+0x74],0x200682e
  a9:	00 00                	add    BYTE PTR [eax],al
  ab:	00 00                	add    BYTE PTR [eax],al
  ad:	05 02 46 84 04       	add    eax,0x4844602
  b2:	08 15 c9 2f ad 4b    	or     BYTE PTR ds:0x4bad2fc9,dl
  b8:	47                   	inc    edi
  b9:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
  ba:	67 3f                	addr16 aas 
  bc:	08 bb 93 e5 08 5a    	or     BYTE PTR [ebx+0x5a08e593],bh
  c2:	59                   	pop    ecx
  c3:	02 0a                	add    cl,BYTE PTR [edx]
  c5:	00 01                	add    BYTE PTR [ecx],al
  c7:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f                   	pop    edi
   1:	49                   	dec    ecx
   2:	4f                   	dec    edi
   3:	5f                   	pop    edi
   4:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
   7:	5f                   	pop    edi
   8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
   a:	64 00 5f 5f          	add    BYTE PTR fs:[edi+0x5f],bl
   e:	71 75                	jno    85 <_init-0x8048243>
  10:	61                   	popa   
  11:	64 5f                	fs pop edi
  13:	74 00                	je     15 <_init-0x80482b3>
  15:	5f                   	pop    edi
  16:	6f                   	outs   dx,DWORD PTR ds:[esi]
  17:	6c                   	ins    BYTE PTR es:[edi],dx
  18:	64 5f                	fs pop edi
  1a:	6f                   	outs   dx,DWORD PTR ds:[esi]
  1b:	66 66 73 65          	data16 data16 jae 84 <_init-0x8048244>
  1f:	74 00                	je     21 <_init-0x80482a7>
  21:	73 79                	jae    9c <_init-0x804822c>
  23:	73 5f                	jae    84 <_init-0x8048244>
  25:	6e                   	outs   dx,BYTE PTR ds:[esi]
  26:	65 72 72             	gs jb  9b <_init-0x804822d>
  29:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
  2c:	4f                   	dec    edi
  2d:	5f                   	pop    edi
  2e:	73 61                	jae    91 <_init-0x8048237>
  30:	76 65                	jbe    97 <_init-0x8048231>
  32:	5f                   	pop    edi
  33:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  35:	64 00 73 68          	add    BYTE PTR fs:[ebx+0x68],dh
  39:	6f                   	outs   dx,DWORD PTR ds:[esi]
  3a:	72 74                	jb     b0 <_init-0x8048218>
  3c:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  3f:	74 00                	je     41 <_init-0x8048287>
  41:	73 69                	jae    ac <_init-0x804821c>
  43:	7a 65                	jp     aa <_init-0x804821e>
  45:	5f                   	pop    edi
  46:	74 00                	je     48 <_init-0x8048280>
  48:	5f                   	pop    edi
  49:	49                   	dec    ecx
  4a:	4f                   	dec    edi
  4b:	5f                   	pop    edi
  4c:	77 72                	ja     c0 <_init-0x8048208>
  4e:	69 74 65 5f 70 74 72 	imul   esi,DWORD PTR [ebp+eiz*2+0x5f],0x727470
  55:	00 
  56:	5f                   	pop    edi
  57:	66 6c                	data16 ins BYTE PTR es:[edi],dx
  59:	61                   	popa   
  5a:	67 73 00             	addr16 jae 5d <_init-0x804826b>
  5d:	5f                   	pop    edi
  5e:	49                   	dec    ecx
  5f:	4f                   	dec    edi
  60:	5f                   	pop    edi
  61:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
  64:	5f                   	pop    edi
  65:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
  68:	65 00 5f 6d          	add    BYTE PTR gs:[edi+0x6d],bl
  6c:	61                   	popa   
  6d:	72 6b                	jb     da <_init-0x80481ee>
  6f:	65 72 73             	gs jb  e5 <_init-0x80481e3>
  72:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
  75:	4f                   	dec    edi
  76:	5f                   	pop    edi
  77:	72 65                	jb     de <_init-0x80481ea>
  79:	61                   	popa   
  7a:	64 5f                	fs pop edi
  7c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  7e:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
  82:	64 65 72 72          	fs gs jb f8 <_init-0x80481d0>
  86:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  8a:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  8e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  8f:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  93:	74 00                	je     95 <_init-0x8048233>
  95:	47                   	inc    edi
  96:	4e                   	dec    esi
  97:	55                   	push   ebp
  98:	20 43 31             	and    BYTE PTR [ebx+0x31],al
  9b:	31 20                	xor    DWORD PTR [eax],esp
  9d:	37                   	aaa    
  9e:	2e 35 2e 30 20 2d    	cs xor eax,0x2d20302e
  a4:	6d                   	ins    DWORD PTR es:[edi],dx
  a5:	33 32                	xor    esi,DWORD PTR [edx]
  a7:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  ad:	65 3d 67 65 6e 65    	gs cmp eax,0x656e6567
  b3:	72 69                	jb     11e <_init-0x80481aa>
  b5:	63 20                	arpl   WORD PTR [eax],sp
  b7:	2d 6d 61 72 63       	sub    eax,0x6372616d
  bc:	68 3d 69 36 38       	push   0x3836693d
  c1:	36 20 2d 67 20 2d 66 	and    BYTE PTR ss:0x662d2067,ch
  c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
  c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ca:	2d 73 74 61 63       	sub    eax,0x63617473
  cf:	6b 2d 70 72 6f 74 65 	imul   ebp,DWORD PTR ds:0x746f7270,0x65
  d6:	63 74 6f 72          	arpl   WORD PTR [edi+ebp*2+0x72],si
  da:	00 5f 6c             	add    BYTE PTR [edi+0x6c],bl
  dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  de:	63 6b 00             	arpl   WORD PTR [ebx+0x0],bp
  e1:	5f                   	pop    edi
  e2:	63 75 72             	arpl   WORD PTR [ebp+0x72],si
  e5:	5f                   	pop    edi
  e6:	63 6f 6c             	arpl   WORD PTR [edi+0x6c],bp
  e9:	75 6d                	jne    158 <_init-0x8048170>
  eb:	6e                   	outs   dx,BYTE PTR ds:[esi]
  ec:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
  ef:	4f                   	dec    edi
  f0:	5f                   	pop    edi
  f1:	32 5f 31             	xor    bl,BYTE PTR [edi+0x31]
  f4:	5f                   	pop    edi
  f5:	73 74                	jae    16b <_init-0x804815d>
  f7:	64 65 72 72          	fs gs jb 16d <_init-0x804815b>
  fb:	5f                   	pop    edi
  fc:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
  ff:	4f                   	dec    edi
 100:	5f                   	pop    edi
 101:	46                   	inc    esi
 102:	49                   	dec    ecx
 103:	4c                   	dec    esp
 104:	45                   	inc    ebp
 105:	5f                   	pop    edi
 106:	70 6c                	jo     174 <_init-0x8048154>
 108:	75 73                	jne    17d <_init-0x804814b>
 10a:	00 5f 70             	add    BYTE PTR [edi+0x70],bl
 10d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 10e:	73 00                	jae    110 <_init-0x80481b8>
 110:	61                   	popa   
 111:	72 67                	jb     17a <_init-0x804814e>
 113:	76 00                	jbe    115 <_init-0x80481b3>
 115:	5f                   	pop    edi
 116:	73 62                	jae    17a <_init-0x804814e>
 118:	75 66                	jne    180 <_init-0x8048148>
 11a:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 11d:	4f                   	dec    edi
 11e:	5f                   	pop    edi
 11f:	46                   	inc    esi
 120:	49                   	dec    ecx
 121:	4c                   	dec    esp
 122:	45                   	inc    ebp
 123:	00 2f                	add    BYTE PTR [edi],ch
 125:	68 6f 6d 65 2f       	push   0x2f656d6f
 12a:	64 69 6c 6c 64 79 6c 	imul   ebp,DWORD PTR fs:[esp+ebp*2+0x64],0x6e616c79
 131:	61 6e 
 133:	70 69                	jo     19e <_init-0x804812a>
 135:	63 6b 6c             	arpl   WORD PTR [ebx+0x6c],bp
 138:	65 2f                	gs das 
 13a:	47                   	inc    edi
 13b:	69 74 48 75 62 2d 50 	imul   esi,DWORD PTR [eax+ecx*2+0x75],0x72502d62
 142:	72 
 143:	6f                   	outs   dx,DWORD PTR ds:[esi]
 144:	6a 65                	push   0x65
 146:	63 74 73 2f          	arpl   WORD PTR [ebx+esi*2+0x2f],si
 14a:	43                   	inc    ebx
 14b:	72 61                	jb     1ae <_init-0x804811a>
 14d:	73 68                	jae    1b7 <_init-0x8048111>
 14f:	2d 43 6f 75 72       	sub    eax,0x72756f43
 154:	73 65                	jae    1bb <_init-0x804810d>
 156:	2d 6f 6e 2d 78       	sub    eax,0x782d6e6f
 15b:	38 36                	cmp    BYTE PTR [esi],dh
 15d:	2d 36 34 2d 52       	sub    eax,0x522d3436
 162:	65 76 65             	gs jbe 1ca <_init-0x80480fe>
 165:	72 73                	jb     1da <_init-0x80480ee>
 167:	65 2d 45 6e 67 69    	gs sub eax,0x69676e45
 16d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 16e:	65 65 72 69          	gs gs jb 1db <_init-0x80480ed>
 172:	6e                   	outs   dx,BYTE PTR ds:[esi]
 173:	67 00 75 6e          	add    BYTE PTR [di+0x6e],dh
 177:	73 69                	jae    1e2 <_init-0x80480e6>
 179:	67 6e                	outs   dx,BYTE PTR ds:[si]
 17b:	65 64 20 63 68       	gs and BYTE PTR fs:[ebx+0x68],ah
 180:	61                   	popa   
 181:	72 00                	jb     183 <_init-0x8048145>
 183:	74 65                	je     1ea <_init-0x80480de>
 185:	73 74                	jae    1fb <_init-0x80480cd>
 187:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 18a:	61                   	popa   
 18b:	72 67                	jb     1f4 <_init-0x80480d4>
 18d:	63 00                	arpl   WORD PTR [eax],ax
 18f:	6c                   	ins    BYTE PTR es:[edi],dx
 190:	6f                   	outs   dx,DWORD PTR ds:[esi]
 191:	6e                   	outs   dx,BYTE PTR ds:[esi]
 192:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 196:	6e                   	outs   dx,BYTE PTR ds:[esi]
 197:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 19b:	73 69                	jae    206 <_init-0x80480c2>
 19d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 19f:	65 64 20 69 6e       	gs and BYTE PTR fs:[ecx+0x6e],ch
 1a4:	74 00                	je     1a6 <_init-0x8048122>
 1a6:	5f                   	pop    edi
 1a7:	49                   	dec    ecx
 1a8:	4f                   	dec    edi
 1a9:	5f                   	pop    edi
 1aa:	32 5f 31             	xor    bl,BYTE PTR [edi+0x31]
 1ad:	5f                   	pop    edi
 1ae:	73 74                	jae    224 <_init-0x80480a4>
 1b0:	64 69 6e 5f 00 5f 49 	imul   ebp,DWORD PTR fs:[esi+0x5f],0x4f495f00
 1b7:	4f 
 1b8:	5f                   	pop    edi
 1b9:	6d                   	ins    DWORD PTR es:[edi],dx
 1ba:	61                   	popa   
 1bb:	72 6b                	jb     228 <_init-0x80480a0>
 1bd:	65 72 00             	gs jb  1c0 <_init-0x8048108>
 1c0:	5f                   	pop    edi
 1c1:	73 68                	jae    22b <_init-0x804809d>
 1c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1c4:	72 74                	jb     23a <_init-0x804808e>
 1c6:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 1c9:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 1cc:	4f                   	dec    edi
 1cd:	5f                   	pop    edi
 1ce:	77 72                	ja     242 <_init-0x8048086>
 1d0:	69 74 65 5f 62 61 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x5f],0x65736162
 1d7:	65 
 1d8:	00 5f 75             	add    BYTE PTR [edi+0x75],bl
 1db:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1dc:	75 73                	jne    251 <_init-0x8048077>
 1de:	65 64 32 00          	gs xor al,BYTE PTR fs:[eax]
 1e2:	5f                   	pop    edi
 1e3:	49                   	dec    ecx
 1e4:	4f                   	dec    edi
 1e5:	5f                   	pop    edi
 1e6:	72 65                	jb     24d <_init-0x804807b>
 1e8:	61                   	popa   
 1e9:	64 5f                	fs pop edi
 1eb:	70 74                	jo     261 <_init-0x8048067>
 1ed:	72 00                	jb     1ef <_init-0x80480d9>
 1ef:	73 68                	jae    259 <_init-0x804806f>
 1f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f2:	72 74                	jb     268 <_init-0x8048060>
 1f4:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 1f7:	73 69                	jae    262 <_init-0x8048066>
 1f9:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1fb:	65 64 20 69 6e       	gs and BYTE PTR fs:[ecx+0x6e],ch
 200:	74 00                	je     202 <_init-0x80480c6>
 202:	6d                   	ins    DWORD PTR es:[edi],dx
 203:	61                   	popa   
 204:	69 6e 00 5f 6e 65 78 	imul   ebp,DWORD PTR [esi+0x0],0x78656e5f
 20b:	74 00                	je     20d <_init-0x80480bb>
 20d:	5f                   	pop    edi
 20e:	5f                   	pop    edi
 20f:	70 61                	jo     272 <_init-0x8048056>
 211:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 214:	5f                   	pop    edi
 215:	5f                   	pop    edi
 216:	70 61                	jo     279 <_init-0x804804f>
 218:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 21b:	5f                   	pop    edi
 21c:	5f                   	pop    edi
 21d:	70 61                	jo     280 <_init-0x8048048>
 21f:	64 33 00             	xor    eax,DWORD PTR fs:[eax]
 222:	5f                   	pop    edi
 223:	5f                   	pop    edi
 224:	70 61                	jo     287 <_init-0x8048041>
 226:	64 34 00             	fs xor al,0x0
 229:	5f                   	pop    edi
 22a:	5f                   	pop    edi
 22b:	70 61                	jo     28e <_init-0x804803a>
 22d:	64 35 00 5f 49 4f    	fs xor eax,0x4f495f00
 233:	5f                   	pop    edi
 234:	77 72                	ja     2a8 <_init-0x8048020>
 236:	69 74 65 5f 65 6e 64 	imul   esi,DWORD PTR [ebp+eiz*2+0x5f],0x646e65
 23d:	00 
 23e:	5f                   	pop    edi
 23f:	5f                   	pop    edi
 240:	6f                   	outs   dx,DWORD PTR ds:[esi]
 241:	66 66 36 34 5f       	data16 data16 ss xor al,0x5f
 246:	74 00                	je     248 <_init-0x8048080>
 248:	5f                   	pop    edi
 249:	5f                   	pop    edi
 24a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24b:	66 66 5f             	data16 pop di
 24e:	74 00                	je     250 <_init-0x8048078>
 250:	5f                   	pop    edi
 251:	63 68 61             	arpl   WORD PTR [eax+0x61],bp
 254:	69 6e 00 5f 49 4f 5f 	imul   ebp,DWORD PTR [esi+0x0],0x5f4f495f
 25b:	62 61 63             	bound  esp,QWORD PTR [ecx+0x63]
 25e:	6b 75 70 5f          	imul   esi,DWORD PTR [ebp+0x70],0x5f
 262:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 265:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 269:	64 69 6e 00 5f 66 6c 	imul   ebp,DWORD PTR fs:[esi+0x0],0x616c665f
 270:	61 
 271:	67 73 32             	addr16 jae 2a6 <_init-0x8048022>
 274:	00 5f 6d             	add    BYTE PTR [edi+0x6d],bl
 277:	6f                   	outs   dx,DWORD PTR ds:[esi]
 278:	64 65 00 5f 49       	fs add BYTE PTR gs:[edi+0x49],bl
 27d:	4f                   	dec    edi
 27e:	5f                   	pop    edi
 27f:	72 65                	jb     2e6 <_init-0x8047fe2>
 281:	61                   	popa   
 282:	64 5f                	fs pop edi
 284:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 287:	65 00 5f 76          	add    BYTE PTR gs:[edi+0x76],bl
 28b:	74 61                	je     2ee <_init-0x8047fda>
 28d:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 291:	6f                   	outs   dx,DWORD PTR ds:[esi]
 292:	66 66 73 65          	data16 data16 jae 2fb <_init-0x8047fcd>
 296:	74 00                	je     298 <_init-0x8048030>
 298:	73 74                	jae    30e <_init-0x8047fba>
 29a:	72 63                	jb     2ff <_init-0x8047fc9>
 29c:	70 79                	jo     317 <_init-0x8047fb1>
 29e:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 2a1:	4f                   	dec    edi
 2a2:	5f                   	pop    edi
 2a3:	73 61                	jae    306 <_init-0x8047fc2>
 2a5:	76 65                	jbe    30c <_init-0x8047fbc>
 2a7:	5f                   	pop    edi
 2a8:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 2ab:	65 00 73 79          	add    BYTE PTR gs:[ebx+0x79],dh
 2af:	73 5f                	jae    310 <_init-0x8047fb8>
 2b1:	65 72 72             	gs jb  326 <_init-0x8047fa2>
 2b4:	6c                   	ins    BYTE PTR es:[edi],dx
 2b5:	69 73 74 00 5f 66 69 	imul   esi,DWORD PTR [ebx+0x74],0x69665f00
 2bc:	6c                   	ins    BYTE PTR es:[edi],dx
 2bd:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2bf:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2c0:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 2c3:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 2c5:	75 74                	jne    33b <_init-0x8047f8d>
 2c7:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 2ca:	4f                   	dec    edi
 2cb:	5f                   	pop    edi
 2cc:	32 5f 31             	xor    bl,BYTE PTR [edi+0x31]
 2cf:	5f                   	pop    edi
 2d0:	73 74                	jae    346 <_init-0x8047f82>
 2d2:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 2d4:	75 74                	jne    34a <_init-0x8047f7e>
 2d6:	5f                   	pop    edi
 2d7:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 2da:	4f                   	dec    edi
 2db:	5f                   	pop    edi
 2dc:	6c                   	ins    BYTE PTR es:[edi],dx
 2dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2de:	63 6b 5f             	arpl   WORD PTR [ebx+0x5f],bp
 2e1:	74 00                	je     2e3 <_init-0x8047fe5>
