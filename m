Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1791639B9DC
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 15:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhFDNdA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 09:33:00 -0400
Received: from mail.kernelconcepts.de ([188.40.83.200]:58438 "EHLO
        mail.kernelconcepts.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFDNdA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 09:33:00 -0400
Received: from [93.135.28.164] (helo=[192.168.1.88])
        by mail.kernelconcepts.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <florian.boor@kernelconcepts.de>)
        id 1lp9uq-0006xq-Dn; Fri, 04 Jun 2021 15:31:12 +0200
From:   Florian Boor <florian.boor@kernelconcepts.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <38229f0a-85e8-680f-f561-5fc59ac84c6b@kernelconcepts.de>
 <YJTUWaPWSmvwaZMb@atomide.com>
 <22081c83-0f7f-cef2-6075-79346abf6e9e@kernelconcepts.de>
Subject: Re: OMAP4460 cpufreq crashes
Message-ID: <fe821e16-7232-2324-0b4e-1a4013f30e38@kernelconcepts.de>
Date:   Fri, 4 Jun 2021 15:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <22081c83-0f7f-cef2-6075-79346abf6e9e@kernelconcepts.de>
Content-Type: multipart/mixed;
 boundary="------------B5F7EC760F5E26BE690EA8C8"
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is a multi-part message in MIME format.
--------------B5F7EC760F5E26BE690EA8C8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

Am 10.05.21 um 13:13 schrieb Florian Boor:
> Am 07.05.21 um 07:47 schrieb Tony Lindgren:
>> Hmm OK, sounds like the voltages might be wrong.
> 
> sounds like my guess wasn't that wrong.

I did some more research and for me it more and more looks like we are missing
the voltage transitions on frequency change completely.

I added some debug output in omap_vp_forceupdate_scale() and
omap_vc_bypass_scale() and enabled debug output that shows the CPU clock
requency changes. Patch and log are attached.

The interesting stuff starts in line 123 where the first frequency change happens.

Maybe I'm missing something and looking in the wrong place, but if voltage
really never gets adapted on some devices then in the best case the device only
wastes power...

I wonder if this affects all OMAP4460 or the Variscite one only.

Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49(0) 271-338857-15
and the reality of tomorrow.		Fax: +49(0) 271-338857-29
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

kernel concepts GmbH
Hauptstraße 16
57074 Siegen
Deutschland
Geschäftsführer: Ole Reinhardt
HR Siegen, HR B 9613

--------------B5F7EC760F5E26BE690EA8C8
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Debug-Add-instrumentation-for-OMAP4-voltage-changes.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-Debug-Add-instrumentation-for-OMAP4-voltage-changes.pat";
 filename*1="ch"

=46rom 978e096731fb720e7d059bdcfba70352dbeb6100 Mon Sep 17 00:00:00 2001
From: Florian Boor <florian@kernelconcepts.de>
Date: Fri, 4 Jun 2021 14:34:55 +0200
Subject: [PATCH] Debug: Add instrumentation for OMAP4 voltage changes

---
 arch/arm/mach-omap2/vc.c | 5 +++++
 arch/arm/mach-omap2/vp.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/mach-omap2/vc.c b/arch/arm/mach-omap2/vc.c
index 86f1ac4c2412..f4a73e467c15 100644
--- a/arch/arm/mach-omap2/vc.c
+++ b/arch/arm/mach-omap2/vc.c
@@ -200,6 +200,8 @@ int omap_vc_bypass_scale(struct voltagedomain *voltdm=
,
 	u8 target_vsel, current_vsel;
 	int ret;
=20
+	pr_warn("%s: Scaling vdd_%s to %ul\n", __func__, voltdm->name, target_v=
olt);
+
 	ret =3D omap_vc_pre_scale(voltdm, target_volt, &target_vsel, &current_v=
sel);
 	if (ret)
 		return ret;
@@ -236,6 +238,9 @@ int omap_vc_bypass_scale(struct voltagedomain *voltdm=
,
 	}
=20
 	omap_vc_post_scale(voltdm, target_volt, target_vsel, current_vsel);
+
+	pr_warn("%s: Success scaling vdd_%s to %ul\n", __func__, voltdm->name, =
target_volt);
+
 	return 0;
 }
