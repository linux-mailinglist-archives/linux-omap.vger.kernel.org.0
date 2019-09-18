Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C552FB6F04
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 23:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388086AbfIRVoC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 17:44:02 -0400
Received: from mail-eopbgr1360111.outbound.protection.outlook.com ([40.107.136.111]:30747
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388063AbfIRVoC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 17:44:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cutx33MFX233ywqXnoqYPhrMHnUKf6ha4TzU3yjXVUPL8ywOS3U+epjD4fPgW/gqNJiPjprceEyMu8EnKieclbTwBwntPXaZ1Rhqs8n6Ic0DiZUdjms97stsWc/FCNeW/Q2jO9kByygQpgap6IROmk6SPzyQzX/5pJXq9bf4EUq9Z46gAfb9Zkzuhz8sBjQDUsb7XUvXsg+OgCuo9uFmq4B0nSRtuXyfRJmB4TIV5zoinFu1JJC6zS//Dvnw6PfxRXqrz+nAPde2o+dcvn+VHwRWcx4bwxDdM7m1ixr2IGUvS2QJNR6CYTQAQr5VuRVT0LZtsiVLtbJOEdJSUgjekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/jxCBu2Pjj+F3KCTJWc0birR8UOuCMEc6W/y6GLHGI=;
 b=mzuFMOj50b3K/gtKN5jERYK/MCfSklixstfyfW1LxxGpFoIpbb0mPI3iquIW5ujkKGKSsn0YXtB9DTfo32Pnz7OXAwQtraKa/dyYe2cIcG/hrSEGsZuiYzNo1nZY6SleKsMidSfBdwrNVYHUnemKfm7Y+8kg2F2QV7EI6hNnXa1NePAwupPnO34pZCmqLO90FS+lPqVdmb0j7XZneCvTOTPly3xsqzFr4+bBTKHPonjcpoPU9w3vVTMjAMFnuc03xr4r5/bjvTCSRXA4IRhl5VlGgrs0vUhaPy3kKTbkm4+eREhbbxugmciJTuyzL9dN1VxZwmNnYhTGpNr1akoT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/jxCBu2Pjj+F3KCTJWc0birR8UOuCMEc6W/y6GLHGI=;
 b=PigNkhJ7aEmEyAn6/Tqt2aGfFjo/4LRdvvXWdIpnBERniF5BLXGBpC1YlR3NDETi1rkfDsd4a44ggKvxzEHXn+T8R9Jjtz5blyE6B4sSYop2vLKFePpeA5CpY65MWLmAz3NrfHpSCRSRaUiZXAwTUaZayYpKaeRboSgGvx1qVa0=
Received: from ME2PR01MB4738.ausprd01.prod.outlook.com (20.178.183.211) by
 ME2PR01MB3859.ausprd01.prod.outlook.com (52.134.222.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Wed, 18 Sep 2019 21:43:56 +0000
Received: from ME2PR01MB4738.ausprd01.prod.outlook.com
 ([fe80::6de7:80f:8c28:c734]) by ME2PR01MB4738.ausprd01.prod.outlook.com
 ([fe80::6de7:80f:8c28:c734%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 21:43:56 +0000
From:   Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     "t-kristo@ti.com" <t-kristo@ti.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] clk: ti: am3: Update AM3 GPIO number as per
 datasheet
Thread-Topic: [PATCH v3 1/2] clk: ti: am3: Update AM3 GPIO number as per
 datasheet
Thread-Index: AQHVbbJwOuyI92owFECF8tuyXtg2r6cxje2AgABpn0A=
Date:   Wed, 18 Sep 2019 21:43:56 +0000
Message-ID: <ME2PR01MB4738DBFC10850D82271F0D18E58E0@ME2PR01MB4738.ausprd01.prod.outlook.com>
References: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
 <20190917234829.91132-2-ankur.tyagi@gallagher.com>
 <20190918152053.GB5610@atomide.com>
In-Reply-To: <20190918152053.GB5610@atomide.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [203.167.229.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 354e8329-c016-4ce4-a792-08d73c814e97
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:ME2PR01MB3859;
x-ms-traffictypediagnostic: ME2PR01MB3859:
x-microsoft-antispam-prvs: <ME2PR01MB385905A61565415C887B5181E58E0@ME2PR01MB3859.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(13464003)(199004)(189003)(66066001)(14444005)(256004)(99286004)(9686003)(186003)(7696005)(8936002)(81166006)(3846002)(6916009)(5024004)(53546011)(6116002)(52536014)(15650500001)(55016002)(81156014)(86362001)(6246003)(476003)(6506007)(102836004)(14454004)(76176011)(6436002)(33656002)(316002)(8676002)(305945005)(7736002)(71200400001)(71190400001)(229853002)(2906002)(26005)(76116006)(446003)(74316002)(486006)(5660300002)(11346002)(25786009)(4326008)(478600001)(54906003)(66946007)(66446008)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:ME2PR01MB3859;H:ME2PR01MB4738.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: gallagher.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DIqGd7sYj+M7FR0SCzcHIzLDVNaZJH5HXW5eQRDrXMPQTXwpR4Avn0q3vrvDwHbomJuKYCbXzFPlQ+Pti++nvY+9SmSU/v/oBN74+2nW4Kppnl+VkcingI31PXoPl9MKyS+IOflcs3sW2vSZ2DRpz2kj8egsKg903B6hTAYGKKnkdCcqF9TiFGAk/0Msi35plMAZHA7v9ChvBZ1XAqX/Ccc4IWbQflUGMAUuV+7+jlM3osYj0oTj9R/TEd4NlLFAoMREsgP54+RLtQDS4gvdKzt7Jqlh7m7Utd1f/l4jl4CNKqP3B1vjYnbhOQI7hiKDTnPoOExKQVm6xiITaszazhOtMghvmddLRtUbTIH1nugPMlnlt/222XadhjrNRWp2CRtsijt8R55aqP8MBz/p2dgPHzo9JcDe/GAYifw33ak=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354e8329-c016-4ce4-a792-08d73c814e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 21:43:56.2944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFvbeZwa5z3jazLgvfXgiJv+UQHkDl3KbEXFB3GwUQUqMM9PrWclZddhXtxEkXVBgNoGjOWndB57QtH+CycOjAW+sdJ+XsMWO0qSzzfVqNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB3859
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9ueSBMaW5kZ3Jl
biA8dG9ueUBhdG9taWRlLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDE5IFNlcHRlbWJlciAyMDE5
IDM6MjEgQU0NCj4gVG86IEFua3VyIFR5YWdpIDxBbmt1ci5UeWFnaUBnYWxsYWdoZXIuY29tPg0K
PiBDYzogdC1rcmlzdG9AdGkuY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAa2Vy
bmVsLm9yZzsgbGludXgtDQo+IG9tYXBAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gY2xrOiB0aTogYW0zOiBV
cGRhdGUgQU0zIEdQSU8gbnVtYmVyIGFzIHBlcg0KPiBkYXRhc2hlZXQNCj4NCj4gSGksDQo+DQo+
ICogQW5rdXIgVHlhZ2kgPGFua3VyLnR5YWdpQGdhbGxhZ2hlci5jb20+IFsxOTA5MTcgMjM6NDld
Og0KPiA+IFNpdGFyYSB0ZWNobmljYWwgcmVmZXJlbmNlIG1hbnVhbCBudW1iZXJzIEdQSU8gZnJv
bSAwIHdoZXJlYXMgaW4gY29kZQ0KPiA+IEdQSU8gYXJlIG51bWJlcmVkIGZyb20gMQ0KPg0KPiBJ
ZiB0aGlzIGlzIGEgY29zbWV0aWMgZml4LCBwbGVhc2UgYWRkIGl0IHRvIHRoZSBkZXNjcmlwdGlv
bi4NCj4gVGhlbiBpZiB0aGVyZSBpcyBhbHNvIHNvbWUgb3RoZXIgZml4LCB0aGF0IHNob3VsZCBi
ZSBkb25lIHNlcGFyYXRlbHkNCg0KVGhpcyBpcyBhIGNvc21ldGljIGZpeCBvbmx5LiBTaGFsbCBJ
IHNlbmQgdjQgd2l0aCBuZXcgZGVzY3JpcHRpb24/DQoNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9hbTMzeHgtbDQuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC1s
NC5kdHNpDQo+ID4gQEAgLTEyOSw3ICsxMjksNyBAQA0KPiA+DQo+ID4gIHRhcmdldC1tb2R1bGVA
NzAwMCB7LyogMHg0NGUwNzAwMCwgYXAgMTQNCj4gMjAuMCAqLw0KPiA+ICBjb21wYXRpYmxlID0g
InRpLHN5c2Mtb21hcDIiLCAidGksc3lzYyI7DQo+ID4gLXRpLGh3bW9kcyA9ICJncGlvMSI7DQo+
ID4gK3RpLGh3bW9kcyA9ICJncGlvMCI7DQo+ID4gIHJlZyA9IDwweDcwMDAgMHg0PiwNCj4gPiAg
ICAgICAgPDB4NzAxMCAweDQ+LA0KPiA+ICAgICAgICA8MHg3MTE0IDB4ND47DQo+DQo+IExldCdz
IHNpbXBsaWZ5IHRoaW5ncyBhIGJpdCBmaXJzdCA6KSBXZSBzaG91bGQgYmUgYWJsZSB0byBkcm9w
IHRoZSAidGksaHdtb2RzIg0KPiBwcm9wZXJ0eSBmb3IgYWxsIGdwaW8gaW5zdGFuY2VzIGFuZCB0
aGUgcmVsYXRlZCBwbGF0Zm9ybSBkYXRhLiBJJ2xsIHBvc3QgYSBwYXRjaA0KPiBmb3IgdGhhdCBh
ZnRlciAtcmMxLg0KPg0KPiBJZiB0aGVyZSdzIHNvbWUgbm9uLWNvc21ldGljIGZpeCBoZXJlIHRv
bywgd2Ugc2hvdWxkIG5hdHVyYWxseSBhcHBseSBhIGZpeCBmb3INCj4gdGhhdCBmaXJzdC4NCg0K
Tm8sIHRoZXJlIGlzIG5vIG90aGVyIGZpeCBoZXJlDQoNCj4NCj4gPiAtY2xvY2tzID0gPCZsNF93
a3VwX2Nsa2N0cmwNCj4gQU0zX0w0X1dLVVBfR1BJTzFfQ0xLQ1RSTCAwPiwNCj4gPiAtIDwmbDRf
d2t1cF9jbGtjdHJsDQo+IEFNM19MNF9XS1VQX0dQSU8xX0NMS0NUUkwgMTg+Ow0KPiA+ICtjbG9j
a3MgPSA8Jmw0X3drdXBfY2xrY3RybA0KPiBBTTNfTDRfV0tVUF9HUElPMF9DTEtDVFJMIDA+LA0K
PiA+ICsgPCZsNF93a3VwX2Nsa2N0cmwNCj4gQU0zX0w0X1dLVVBfR1BJTzBfQ0xLQ1RSTCAxOD47
DQo+DQo+IE5vdCBzdXJlIGlmIHRoaXMgcmVudW1iZXJpbmcgaGVscHMuLiBJdCBtaWdodCBhY3R1
YWxseSBtYWtlIGl0IGVhc2llciB0bw0KPiBpbnRyb2R1Y2Ugd2VpcmQgYnVncyBpZiBvbGRlciBk
dGIgaXMgdXNlZCB3aXRoIGEgbmV3ZXIga2VybmVsLg0KDQpBY3R1YWxseSBJIGhhZCBzb21lIHRy
b3VibGUgd2l0aCBvbGQgdmVyc2lvbiBvZiBrZXJuZWwgd2hlcmUgSSBqdXN0IHVzZWQNCkdQSU8y
IGRlZmluZSB0byBlbmFibGUgZ3BpbzIgY2xvY2sgYnV0IGl0IGVuYWJsZWQgZ3BpbzEuIFRoYXQn
cyB3aHkgSSB0aG91Z2h0DQpvZiBmaXhpbmcgdGhlIG51bWJlcmluZyBpbiBjb2RlLg0KDQo+ID4g
QEAgLTcyLDkgKzcyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvbWFwX2Nsa2N0cmxfcmVnX2Rh
dGENCj4gYW0zX2w0X3Blcl9jbGtjdHJsX3JlZ3NbXSBfX2luaXRjb25zdA0KPiA+ICB7IEFNM19S
TkdfQ0xLQ1RSTCwgTlVMTCwgQ0xLRl9TV19TVVAsICJybmdfZmNrIiB9LA0KPiA+ICB7IEFNM19B
RVNfQ0xLQ1RSTCwgTlVMTCwgQ0xLRl9TV19TVVAsICJhZXMwX2ZjayIsICJsM19jbGtkbSIgfSwN
Cj4gPiAgeyBBTTNfU0hBTV9DTEtDVFJMLCBOVUxMLCBDTEtGX1NXX1NVUCwgImwzX2djbGsiLCAi
bDNfY2xrZG0iDQo+IH0sDQo+ID4gK3sgQU0zX0dQSU8xX0NMS0NUUkwsIGFtM19ncGlvMV9iaXRf
ZGF0YSwgQ0xLRl9TV19TVVAsDQo+ICJsNGxzX2djbGsiIH0sDQo+ID4gIHsgQU0zX0dQSU8yX0NM
S0NUUkwsIGFtM19ncGlvMl9iaXRfZGF0YSwgQ0xLRl9TV19TVVAsDQo+ICJsNGxzX2djbGsiIH0s
DQo+ID4gIHsgQU0zX0dQSU8zX0NMS0NUUkwsIGFtM19ncGlvM19iaXRfZGF0YSwgQ0xLRl9TV19T
VVAsDQo+ICJsNGxzX2djbGsiIH0sDQo+ID4gLXsgQU0zX0dQSU80X0NMS0NUUkwsIGFtM19ncGlv
NF9iaXRfZGF0YSwgQ0xLRl9TV19TVVAsDQo+ICJsNGxzX2djbGsiIH0sDQo+ID4gIHsgQU0zX1RQ
Q0NfQ0xLQ1RSTCwgTlVMTCwgQ0xLRl9TV19TVVAsICJsM19nY2xrIiwgImwzX2Nsa2RtIiB9LA0K
PiA+ICB7IEFNM19EX0NBTjBfQ0xLQ1RSTCwgTlVMTCwgQ0xLRl9TV19TVVAsICJkY2FuMF9mY2si
IH0sDQo+ID4gIHsgQU0zX0RfQ0FOMV9DTEtDVFJMLCBOVUxMLCBDTEtGX1NXX1NVUCwgImRjYW4x
X2ZjayIgfSwNCj4NCj4gU28gaXMgdGhpcyBqdXN0IHJlbnVtYmVyaW5nLCBvciBkbyB3ZSBoYXZl
IHNvbWUgb3RoZXIgcmVhbCBidWcgdG9vIGhlcmU/DQoNCkp1c3QgbnVtYmVyaW5nIHRvIG1ha2Ug
dGhpbmdzIGNvbnNpc3RlbnQgd2l0aCByZWZlcmVuY2UgbWFudWFsLg0KTGV0IG1lIGtub3cgaWYg
aXQgaXMgd29ydGggZG9pbmcgdGhlbiBJJ2xsIHNlbmQgYW5vdGhlciBwYXRjaCB3aXRoIHVwZGF0
ZWQNCmRlc2NyaXB0aW9uIG90aGVyd2lzZSBub3Qg8J+Yig0KDQo+IFJlZ2FyZHMsDQo+DQo+IFRv
bnkNCg0KUmVnYXJkcw0KQW5rdXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQog
VGhpcyBlbWFpbCBpcyBjb25maWRlbnRpYWwgYW5kIG1heSBjb250YWluIGluZm9ybWF0aW9uIHN1
YmplY3QgdG8gbGVnYWwgcHJpdmlsZWdlLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50IHBsZWFzZSBhZHZpc2UgdXMgb2Ygb3VyIGVycm9yIGJ5IHJldHVybiBlLW1haWwgdGhl
biBkZWxldGUgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaGVkIGZpbGVzLiBZb3UgbWF5IG5vdCBj
b3B5LCBkaXNjbG9zZSBvciB1c2UgdGhlIGNvbnRlbnRzIGluIGFueSB3YXkuIFRoZSB2aWV3cyBl
eHByZXNzZWQgaW4gdGhpcyBlbWFpbCBtYXkgbm90IGJlIHRob3NlIG9mIEdhbGxhZ2hlciBHcm91
cCBMdGQgb3Igc3Vic2lkaWFyeSBjb21wYW5pZXMgdGhlcmVvZi4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo=
