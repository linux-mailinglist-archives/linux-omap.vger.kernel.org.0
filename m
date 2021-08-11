Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9886E3E9367
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhHKOSZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 10:18:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48090 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhHKOSY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Aug 2021 10:18:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17BEHxA9055410;
        Wed, 11 Aug 2021 09:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1628691479;
        bh=c/qxUABx9tYL9Rzvu0Q3NRtn9QytLHQRiK5j6AsPu7A=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=yAQ2bAB7jdIdW3XkkTmm8r9qN3PXppcdqjaZXAN927YlfBHC7LMZiCsH5tbV204Vi
         vE5yO0aq2HyTd+EPn7l/eyjfvcYDll6mIWZ2/7WOD3/ZZVHktAW7/XYPsZRwbCkqnX
         xwE6dBZtQRc6+NpmMpRhmCByV9+padnYuOB8T83M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17BEHwAE032215
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Aug 2021 09:17:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 11
 Aug 2021 09:17:58 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
 DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
 15.01.2176.012; Wed, 11 Aug 2021 09:17:58 -0500
From:   "Woodruff, Richard" <r-woodruff2@ti.com>
To:     David Russell <david.russell73@gmail.com>,
        Tony Lindgren <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Topic: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Index: AQHXW64KTel5D7x5GUqgCeE1dBGRWqsIrOqggALerYCAY3DfAP//vyPQ
Date:   Wed, 11 Aug 2021 14:17:58 +0000
Message-ID: <6616af990c3d4cc8b3ca51e1a6e9283e@ti.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
 <cb562f9f798d4431a09f19e8efd24727@ti.com> <YMBdt8dDdvySofuC@atomide.com>
 <2B1CE4CB-689F-4547-A64C-A7FB699F0730@gmail.com>