=20
diff --git a/arch/arm/mach-omap2/vp.c b/arch/arm/mach-omap2/vp.c
index a709655b978c..399b1b751173 100644
--- a/arch/arm/mach-omap2/vp.c
+++ b/arch/arm/mach-omap2/vp.c
@@ -126,6 +126,10 @@ int omap_vp_forceupdate_scale(struct voltagedomain *=
voltdm,
 	u8 target_vsel, current_vsel;
 	int ret, timeout =3D 0;
=20
+	pr_warn("%s: vdd_%s Scaling to %ul \n",
+			__func__, voltdm->name, target_volt);
+
+
 	ret =3D omap_vc_pre_scale(voltdm, target_volt, &target_vsel, &current_v=
sel);
 	if (ret)
 		return ret;
@@ -184,6 +188,9 @@ int omap_vp_forceupdate_scale(struct voltagedomain *v=
oltdm,
 	/* Clear force bit */
 	voltdm->write(vpconfig, vp->vpconfig);
=20
+	pr_warn("%s: vdd_%s Success scaling to %ul \n",
+			__func__, voltdm->name, target_volt);
+
 	return 0;
 }
=20
--=20
2.25.1


--------------B5F7EC760F5E26BE690EA8C8
Content-Type: text/plain; charset=UTF-8;
 name="log-cpufreq-debug-1.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="log-cpufreq-debug-1.txt"

WyAgICAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwClsgICAg
MC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS4xMy4wLXJjMS0wMDAwMS1nY2UxZTc0YTUzODU2
LWRpcnR5IChmdWNoc0Bjb3JleSkgKGFybS1wb2t5LWxpbnV4LWdudWVhYmktZ2NjIChHQ0Mp
IDguMy4wCiwgR05VIGxkIChHTlUgQmludXRpbHMpIDIuMzIuMC4yMDE5MDIwNCkgIzQzIFNN
UCBGcmkgSnVuIDQgMTQ6MjI6MTIgQ0VTVCAyMDIxClsgICAgMC4wMDAwMDBdIENQVTogQVJN
djcgUHJvY2Vzc29yIFs0MTJmYzA5YV0gcmV2aXNpb24gMTAgKEFSTXY3KSwgY3I9MTBjNTM4
N2QKWyAgICAwLjAwMDAwMF0gQ1BVOiBQSVBUIC8gVklQVCBub25hbGlhc2luZyBkYXRhIGNh
Y2hlLCBWSVBUIGFsaWFzaW5nIGluc3RydWN0aW9uIGNhY2hlClsgICAgMC4wMDAwMDBdIE9G
OiBmZHQ6IE1hY2hpbmUgbW9kZWw6IFZhcmlzY2l0ZSBWQVItRFZLLU9NNDQKWyAgICAwLjAw
MDAwMF0gTWVtb3J5IHBvbGljeTogRGF0YSBjYWNoZSB3cml0ZWFsbG9jClsgICAgMC4wMDAw
MDBdIGNtYTogUmVzZXJ2ZWQgMTYgTWlCIGF0IDB4YmYwMDAwMDAKWyAgICAwLjAwMDAwMF0g
T01BUDQ6IE1hcCAweGFmZTAwMDAwIHRvIChwdHJ2YWwpIGZvciBkcmFtIGJhcnJpZXIKWyAg
ICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAgMC4wMDAwMDBdICAgTm9ybWFsICAgW21l
bSAweDAwMDAwMDAwODAwMDAwMDAtMHgwMDAwMDAwMGFmZGZmZmZmXQpbICAgIDAuMDAwMDAw
XSAgIEhpZ2hNZW0gIFttZW0gMHgwMDAwMDAwMGFmZTAwMDAwLTB4MDAwMDAwMDBiZmZmZmZm
Zl0KWyAgICAwLjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUKWyAg
ICAwLjAwMDAwMF0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzClsgICAgMC4wMDAwMDBdICAg
bm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDgwMDAwMDAwLTB4MDAwMDAwMDBhZmRmZmZmZl0K
WyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYjAwMDAwMDAtMHgw
MDAwMDAwMGJmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBb
bWVtIDB4MDAwMDAwMDA4MDAwMDAwMC0weDAwMDAwMDAwYmZmZmZmZmZdClsgICAgMC4wMDAw
MDBdIE9NQVA0NDYwIEVTMS4xClsgICAgMC4wMDAwMDBdIHBlcmNwdTogRW1iZWRkZWQgMjAg
cGFnZXMvY3B1IHM0OTk5NiByODE5MiBkMjM3MzIgdTgxOTIwClsgICAgMC4wMDAwMDBdIEJ1
aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGluZyBvbi4gIFRvdGFsIHBhZ2VzOiAy
NTk5MDgKWyAgICAwLjAwMDAwMF0gS2VybmVsIGNvbW1hbmQgbGluZTogcm9vdHdhaXQgcm9v
dD0vZGV2L21tY2JsazBwMyBtZW09MUdAMHg4MDAwMDAwMCBydyBjb25zb2xlPXR0eU8yLDEx
NTIwMG44IGZiY29uPW1hcDoKMCB2dC5nbG9iYWxfY3Vyc29yX2RlZmF1bHQ9MCBzcGxhc2gg
cGx5bW91dGguaWdub3JlLXNlcmlhbC1jb25zb2xlcyBjb25zb2xlYmxhbms9MCBvbWFwZmIu
dnJhbT0wOjRNIGZiY29uPXJvdGF0ZTozIGxvZ2wKZXZlbD03ClsgICAgMC4wMDAwMDBdIERl
bnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDcsIDUyNDI4
OCBieXRlcywgbGluZWFyKQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxl
IGVudHJpZXM6IDY1NTM2IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzLCBsaW5lYXIpClsgICAg
MC4wMDAwMDBdIG1lbSBhdXRvLWluaXQ6IHN0YWNrOm9mZiwgaGVhcCBhbGxvYzpvZmYsIGhl
YXAgZnJlZTpvZmYKWyAgICAwLjAwMDAwMF0gTWVtb3J5OiAxMDA1MDQwSy8xMDQ2NTI4SyBh
dmFpbGFibGUgKDkyMTZLIGtlcm5lbCBjb2RlLCAxMDE4SyByd2RhdGEsIDIyNDRLIHJvZGF0
YSwgMTAyNEsgaW5pdCwgMjQ0SyBic3MKLCAyNTEwNEsgcmVzZXJ2ZWQsIDE2Mzg0SyBjbWEt
cmVzZXJ2ZWQsIDI0NTc2MEsgaGlnaG1lbSkKWyAgICAwLjAwMDAwMF0gdHJhY2UgZXZlbnQg
c3RyaW5nIHZlcmlmaWVyIGRpc2FibGVkClsgICAgMC4wMDAwMDBdIHJjdTogSGllcmFyY2hp
Y2FsIFJDVSBpbXBsZW1lbnRhdGlvbi4KWyAgICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIGV2
ZW50IHRyYWNpbmcgaXMgZW5hYmxlZC4KWyAgICAwLjAwMDAwMF0gcmN1OiBSQ1UgY2FsY3Vs
YXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxheSBpcyAxMCBqaWZmaWVz
LgpbICAgIDAuMDAwMDAwXSBOUl9JUlFTOiAxNiwgbnJfaXJxczogMTYsIHByZWFsbG9jYXRl
ZCBpcnFzOiAxNgpbICAgIDAuMDAwMDAwXSBMMkM6IHBsYXRmb3JtIG1vZGlmaWVzIGF1eCBj
b250cm9sIHJlZ2lzdGVyOiAweDBlMDcwMDAwIC0+IDB4M2U0NzAwMDAKWyAgICAwLjAwMDAw
MF0gTDJDOiBEVC9wbGF0Zm9ybSBtb2RpZmllcyBhdXggY29udHJvbCByZWdpc3RlcjogMHgw
ZTA3MDAwMCAtPiAweDNlNDcwMDAwClsgICAgMC4wMDAwMDBdIEwyQy0zMTAgZW5hYmxpbmcg
ZWFybHkgQlJFU1AgZm9yIENvcnRleC1BOQpbICAgIDAuMDAwMDAwXSBPTUFQIEwyQzMxMDog
Uk9NIGRvZXMgbm90IHN1cHBvcnQgcG93ZXIgY29udHJvbCBzZXR0aW5nClsgICAgMC4wMDAw
MDBdIEwyQy0zMTAgZHluYW1pYyBjbG9jayBnYXRpbmcgZGlzYWJsZWQsIHN0YW5kYnkgbW9k
ZSBkaXNhYmxlZApbICAgIDAuMDAwMDAwXSBMMkMtMzEwIGNhY2hlIGNvbnRyb2xsZXIgZW5h
YmxlZCwgMTYgd2F5cywgMTAyNCBrQgpbICAgIDAuMDAwMDAwXSBMMkMtMzEwOiBDQUNIRV9J
RCAweDQxMDAwMGM3LCBBVVhfQ1RSTCAweDRlNDcwMDAwClsgICAgMC4wMDAwMDBdIHJhbmRv
bTogZ2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBzdGFydF9rZXJuZWwrMHgzNDQvMHg1
OGMgd2l0aCBjcm5nX2luaXQ9MApbICAgIDAuMDAwMDAwXSBPTUFQIGNsb2Nrc291cmNlOiAz
MmtfY291bnRlciBhdCAzMjc2OCBIegpbICAgIDAuMDAwMDAwXSBjbG9ja3NvdXJjZTogMzJr
X2NvdW50ZXI6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4
X2lkbGVfbnM6IDU4MzI3MDM5OTg2NDE5IG5zClsgICAgMC4wMDAwMDBdIHNjaGVkX2Nsb2Nr
OiAzMiBiaXRzIGF0IDMya0h6LCByZXNvbHV0aW9uIDMwNTE3bnMsIHdyYXBzIGV2ZXJ5IDY1
NTM1OTk5OTg0NzQxbnMKWyAgICAwLjAwMTE5MF0gVEkgZ3B0aW1lciBjbG9ja2V2ZW50OiBh
bHdheXMtb24gMzI3NjggSHogYXQgL29jcC9pbnRlcmNvbm5lY3RANGEzMDAwMDAvc2VnbWVu
dEAxMDAwMC90YXJnZXQtbW9kdWxlQDgwMDAKWyAgICAwLjAwNDU0N10gQ29uc29sZTogY29s
b3VyIGR1bW15IGRldmljZSA4MHgzMApbICAgIDAuMDA0NTc3XSBXQVJOSU5HOiBZb3VyICdj
b25zb2xlPXR0eU8yJyBoYXMgYmVlbiByZXBsYWNlZCBieSAndHR5UzInClsgICAgMC4wMDQ1
NzddIFRoaXMgZW5zdXJlcyB0aGF0IHlvdSBzdGlsbCBzZWUga2VybmVsIG1lc3NhZ2VzLiBQ
bGVhc2UKWyAgICAwLjAwNDYwOF0gdXBkYXRlIHlvdXIga2VybmVsIGNvbW1hbmRsaW5lLgpb
ICAgIDAuMDA0NjM4XSBDYWxpYnJhdGluZyBkZWxheSBsb29wLi4uIDEzOTcuNTUgQm9nb01J
UFMgKGxwaj02OTg3Nzc2KQpbICAgIDAuMDg5ODc0XSBwaWRfbWF4OiBkZWZhdWx0OiAzMjc2
OCBtaW5pbXVtOiAzMDEKWyAgICAwLjA5MDA1N10gTFNNOiBTZWN1cml0eSBGcmFtZXdvcmsg
aW5pdGlhbGl6aW5nClsgICAgMC4wOTAxNDhdIE1vdW50LWNhY2hlIGhhc2ggdGFibGUgZW50
cmllczogMjA0OCAob3JkZXI6IDEsIDgxOTIgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA5MDE3
OV0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDIwNDggKG9yZGVyOiAx
LCA4MTkyIGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wOTEwNjRdIENQVTogVGVzdGluZyB3cml0
ZSBidWZmZXIgY29oZXJlbmN5OiBvawpbICAgIDAuMDkxMTI1XSBDUFUwOiBTcGVjdHJlIHYy
OiB1c2luZyBCUElBTEwgd29ya2Fyb3VuZApbICAgIDAuMDkxMzM5XSBDUFUwOiB0aHJlYWQg
LTEsIGNwdSAwLCBzb2NrZXQgMCwgbXBpZHIgODAwMDAwMDAKWyAgICAwLjA5MTk0OV0gU2V0
dGluZyB1cCBzdGF0aWMgaWRlbnRpdHkgbWFwIGZvciAweDgwMTAwMDAwIC0gMHg4MDEwMDA3
OApbICAgIDAuMDkyMTMyXSByY3U6IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9u
LgpbICAgIDAuMDkyNjIwXSBzbXA6IEJyaW5naW5nIHVwIHNlY29uZGFyeSBDUFVzIC4uLgpb
ICAgIDAuMTc5ODQwXSBDUFUxOiB0aHJlYWQgLTEsIGNwdSAxLCBzb2NrZXQgMCwgbXBpZHIg
ODAwMDAwMDEKWyAgICAwLjE3OTg3MF0gQ1BVMTogU3BlY3RyZSB2MjogdXNpbmcgQlBJQUxM
IHdvcmthcm91bmQKWyAgICAwLjE4MDA1M10gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgMiBD
UFVzClsgICAgMC4xODAwNTNdIFNNUDogVG90YWwgb2YgMiBwcm9jZXNzb3JzIGFjdGl2YXRl
ZCAoMjc5NS4xMSBCb2dvTUlQUykuClsgICAgMC4xODAwODRdIENQVTogQWxsIENQVShzKSBz
dGFydGVkIGluIFNWQyBtb2RlLgpbICAgIDAuMTgwNjAzXSBkZXZ0bXBmczogaW5pdGlhbGl6
ZWQKWyAgICAwLjE5NzYzMV0gVkZQIHN1cHBvcnQgdjAuMzogaW1wbGVtZW50b3IgNDEgYXJj
aGl0ZWN0dXJlIDMgcGFydCAzMCB2YXJpYW50IDkgcmV2IDQKWyAgICAwLjE5Nzg3NV0gY2xv
Y2tzb3VyY2U6IGppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZm
ZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTEyNjA0NDYyNzUwMDAwIG5zClsgICAgMC4xOTc5MDZd
IGZ1dGV4IGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRlcjogMywgMzI3NjggYnl0ZXMs
IGxpbmVhcikKWyAgICAwLjE5OTM3MV0gcGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5j
dHJsIHN1YnN5c3RlbQpbICAgIDAuMjAwNTYxXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wg
ZmFtaWx5IDE2ClsgICAgMC4yMDM0MzBdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9v
bCBmb3IgYXRvbWljIGNvaGVyZW50IGFsbG9jYXRpb25zClsgICAgMC4yMDQwNDBdIGF1ZGl0
OiBpbml0aWFsaXppbmcgbmV0bGluayBzdWJzeXMgKGRpc2FibGVkKQpbICAgIDAuMjA0MjIz
XSBhdWRpdDogdHlwZT0yMDAwIGF1ZGl0KDAuMjAwOjEpOiBzdGF0ZT1pbml0aWFsaXplZCBh
dWRpdF9lbmFibGVkPTAgcmVzPTEKWyAgICAwLjIwNDc3Ml0gdGhlcm1hbF9zeXM6IFJlZ2lz
dGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnZmFpcl9zaGFyZScKWyAgICAwLjIwNDgwM10gdGhl
cm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93aXNlJwpbICAg
IDAuMjA0ODAzXSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICd1
c2VyX3NwYWNlJwpbICAgIDAuMjA1NDc0XSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5vciBtZW51
ClsgICAgMC4yMzAxOTRdIE5vIEFUQUdzPwpbICAgIDAuMjMwMzE2XSBody1icmVha3BvaW50
OiBmb3VuZCA1ICgrMSByZXNlcnZlZCkgYnJlYWtwb2ludCBhbmQgMSB3YXRjaHBvaW50IHJl
Z2lzdGVycy4KWyAgICAwLjIzMDMxNl0gaHctYnJlYWtwb2ludDogbWF4aW11bSB3YXRjaHBv
aW50IHNpemUgaXMgNCBieXRlcy4KWyAgICAwLjI0MDM1Nl0gS3Byb2JlcyBnbG9iYWxseSBv
cHRpbWl6ZWQKWyAgICAwLjI0NTg0OV0gaW9tbXU6IERlZmF1bHQgZG9tYWluIHR5cGU6IFRy
YW5zbGF0ZWQgClsgICAgMC4yNDY5MTddIHZnYWFyYjogbG9hZGVkClsgICAgMC4yNDczMTRd
IFNDU0kgc3Vic3lzdGVtIGluaXRpYWxpemVkClsgICAgMC4yNDc4MDJdIHBwc19jb3JlOiBM
aW51eFBQUyBBUEkgdmVyLiAxIHJlZ2lzdGVyZWQKWyAgICAwLjI0NzgwMl0gcHBzX2NvcmU6
IFNvZnR3YXJlIHZlci4gNS4zLjYgLSBDb3B5cmlnaHQgMjAwNS0yMDA3IFJvZG9sZm8gR2lv
bWV0dGkgPGdpb21ldHRpQGxpbnV4Lml0PgpbICAgIDAuMjQ3ODMzXSBQVFAgY2xvY2sgc3Vw
cG9ydCByZWdpc3RlcmVkClsgICAgMC4yNDkwMjNdIGNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0
byBjbG9ja3NvdXJjZSAzMmtfY291bnRlcgpbICAgIDAuMjgxOTUxXSBWRlM6IERpc2sgcXVv
dGFzIGRxdW90XzYuNi4wClsgICAgMC4yODIwNzNdIFZGUzogRHF1b3QtY2FjaGUgaGFzaCB0
YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlciAwLCA0MDk2IGJ5dGVzKQpbICAgIDAuMjkxMjU5
XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDIKWyAgICAwLjI5MTQ3M10gSVAg
aWRlbnRzIGhhc2ggdGFibGUgZW50cmllczogMTYzODQgKG9yZGVyOiA1LCAxMzEwNzIgYnl0
ZXMsIGxpbmVhcikKWyAgICAwLjI5Mjk5OV0gdGNwX2xpc3Rlbl9wb3J0YWRkcl9oYXNoIGhh
c2ggdGFibGUgZW50cmllczogNTEyIChvcmRlcjogMCwgNjE0NCBieXRlcywgbGluZWFyKQpb
ICAgIDAuMjkzMDI5XSBUQ1AgZXN0YWJsaXNoZWQgaGFzaCB0YWJsZSBlbnRyaWVzOiA4MTky
IChvcmRlcjogMywgMzI3NjggYnl0ZXMsIGxpbmVhcikKWyAgICAwLjI5MzE1MV0gVENQIGJp
bmQgaGFzaCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjogNCwgNjU1MzYgYnl0ZXMsIGxp
bmVhcikKWyAgICAwLjI5MzI3M10gVENQOiBIYXNoIHRhYmxlcyBjb25maWd1cmVkIChlc3Rh
Ymxpc2hlZCA4MTkyIGJpbmQgODE5MikKWyAgICAwLjI5MzM5NV0gVURQIGhhc2ggdGFibGUg
ZW50cmllczogNTEyIChvcmRlcjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjI5
MzQ4N10gVURQLUxpdGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyOiAyLCAxNjM4
NCBieXRlcywgbGluZWFyKQpbICAgIDAuMjkzNzAxXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9j
b2wgZmFtaWx5IDEKWyAgICAwLjI5NDQ5NF0gUlBDOiBSZWdpc3RlcmVkIG5hbWVkIFVOSVgg
c29ja2V0IHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMC4yOTQ1MjVdIFJQQzogUmVnaXN0ZXJl
ZCB1ZHAgdHJhbnNwb3J0IG1vZHVsZS4KWyAgICAwLjI5NDUyNV0gUlBDOiBSZWdpc3RlcmVk
IHRjcCB0cmFuc3BvcnQgbW9kdWxlLgpbICAgIDAuMjk0NTU1XSBSUEM6IFJlZ2lzdGVyZWQg
dGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNwb3J0IG1vZHVsZS4KWyAgICAwLjI5NDU1
NV0gUENJOiBDTFMgMCBieXRlcywgZGVmYXVsdCA2NApbICAgIDAuMjk2MDUxXSBJbml0aWFs
aXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMC4yOTYzMjVdIHdvcmtpbmdzZXQ6
IHRpbWVzdGFtcF9iaXRzPTE0IG1heF9vcmRlcj0xOCBidWNrZXRfb3JkZXI9NApbICAgIDEu
MDM4NDgyXSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9yZXNvbHZlciBrZXkgdHlwZQpbICAg
IDEuMDM4NTEzXSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMS4wMzg1
NDNdIEtleSB0eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkClsgICAgMS4wMzg1NzRdIGpmZnMy
OiB2ZXJzaW9uIDIuMi4gKE5BTkQpIChTVU1NQVJZKSAg77+9wqkgMjAwMS0yMDA2IFJlZCBI
YXQsIEluYy4KWyAgICAxLjAzODg3OV0gS2V5IHR5cGUgYXN5bW1ldHJpYyByZWdpc3RlcmVk
ClsgICAgMS4wMzg5MDldIEFzeW1tZXRyaWMga2V5IHBhcnNlciAneDUwOScgcmVnaXN0ZXJl
ZApbICAgIDEuMDM4OTcwXSBib3VuY2U6IHBvb2wgc2l6ZTogNjQgcGFnZXMKWyAgICAxLjAz
OTE1NF0gaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQKWyAgICAxLjAzOTE1
NF0gaW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQKWyAgICAxLjA0MzQyNl0gU2VyaWFs
OiA4MjUwLzE2NTUwIGRyaXZlciwgNiBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApbICAg
IDEuMDU0MjkwXSBicmQ6IG1vZHVsZSBsb2FkZWQKWyAgICAxLjA2MjEwM10gbG9vcDogbW9k
dWxlIGxvYWRlZApbICAgIDEuMDYyODk2XSBtdGRvb3BzOiBtdGQgZGV2aWNlIChtdGRkZXY9
bmFtZS9udW1iZXIpIG11c3QgYmUgc3VwcGxpZWQKWyAgICAxLjA2NDE0N10gbGlicGh5OiBG
aXhlZCBNRElPIEJ1czogcHJvYmVkClsgICAgMS4wNjUyMTZdIGkyYyAvZGV2IGVudHJpZXMg
ZHJpdmVyClsgICAgMS4wNjYwNDBdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1
ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAxLjA2NjQzNl0gY3B1ZnJlcTog
bm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpb
ICAgIDEuMDY2NDY3XSBjcHVmcmVxOiBjcHVmcmVxX29ubGluZTogQ1BVMDogUnVubmluZyBh
dCB1bmxpc3RlZCBpbml0aWFsIGZyZXF1ZW5jeTogNjk5OTc3IEtIeiwgY2hhbmdpbmcgdG86
IDcwMDAwMCBLSHoKWyAgICAxLjA2NzAxNl0gc2RoY2k6IFNlY3VyZSBEaWdpdGFsIEhvc3Qg
Q29udHJvbGxlciBJbnRlcmZhY2UgZHJpdmVyClsgICAgMS4wNjcwNDddIHNkaGNpOiBDb3B5
cmlnaHQoYykgUGllcnJlIE9zc21hbgpbICAgIDEuMDY3MjYwXSBzZGhjaS1wbHRmbTogU0RI
Q0kgcGxhdGZvcm0gYW5kIE9GIGRyaXZlciBoZWxwZXIKWyAgICAxLjA2NzQ3NF0gY3B1ZnJl
cTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtI
egpbICAgIDEuMDY3NTA0XSBsZWR0cmlnLWNwdTogcmVnaXN0ZXJlZCB0byBpbmRpY2F0ZSBh
Y3Rpdml0eSBvbiBDUFVzClsgICAgMS4wNjc2ODddIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAx
IG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAxLjA2Nzk5M10g
SW5pdGlhbGl6aW5nIFhGUk0gbmV0bGluayBzb2NrZXQKWyAgICAxLjA2ODE0NV0gTkVUOiBS
ZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxMApbICAgIDEuMDY4OTM5XSBTZWdtZW50IFJv
dXRpbmcgd2l0aCBJUHY2ClsgICAgMS4wNjkwNjFdIHNpdDogSVB2NiwgSVB2NCBhbmQgTVBM
UyBvdmVyIElQdjQgdHVubmVsaW5nIGRyaXZlcgpbICAgIDEuMDY5NTQ5XSBORVQ6IFJlZ2lz
dGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE3ClsgICAgMS4wNjk1ODBdIE5FVDogUmVnaXN0ZXJl
ZCBwcm90b2NvbCBmYW1pbHkgMTUKWyAgICAxLjA2OTY0MV0gS2V5IHR5cGUgZG5zX3Jlc29s
dmVyIHJlZ2lzdGVyZWQKWyAgICAxLjA2OTg1NF0gVGh1bWJFRSBDUFUgZXh0ZW5zaW9uIHN1
cHBvcnRlZC4KWyAgICAxLjA2OTg1NF0gUmVnaXN0ZXJpbmcgU1dQL1NXUEIgZW11bGF0aW9u
IGhhbmRsZXIKWyAgICAxLjA2OTg4NV0gU21hcnRSZWZsZXggQ2xhc3MzIGluaXRpYWxpemVk
ClsgICAgMS4wNzAyODFdIExvYWRpbmcgY29tcGlsZWQtaW4gWC41MDkgY2VydGlmaWNhdGVz
ClsgICAgMS4wOTM4MTFdIE9NQVAgR1BJTyBoYXJkd2FyZSB2ZXJzaW9uIDAuMQpbICAgIDEu
MDk3NjU2XSBwaW5jdHJsLXNpbmdsZSA0YTMxZTA0MC5waW5tdXg6IDI4IHBpbnMsIHNpemUg
NTYKWyAgICAxLjExNjY5OV0gb21hcC1kbWEtZW5naW5lIDRhMDU2MDAwLmRtYS1jb250cm9s
bGVyOiBPTUFQIERNQSBlbmdpbmUgZHJpdmVyIChMaW5rZWRMaXN0MS8yLzMgc3VwcG9ydGVk
KQpbICAgIDEuMTIyMTAwXSBvbWFwLWlvbW11IDRhMDY2MDAwLm1tdTogNGEwNjYwMDAubW11
IHJlZ2lzdGVyZWQKWyAgICAxLjEzMjExMF0gcGluY3RybC1zaW5nbGUgNGExMDAwNDAucGlu
bXV4OiAyMDMgcGlucywgc2l6ZSA0MDYKWyAgICAxLjEzODU4MF0gNDgwMjAwMDAuc2VyaWFs
OiB0dHlTMiBhdCBNTUlPIDB4NDgwMjAwMDAgKGlycSA9IDExMCwgYmFzZV9iYXVkID0gMzAw
MDAwMCkgaXMgYSA4MjUwClsgICAgMS45OTc2ODBdIHByaW50azogY29uc29sZSBbdHR5UzJd
IGVuYWJsZWQKWyAgICAyLjAxNTQ3Ml0gb21hcF9pMmMgNDgwNjAwMDAuaTJjOiBidXMgMiBy
ZXYwLjExIGF0IDQwMCBrSHoKWyAgICAyLjAyMjc5Nl0gNDgwNmEwMDAuc2VyaWFsOiB0dHlT
MCBhdCBNTUlPIDB4NDgwNmEwMDAgKGlycSA9IDEyMSwgYmFzZV9iYXVkID0gMzAwMDAwMCkg
aXMgYSA4MjUwClsgICAgMi4wMzM1NjldIDQ4MDZjMDAwLnNlcmlhbDogdHR5UzEgYXQgTU1J
TyAweDQ4MDZjMDAwIChpcnEgPSAxMjIsIGJhc2VfYmF1ZCA9IDMwMDAwMDApIGlzIGEgODI1
MApbICAgIDIuMDQ2MDgxXSBTa2lwcGluZyB0d2wgaW50ZXJuYWwgY2xvY2sgaW5pdCBhbmQg
dXNpbmcgYm9vdGxvYWRlciB2YWx1ZSAodW5rbm93biBvc2MgcmF0ZSkKWyAgICAyLjA3OTA0
MF0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
MzUwMDAwIGtIegpbICAgIDIuMDg2NTQ3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBm
cmVxdWVuY3kgdHJhbnNpdGlvbiB0byAzNTAwMDAga0h6ClsgICAgMi4wOTQyMzhdIHR3bCAw
LTAwNDg6IFBJSCAoaXJxIDEyNCkgbmVzdGVkIElSUXMKWyAgICAyLjA5OTI0M10gY3B1ZnJl
cTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtI
egpbICAgIDIuMTA2NTY3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kg
dHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMi4xMTkxNDBdIFZVU0lNOiBCcmluZ2lu
ZyAxODAwMDAwdVYgaW50byAzMDAwMDAwLTMwMDAwMDB1VgpbICAgIDIuMTI0ODc3XSBjcHVm
cmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAg
a0h6ClsgICAgMi4xMzE5MjddIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5j
eSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAyLjE0Nzc5Nl0gb21hcF9pMmMgNDgw
NzAwMDAuaTJjOiBidXMgMCByZXYwLjExIGF0IDQwMCBrSHoKWyAgICAyLjE2MDY0NF0ga3M4
ODUxIHNwaTAuMDogc3VwcGx5IHZkZC1pbyBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3Vs
YXRvcgpbICAgIDIuMTY3NjAyXSBrczg4NTEgc3BpMC4wOiBzdXBwbHkgdmRkIG5vdCBmb3Vu
ZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yClsgICAgMi4xNzQyMjRdIGtzODg1MSBzcGkwLjA6
IG1lc3NhZ2UgZW5hYmxlIGlzIDAKWyAgICAyLjE3OTY4N10gbGlicGh5OiBrczg4NTFfZXRo
X21paTogcHJvYmVkClsgICAgMi4xODY1ODRdIGtzODg1MSBzcGkwLjAgZXRoMDogcmV2aXNp
b24gMSwgTUFDIDVlOjIyOmVkOjRjOjk3OjVkLCBJUlEgMTM3LCBubyBFRVBST00KWyAgICAy
LjIwOTA3NV0gdGktc3lzYyA0ODBiMjAwMC50YXJnZXQtbW9kdWxlOiBPQ1Agc29mdHJlc2V0
IHRpbWVkIG91dApbICAgIDIuMjI1NDYzXSB0aS1zeXNjIDQ4MGIyMDAwLnRhcmdldC1tb2R1
bGU6IE9DUCBzb2Z0cmVzZXQgdGltZWQgb3V0ClsgICAgMi4yMzY5NjhdIG9tYXBfZ3BpbyA0
ODA1OTAwMC5ncGlvOiBDb3VsZCBub3Qgc2V0IGxpbmUgMTQgZGVib3VuY2UgdG8gMjAwMDAw
IG1pY3Jvc2Vjb25kcyAoLTIyKQpbICAgIDIuMjQ1ODQ5XSBvbWFwX2hzbW1jIDQ4MGQ1MDAw
Lm1tYzogR290IENEIEdQSU8KWyAgICAyLjI1MTQ2NF0gb21hcF9pMmMgNDgzNTAwMDAuaTJj
OiBidXMgMyByZXYwLjExIGF0IDQwMCBrSHoKWyAgICAyLjI2MjQ4MV0gY3B1ZnJlcTogbm90
aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAg
IDIuMjY5NzE0XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNp
dGlvbiB0byA3MDAwMDAga0h6ClsgICAgMi4yODY3NDNdIGNwdWZyZXE6IG5vdGlmaWNhdGlv
biAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAyLjI5Mzgy
M10gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
OTIwMDAwIGtIegpbICAgIDIuMzAxNjY2XSBhcm12Ny1wbXUgb2NwOnRhcmdldC1tb2R1bGVA
NTQwMDAwMDA6cG11OiBodyBwZXJmZXZlbnRzOiBubyBpbnRlcnJ1cHQtYWZmaW5pdHkgcHJv
cGVydHksIGd1ZXNzaW5nLgpbICAgIDIuMzEyMTAzXSBodyBwZXJmZXZlbnRzOiBlbmFibGVk
IHdpdGggYXJtdjdfY29ydGV4X2E5IFBNVSBkcml2ZXIsIDcgY291bnRlcnMgYXZhaWxhYmxl
ClsgICAgMi4zMjEyNThdIG9tYXAtaW9tbXUgNTUwODIwMDAubW11OiA1NTA4MjAwMC5tbXUg
cmVnaXN0ZXJlZApbICAgIDIuMzM1OTM3XSBwbGF0Zm9ybSA1ODAwMDAwMC5kc3M6IEZpeGlu
ZyB1cCBjeWNsaWMgZGVwZW5kZW5jeSB3aXRoIGRpc3BsYXkKWyAgICAyLjM0ODMyN10gbW1j
MDogaG9zdCBkb2VzIG5vdCBzdXBwb3J0IHJlYWRpbmcgcmVhZC1vbmx5IHN3aXRjaCwgYXNz
dW1pbmcgd3JpdGUtZW5hYmxlClsgICAgMi4zNTY5NjRdIGNwdWZyZXE6IG5vdGlmaWNhdGlv
biAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAyLjM2NDE5
Nl0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
NzAwMDAwIGtIegpbICAgIDIuMzcxNDkwXSBtbWMwOiBuZXcgaGlnaCBzcGVlZCBTREhDIGNh
cmQgYXQgYWRkcmVzcyBhYWFhClsgICAgMi4zNzE3NjVdIFBvd2VyIE1hbmFnZW1lbnQgZm9y
IFRJIE9NQVA0KyBkZXZpY2VzLgpbICAgIDIuMzc3MzE5XSBjcHVmcmVxOiBub3RpZmljYXRp
b24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMi4zODE5
NThdIE9NQVA0IFBNOiB1LWJvb3QgPj0gdjIwMTIuMDcgaXMgcmVxdWlyZWQgZm9yIGZ1bGwg
UE0gc3VwcG9ydApbICAgIDIuMzk1NTA3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBm
cmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMi4zOTU3ODJdIG1tY2Js
azA6IG1tYzA6YWFhYSBTQzMyRyAyOS43IEdpQiAKWyAgICAyLjQwNzk4OV0gbDRfc2VjdXJl
X2NtOmNsazowMDM4OjA6IGZhaWxlZCB0byBkaXNhYmxlClsgICAgMi40MTM4NDhdIHNtYXJ0
cmVmbGV4IDRhMGQ5MDAwLnNtYXJ0cmVmbGV4OiBvbWFwX3NyX3Byb2JlOiBTbWFydFJlZmxl
eCBkcml2ZXIgaW5pdGlhbGl6ZWQKWyAgICAyLjQyMjU3Nl0gc21hcnRyZWZsZXggNGEwZGIw
MDAuc21hcnRyZWZsZXg6IG9tYXBfc3JfcHJvYmU6IFNtYXJ0UmVmbGV4IGRyaXZlciBpbml0
aWFsaXplZApbICAgIDIuNDMxMjQzXSBzbWFydHJlZmxleCA0YTBkZDAwMC5zbWFydHJlZmxl
eDogb21hcF9zcl9wcm9iZTogU21hcnRSZWZsZXggZHJpdmVyIGluaXRpYWxpemVkClsgICAg
Mi40NDEyNTNdICBtbWNibGswOiBwMSBwMiBwMyBwNApbICAgIDIuNDU5NDExXSBody1icmVh
a3BvaW50OiBGYWlsZWQgdG8gZW5hYmxlIG1vbml0b3IgbW9kZSBvbiBDUFUgMC4KWyAgICAy
LjQ2NTg4MV0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRp
b24gdG8gMzUwMDAwIGtIegpbICAgIDIuNDY4OTMzXSBFWFQ0LWZzIChtbWNibGswcDMpOiBt
b3VudGluZyBleHQzIGZpbGUgc3lzdGVtIHVzaW5nIHRoZSBleHQ0IHN1YnN5c3RlbQpbICAg
IDIuNDgwNDA3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNp
dGlvbiB0byAzNTAwMDAga0h6ClsgICAgMi40ODU4NzBdIGNwdWZyZXE6IG5vdGlmaWNhdGlv
biAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAyLjQ5NDQ3
Nl0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
OTIwMDAwIGtIegpbICAgIDIuNTA2MzE3XSBvbWFwX2hzbW1jIDQ4MGQxMDAwLm1tYzogY2Fy
ZCBjbGFpbXMgdG8gc3VwcG9ydCB2b2x0YWdlcyBiZWxvdyBkZWZpbmVkIHJhbmdlClsgICAg
Mi41MjE0NTNdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUKWyAgICAyLjUyNjYxMV0gY3B1ZnJl
cTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtI
egpbICAgIDIuNTMzNDQ3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kg
dHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMi41NDM4NTNdIG1tYzM6IG5ldyBTRElP
IGNhcmQgYXQgYWRkcmVzcyAwMDAxClsgICAgMi41NTMzMTRdIEVYVDQtZnMgKG1tY2JsazBw
Myk6IG1vdW50ZWQgZmlsZXN5c3RlbSB3aXRoIG9yZGVyZWQgZGF0YSBtb2RlLiBPcHRzOiAo
bnVsbCkuIFF1b3RhIG1vZGU6IG5vbmUuClsgICAgMi41NjMyOTNdIFZGUzogTW91bnRlZCBy
b290IChleHQzIGZpbGVzeXN0ZW0pIG9uIGRldmljZSAxNzk6My4KWyAgICAyLjU2OTA2MV0g
Y3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIw
MDAwIGtIegpbICAgIDIuNTY5NDg4XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVx
dWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMi41OTAyNDBdIGNwdWZyZXE6
IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoK
WyAgICAyLjU5MDI0MF0gZGV2dG1wZnM6IG1vdW50ZWQKWyAgICAyLjYwMDA2N10gY3B1ZnJl
cTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtI
egpbICAgIDIuNjA3MTE2XSBGcmVlaW5nIHVudXNlZCBrZXJuZWwgbWVtb3J5OiAxMDI0Swpb
ICAgIDIuNjEzMDM3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJh
bnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMi42MjAwODZdIGNwdWZyZXE6IG5vdGlmaWNh
dGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAyLjYy
NjA2OF0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzClsgICAgMi42MzE4OTZdIGNw
dWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAw
MCBrSHoKWyAgICAyLjYzODczMl0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVl
bmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAgIDIuNjQ3MzY5XSBody1icmVha3Bv
aW50OiBDUFUgMCBmYWlsZWQgdG8gZGlzYWJsZSB2ZWN0b3IgY2F0Y2gKWyAgICAyLjY3NzEy
NF0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
MzUwMDAwIGtIegpbICAgIDIuNjg0NzUzXSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBm
cmVxdWVuY3kgdHJhbnNpdGlvbiB0byAzNTAwMDAga0h6ClsgICAgMi43MDAxNjRdIGNwdWZy
ZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBr
SHoKWyAgICAyLjcwNzI3NV0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5
IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDIuNzIyMTM3XSBjcHVmcmVxOiBub3Rp
ZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAg
Mi43MjkzMzldIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0
aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAyLjg2NjgyMV0gY3B1ZnJlcTogbm90aWZpY2F0aW9u
IDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gMzUwMDAwIGtIegpbICAgIDIuODc0NDUw
XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byAz
NTAwMDAga0h6Ck1vdW50IGZhaWxlZCBmb3Igc2VsaW51eGZzIG9uIC9zeXMvZnMvc2VsaW51
eDogIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKWyAgICAyLjg4OTAzOF0gY3B1ZnJlcTog
bm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpb
ICAgIDIuODk2Njk3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJh
bnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMi45MDkwNTddIGNwdWZyZXE6IG5vdGlmaWNh
dGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAyLjkx
NTgzMl0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24g
dG8gNzAwMDAwIGtIegpbICAgIDIuOTk3OTg1XSByYW5kb206IGluaXQ6IHVuaW5pdGlhbGl6
ZWQgdXJhbmRvbSByZWFkICgxMiBieXRlcyByZWFkKQpbICAgIDMuMDUyNzM0XSBjcHVmcmVx
OiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byAzNTAwMDAga0h6
ClsgICAgMy4wNjAzNjNdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0
cmFuc2l0aW9uIHRvIDM1MDAwMCBrSHoKWyAgICAzLjA3NDUyM10gY3B1ZnJlcTogbm90aWZp
Y2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDMu
MDgxNTczXSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlv
biB0byA5MjAwMDAga0h6ClsgICAgMy4wOTQ1NDNdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAw
IG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAzLjEwMTQ3MF0g
Y3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAw
MDAwIGtIegpbICAgIDMuMTc3NTUxXSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVx
dWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMy4xODQ3MjJdIGNwdWZyZXE6
IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoK
WyAgICAzLjE5ODI0Ml0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRy
YW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAgIDMuMjA1NDc0XSBjcHVmcmVxOiBub3RpZmlj
YXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMy4y
MTgwNzhdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9u
IHRvIDkyMDAwMCBrSHoKWyAgICAzLjIyNTIxOV0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEg
b2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDMuMjUwNDg4XSBp
bml0OiBod2Nsb2NrIG1haW4gcHJvY2VzcyAoNzgpIHRlcm1pbmF0ZWQgd2l0aCBzdGF0dXMg
MQpbICAgIDMuMjU5NTIxXSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kg
dHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMy4yNjY5MzddIGNwdWZyZXE6IG5vdGlm
aWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAz
LjI3OTIwNV0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRp
b24gdG8gOTIwMDAwIGtIegpbICAgIDMuMjg2MTMyXSBjcHVmcmVxOiBub3RpZmljYXRpb24g
MSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMy4yOTQ4MzBd
IGluaXQ6IHVyZWFkYWhlYWQgbWFpbiBwcm9jZXNzICg3OSkgdGVybWluYXRlZCB3aXRoIHN0
YXR1cyA1ClsgICAgMy4zMjIwMjFdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1
ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAzLjMyOTE5M10gY3B1ZnJlcTog
bm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpb
ICAgIDMuMzc4ODE0XSByYW5kb206IG1vdW50YWxsOiB1bmluaXRpYWxpemVkIHVyYW5kb20g
cmVhZCAoMTIgYnl0ZXMgcmVhZCkKWyAgICAzLjM4NTc0Ml0gY3B1ZnJlcTogbm90aWZpY2F0
aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDMuMzky
NjY5XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0
byA5MjAwMDAga0h6ClsgICAgMy40ODg4NjFdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9m
IGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAzLjQ5NjA5M10gY3B1
ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAw
IGtIegpbICAgIDMuNTA5MTI0XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVu
Y3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAgMy41MTYxNzRdIGNwdWZyZXE6IG5v
dGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAg
ICAzLjUyOTM4OF0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5z
aXRpb24gdG8gNzAwMDAwIGtIegpbICAgIDMuNTM2NTYwXSBjcHVmcmVxOiBub3RpZmljYXRp
b24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMy41Njk4
NTRdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRv
IDM1MDAwMCBrSHoKWyAgICAzLjU3NzQyM10gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2Yg
ZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gMzUwMDAwIGtIegpbICAgIDMuNTkwMDI2XSBjcHVm
cmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAg
a0h6ClsgICAgMy41OTAyNzBdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5j
eSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICAzLjYxMDQxMl0gY3B1ZnJlcTogbm90
aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAg
IDMuNjE3NTg0XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNp
dGlvbiB0byA3MDAwMDAga0h6ClsgICAgMy42NTA5MzldIGNwdWZyZXE6IG5vdGlmaWNhdGlv
biAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDM1MDAwMCBrSHoKWyAgICAzLjY1ODUw
OF0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8g
MzUwMDAwIGtIegpbICAgIDMuNjcwOTg5XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBm
cmVxdWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgMy42NzgzMTRdIGNwdWZy
ZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcwMDAwMCBr
SHoKWyAgICAzLjg5OTA3OF0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5
IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDMuOTA2MTI3XSBjcHVmcmVxOiBub3Rp
ZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6ClsgICAg
My45Mzk0ODNdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0
aW9uIHRvIDcwMDAwMCBrSHoKWyAgICAzLjk0NjcxNl0gY3B1ZnJlcTogbm90aWZpY2F0aW9u
IDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAgIDMuOTU5MzIw
XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5
MjAwMDAga0h6ClsgICAgMy45NjYwMzNdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZy
ZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICA0LjE4NjY0NV0gY3B1ZnJl
cTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtI
egpbICAgIDQuMTkzODQ3XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kg
dHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgNC4yMDgxOTBdIGNwdWZyZXE6IG5vdGlm
aWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICA0
LjIxNTM2Ml0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRp
b24gdG8gOTIwMDAwIGtIegpbICAgIDQuMjMxMDE4XSBjcHVmcmVxOiBub3RpZmljYXRpb24g
MCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgNC4yMzgyODFd
IGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAxIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDcw
MDAwMCBrSHoKWyAgICA0LjI0OTIzN10gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJl
cXVlbmN5IHRyYW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDQuMjU2Mjg2XSBjcHVmcmVx
OiBub3RpZmljYXRpb24gMSBvZiBmcmVxdWVuY3kgdHJhbnNpdGlvbiB0byA5MjAwMDAga0h6
ClsgICAgNC4yOTE2ODddIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0
cmFuc2l0aW9uIHRvIDcwMDAwMCBrSHoKWyAgICA0LjI5ODg4OV0gY3B1ZnJlcTogbm90aWZp
Y2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAwMDAwIGtIegpbICAgIDQu
MzEyNTkxXSBjcHVmcmVxOiBub3RpZmljYXRpb24gMCBvZiBmcmVxdWVuY3kgdHJhbnNpdGlv
biB0byA5MjAwMDAga0h6ClsgICAgNC4zMTk0ODhdIGNwdWZyZXE6IG5vdGlmaWNhdGlvbiAx
IG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoKWyAgICA0LjM1MjcyMl0g
Y3B1ZnJlcTogbm90aWZpY2F0aW9uIDAgb2YgZnJlcXVlbmN5IHRyYW5zaXRpb24gdG8gNzAw
MDAwIGtIegpbICAgIDQuMzYwMDQ2XSBjcHVmcmVxOiBub3RpZmljYXRpb24gMSBvZiBmcmVx
dWVuY3kgdHJhbnNpdGlvbiB0byA3MDAwMDAga0h6ClsgICAgNC4zNzQzMjhdIGNwdWZyZXE6
IG5vdGlmaWNhdGlvbiAwIG9mIGZyZXF1ZW5jeSB0cmFuc2l0aW9uIHRvIDkyMDAwMCBrSHoK
WyAgICA0LjM4MTIyNV0gY3B1ZnJlcTogbm90aWZpY2F0aW9uIDEgb2YgZnJlcXVlbmN5IHRy
YW5zaXRpb24gdG8gOTIwMDAwIGtIegpbICAgIDQuNTM5ODU1XSA4PC0tLSBjdXQgaGVyZSAt
LS0KWyAgICA0LjU0MjkzOF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVl
c3QgYXQgdmlydHVhbCBhZGRyZXNzIDJlNzIzMDI3ClsgICAgNC41NTAyMDFdIHBnZCA9IChw
dHJ2YWwpClsgICAgNC41NTAyMDFdIFsyZTcyMzAyN10gKnBnZD0wMDAwMDAwMApbICAgIDQu
NTU2NTE4XSBJbnRlcm5hbCBlcnJvcjogT29wczogNSBbIzFdIFNNUCBBUk0KWyAgICA0LjU1
NjUxOF0gTW9kdWxlcyBsaW5rZWQgaW46ClsgICAgNC41NjQyMzldIENQVTogMCBQSUQ6IDIw
MSBDb21tOiBzaCBOb3QgdGFpbnRlZCA1LjEzLjAtcmMxLTAwMDAxLWdjZTFlNzRhNTM4NTYt
ZGlydHkgIzQzClsgICAgNC41NjQyMzldIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgT01BUDQg
KEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkKWyAgICA0LjU3ODQ5MV0gUEMgaXMgYXQgX19tb2Rf
em9uZV9wYWdlX3N0YXRlKzB4MmMvMHhjNApbICAgIDQuNTgzNDk2XSBMUiBpcyBhdCAweDJl
NzIzMDAwClsgICAgNC41ODM0OTZdIHBjIDogWzxjMDI4MTIyND5dICAgIGxyIDogWzwyZTcy
MzAwMD5dICAgIHBzcjogODAwNzAwOTMKWyAgICA0LjU4MzQ5Nl0gc3AgOiBjMjQ0NWU4YyAg
aXAgOiAwMDAwMDAyNyAgZnAgOiBlZjQ5YWU0OApbICAgIDQuNTkyOTU2XSByMTA6IDAwMDAw
MDA4ICByOSA6IDAwMDAwMDAwICByOCA6IGVmZGJiZjYwClsgICAgNC42MDI5MzVdIHI3IDog
MDAwMDAwMDEgIHI2IDogYzBlMDU2NDAgIHI1IDogZmZmZmUwMDAgIHI0IDogMDAwMDAwMjcK
WyAgICA0LjYwMzcyOV0gcjMgOiAwMDAwMDAwMCAgcjIgOiAwMDAwMDAwMSAgcjEgOiAwMDAw
MDAwMiAgcjAgOiBjMGVmZTkyNgpbICAgIDQuNjE0MjU3XSBGbGFnczogTnpjdiAgSVJRcyBv
ZmYgIEZJUXMgb24gIE1vZGUgU1ZDXzMyICBJU0EgQVJNICBTZWdtZW50IG5vbmUKWyAgICA0
LjYyMzc0OF0gQ29udHJvbDogMTBjNTM4N2QgIFRhYmxlOiA4MjQzYzA0YSAgREFDOiAwMDAw
MDA1MQpbICAgIDQuNjI4OTk3XSBSZWdpc3RlciByMCBpbmZvcm1hdGlvbjogbm9uLXNsYWIv
dm1hbGxvYyBtZW1vcnkKWyAgICA0LjYyOTYwOF0gUmVnaXN0ZXIgcjEgaW5mb3JtYXRpb246
IG5vbi1wYWdlZCBtZW1vcnkKWyAgICA0LjYzOTAwN10gUmVnaXN0ZXIgcjIgaW5mb3JtYXRp
b246IG5vbi1wYWdlZCBtZW1vcnkKWyAgICA0LjY0MDM4MF0gUmVnaXN0ZXIgcjMgaW5mb3Jt
YXRpb246IE5VTEwgcG9pbnRlcgpbICAgIDQuNjUwMTc3XSBSZWdpc3RlciByNCBpbmZvcm1h
dGlvbjogbm9uLXBhZ2VkIG1lbW9yeQpbICAgIDQuNjUwMTc3XSBSZWdpc3RlciByNSBpbmZv
cm1hdGlvbjogbm9uLXBhZ2VkIG1lbW9yeQpbICAgIDQuNjU3NjIzXSBSZWdpc3RlciByNiBp
bmZvcm1hdGlvbjogbm9uLXNsYWIvdm1hbGxvYyBtZW1vcnkKWyAgICA0LjY2MDM2OV0gUmVn
aXN0ZXIgcjcgaW5mb3JtYXRpb246IG5vbi1wYWdlZCBtZW1vcnkKWyAgICA0LjY2OTAwNl0g
UmVnaXN0ZXIgcjggaW5mb3JtYXRpb246IG5vbi1zbGFiL3ZtYWxsb2MgbWVtb3J5ClsgICAg
NC42NjkwMDZdIFJlZ2lzdGVyIHI5IGluZm9ybWF0aW9uOiBOVUxMIHBvaW50ZXIKWyAgICA0
LjY2OTAwNl0gUmVnaXN0ZXIgcjEwIGluZm9ybWF0aW9uOiBub24tcGFnZWQgbWVtb3J5Clsg
ICAgNC42NjkwMDZdIFJlZ2lzdGVyIHIxMSBpbmZvcm1hdGlvbjogbm9uLXNsYWIvdm1hbGxv
YyBtZW1vcnkKWyAgICA0LjY5MjQ3NF0gUmVnaXN0ZXIgcjEyIGluZm9ybWF0aW9uOiBub24t
cGFnZWQgbWVtb3J5ClsgICAgNC42OTI0NzRdIFByb2Nlc3Mgc2ggKHBpZDogMjAxLCBzdGFj
ayBsaW1pdCA9IDB4KHB0cnZhbCkpClsgICAgNC42OTkwMDVdIFN0YWNrOiAoMHhjMjQ0NWU4
YyB0byAweGMyNDQ2MDAwKQpbICAgIDQuNjk5MDA1XSA1ZTgwOiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlZmRiYmY1YyBjMTBhYTYwMCAwMDAwMDAwMSAwMDAwMDAwMSBjMDI2ZGY1
YwpbICAgIDQuNzE1ODUwXSA1ZWEwOiBlZmRiYmY1YyBjMGVmZTVhNiAwMDAwMDAwMiBlZjQ5
YWU0NCA2MDA3MDAxMyBjMGUwNTFjOCAwMDAwMjAxNyAwMDAwMDAwMApbICAgIDQuNzE1ODUw
XSA1ZWMwOiBjMGUwNTY0MCAwMDQ4YzY3YyAwMDQ4YzY5NCBjMjNlMTAwMCBjMjI2OGEwMCAw
MDAwMDAwYiBiZTljMWE1NCBjMDI2ZTQwNApbICAgIDQuNzI5MDAzXSA1ZWUwOiBjMjEwZjBj
MCBjMjBhMDAwMCAwMDQ4YzY3YyBjMDI2ZTRiNCBjMjEwZjBjMCBjMDJhMmMzMCAwMDAwMDAw
MCBjMjNlMTAwMApbICAgIDQuNzM5MDEzXSA1ZjAwOiAwMDAyMDAyMCAwMDAwMDAwMCAwMDAw
MDAwMSAwMDAwMDEwMCAwMDAwMDAwMSBjMGUwNTFjOCBjMjI2OGEwMCBjMjI2OGEwMApbICAg
IDQuNzM5MDEzXSA1ZjIwOiBmZmZmZTAwMCBjMDJlM2U1YyAwMDAwMDAwMCBjMDJlM2M2OCAw
MDAwMDAwMCBjMGUwNTFjOCBjMjBhMDAwMCAwMDAwMDAwMApbICAgIDQuNzQ4OTkyXSA1ZjQw
OiAwMDQ4YzY3YyBjMGUwNTFjOCBjMjNlMTAwMCBjMjBhMDAwMCAwMDAwMDAwMCBjMDEzMzk2
MCBjMjI2OGEwMCBmZmZmZmY5YwpbICAgIDQuNzY1MTM2XSA1ZjYwOiAwMDQ4YzY3YyBjMDJl
MmRjOCBmZmZmZmZmZSBjMDJlNDRjYyAwMDQ4YzY3YyAwMDQ4YzY5NCAwMDQ4YzZiYyAwMDAw
MDAwYgpbICAgIDQuNzY1MTM2XSA1ZjgwOiBjMDEwMDI4NCBjMjQ0NDAwMCAwMDAwMDAwYiBj
MDJlNTJmYyAwMDAwMDAwMCAwMDQ4YzZiYyAwMDAwMDAwYiAwMDQ4YzY3YwpbICAgIDQuNzc0
OTAyXSA1ZmEwOiAwMDQ4YzZiYyBjMDEwMDA4MCAwMDQ4YzY3YyAwMDQ4YzZiYyAwMDQ4YzZi
YyAwMDQ4YzY3YyAwMDQ4YzY5NCAwMDAwMDAwMApbICAgIDQuNzgyODY3XSA1ZmMwOiAwMDQ4
YzY3YyAwMDQ4YzZiYyAwMDQ4YzZiYyAwMDAwMDAwYiAwMDAwMDAwMiBiZTljMTgzNCAwMDQ4
YzY5NCBiZTljMWE1NApbICAgIDQuNzgyODY3XSA1ZmUwOiAwMDAwMDAwYiBiZTljMTgwYyBi
NmVhM2MxMyBiNmU0NzkyNiBhMDA3MDAzMCAwMDQ4YzZiYyAwMDAwMDAwMCAwMDAwMDAwMApb
ICAgIDQuODA2Mjc0XSBbPGMwMjgxMjI0Pl0gKF9fbW9kX3pvbmVfcGFnZV9zdGF0ZSkgZnJv
bSBbPGMwMjZkZjVjPl0gKF9fcGFnZXZlY19scnVfYWRkKzB4ZDAvMHgzYjQpClsgICAgNC44
MTE3MzddIFs8YzAyNmRmNWM+XSAoX19wYWdldmVjX2xydV9hZGQpIGZyb20gWzxjMDI2ZTQw
ND5dIChscnVfYWRkX2RyYWluX2NwdSsweDk4LzB4MTMwKQpbICAgIDQuODExNzM3XSBbPGMw
MjZlNDA0Pl0gKGxydV9hZGRfZHJhaW5fY3B1KSBmcm9tIFs8YzAyNmU0YjQ+XSAobHJ1X2Fk
ZF9kcmFpbisweDE4LzB4MWMpClsgICAgNC44MzE5MzldIFs8YzAyNmU0YjQ+XSAobHJ1X2Fk
ZF9kcmFpbikgZnJvbSBbPGMwMmEyYzMwPl0gKGV4aXRfbW1hcCsweDljLzB4MWQ0KQpbICAg
IDQuODM5NDc3XSBbPGMwMmEyYzMwPl0gKGV4aXRfbW1hcCkgZnJvbSBbPGMwMTMzOTYwPl0g
KG1tcHV0KzB4NGMvMHgxMTApClsgICAgNC44Mzk0NzddIFs8YzAxMzM5NjA+XSAobW1wdXQp
IGZyb20gWzxjMDJlMmRjOD5dIChmcmVlX2Jwcm0rMHgyNC8weGMwKQpbICAgIDQuODM5NDc3
XSBbPGMwMmUyZGM4Pl0gKGZyZWVfYnBybSkgZnJvbSBbPGMwMmU0NGNjPl0gKGRvX2V4ZWN2
ZWF0X2NvbW1vbisweDE2MC8weDE2YykKWyAgICA0LjgzOTQ3N10gWzxjMDJlNDRjYz5dIChk
b19leGVjdmVhdF9jb21tb24pIGZyb20gWzxjMDJlNTJmYz5dIChzeXNfZXhlY3ZlKzB4MzAv
MHgzOCkKWyAgICA0Ljg2MTExNF0gWzxjMDJlNTJmYz5dIChzeXNfZXhlY3ZlKSBmcm9tIFs8
YzAxMDAwODA+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHg1OCkKWyAgICA0Ljg3Njc3MF0g
RXhjZXB0aW9uIHN0YWNrKDB4YzI0NDVmYTggdG8gMHhjMjQ0NWZmMCkKWyAgICA0Ljg4MDg4
OV0gNWZhMDogICAgICAgICAgICAgICAgICAgMDA0OGM2N2MgMDA0OGM2YmMgMDA0OGM2YmMg
MDA0OGM2N2MgMDA0OGM2OTQgMDAwMDAwMDAKWyAgICA0Ljg4OTAwN10gNWZjMDogMDA0OGM2
N2MgMDA0OGM2YmMgMDA0OGM2YmMgMDAwMDAwMGIgMDAwMDAwMDIgYmU5YzE4MzQgMDA0OGM2
OTQgYmU5YzFhNTQKWyAgICA0Ljg5ODI4NF0gNWZlMDogMDAwMDAwMGIgYmU5YzE4MGMgYjZl
YTNjMTMgYjZlNDc5MjYKWyAgICA0Ljg5ODI4NF0gQ29kZTogZTc5NmUxMGMgZTI4M2MwMjUg
ZTA4Y2MwMDEgZTFhMDQwMGMgKGUxOWU3MGQ0KSAKWyAgICA0LjkwMzM4MV0gLS0tWyBlbmQg
dHJhY2UgZTU2ZWIyMTM3ZDdjZGM0MyBdLS0tCgo=
--------------B5F7EC760F5E26BE690EA8C8--
