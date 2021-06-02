Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E56399279
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 20:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhFBSX3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 14:23:29 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54632 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229552AbhFBSX3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 14:23:29 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1loVUt-0000S9-FH; Wed, 02 Jun 2021 21:21:43 +0300
Subject: Re: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
 <YLcXicwDxue0a52/@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <5037cd3e-9c4f-0028-ceef-8315d297f2bc@bitmer.com>
Date:   Wed, 2 Jun 2021 21:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YLcXicwDxue0a52/@atomide.com>
Content-Type: multipart/mixed;
 boundary="------------36C34FBFAE52466B70570902"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is a multi-part message in MIME format.
--------------36C34FBFAE52466B70570902
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

On 6/2/21 8:30 AM, Tony Lindgren wrote:
> Sounds like the beagleboard timer errata handling is either picking
> a wrong clockevent timer, or later on ti-sysc misdetects the active
> timer for clockevent and idles it.
> 
> What does dmesg say in the beginning for clockevent and clocksource
> timers?
> 
I attached logs from commit 6cfcd5563b4f and commit 30c66fc30ee7 before
it. Perhaps this is relevant difference between them?

+ti-sysc: probe of 49032000.target-module failed with error -16
+ti-sysc: probe of 48304000.target-module failed with error -16

Jarkko

--------------36C34FBFAE52466B70570902
Content-Type: text/plain; charset=UTF-8;
 name="minicom.cap.6cfcd5563b4f"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="minicom.cap.6cfcd5563b4f"

WyAgICAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwClsgICAg
MC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS44LjAtcmM0LTAwMDAyLWc2Y2ZjZDU1NjNiNGYg
KGphcmtrb0BteWxseTY0KSAoYXJtLWxpbnV4LWdudWVhYmloZi1nY2MgKERlYmlhbiA4LjMu
MC0yKSA4LjMuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi4zMS4xKSAj
MTAgU01QIFdlZCBKdW4gMiAyMTowMDowMiBFRVNUIDIwMjEKWyAgICAwLjAwMDAwMF0gQ1BV
OiBBUk12NyBQcm9jZXNzb3IgWzQxMWZjMDgzXSByZXZpc2lvbiAzIChBUk12NyksIGNyPTEw
YzUzODdkClsgICAgMC4wMDAwMDBdIENQVTogUElQVCAvIFZJUFQgbm9uYWxpYXNpbmcgZGF0
YSBjYWNoZSwgVklQVCBub25hbGlhc2luZyBpbnN0cnVjdGlvbiBjYWNoZQpbICAgIDAuMDAw
MDAwXSBPRjogZmR0OiBNYWNoaW5lIG1vZGVsOiBUSSBPTUFQMyBCZWFnbGVCb2FyZApbICAg
IDAuMDAwMDAwXSBNZW1vcnkgcG9saWN5OiBEYXRhIGNhY2hlIHdyaXRlYmFjawpbICAgIDAu
MDAwMDAwXSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDhlODAwMDAwClsgICAgMC4wMDAw
MDBdIFpvbmUgcmFuZ2VzOgpbICAgIDAuMDAwMDAwXSAgIE5vcm1hbCAgIFttZW0gMHgwMDAw
MDAwMDgwMDAwMDAwLTB4MDAwMDAwMDA4ZmRmZmZmZl0KWyAgICAwLjAwMDAwMF0gICBIaWdo
TWVtICBlbXB0eQpbICAgIDAuMDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2gg
bm9kZQpbICAgIDAuMDAwMDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAw
MDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwODAwMDAwMDAtMHgwMDAwMDAwMDhm
ZGZmZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAw
MDAwMDA4MDAwMDAwMC0weDAwMDAwMDAwOGZkZmZmZmZdClsgICAgMC4wMDAwMDBdIENQVTog
QWxsIENQVShzKSBzdGFydGVkIGluIFNWQyBtb2RlLgpbICAgIDAuMDAwMDAwXSBPTUFQMzQz
MC8zNTMwIEVTMy4wIChsMmNhY2hlIGl2YSBzZ3ggbmVvbiBpc3ApClsgICAgMC4wMDAwMDBd
IHBlcmNwdTogRW1iZWRkZWQgMTkgcGFnZXMvY3B1IHM0OTAzNiByODE5MiBkMjA1OTYgdTc3
ODI0ClsgICAgMC4wMDAwMDBdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGlu
ZyBvbi4gIFRvdGFsIHBhZ2VzOiA2NDQ1MgpbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFu
ZCBsaW5lOiBjb25zb2xlPXR0eU8yLDExNTIwMG44IG1wdXJhdGU9YXV0byBidWRkeT1ub25l
IGNhbWVyYT1ub25lIHZyYW09MTJNIG9tYXBmYi5tb2RlPWR2aTo2NDB4NDgwTVItMTZANjAg
b21hcGRzcy5kZWZfZGlzcD1kdmkgcm9vdD0vZGV2L21tY2JsazBwMiBydyByb290ZnN0eXBl
PWV4dDQgcm9vdHdhaXQKWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUg
ZW50cmllczogMzI3NjggKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVhcikKWyAgICAw
LjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3JkZXI6
IDQsIDY1NTM2IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wMDAwMDBdIG1lbSBhdXRvLWluaXQ6
IHN0YWNrOm9mZiwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpvZmYKWyAgICAwLjAwMDAw
MF0gTWVtb3J5OiAyMjY0NDRLLzI2MDA5NksgYXZhaWxhYmxlICg5MjE2SyBrZXJuZWwgY29k
ZSwgNzk3SyByd2RhdGEsIDIxNTJLIHJvZGF0YSwgMTAyNEsgaW5pdCwgMjU1SyBic3MsIDE3
MjY4SyByZXNlcnZlZCwgMTYzODRLIGNtYS1yZXNlcnZlZCwgMEsgaGlnaG1lbSkKWyAgICAw
LjAwMDAwMF0gcmN1OiBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAu
MDAwMDAwXSByY3U6IAlSQ1UgZXZlbnQgdHJhY2luZyBpcyBlbmFibGVkLgpbICAgIDAuMDAw
MDAwXSByY3U6IAlSQ1UgcmVzdHJpY3RpbmcgQ1BVcyBmcm9tIE5SX0NQVVM9MiB0byBucl9j
cHVfaWRzPTEuClsgICAgMC4wMDAwMDBdIHJjdTogUkNVIGNhbGN1bGF0ZWQgdmFsdWUgb2Yg
c2NoZWR1bGVyLWVubGlzdG1lbnQgZGVsYXkgaXMgMTAgamlmZmllcy4KWyAgICAwLjAwMDAw
MF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJf
Y3B1X2lkcz0xClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDE2LCBucl9pcnFzOiAxNiwgcHJl
YWxsb2NhdGVkIGlycXM6IDE2ClsgICAgMC4wMDAwMDBdIElSUTogRm91bmQgYW4gSU5UQyBh
dCAweChwdHJ2YWwpIChyZXZpc2lvbiA0LjApIHdpdGggOTYgaW50ZXJydXB0cwpbICAgIDAu
MDAwMDAwXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZyb20gc3RhcnRfa2Vy
bmVsKzB4MmYwLzB4NTMwIHdpdGggY3JuZ19pbml0PTAKWyAgICAwLjAwMDAwMF0gQ2xvY2tp
bmcgcmF0ZSAoQ3J5c3RhbC9Db3JlL01QVSk6IDI2LjAvMzMyLzYwMCBNSHoKWyAgICAwLjAw
MDAwMF0gVEkgZ3B0aW1lciBjbG9ja2V2ZW50OiAxMzAwMDAwMCBIeiBhdCAvb2NwQDY4MDAw
MDAwL3RhcmdldC1tb2R1bGVANDkwMzIwMDAKWyAgICAwLjAwMDAwMF0gVEkgZ3B0aW1lciBj
bG9ja3NvdXJjZTogYWx3YXlzLW9uIC9vY3BANjgwMDAwMDAvdGFyZ2V0LW1vZHVsZUA0ODMw
NDAwMApbICAgIDAuMDAwMDkxXSBzY2hlZF9jbG9jazogMzIgYml0cyBhdCAzMmtIeiwgcmVz
b2x1dGlvbiAzMDUxN25zLCB3cmFwcyBldmVyeSA2NTUzNTk5OTk4NDc0MW5zClsgICAgMC4w
MDAxODNdIGNsb2Nrc291cmNlOiBkbXRpbWVyOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNs
ZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiA1ODMyNzAzOTk4NjQxOSBucwpbICAgIDAu
MDAxNTI1XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDMwClsgICAgMC4wMDE2
NDddIFdBUk5JTkc6IFlvdXIgJ2NvbnNvbGU9dHR5TzInIGhhcyBiZWVuIHJlcGxhY2VkIGJ5
ICd0dHlTMicKWyAgICAwLjAwMTcwOF0gVGhpcyBlbnN1cmVzIHRoYXQgeW91IHN0aWxsIHNl
ZSBrZXJuZWwgbWVzc2FnZXMuIFBsZWFzZQpbICAgIDAuMDAxNzcwXSB1cGRhdGUgeW91ciBr
ZXJuZWwgY29tbWFuZGxpbmUuClsgICAgMC4wMDE5NTNdIENhbGlicmF0aW5nIGRlbGF5IGxv
b3AuLi4gNTk0LjczIEJvZ29NSVBTIChscGo9Mjk3MzY5NikKWyAgICAwLjA1NDYyNl0gcGlk
X21heDogZGVmYXVsdDogMzI3NjggbWluaW11bTogMzAxClsgICAgMC4wNTUwMjNdIExTTTog
U2VjdXJpdHkgRnJhbWV3b3JrIGluaXRpYWxpemluZwpbICAgIDAuMDU1MjY3XSBNb3VudC1j
YWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4wNTUzNThdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRy
aWVzOiAxMDI0IChvcmRlcjogMCwgNDA5NiBieXRlcywgbGluZWFyKQpbICAgIDAuMDU3Mjgx
XSBDUFU6IFRlc3Rpbmcgd3JpdGUgYnVmZmVyIGNvaGVyZW5jeTogb2sKWyAgICAwLjA1NzQ2
NF0gQ1BVMDogU3BlY3RyZSB2MjogdXNpbmcgQlBJQUxMIHdvcmthcm91bmQKWyAgICAwLjA1
ODY1NF0gQ1BVMDogdGhyZWFkIC0xLCBjcHUgMCwgc29ja2V0IC0xLCBtcGlkciAwClsgICAg
MC4wNjQ2NjZdIFNldHRpbmcgdXAgc3RhdGljIGlkZW50aXR5IG1hcCBmb3IgMHg4MDEwMDAw
MCAtIDB4ODAxMDAwNzgKWyAgICAwLjA2NjE2Ml0gcmN1OiBIaWVyYXJjaGljYWwgU1JDVSBp
bXBsZW1lbnRhdGlvbi4KWyAgICAwLjA2OTQ1OF0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRh
cnkgQ1BVcyAuLi4KWyAgICAwLjA2OTU0OV0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgMSBD
UFUKWyAgICAwLjA2OTY0MV0gU01QOiBUb3RhbCBvZiAxIHByb2Nlc3NvcnMgYWN0aXZhdGVk
ICg1OTQuNzMgQm9nb01JUFMpLgpbICAgIDAuMDY5NzAyXSBDUFU6IEFsbCBDUFUocykgc3Rh
cnRlZCBpbiBTVkMgbW9kZS4KWyAgICAwLjA3MTYyNF0gZGV2dG1wZnM6IGluaXRpYWxpemVk
ClsgICAgMC4xMDUwNDFdIFZGUCBzdXBwb3J0IHYwLjM6IGltcGxlbWVudG9yIDQxIGFyY2hp
dGVjdHVyZSAzIHBhcnQgMzAgdmFyaWFudCBjIHJldiAxClsgICAgMC4xMDU3MTJdIGNsb2Nr
c291cmNlOiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZm
ZmYsIG1heF9pZGxlX25zOiAxOTExMjYwNDQ2Mjc1MDAwMCBucwpbICAgIDAuMTA1ODA0XSBm
dXRleCBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4xMDc3NTddIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGluY3Ry
bCBzdWJzeXN0ZW0KWyAgICAwLjEwOTE5MV0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhl
cm1hbCBnb3Zlcm5vciAnZmFpcl9zaGFyZScKWyAgICAwLjEwOTI1Ml0gdGhlcm1hbF9zeXM6
IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93aXNlJwpbICAgIDAuMTA5MzQ0
XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICd1c2VyX3NwYWNl
JwpbICAgIDAuMTExOTY4XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2Clsg
ICAgMC4xMTgzNzddIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWlj
IGNvaGVyZW50IGFsbG9jYXRpb25zClsgICAgMC4xNTAzNjBdIG9tYXBfaHdtb2Q6IG1jYnNw
Ml9zaWRldG9uZSB1c2luZyBicm9rZW4gZHQgZGF0YSBmcm9tIG1jYnNwClsgICAgMC4xNTEz
NjddIG9tYXBfaHdtb2Q6IG1jYnNwM19zaWRldG9uZSB1c2luZyBicm9rZW4gZHQgZGF0YSBm
cm9tIG1jYnNwClsgICAgMC4yNDYzNjhdIGF1ZGl0OiBpbml0aWFsaXppbmcgbmV0bGluayBz
dWJzeXMgKGRpc2FibGVkKQpbICAgIDAuMjQ5MDUzXSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5v
ciBtZW51ClsgICAgMC4yNDk3ODZdIFJlcHJvZ3JhbW1pbmcgU0RSQyBjbG9jayB0byAzMzIw
MDAwMDAgSHoKWyAgICAwLjI5MDQwNV0gYXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgwLjIyMDox
KTogc3RhdGU9aW5pdGlhbGl6ZWQgYXVkaXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC4yOTEz
NTFdIE9NQVAgR1BJTyBoYXJkd2FyZSB2ZXJzaW9uIDIuNQpbICAgIDAuMzUxOTI4XSBvbWFw
LWdwbWMgNmUwMDAwMDAuZ3BtYzogR1BNQyByZXZpc2lvbiA1LjAKWyAgICAwLjM1MjAyMF0g
Z3BtY19tZW1faW5pdDogZGlzYWJsaW5nIGNzIDAgbWFwcGVkIGF0IDB4MC0weDEwMDAwMDAK
WyAgICAwLjM4ODE1M10gTm8gQVRBR3M/ClsgICAgMC4zODgyNDRdIGh3LWJyZWFrcG9pbnQ6
IGRlYnVnIGFyY2hpdGVjdHVyZSAweDQgdW5zdXBwb3J0ZWQuClsgICAgMC40NDIyMzBdIGlv
bW11OiBEZWZhdWx0IGRvbWFpbiB0eXBlOiBUcmFuc2xhdGVkIApbICAgIDAuNDQ0ODU0XSBv
bWFwLWlvbW11IDQ4MGJkNDAwLm1tdTogNDgwYmQ0MDAubW11IHJlZ2lzdGVyZWQKWyAgICAw
LjQ0NTc3MF0gcGxhdGZvcm0gNDgwYmMwMDAuaXNwOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAg
MApbICAgIDAuNDQ5NDkzXSB2Z2FhcmI6IGxvYWRlZApbICAgIDAuNDUwNTAwXSBTQ1NJIHN1
YnN5c3RlbSBpbml0aWFsaXplZApbICAgIDAuNDU3MDAwXSBvbWFwX2kyYyA0ODA3MDAwMC5p
MmM6IGJ1cyAwIHJldjMuMyBhdCAyNjAwIGtIegpbICAgIDAuNDU5MzgxXSBvbWFwX2kyYyA0
ODA3MjAwMC5pMmM6IGJ1cyAxIHJldjMuMyBhdCAxMDAga0h6ClsgICAgMC40NjE1MTddIG9t
YXBfaTJjIDQ4MDYwMDAwLmkyYzogYnVzIDIgcmV2My4zIGF0IDEwMCBrSHoKWyAgICAwLjQ2
MjE1OF0gcHBzX2NvcmU6IExpbnV4UFBTIEFQSSB2ZXIuIDEgcmVnaXN0ZXJlZApbICAgIDAu
NDYyMjQ5XSBwcHNfY29yZTogU29mdHdhcmUgdmVyLiA1LjMuNiAtIENvcHlyaWdodCAyMDA1
LTIwMDcgUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGludXguaXQ+ClsgICAgMC40NjIz
NzFdIFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQKWyAgICAwLjQ2NTUxNV0gY2xvY2tz
b3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIGRtdGltZXIKWyAgICAxLjY1NDg3Nl0g
VkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82LjYuMApbICAgIDEuNjU1MTIwXSBWRlM6IERxdW90
LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMTAyNCAob3JkZXIgMCwgNDA5NiBieXRlcykK
WyAgICAxLjY5MTIyM10gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAyClsgICAg
MS42OTI2ODddIHRjcF9saXN0ZW5fcG9ydGFkZHJfaGFzaCBoYXNoIHRhYmxlIGVudHJpZXM6
IDUxMiAob3JkZXI6IDAsIDYxNDQgYnl0ZXMsIGxpbmVhcikKWyAgICAxLjY5MjgxMF0gVENQ
IGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDEsIDgxOTIg
Ynl0ZXMsIGxpbmVhcikKWyAgICAxLjY5MjkzMl0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRy
aWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAgICAxLjY5MzA1
NF0gVENQOiBIYXNoIHRhYmxlcyBjb25maWd1cmVkIChlc3RhYmxpc2hlZCAyMDQ4IGJpbmQg
MjA0OCkKWyAgICAxLjY5MzM1OV0gVURQIGhhc2ggdGFibGUgZW50cmllczogMjU2IChvcmRl
cjogMSwgODE5MiBieXRlcywgbGluZWFyKQpbICAgIDEuNjkzNDgxXSBVRFAtTGl0ZSBoYXNo
IHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDEsIDgxOTIgYnl0ZXMsIGxpbmVhcikKWyAg
ICAxLjY5Mzg3OF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxClsgICAgMS42
OTg1NzddIFJQQzogUmVnaXN0ZXJlZCBuYW1lZCBVTklYIHNvY2tldCB0cmFuc3BvcnQgbW9k
dWxlLgpbICAgIDEuNjk4NjY5XSBSUEM6IFJlZ2lzdGVyZWQgdWRwIHRyYW5zcG9ydCBtb2R1
bGUuClsgICAgMS42OTg3MzBdIFJQQzogUmVnaXN0ZXJlZCB0Y3AgdHJhbnNwb3J0IG1vZHVs
ZS4KWyAgICAxLjY5ODc5MV0gUlBDOiBSZWdpc3RlcmVkIHRjcCBORlN2NC4xIGJhY2tjaGFu
bmVsIHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMS42OTg4ODNdIFBDSTogQ0xTIDAgYnl0ZXMs
IGRlZmF1bHQgNjQKWyAgICAxLjcwOTYyNV0gaHcgcGVyZmV2ZW50czogZW5hYmxlZCB3aXRo
IGFybXY3X2NvcnRleF9hOCBQTVUgZHJpdmVyLCA1IGNvdW50ZXJzIGF2YWlsYWJsZQpbICAg
IDEuNzEyNDYzXSBJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMS43
MTM3NzVdIHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTE0IG1heF9vcmRlcj0xNiBidWNr
ZXRfb3JkZXI9MgpbICAgIDEuNzE4MjAwXSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9yZXNv
bHZlciBrZXkgdHlwZQpbICAgIDEuNzE4MzIyXSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdp
c3RlcmVkClsgICAgMS43MTg0MTRdIEtleSB0eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkClsg
ICAgMS43MTg1NjZdIGpmZnMyOiB2ZXJzaW9uIDIuMi4gKE5BTkQpIChTVU1NQVJZKSAgwqkg
MjAwMS0yMDA2IFJlZCBIYXQsIEluYy4KWyAgICAxLjcxOTI2OF0gS2V5IHR5cGUgYXN5bW1l
dHJpYyByZWdpc3RlcmVkClsgICAgMS43MTkzNjBdIEFzeW1tZXRyaWMga2V5IHBhcnNlciAn
eDUwOScgcmVnaXN0ZXJlZApbICAgIDEuNzE5NDgyXSBpbyBzY2hlZHVsZXIgbXEtZGVhZGxp
bmUgcmVnaXN0ZXJlZApbICAgIDEuNzE5NTczXSBpbyBzY2hlZHVsZXIga3liZXIgcmVnaXN0
ZXJlZApbICAgIDEuNzM4OTUyXSBvbWFwLWRtYS1lbmdpbmUgNDgwNTYwMDAuZG1hLWNvbnRy
b2xsZXI6IE9NQVAgRE1BIGVuZ2luZSBkcml2ZXIKWyAgICAxLjc0Mzc3NF0gdGktc3lzYzog
cHJvYmUgb2YgNDkwMzIwMDAudGFyZ2V0LW1vZHVsZSBmYWlsZWQgd2l0aCBlcnJvciAtMTYK
WyAgICAxLjc0NDE3MV0gdGktc3lzYzogcHJvYmUgb2YgNDgzMDQwMDAudGFyZ2V0LW1vZHVs
ZSBmYWlsZWQgd2l0aCBlcnJvciAtMTYKWyAgICAxLjc0NDY1OV0gdGktc3lzYyA0ODBjYjAy
NC50YXJnZXQtbW9kdWxlOiBzeXNjX2ZsYWdzIDAwMDAwMTAwICE9IDAwMDAwMTEwClsgICAg
MS43NDY4ODddIHRpLXN5c2MgNDgwYzkwMjQudGFyZ2V0LW1vZHVsZTogc3lzY19mbGFncyAw
MDAwMDEwMCAhPSAwMDAwMDExMApbICAgIDEuNzUxODAwXSBwaW5jdHJsLXNpbmdsZSA0ODAw
MjAzMC5waW5tdXg6IDI4NCBwaW5zLCBzaXplIDU2OApbICAgIDEuNzUyNjU1XSBwaW5jdHJs
LXNpbmdsZSA0ODAwMmEwMC5waW5tdXg6IDQ2IHBpbnMsIHNpemUgOTIKWyAgICAxLjc1Mzgx
NF0gcGluY3RybC1zaW5nbGUgNDgwMDI1ZDgucGlubXV4OiAxOCBwaW5zLCBzaXplIDM2Clsg
ICAgMS43NjI4NzhdIFNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDYgcG9ydHMsIElSUSBz
aGFyaW5nIGVuYWJsZWQKWyAgICAxLjc3MjI0N10gNDgwNmEwMDAuc2VyaWFsOiB0dHlTMCBh
dCBNTUlPIDB4NDgwNmEwMDAgKGlycSA9IDg4LCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBh
IDgyNTAKWyAgICAxLjc3NjMzNl0gNDgwNmMwMDAuc2VyaWFsOiB0dHlTMSBhdCBNTUlPIDB4
NDgwNmMwMDAgKGlycSA9IDg5LCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBhIDgyNTAKWyAg
ICAxLjc4MDE1MV0gNDkwMjAwMDAuc2VyaWFsOiB0dHlTMiBhdCBNTUlPIDB4NDkwMjAwMDAg
KGlycSA9IDkwLCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBhIDgyNTAKWyAgICAyLjYzNzg3
OF0gcmFuZG9tOiBmYXN0IGluaXQgZG9uZQpbICAgIDIuNjYxODY1XSBwcmludGs6IGNvbnNv
bGUgW3R0eVMyXSBlbmFibGVkClsgICAgMi42OTY5OTBdIGJyZDogbW9kdWxlIGxvYWRlZApb
ICAgIDIuNzIxMzQzXSBsb29wOiBtb2R1bGUgbG9hZGVkClsgICAgMi43MjgzMzJdIFNraXBw
aW5nIHR3bCBpbnRlcm5hbCBjbG9jayBpbml0IGFuZCB1c2luZyBib290bG9hZGVyIHZhbHVl
ICh1bmtub3duIG9zYyByYXRlKQpbICAgIDIuNzU1MTU3XSB0d2wgMC0wMDQ4OiBQSUggKGly
cSAyMykgY2hhaW5pbmcgSVJRcyAxNDcuLjE1NQpbICAgIDIuNzYxOTkzXSB0d2wgMC0wMDQ4
OiBwb3dlciAoaXJxIDE1MikgY2hhaW5pbmcgSVJRcyAxNTUuLjE2MgpbICAgIDIuODQ4NjMy
XSB0d2w0MDMwX2dwaW8gdHdsNDAzMC1ncGlvOiBncGlvIChpcnEgMTQ3KSBjaGFpbmluZyBJ
UlFzIDE2My4uMTgwClsgICAgMi44ODExOTVdIFRXTDQwMzA6IEhGQ0xLIGlzIG5vdCBjb25m
aWd1cmVkClsgICAgMi44ODY0NDRdIHR3bDQwMzAtYXVkaW8gNDgwNzAwMDAuaTJjOnR3bEA0
ODphdWRpbzogSW52YWxpZCBhdWRpb19tY2xrClsgICAgMi44OTM5NTFdIHR3bDQwMzAtYXVk
aW86IHByb2JlIG9mIDQ4MDcwMDAwLmkyYzp0d2xANDg6YXVkaW8gZmFpbGVkIHdpdGggZXJy
b3IgLTIyClsgICAgMi45MDQ1NDFdIG10ZG9vcHM6IG10ZCBkZXZpY2UgKG10ZGRldj1uYW1l
L251bWJlcikgbXVzdCBiZSBzdXBwbGllZApbICAgIDIuOTE0MjQ1XSBuYW5kOiBkZXZpY2Ug
Zm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhiYQpbICAgIDIuOTIx
ODEzXSBuYW5kOiBNaWNyb24gTVQyOUYyRzE2QUJEClsgICAgMi45MjYzMDBdIG5hbmQ6IDI1
NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Ig
c2l6ZTogNjQKWyAgICAyLjkzNDgxNF0gb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiBuYW5k
OiB1c2luZyBPTUFQX0VDQ19IQU0xX0NPREVfSFcKWyAgICAyLjk0MjY4N10gNSBmaXhlZC1w
YXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBvbWFwMi1uYW5kLjAK
WyAgICAyLjk1MDc3NV0gQ3JlYXRpbmcgNSBNVEQgcGFydGl0aW9ucyBvbiAib21hcDItbmFu
ZC4wIjoKWyAgICAyLjk1NzA5Ml0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwODAwMDAgOiAi
WC1Mb2FkZXIiClsgICAgMi45NjgyMzFdIDB4MDAwMDAwMDgwMDAwLTB4MDAwMDAwMjYwMDAw
IDogIlUtQm9vdCIKWyAgICAyLjk3OTY0NF0gMHgwMDAwMDAyNjAwMDAtMHgwMDAwMDAyODAw
MDAgOiAiVS1Cb290IEVudiIKWyAgICAyLjk5MDU3MF0gMHgwMDAwMDAyODAwMDAtMHgwMDAw
MDA2ODAwMDAgOiAiS2VybmVsIgpbICAgIDMuMDAyOTkwXSAweDAwMDAwMDY4MDAwMC0weDAw
MDAxMDAwMDAwMCA6ICJGaWxlc3lzdGVtIgpbICAgIDMuMTYyMDQ4XSBsaWJwaHk6IEZpeGVk
IE1ESU8gQnVzOiBwcm9iZWQKWyAgICAzLjE3MTM1Nl0gaTJjIC9kZXYgZW50cmllcyBkcml2
ZXIKWyAgICAzLjE4MjAzN10gc2RoY2k6IFNlY3VyZSBEaWdpdGFsIEhvc3QgQ29udHJvbGxl
ciBJbnRlcmZhY2UgZHJpdmVyClsgICAgMy4xODk0MjJdIHNkaGNpOiBDb3B5cmlnaHQoYykg
UGllcnJlIE9zc21hbgpbICAgIDMuMjQzMjU1XSBzZGhjaS1wbHRmbTogU0RIQ0kgcGxhdGZv
cm0gYW5kIE9GIGRyaXZlciBoZWxwZXIKWyAgICAzLjI1MzE3M10gbGVkdHJpZy1jcHU6IHJl
Z2lzdGVyZWQgdG8gaW5kaWNhdGUgYWN0aXZpdHkgb24gQ1BVcwpbICAgIDMuMjY3NzMwXSBk
cm9wX21vbml0b3I6IEluaXRpYWxpemluZyBuZXR3b3JrIGRyb3AgbW9uaXRvciBzZXJ2aWNl
ClsgICAgMy4yNzUyNjhdIEluaXRpYWxpemluZyBYRlJNIG5ldGxpbmsgc29ja2V0ClsgICAg
My4yODA4NTNdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTAKWyAgICAzLjI5
MTA0Nl0gU2VnbWVudCBSb3V0aW5nIHdpdGggSVB2NgpbICAgIDMuMjk1ODM3XSBzaXQ6IElQ
djYsIElQdjQgYW5kIE1QTFMgb3ZlciBJUHY0IHR1bm5lbGluZyBkcml2ZXIKWyAgICAzLjMw
MzgwMl0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNwpbICAgIDMuMzA5Mjk1
XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE1ClsgICAgMy4zMTQ1MTRdIEtl
eSB0eXBlIGRuc19yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMy4zMjA1ODddIG9wcm9maWxl
OiB1c2luZyBhcm0vYXJtdjcKWyAgICAzLjMyNTQzOV0gVGh1bWJFRSBDUFUgZXh0ZW5zaW9u
IHN1cHBvcnRlZC4KWyAgICAzLjMzMDI5MV0gUmVnaXN0ZXJpbmcgU1dQL1NXUEIgZW11bGF0
aW9uIGhhbmRsZXIKWyAgICAzLjMzNjg4M10gUE06IG5vIHNvZnR3YXJlIEkvTyBjaGFpbiBj
b250cm9sOyBzb21lIHdha2V1cHMgbWF5IGJlIGxvc3QKWyAgICAzLjM0NjY0OV0gU21hcnRS
ZWZsZXggQ2xhc3MzIGluaXRpYWxpemVkClsgICAgMy4zNTI3NTJdIExvYWRpbmcgY29tcGls
ZWQtaW4gWC41MDkgY2VydGlmaWNhdGVzClsgICAgMy40MzQ2MDBdIHNtYXJ0cmVmbGV4IDQ4
MGNiMDAwLnNtYXJ0cmVmbGV4OiBvbWFwX3NyX3Byb2JlOiBTbWFydFJlZmxleCBkcml2ZXIg
aW5pdGlhbGl6ZWQKWyAgICAzLjQ0NTEyOV0gc21hcnRyZWZsZXggNDgwY2IwMDAuc21hcnRy
ZWZsZXg6IG9tYXBfc3JfcHJvYmU6IHNtYXJ0cmVmbGV4X2NvcmU6IE5vIFZvbHRhZ2UgdGFi
bGUgZm9yIHRoZSBjb3JyZXNwb25kaW5nIHZkZC4gQ2Fubm90IGNyZWF0ZSBkZWJ1Z2ZzIGVu
dHJpZXMgZm9yIG4tdmFsdWVzClsgICAgMy40NjI3NjhdIHNtYXJ0cmVmbGV4OiBwcm9iZSBv
ZiA0ODBjYjAwMC5zbWFydHJlZmxleCBmYWlsZWQgd2l0aCBlcnJvciAtNjEKWyAgICAzLjQ3
MTg2Ml0gc21hcnRyZWZsZXggNDgwYzkwMDAuc21hcnRyZWZsZXg6IG9tYXBfc3JfcHJvYmU6
IFNtYXJ0UmVmbGV4IGRyaXZlciBpbml0aWFsaXplZApbICAgIDMuNDgxODQyXSBzbWFydHJl
ZmxleCA0ODBjOTAwMC5zbWFydHJlZmxleDogb21hcF9zcl9wcm9iZTogc21hcnRyZWZsZXhf
bXB1X2l2YTogTm8gVm9sdGFnZSB0YWJsZSBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgdmRkLiBD
YW5ub3QgY3JlYXRlIGRlYnVnZnMgZW50cmllcyBmb3Igbi12YWx1ZXMKWyAgICAzLjQ5OTY2
NF0gc21hcnRyZWZsZXg6IHByb2JlIG9mIDQ4MGM5MDAwLnNtYXJ0cmVmbGV4IGZhaWxlZCB3
aXRoIGVycm9yIC02MQpbICAgIDMuNTEyOTA4XSBXYWl0aW5nIGZvciByb290IGRldmljZSAv
ZGV2L21tY2JsazBwMi4uLgo=
--------------36C34FBFAE52466B70570902
Content-Type: text/plain; charset=UTF-8;
 name="minicom.cap.30c66fc30ee7"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="minicom.cap.30c66fc30ee7"

WyAgICAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwClsgICAg
MC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS44LjAtcmM0LTAwMDAxLWczMGM2NmZjMzBlZTcg
KGphcmtrb0BteWxseTY0KSAoYXJtLWxpbnV4LWdudWVhYmloZi1nY2MgKERlYmlhbiA4LjMu
MC0yKSA4LjMuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi4zMS4xKSAj
MTIgU01QIFdlZCBKdW4gMiAyMTowODoxOSBFRVNUIDIwMjEKWyAgICAwLjAwMDAwMF0gQ1BV
OiBBUk12NyBQcm9jZXNzb3IgWzQxMWZjMDgzXSByZXZpc2lvbiAzIChBUk12NyksIGNyPTEw
YzUzODdkClsgICAgMC4wMDAwMDBdIENQVTogUElQVCAvIFZJUFQgbm9uYWxpYXNpbmcgZGF0
YSBjYWNoZSwgVklQVCBub25hbGlhc2luZyBpbnN0cnVjdGlvbiBjYWNoZQpbICAgIDAuMDAw
MDAwXSBPRjogZmR0OiBNYWNoaW5lIG1vZGVsOiBUSSBPTUFQMyBCZWFnbGVCb2FyZApbICAg
IDAuMDAwMDAwXSBNZW1vcnkgcG9saWN5OiBEYXRhIGNhY2hlIHdyaXRlYmFjawpbICAgIDAu
MDAwMDAwXSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDhlODAwMDAwClsgICAgMC4wMDAw
MDBdIFpvbmUgcmFuZ2VzOgpbICAgIDAuMDAwMDAwXSAgIE5vcm1hbCAgIFttZW0gMHgwMDAw
MDAwMDgwMDAwMDAwLTB4MDAwMDAwMDA4ZmRmZmZmZl0KWyAgICAwLjAwMDAwMF0gICBIaWdo
TWVtICBlbXB0eQpbICAgIDAuMDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2gg
bm9kZQpbICAgIDAuMDAwMDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAw
MDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwODAwMDAwMDAtMHgwMDAwMDAwMDhm
ZGZmZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAw
MDAwMDA4MDAwMDAwMC0weDAwMDAwMDAwOGZkZmZmZmZdClsgICAgMC4wMDAwMDBdIENQVTog
QWxsIENQVShzKSBzdGFydGVkIGluIFNWQyBtb2RlLgpbICAgIDAuMDAwMDAwXSBPTUFQMzQz
MC8zNTMwIEVTMy4wIChsMmNhY2hlIGl2YSBzZ3ggbmVvbiBpc3ApClsgICAgMC4wMDAwMDBd
IHBlcmNwdTogRW1iZWRkZWQgMTkgcGFnZXMvY3B1IHM0OTAzNiByODE5MiBkMjA1OTYgdTc3
ODI0ClsgICAgMC4wMDAwMDBdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGlu
ZyBvbi4gIFRvdGFsIHBhZ2VzOiA2NDQ1MgpbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFu
ZCBsaW5lOiBjb25zb2xlPXR0eU8yLDExNTIwMG44IG1wdXJhdGU9YXV0byBidWRkeT1ub25l
IGNhbWVyYT1ub25lIHZyYW09MTJNIG9tYXBmYi5tb2RlPWR2aTo2NDB4NDgwTVItMTZANjAg
b21hcGRzcy5kZWZfZGlzcD1kdmkgcm9vdD0vZGV2L21tY2JsazBwMiBydyByb290ZnN0eXBl
PWV4dDQgcm9vdHdhaXQKWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUg
ZW50cmllczogMzI3NjggKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVhcikKWyAgICAw
LjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3JkZXI6
IDQsIDY1NTM2IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wMDAwMDBdIG1lbSBhdXRvLWluaXQ6
IHN0YWNrOm9mZiwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpvZmYKWyAgICAwLjAwMDAw
MF0gTWVtb3J5OiAyMjY0NDRLLzI2MDA5NksgYXZhaWxhYmxlICg5MjE2SyBrZXJuZWwgY29k
ZSwgNzk3SyByd2RhdGEsIDIxNTJLIHJvZGF0YSwgMTAyNEsgaW5pdCwgMjU1SyBic3MsIDE3
MjY4SyByZXNlcnZlZCwgMTYzODRLIGNtYS1yZXNlcnZlZCwgMEsgaGlnaG1lbSkKWyAgICAw
LjAwMDAwMF0gcmN1OiBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAu
MDAwMDAwXSByY3U6IAlSQ1UgZXZlbnQgdHJhY2luZyBpcyBlbmFibGVkLgpbICAgIDAuMDAw
MDAwXSByY3U6IAlSQ1UgcmVzdHJpY3RpbmcgQ1BVcyBmcm9tIE5SX0NQVVM9MiB0byBucl9j
cHVfaWRzPTEuClsgICAgMC4wMDAwMDBdIHJjdTogUkNVIGNhbGN1bGF0ZWQgdmFsdWUgb2Yg
c2NoZWR1bGVyLWVubGlzdG1lbnQgZGVsYXkgaXMgMTAgamlmZmllcy4KWyAgICAwLjAwMDAw
MF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJf
Y3B1X2lkcz0xClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDE2LCBucl9pcnFzOiAxNiwgcHJl
YWxsb2NhdGVkIGlycXM6IDE2ClsgICAgMC4wMDAwMDBdIElSUTogRm91bmQgYW4gSU5UQyBh
dCAweChwdHJ2YWwpIChyZXZpc2lvbiA0LjApIHdpdGggOTYgaW50ZXJydXB0cwpbICAgIDAu
MDAwMDAwXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZyb20gc3RhcnRfa2Vy
bmVsKzB4MmYwLzB4NTMwIHdpdGggY3JuZ19pbml0PTAKWyAgICAwLjAwMDAwMF0gQ2xvY2tp
bmcgcmF0ZSAoQ3J5c3RhbC9Db3JlL01QVSk6IDI2LjAvMzMyLzYwMCBNSHoKWyAgICAwLjAw
MDAwMF0gVEkgZ3B0aW1lciBjbG9ja2V2ZW50OiAxMzAwMDAwMCBIeiBhdCAvb2NwQDY4MDAw
MDAwL3RhcmdldC1tb2R1bGVANDkwMzIwMDAKWyAgICAwLjAwMDAwMF0gVEkgZ3B0aW1lciBj
bG9ja3NvdXJjZTogYWx3YXlzLW9uIC9vY3BANjgwMDAwMDAvdGFyZ2V0LW1vZHVsZUA0ODMw
NDAwMApbICAgIDAuMDAwMDkxXSBzY2hlZF9jbG9jazogMzIgYml0cyBhdCAzMmtIeiwgcmVz
b2x1dGlvbiAzMDUxN25zLCB3cmFwcyBldmVyeSA2NTUzNTk5OTk4NDc0MW5zClsgICAgMC4w
MDAxODNdIGNsb2Nrc291cmNlOiBkbXRpbWVyOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNs
ZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiA1ODMyNzAzOTk4NjQxOSBucwpbICAgIDAu
MDAxNTI1XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDMwClsgICAgMC4wMDE2
NDddIFdBUk5JTkc6IFlvdXIgJ2NvbnNvbGU9dHR5TzInIGhhcyBiZWVuIHJlcGxhY2VkIGJ5
ICd0dHlTMicKWyAgICAwLjAwMTcwOF0gVGhpcyBlbnN1cmVzIHRoYXQgeW91IHN0aWxsIHNl
ZSBrZXJuZWwgbWVzc2FnZXMuIFBsZWFzZQpbICAgIDAuMDAxNzcwXSB1cGRhdGUgeW91ciBr
ZXJuZWwgY29tbWFuZGxpbmUuClsgICAgMC4wMDE5NTNdIENhbGlicmF0aW5nIGRlbGF5IGxv
b3AuLi4gNTk0LjczIEJvZ29NSVBTIChscGo9Mjk3MzY5NikKWyAgICAwLjA1NDY1Nl0gcGlk
X21heDogZGVmYXVsdDogMzI3NjggbWluaW11bTogMzAxClsgICAgMC4wNTUwNTNdIExTTTog
U2VjdXJpdHkgRnJhbWV3b3JrIGluaXRpYWxpemluZwpbICAgIDAuMDU1Mjk3XSBNb3VudC1j
YWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4wNTUzODldIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRy
aWVzOiAxMDI0IChvcmRlcjogMCwgNDA5NiBieXRlcywgbGluZWFyKQpbICAgIDAuMDU3Mjgx
XSBDUFU6IFRlc3Rpbmcgd3JpdGUgYnVmZmVyIGNvaGVyZW5jeTogb2sKWyAgICAwLjA1NzQ2
NF0gQ1BVMDogU3BlY3RyZSB2MjogdXNpbmcgQlBJQUxMIHdvcmthcm91bmQKWyAgICAwLjA1
ODY1NF0gQ1BVMDogdGhyZWFkIC0xLCBjcHUgMCwgc29ja2V0IC0xLCBtcGlkciAwClsgICAg
MC4wNjQ1NDRdIFNldHRpbmcgdXAgc3RhdGljIGlkZW50aXR5IG1hcCBmb3IgMHg4MDEwMDAw
MCAtIDB4ODAxMDAwNzgKWyAgICAwLjA2NjEwMV0gcmN1OiBIaWVyYXJjaGljYWwgU1JDVSBp
bXBsZW1lbnRhdGlvbi4KWyAgICAwLjA2OTM2Nl0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRh
cnkgQ1BVcyAuLi4KWyAgICAwLjA2OTQ1OF0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgMSBD
UFUKWyAgICAwLjA2OTU0OV0gU01QOiBUb3RhbCBvZiAxIHByb2Nlc3NvcnMgYWN0aXZhdGVk
ICg1OTQuNzMgQm9nb01JUFMpLgpbICAgIDAuMDY5NjEwXSBDUFU6IEFsbCBDUFUocykgc3Rh
cnRlZCBpbiBTVkMgbW9kZS4KWyAgICAwLjA3MTU5NF0gZGV2dG1wZnM6IGluaXRpYWxpemVk
ClsgICAgMC4xMDU1MjldIFZGUCBzdXBwb3J0IHYwLjM6IGltcGxlbWVudG9yIDQxIGFyY2hp
dGVjdHVyZSAzIHBhcnQgMzAgdmFyaWFudCBjIHJldiAxClsgICAgMC4xMDYyMDFdIGNsb2Nr
c291cmNlOiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZm
ZmYsIG1heF9pZGxlX25zOiAxOTExMjYwNDQ2Mjc1MDAwMCBucwpbICAgIDAuMTA2MjkyXSBm
dXRleCBoYXNoIHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4xMDgyNDVdIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGluY3Ry
bCBzdWJzeXN0ZW0KWyAgICAwLjEwOTY4MF0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhl
cm1hbCBnb3Zlcm5vciAnZmFpcl9zaGFyZScKWyAgICAwLjExMDA3Nl0gdGhlcm1hbF9zeXM6
IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93aXNlJwpbICAgIDAuMTEwMTY4
XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICd1c2VyX3NwYWNl
JwpbICAgIDAuMTEyNDg3XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2Clsg
ICAgMC4xMTg4OTZdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWlj
IGNvaGVyZW50IGFsbG9jYXRpb25zClsgICAgMC4xNTE5NDddIG9tYXBfaHdtb2Q6IG1jYnNw
Ml9zaWRldG9uZSB1c2luZyBicm9rZW4gZHQgZGF0YSBmcm9tIG1jYnNwClsgICAgMC4xNTI5
ODRdIG9tYXBfaHdtb2Q6IG1jYnNwM19zaWRldG9uZSB1c2luZyBicm9rZW4gZHQgZGF0YSBm
cm9tIG1jYnNwClsgICAgMC4yMzU2MjZdIGF1ZGl0OiBpbml0aWFsaXppbmcgbmV0bGluayBz
dWJzeXMgKGRpc2FibGVkKQpbICAgIDAuMjM4MzExXSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5v
ciBtZW51ClsgICAgMC4yMzkwNDRdIFJlcHJvZ3JhbW1pbmcgU0RSQyBjbG9jayB0byAzMzIw
MDAwMDAgSHoKWyAgICAwLjI3OTg3Nl0gYXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgwLjIxMDox
KTogc3RhdGU9aW5pdGlhbGl6ZWQgYXVkaXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC4yODA4
MjJdIE9NQVAgR1BJTyBoYXJkd2FyZSB2ZXJzaW9uIDIuNQpbICAgIDAuMzQyMjg1XSBvbWFw
LWdwbWMgNmUwMDAwMDAuZ3BtYzogR1BNQyByZXZpc2lvbiA1LjAKWyAgICAwLjM0MjU1OV0g
Z3BtY19tZW1faW5pdDogZGlzYWJsaW5nIGNzIDAgbWFwcGVkIGF0IDB4MC0weDEwMDAwMDAK
WyAgICAwLjM3OTE1MF0gTm8gQVRBR3M/ClsgICAgMC4zNzkyNDFdIGh3LWJyZWFrcG9pbnQ6
IGRlYnVnIGFyY2hpdGVjdHVyZSAweDQgdW5zdXBwb3J0ZWQuClsgICAgMC40MzM4OThdIGlv
bW11OiBEZWZhdWx0IGRvbWFpbiB0eXBlOiBUcmFuc2xhdGVkIApbICAgIDAuNDM2MDY1XSBv
bWFwLWlvbW11IDQ4MGJkNDAwLm1tdTogNDgwYmQ0MDAubW11IHJlZ2lzdGVyZWQKWyAgICAw
LjQzNjk4MV0gcGxhdGZvcm0gNDgwYmMwMDAuaXNwOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAg
MApbICAgIDAuNDQwNzA0XSB2Z2FhcmI6IGxvYWRlZApbICAgIDAuNDQxNzExXSBTQ1NJIHN1
YnN5c3RlbSBpbml0aWFsaXplZApbICAgIDAuNDQ4MjcyXSBvbWFwX2kyYyA0ODA3MDAwMC5p
MmM6IGJ1cyAwIHJldjMuMyBhdCAyNjAwIGtIegpbICAgIDAuNDUwNTYxXSBvbWFwX2kyYyA0
ODA3MjAwMC5pMmM6IGJ1cyAxIHJldjMuMyBhdCAxMDAga0h6ClsgICAgMC40NTI2OTddIG9t
YXBfaTJjIDQ4MDYwMDAwLmkyYzogYnVzIDIgcmV2My4zIGF0IDEwMCBrSHoKWyAgICAwLjQ1
Mzc2NV0gcHBzX2NvcmU6IExpbnV4UFBTIEFQSSB2ZXIuIDEgcmVnaXN0ZXJlZApbICAgIDAu
NDUzODU3XSBwcHNfY29yZTogU29mdHdhcmUgdmVyLiA1LjMuNiAtIENvcHlyaWdodCAyMDA1
LTIwMDcgUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGludXguaXQ+ClsgICAgMC40NTM5
NzldIFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQKWyAgICAwLjQ1NjcyNl0gY2xvY2tz
b3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIGRtdGltZXIKWyAgICAxLjY0MzU1NF0g
VkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82LjYuMApbICAgIDEuNjQzNzk4XSBWRlM6IERxdW90
LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMTAyNCAob3JkZXIgMCwgNDA5NiBieXRlcykK
WyAgICAxLjY4MDE3NV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAyClsgICAg
MS42ODE2NzFdIHRjcF9saXN0ZW5fcG9ydGFkZHJfaGFzaCBoYXNoIHRhYmxlIGVudHJpZXM6
IDUxMiAob3JkZXI6IDAsIDYxNDQgYnl0ZXMsIGxpbmVhcikKWyAgICAxLjY4MTc5M10gVENQ
IGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDEsIDgxOTIg
Ynl0ZXMsIGxpbmVhcikKWyAgICAxLjY4MTkxNV0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRy
aWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAgICAxLjY4MjAz
N10gVENQOiBIYXNoIHRhYmxlcyBjb25maWd1cmVkIChlc3RhYmxpc2hlZCAyMDQ4IGJpbmQg
MjA0OCkKWyAgICAxLjY4MjMxMl0gVURQIGhhc2ggdGFibGUgZW50cmllczogMjU2IChvcmRl
cjogMSwgODE5MiBieXRlcywgbGluZWFyKQpbICAgIDEuNjgyNDM0XSBVRFAtTGl0ZSBoYXNo
IHRhYmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDEsIDgxOTIgYnl0ZXMsIGxpbmVhcikKWyAg
ICAxLjY4Mjg2MV0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxClsgICAgMS42
ODc5ODhdIFJQQzogUmVnaXN0ZXJlZCBuYW1lZCBVTklYIHNvY2tldCB0cmFuc3BvcnQgbW9k
dWxlLgpbICAgIDEuNjg4MDc5XSBSUEM6IFJlZ2lzdGVyZWQgdWRwIHRyYW5zcG9ydCBtb2R1
bGUuClsgICAgMS42ODgxNDBdIFJQQzogUmVnaXN0ZXJlZCB0Y3AgdHJhbnNwb3J0IG1vZHVs
ZS4KWyAgICAxLjY4ODIwMV0gUlBDOiBSZWdpc3RlcmVkIHRjcCBORlN2NC4xIGJhY2tjaGFu
bmVsIHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMS42ODgyOTNdIFBDSTogQ0xTIDAgYnl0ZXMs
IGRlZmF1bHQgNjQKWyAgICAxLjY5ODkxM10gaHcgcGVyZmV2ZW50czogZW5hYmxlZCB3aXRo
IGFybXY3X2NvcnRleF9hOCBQTVUgZHJpdmVyLCA1IGNvdW50ZXJzIGF2YWlsYWJsZQpbICAg
IDEuNzAxODczXSBJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMS43
MDMxODZdIHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTE0IG1heF9vcmRlcj0xNiBidWNr
ZXRfb3JkZXI9MgpbICAgIDEuNzA2ODc4XSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9yZXNv
bHZlciBrZXkgdHlwZQpbICAgIDEuNzA3MDMxXSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdp
c3RlcmVkClsgICAgMS43MDc3MDJdIEtleSB0eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkClsg
ICAgMS43MDc4NTVdIGpmZnMyOiB2ZXJzaW9uIDIuMi4gKE5BTkQpIChTVU1NQVJZKSAgwqkg
MjAwMS0yMDA2IFJlZCBIYXQsIEluYy4KWyAgICAxLjcwODgzMV0gS2V5IHR5cGUgYXN5bW1l
dHJpYyByZWdpc3RlcmVkClsgICAgMS43MDg5MjNdIEFzeW1tZXRyaWMga2V5IHBhcnNlciAn
eDUwOScgcmVnaXN0ZXJlZApbICAgIDEuNzA5MDE0XSBpbyBzY2hlZHVsZXIgbXEtZGVhZGxp
bmUgcmVnaXN0ZXJlZApbICAgIDEuNzA5MTA2XSBpbyBzY2hlZHVsZXIga3liZXIgcmVnaXN0
ZXJlZApbICAgIDEuNzI4NzU5XSBvbWFwLWRtYS1lbmdpbmUgNDgwNTYwMDAuZG1hLWNvbnRy
b2xsZXI6IE9NQVAgRE1BIGVuZ2luZSBkcml2ZXIKWyAgICAxLjczODE1OV0gdGktc3lzYyA0
ODBjYjAyNC50YXJnZXQtbW9kdWxlOiBzeXNjX2ZsYWdzIDAwMDAwMTAwICE9IDAwMDAwMTEw
ClsgICAgMS43Mzk5MjldIHRpLXN5c2MgNDgwYzkwMjQudGFyZ2V0LW1vZHVsZTogc3lzY19m
bGFncyAwMDAwMDEwMCAhPSAwMDAwMDExMApbICAgIDEuNzQ0ODEyXSBwaW5jdHJsLXNpbmds
ZSA0ODAwMjAzMC5waW5tdXg6IDI4NCBwaW5zLCBzaXplIDU2OApbICAgIDEuNzQ1NjY2XSBw
aW5jdHJsLXNpbmdsZSA0ODAwMmEwMC5waW5tdXg6IDQ2IHBpbnMsIHNpemUgOTIKWyAgICAx
Ljc0Njc5NV0gcGluY3RybC1zaW5nbGUgNDgwMDI1ZDgucGlubXV4OiAxOCBwaW5zLCBzaXpl
IDM2ClsgICAgMS43NTYxMDNdIFNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDYgcG9ydHMs
IElSUSBzaGFyaW5nIGVuYWJsZWQKWyAgICAxLjc2NTQ0MV0gNDgwNmEwMDAuc2VyaWFsOiB0
dHlTMCBhdCBNTUlPIDB4NDgwNmEwMDAgKGlycSA9IDg4LCBiYXNlX2JhdWQgPSAzMDAwMDAw
KSBpcyBhIDgyNTAKWyAgICAxLjc2OTU2MV0gNDgwNmMwMDAuc2VyaWFsOiB0dHlTMSBhdCBN
TUlPIDB4NDgwNmMwMDAgKGlycSA9IDg5LCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBhIDgy
NTAKWyAgICAxLjc3MzE2Ml0gNDkwMjAwMDAuc2VyaWFsOiB0dHlTMiBhdCBNTUlPIDB4NDkw
MjAwMDAgKGlycSA9IDkwLCBiYXNlX2JhdWQgPSAzMDAwMDAwKSBpcyBhIDgyNTAKWyAgICAy
LjYzNDgyNl0gcHJpbnRrOiBjb25zb2xlIFt0dHlTMl0gZW5hYmxlZApbICAgIDIuNjM5ODYy
XSByYW5kb206IGZhc3QgaW5pdCBkb25lClsgICAgMi42NzQxMDJdIGJyZDogbW9kdWxlIGxv
YWRlZApbICAgIDIuNjk5MDA1XSBsb29wOiBtb2R1bGUgbG9hZGVkClsgICAgMi43MDU0NzRd
IFNraXBwaW5nIHR3bCBpbnRlcm5hbCBjbG9jayBpbml0IGFuZCB1c2luZyBib290bG9hZGVy
IHZhbHVlICh1bmtub3duIG9zYyByYXRlKQpbICAgIDIuNzMzMDAxXSB0d2wgMC0wMDQ4OiBQ
SUggKGlycSAyMykgY2hhaW5pbmcgSVJRcyAxNDcuLjE1NQpbICAgIDIuNzM5Nzc2XSB0d2wg
MC0wMDQ4OiBwb3dlciAoaXJxIDE1MikgY2hhaW5pbmcgSVJRcyAxNTUuLjE2MgpbICAgIDIu
ODI2NTA3XSB0d2w0MDMwX2dwaW8gdHdsNDAzMC1ncGlvOiBncGlvIChpcnEgMTQ3KSBjaGFp
bmluZyBJUlFzIDE2My4uMTgwClsgICAgMi44NTk0OTddIFRXTDQwMzA6IEhGQ0xLIGlzIG5v
dCBjb25maWd1cmVkClsgICAgMi44NjQzNDldIHR3bDQwMzAtYXVkaW8gNDgwNzAwMDAuaTJj
OnR3bEA0ODphdWRpbzogSW52YWxpZCBhdWRpb19tY2xrClsgICAgMi44NzIyMjJdIHR3bDQw
MzAtYXVkaW86IHByb2JlIG9mIDQ4MDcwMDAwLmkyYzp0d2xANDg6YXVkaW8gZmFpbGVkIHdp
dGggZXJyb3IgLTIyClsgICAgMi44ODI4MTJdIG10ZG9vcHM6IG10ZCBkZXZpY2UgKG10ZGRl
dj1uYW1lL251bWJlcikgbXVzdCBiZSBzdXBwbGllZApbICAgIDIuODkyNTQ3XSBuYW5kOiBk
ZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhiYQpbICAg
IDIuOTAwMTE1XSBuYW5kOiBNaWNyb24gTVQyOUYyRzE2QUJEClsgICAgMi45MDQyNjZdIG5h
bmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4
LCBPT0Igc2l6ZTogNjQKWyAgICAyLjkxMzExNl0gb21hcDItbmFuZCAzMDAwMDAwMC5uYW5k
OiBuYW5kOiB1c2luZyBPTUFQX0VDQ19IQU0xX0NPREVfSFcKWyAgICAyLjkyMDk4OV0gNSBm
aXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBvbWFwMi1u
YW5kLjAKWyAgICAyLjkyOTA3N10gQ3JlYXRpbmcgNSBNVEQgcGFydGl0aW9ucyBvbiAib21h
cDItbmFuZC4wIjoKWyAgICAyLjkzNTA4OV0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwODAw
MDAgOiAiWC1Mb2FkZXIiClsgICAgMi45NDYwNzVdIDB4MDAwMDAwMDgwMDAwLTB4MDAwMDAw
MjYwMDAwIDogIlUtQm9vdCIKWyAgICAyLjk1NzkxNl0gMHgwMDAwMDAyNjAwMDAtMHgwMDAw
MDAyODAwMDAgOiAiVS1Cb290IEVudiIKWyAgICAyLjk2ODg3Ml0gMHgwMDAwMDAyODAwMDAt
MHgwMDAwMDA2ODAwMDAgOiAiS2VybmVsIgpbICAgIDIuOTgxMzIzXSAweDAwMDAwMDY4MDAw
MC0weDAwMDAxMDAwMDAwMCA6ICJGaWxlc3lzdGVtIgpbICAgIDMuMTQwODA4XSBsaWJwaHk6
IEZpeGVkIE1ESU8gQnVzOiBwcm9iZWQKWyAgICAzLjE1MDIwN10gaTJjIC9kZXYgZW50cmll
cyBkcml2ZXIKWyAgICAzLjE2MDYxNF0gc2RoY2k6IFNlY3VyZSBEaWdpdGFsIEhvc3QgQ29u
dHJvbGxlciBJbnRlcmZhY2UgZHJpdmVyClsgICAgMy4xNjgwMjldIHNkaGNpOiBDb3B5cmln
aHQoYykgUGllcnJlIE9zc21hbgpbICAgIDMuMjIxMDk5XSBzZGhjaS1wbHRmbTogU0RIQ0kg
cGxhdGZvcm0gYW5kIE9GIGRyaXZlciBoZWxwZXIKWyAgICAzLjIzMDk4N10gbGVkdHJpZy1j
cHU6IHJlZ2lzdGVyZWQgdG8gaW5kaWNhdGUgYWN0aXZpdHkgb24gQ1BVcwpbICAgIDMuMjQ2
MDYzXSBkcm9wX21vbml0b3I6IEluaXRpYWxpemluZyBuZXR3b3JrIGRyb3AgbW9uaXRvciBz
ZXJ2aWNlClsgICAgMy4yNTM5OTddIEluaXRpYWxpemluZyBYRlJNIG5ldGxpbmsgc29ja2V0
ClsgICAgMy4yNTk2MTNdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTAKWyAg
ICAzLjI3MDA1MF0gU2VnbWVudCBSb3V0aW5nIHdpdGggSVB2NgpbICAgIDMuMjc0NTk3XSBz
aXQ6IElQdjYsIElQdjQgYW5kIE1QTFMgb3ZlciBJUHY0IHR1bm5lbGluZyBkcml2ZXIKWyAg
ICAzLjI4Mjk1OF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNwpbICAgIDMu
Mjg4NDIxXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE1ClsgICAgMy4yOTM2
NDBdIEtleSB0eXBlIGRuc19yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMy4yOTk3NDNdIG9w
cm9maWxlOiB1c2luZyBhcm0vYXJtdjcKWyAgICAzLjMwNDE5OV0gVGh1bWJFRSBDUFUgZXh0
ZW5zaW9uIHN1cHBvcnRlZC4KWyAgICAzLjMwOTQ0OF0gUmVnaXN0ZXJpbmcgU1dQL1NXUEIg
ZW11bGF0aW9uIGhhbmRsZXIKWyAgICAzLjMxNTY3M10gUE06IG5vIHNvZnR3YXJlIEkvTyBj
aGFpbiBjb250cm9sOyBzb21lIHdha2V1cHMgbWF5IGJlIGxvc3QKWyAgICAzLjMyNTM3OF0g
U21hcnRSZWZsZXggQ2xhc3MzIGluaXRpYWxpemVkClsgICAgMy4zMzE4NDhdIExvYWRpbmcg
Y29tcGlsZWQtaW4gWC41MDkgY2VydGlmaWNhdGVzClsgICAgMy40MTI3MTldIHNtYXJ0cmVm
bGV4IDQ4MGNiMDAwLnNtYXJ0cmVmbGV4OiBvbWFwX3NyX3Byb2JlOiBTbWFydFJlZmxleCBk
cml2ZXIgaW5pdGlhbGl6ZWQKWyAgICAzLjQyMjkxMl0gc21hcnRyZWZsZXggNDgwY2IwMDAu
c21hcnRyZWZsZXg6IG9tYXBfc3JfcHJvYmU6IHNtYXJ0cmVmbGV4X2NvcmU6IE5vIFZvbHRh
Z2UgdGFibGUgZm9yIHRoZSBjb3JyZXNwb25kaW5nIHZkZC4gQ2Fubm90IGNyZWF0ZSBkZWJ1
Z2ZzIGVudHJpZXMgZm9yIG4tdmFsdWVzClsgICAgMy40NDA1NTFdIHNtYXJ0cmVmbGV4OiBw
cm9iZSBvZiA0ODBjYjAwMC5zbWFydHJlZmxleCBmYWlsZWQgd2l0aCBlcnJvciAtNjEKWyAg
ICAzLjQ0OTYxNV0gc21hcnRyZWZsZXggNDgwYzkwMDAuc21hcnRyZWZsZXg6IG9tYXBfc3Jf
cHJvYmU6IFNtYXJ0UmVmbGV4IGRyaXZlciBpbml0aWFsaXplZApbICAgIDMuNDU5NTAzXSBz
bWFydHJlZmxleCA0ODBjOTAwMC5zbWFydHJlZmxleDogb21hcF9zcl9wcm9iZTogc21hcnRy
ZWZsZXhfbXB1X2l2YTogTm8gVm9sdGFnZSB0YWJsZSBmb3IgdGhlIGNvcnJlc3BvbmRpbmcg
dmRkLiBDYW5ub3QgY3JlYXRlIGRlYnVnZnMgZW50cmllcyBmb3Igbi12YWx1ZXMKWyAgICAz
LjQ3NzMyNV0gc21hcnRyZWZsZXg6IHByb2JlIG9mIDQ4MGM5MDAwLnNtYXJ0cmVmbGV4IGZh
aWxlZCB3aXRoIGVycm9yIC02MQpbICAgIDMuNDkwMzI1XSBXYWl0aW5nIGZvciByb290IGRl
dmljZSAvZGV2L21tY2JsazBwMi4uLgpbICAgIDMuNTkyNDk4XSBtbWMwOiBob3N0IGRvZXMg
bm90IHN1cHBvcnQgcmVhZGluZyByZWFkLW9ubHkgc3dpdGNoLCBhc3N1bWluZyB3cml0ZS1l
bmFibGUKWyAgICAzLjYwOTAwOF0gbW1jMDogbmV3IGhpZ2ggc3BlZWQgU0RIQyBjYXJkIGF0
IGFkZHJlc3MgYWFhYQpbICAgIDMuNjE4MTAzXSBtbWNibGswOiBtbWMwOmFhYWEgU0MxNkcg
MTQuOCBHaUIgClsgICAgMy42MzUyNTNdICBtbWNibGswOiBwMSBwMiBwMwpbICAgIDMuNzM1
MDc2XSBFWFQ0LWZzIChtbWNibGswcDIpOiBtb3VudGVkIGZpbGVzeXN0ZW0gd2l0aCBvcmRl
cmVkIGRhdGEgbW9kZS4gT3B0czogKG51bGwpClsgICAgMy43NDQ3NTBdIFZGUzogTW91bnRl
ZCByb290IChleHQ0IGZpbGVzeXN0ZW0pIG9uIGRldmljZSAxNzk6Mi4K
--------------36C34FBFAE52466B70570902--