In-Reply-To: <2B1CE4CB-689F-4547-A64C-A7FB699F0730@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.57.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gRGF2ZSwNCg0KSXQgZGVwZW5kcyBvbiB3aGF0IGZlYXR1cmVzIHlvdSBuZWVkIHRvIHNh
dGlzZnkgeW91ciB1c2UgY2FzZSAoa2VybmVsICsgYmFzZSArIGFwcGxpY2F0aW9uKS4gIFN0YWJs
ZSBvbGRlciBrZXJuZWxzIGNhbiBkbyBzb21lIHRhc2tzIHdlbGwgZW5vdWdoIGlmIHRoZXkgaGF2
ZSB0aGUgZmVhdHVyZXMgeW91IG5lZWQgaW4gcGxhY2UuICBJZiB5b3UgbmVlZCBuZXdlciBmZWF0
dXJlcyB0aGVuIHdoYXQgYW4gb2xkZXIga2VybmVsIHByb3ZpZGVkLCBpdCBjYW4gYmUgYSBsb3Qg
b2Ygd29yayB0byBiYWNrIHBvcnQuICBBbHNvIGlmIHRoZSBrZXJuZWwgaXMgdXNlZCBpbiBvcGVu
IG5ldHdvcmtzIHRoZW4gaG93IHRvIGhhbmRsZSBzZWN1cml0eSBpcyBhbHNvIHNvbWV0aGluZyB0
byBjb25zaWRlci4NCg0KSSd2ZSBub3QgYm9vdGVkIG15IE9NQVAyNDMwIGJvYXJkIGZvciBzZXZl
cmFsIHllYXJzLCBob3dldmVyLCBJIGRvIGhhdmUgc29tZSBvbGQgdGFibGV0cyBhbmQgcGhvbmVz
IEkgc3RhcnQgZnJvbSB0aW1lIHRvIHRpbWUuICBUaGUgbGFzdCBrZXJuZWwncyBJIHVzZWQgb24g
aXQgd2VyZSBhcm91bmQgdGhlIHRpbWUgZnJhbWUgb2Ygd2hhdCB5b3UgYXJlIHVzaW5nLiBJdCBp
cyB2ZXJ5IGxpa2VseSBzb21lIG5ld2VyIHNuYXBzaG90cyB3ZXJlIGRvbmUgb24gYSBwZXIgcHJv
amVjdCBiYXNpcy4NCg0KUHJvYmFibHkgYSBnb29kIG1pbmltYWwga2VybmVsIHdpdGggYmFzaWMg
ZHJpdmVycyBjYW4gYmUgbWFkZSBhdCBtdWx0aXBsZSBwb2ludHMuICBJJ20gbGVzcyBzdXJlIGFi
b3V0IHRoZSBzdGF0ZSBvZiBvcGVuIGRyaXZlcnMgd2l0aCBXTDE4eHguICBJJ2Qgc3VnZ2VzdCBl
eHBsb3JpbmcgdGhhdCBhIGJpdCBtb3JlIHRvIHNlZSBpZiBpdCBlbmRzIHVwIGRvbWluYXRpbmcu
ICBGb3IgZWFybHkgV0xBTiwgc29tZXRpbWVzIGZpcm13YXJlIGFuZCBmcmFnaWxlIERNQSBpbnRl
Z3JhdGlvbnMgd2VyZSBoYXJkIHRvIHdvcmsgYXJvdW5kLg0KDQpSZWdhcmRzLA0KUmljaGFyZCBX
Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRGF2aWQgUnVzc2VsbCA8ZGF2
aWQucnVzc2VsbDczQGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMSwgMjAy
MSA3OjU0IEFNDQpUbzogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4NCkNjOiBXb29k
cnVmZiwgUmljaGFyZCA8ci13b29kcnVmZjJAdGkuY29tPjsgbGludXgtb21hcEB2Z2VyLmtlcm5l
bC5vcmcNClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIE9NQVAyNDMwIGtlcm5lbCBoYW5ncyBvbiBp
b3JlbWFwIG9mIElWQTIuMSBhZGRyZXNzZXMNCg0KR29vZCBNb3JuaW5nLA0KDQpJIGhhdmUgYmVl
biB1cGdyYWRpbmcgYSBsZWdhY3kgcHJvamVjdCB0aGF0IHJ1bnMgb24gYW4gT01BUDI0MzAgYmFz
ZWQgb24gdGhlIGxpbnV4LW9tYXAgcmVwbyAodGFnIHYyLjYuMjgtb21hcDEpIHRvIG1haW5saW5l
IHY1LjEwOyBJIGhhdmUgYmVlbiBhYmxlIHRvIGdldCB0aGUgbWFpbiBhcHBsaWNhdGlvbiBydW5u
aW5nLCBob3dldmVyIEkgYW0gY29uY2VybmVkIHRoZXJlIGFyZSBwb3RlbnRpYWxseSBtYW55IHVu
ZGVybHlpbmcgaXNzdWVzIEkgaGF2ZSBub3QgY29ycmVjdGVkIG5vciBldmVuIHNlZW4geWV0LiAg
SSByZWNhbGxlZCBUb2554oCZcyBjb21tZW50IHRoYXQgdGhlIHBhcnQgaXMgZGF0ZWQgKG9mIGNv
dXJzZSB0aGVyZSBpcyBubyBhcmd1bWVudCBmcm9tIG1lIHRoZXJlKSB0byB0aGUgcG9pbnQgdGhh
dCBJIGFtIG5vdCBzdXJlIHRvIHdoYXQgZXh0ZW50IGFueW9uZSBoYXMgdXNlZCB0aGUgbGF0ZXN0
IG1haW5saW5lIG9uIGFuIE9NQVAyeHh4IHBhcnQgKGkuZS4sIHJlZ3Jlc3Npb24gdGVzdGluZyku
DQoNCkkgYW0gaG9wZWZ1bCBzb21lb25lIGhhcyBhIGdvb2Qgc3VnZ2VzdGlvbiB0byB0aGUgZm9s
bG93aW5nIHF1ZXN0aW9uOiAgd2hhdCBtYWlubGluZSBrZXJuZWwgdmVyc2lvbiB3b3VsZCBiZSBj
b25zaWRlcmVkIHRoZSBtb3N0IHN0YWJsZSBpbiByZWdhcmRzIHRvIGFuIE9NQVAyNDMwIHByb2Nl
c3NvciB0aGF0IG1heSBhbHNvIGluY2x1ZGUgdGhlIFRJIFdMMTh4eCB3aWZpIGRyaXZlcj8gIE9y
IGlmIHRoZXkgZG8gbm90IG92ZXJsYXAsIHNpbXBseSB3aGF0IGlzIHRoZSBsYXRlc3QgbWFpbmxp
bmUga2VybmVsIHZlcnNpb24gdGhhdCB3b3VsZCBiZSBtb3N0IHN0YWJsZSBmb3IgT01BUDJ4eHg/
ICBJIGFtIGp1c3QgYWZyYWlkIHRoZSB2NS4xMCBhbmQgdjQuMTkgYXJlIHNvIG5ldyB0aGF0IHRo
ZXJlIGFyZSB1bmRlcmx5aW5nIGlzc3VlcyB0aGF0IHdvdWxkIHRha2Ugc2lnbmlmaWNhbnQgdGlt
ZSB0byBjaGFzZSBkb3duOyBidXQgaWYgSSBjYW4gcm9sbC1iYWNrIHRvIGFuIG9sZGVyIHZlcnNp
b24gKHlldCBuZXdlciB0aGFuIDIuNi4yOCksIHRoYXQgbWlnaHQgZ2V0IG1lIGNsb3NlciB0byB3
aGVyZSBJIG5lZWQgdG8gYmUuDQoNClRoYW5rcyBmb3IgYW55IHN1Z2dlc3Rpb25zLA0KDQpEYXZl
DQoNCj4gT24gSnVuIDgsIDIwMjEsIGF0IDExOjIwIFBNLCBUb255IExpbmRncmVuIDx0b255QGF0
b21pZGUuY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gKiBXb29kcnVmZiwgUmljaGFyZCA8
ci13b29kcnVmZjJAdGkuY29tPiBbMjEwNjA3IDE1OjQwXToNCj4+IEd1ZXNzOiB0aGlzIGJpdCBp
biBKVEFHIHNjcmlwdCB1c2VkIGZvciBJVkEgdGVzdHMgcHJvYmFibHkgaXMgbWlzc2luZyBhbmQg
bmVlZHMgdG8gYmUgd29ya2VkIGluLiAgVGhlIGdlbmVyaWMgbGludXgtb21hcCBjbG9jayBjb2Rl
IHByb2JhYmx5IGhhbmRsZXMgdGhlIElWQSBjbG9jayBidXQgbWF5YmUgbm90IHRoZSByZXNldHMu
DQo+PiANCj4+ICAgLyogIEVuYWJsZSBJVkEtc3MgZnVuY3Rpb25hbCBjbG9jayAoc2V0IGJpdCAw
KSAqLw0KPj4gICAoKihpbnQqKTB4NDkwMDY4MDApIHw9IDB4MTsNCj4+IA0KPj4gICAvKiBSZWxl
YXNlIGwzc19pZGxlX3JlcSAgKi8NCj4+ICAgKCooaW50KikweDQ5MDA2ODEwKSB8PSAoMSA8PCAx
KTsNCj4+IA0KPj4gICAvKiBSZWxlYXNlIEwzUyByZXNldCBhbmQgcG93ZXItb24gcmVzZXQgKGNs
ZWFyIGJpdCAxKSBhdCB0aGUgc2FtZSB0aW1lICovDQo+PiAgICgqKGludCopMHg0OTAwNjg1MCkg
Jj0gfigoIDEgPDwgMSkpOw0KPiANCj4gSGVoIGFuZCBJIHRob3VnaHQgbm9ib2R5IGlzIHVzaW5n
IDI0MzAgYW55IGxvbmdlciA6KQ0KPiANCj4gRllJLCB0aGUgY3VycmVudCBtYWlubGluZSBrZXJu
ZWwgYWN0dWFsbHkgY2FuIGRlYWwgd2l0aCBhbGwgdGhhdCB1c2luZyANCj4gcmVzZXQgZHJpdmVy
IGFuZCBnZW5wZCwgc2VlIGZvciBleGFtcGxlIGNvbW1pdHM6DQo+IA0KPiBhZTU3ZDE1NTg5MDgg
KCJBUk06IGR0czogQ29uZmlndXJlIGludGVyY29ubmVjdCB0YXJnZXQgbW9kdWxlIGZvciBkcmE3
IA0KPiBpdmEiKQ0KPiBlZmZlODllNDAwMzcgKCJzb2M6IHRpOiBvbWFwLXBybTogRml4IG9jY2Fz
aW9uYWwgYWJvcnQgb24gcmVzZXQgDQo+IGRlYXNzZXJ0IGZvciBkcmE3IGl2YSIpDQo+IA0KPiBT
aW1pbGFyIHNldHVwIHNob3VsZCBhbHNvIHdvcmsgZm9yIDI0MzAgYnV0IG5lZWRzIHRoZSBwb3dl
ciBkb21haW5zIA0KPiBjb25maWd1cmVkIGZvciBkcml2ZXJzL3NvYy90aS9vbWFwX3BybS5jIGF0
IGxlYXN0IGZvciBpdmEuDQo+IA0KPiBEYXZpZCwgSSB0aGluayB3aGF0IHlvdSdyZSBzZWVpbmcg
aXMgaXZhIGdldHRpbmcgcmVsZWFzZWQgZnJvbSByZXNldCANCj4gd2l0aCBhbiB1bmNvbmZpZ3Vy
ZWQgTU1VLCBhbmQgdGhlbiB0aGUgc3lzdGVtIHdpbGwgaGFuZy4NCj4gDQo+IFJlZ2FyZHMsDQo+
IA0KPiBUb255DQoNCg==
