Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E8B6F29
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 00:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732278AbfIRWBz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 18:01:55 -0400
Received: from mail-eopbgr1360097.outbound.protection.outlook.com ([40.107.136.97]:46048
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731399AbfIRWBz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 18:01:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SX+wUorZk0viTkZ5LLhrs0l4WvbUVgX/H5A6X0tkd0BhiImioimegUHXOymWk+kQCUIBrK7T0QIIevmfQ7cGxFZpYBxkCtC/RYm0Xslfk50QJhY61awUDYIwgDOml1SDl/Rn+Xy7FrToIzt5g81MTTOlUgPO80M/oVklzgUD8DuyS+qk26mtyuTIZNfBy/c/RHcIS0jASSs3ZP8PqGcZwN7OzKgIN4rGD/2LcNdHeu+L35TaEBfZbF/tzZSX+rJCirVS+4B3CLJMJ/3SUt/5W1QYrMbJLAmx3L3tTTdIdUmogr6nYNUvH/fMzMNLTTCqKodJ26cEEsYQB4LN1LQ7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGJ7HD0sGBqLirfjhL0tzy+t+5Oh1Tds9TTY0gRQows=;
 b=LTax8js6WXUIebuvBpGnjREO8lgxn2HkGGiz8Ddh2CchNkF6IYz2hR3jRcOnngB1NBSU2f6DFXBxcvJj40Itz0+Y9XtDbRp9RMPt6WXowS1l/z+bjh1BiB1A4geRJYqUt+Up2XX9enn4uj8DUFkfn9/lvHInABx3mi2tEfbs1nLKr0K2NGdJJB7Hkqxv5UCm3Of3vCpGN0uxJmOw7cU7qwXxvPzPLrlaG9qLvQr9fyBMn8PvPMniV64nAarRNZuBpa7zEE8sfK/7NTZ4LAOxR8ewKH+S5mOxCoszu3X7ij79ffWNdKpinDwGUABBTOR90lQuhs1LAhrU32KakeXOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGJ7HD0sGBqLirfjhL0tzy+t+5Oh1Tds9TTY0gRQows=;
 b=uym4DK/QPB9cBp9E6r3Vy7oowjyeY3LhgEBXsVbHoy9SJMZbI2Ioixg+sisZmNE2PF4Tpplo/T89qt9OobjXU7v2lTg8CsNB+1XUuN2Lz+uULX1G5FpB20ReE++IJ+DhY7P0s6Msxzu9ZVNr826UeB2FMMiHmUY5hoI+T57t4RI=
Received: from ME2PR01MB4738.ausprd01.prod.outlook.com (20.178.183.211) by
 ME2PR01MB5330.ausprd01.prod.outlook.com (10.255.107.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Wed, 18 Sep 2019 22:01:47 +0000
Received: from ME2PR01MB4738.ausprd01.prod.outlook.com
 ([fe80::6de7:80f:8c28:c734]) by ME2PR01MB4738.ausprd01.prod.outlook.com
 ([fe80::6de7:80f:8c28:c734%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 22:01:47 +0000
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
Thread-Index: AQHVbbJwOuyI92owFECF8tuyXtg2r6cxje2AgABpn0CAAAKfAIAAAJCw
Date:   Wed, 18 Sep 2019 22:01:47 +0000
Message-ID: <ME2PR01MB4738AC8F1007704DF8FC71CEE58E0@ME2PR01MB4738.ausprd01.prod.outlook.com>
References: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
 <20190917234829.91132-2-ankur.tyagi@gallagher.com>
 <20190918152053.GB5610@atomide.com>
 <ME2PR01MB4738DBFC10850D82271F0D18E58E0@ME2PR01MB4738.ausprd01.prod.outlook.com>
 <20190918214818.GF5610@atomide.com>
In-Reply-To: <20190918214818.GF5610@atomide.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [203.167.229.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e97cbb85-3844-408c-5b9a-08d73c83ccf8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:ME2PR01MB5330;
x-ms-traffictypediagnostic: ME2PR01MB5330:
x-microsoft-antispam-prvs: <ME2PR01MB5330FEAE2B3E6EAFFFCCC448E58E0@ME2PR01MB5330.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(189003)(199004)(13464003)(316002)(25786009)(6916009)(6246003)(446003)(5024004)(486006)(33656002)(256004)(11346002)(7696005)(5660300002)(76176011)(99286004)(71200400001)(86362001)(55016002)(6436002)(14444005)(2906002)(102836004)(476003)(6116002)(9686003)(186003)(15650500001)(26005)(71190400001)(3846002)(66946007)(81166006)(66556008)(54906003)(66476007)(4326008)(66066001)(229853002)(8676002)(64756008)(66446008)(81156014)(6506007)(76116006)(8936002)(14454004)(478600001)(7736002)(74316002)(305945005)(52536014)(53546011);DIR:OUT;SFP:1102;SCL:1;SRVR:ME2PR01MB5330;H:ME2PR01MB4738.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: gallagher.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +MpKCTRb8dIaG2CoOfpMUTPPgx+M6xvoDkjq8Z2FFlit037O4aCU2FS9Bf8Gwdr62tX+hHAI73rX7jYLksPVG30Iev9oQZfaSi5mWp6QimIUcnfIfWhhtdU0jyffVcFbMKqvRfnzOcPI0N95unQwjCRwvAD9vR4z6LsN2egq+OIcQGj+YBZoo+8/UzjqU0ZBv6kskIMSHI6P2RHyaTrUMtAliKBIPJMm6SKnA0EyGE0QQ9Q9GdqX6o7642PtUpoPFudQXK9uN16m+fxs+3I9sZWRw7w5KjorrueFALHcFwXvTopnY59re1cenKGxdSL7Xb5GqXnqHn/o0MU3qvdSySBc2YvDVrIKIIqkB3gzmrn7SMfGPnLqKzWyfqQQEhWXVvJyUc/nHz5ktf8Uz+x+MqYwzDJ89h0NLo1CzbfmBJ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97cbb85-3844-408c-5b9a-08d73c83ccf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:01:47.1816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGk3sNLnk52q664WjdRxosrSWTTyNfArXkFrRMZzl6Pj+j8qZlJVUILvISIm0FKgPvCMjJdZ7g42GSp4QAriARZUKSZE3v8CPosD05qbEi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB5330
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9ueSBMaW5kZ3Jl
biA8dG9ueUBhdG9taWRlLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDE5IFNlcHRlbWJlciAyMDE5
IDk6NDggQU0NCj4gVG86IEFua3VyIFR5YWdpIDxBbmt1ci5UeWFnaUBnYWxsYWdoZXIuY29tPg0K
PiBDYzogdC1rcmlzdG9AdGkuY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAa2Vy
bmVsLm9yZzsgbGludXgtDQo+IG9tYXBAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gY2xrOiB0aTogYW0zOiBV
cGRhdGUgQU0zIEdQSU8gbnVtYmVyIGFzIHBlcg0KPiBkYXRhc2hlZXQNCj4NCj4gKiBBbmt1ciBU
eWFnaSA8QW5rdXIuVHlhZ2lAZ2FsbGFnaGVyLmNvbT4gWzE5MDkxOCAyMTo0NF06DQo+ID4gSGks
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBUb255
IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIDE5IFNl
cHRlbWJlciAyMDE5IDM6MjEgQU0NCj4gPiA+IFRvOiBBbmt1ciBUeWFnaSA8QW5rdXIuVHlhZ2lA
Z2FsbGFnaGVyLmNvbT4NCj4gPiA+IENjOiB0LWtyaXN0b0B0aS5jb207IG10dXJxdWV0dGVAYmF5
bGlicmUuY29tOyBzYm95ZEBrZXJuZWwub3JnOw0KPiA+ID4gbGludXgtIG9tYXBAdmdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAxLzJdIGNsazogdGk6IGFtMzogVXBkYXRlIEFNMyBHUElPIG51bWJlciBhcw0KPiA+
ID4gcGVyIGRhdGFzaGVldA0KPiA+ID4NCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+ICogQW5rdXIg
VHlhZ2kgPGFua3VyLnR5YWdpQGdhbGxhZ2hlci5jb20+IFsxOTA5MTcgMjM6NDldOg0KPiA+ID4g
PiBTaXRhcmEgdGVjaG5pY2FsIHJlZmVyZW5jZSBtYW51YWwgbnVtYmVycyBHUElPIGZyb20gMCB3
aGVyZWFzIGluDQo+ID4gPiA+IGNvZGUgR1BJTyBhcmUgbnVtYmVyZWQgZnJvbSAxDQo+ID4gPg0K
PiA+ID4gSWYgdGhpcyBpcyBhIGNvc21ldGljIGZpeCwgcGxlYXNlIGFkZCBpdCB0byB0aGUgZGVz
Y3JpcHRpb24uDQo+ID4gPiBUaGVuIGlmIHRoZXJlIGlzIGFsc28gc29tZSBvdGhlciBmaXgsIHRo
YXQgc2hvdWxkIGJlIGRvbmUgc2VwYXJhdGVseQ0KPiA+DQo+ID4gVGhpcyBpcyBhIGNvc21ldGlj
IGZpeCBvbmx5LiBTaGFsbCBJIHNlbmQgdjQgd2l0aCBuZXcgZGVzY3JpcHRpb24/DQo+DQo+IFdl
bGwgaWYgdGhpcyBpcyBhIGNvc21ldGljIGZpeCBvbmx5LCBsZXQncyB3YWl0IGEgYml0IHNvIHdl
IGNhbiBnZXQgcmlkIG9mIHRoZQ0KPiAidGksaHdtb2RzIiBwYXJ0LiBJJ2xsIHBvc3QgcGF0Y2hl
cyBmb3IgdGhhdCBhZnRlciAtcmMsIHNvIGluIGZldyB3ZWVrcy4gQnV0DQo+IHllYWggd2hlbiBy
ZXBvc3RpbmcgYXQgdGhhdCBwb2ludCwganVzdCBhZGQgIm5vIGZ1bmN0aW9uYWwgY2hhbmdlcyIg
dG8gdGhlDQo+IHBhdGNoIHRvIG1ha2UgaXQgY2xlYXIuDQoNClN1cmUsIEknbGwgd2FpdA0KDQo+
ID4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC1sNC5kdHNpDQo+ID4gPiA+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC1sNC5kdHNpDQo+ID4gPiA+IEBAIC0xMjksNyAr
MTI5LDcgQEANCj4gPiA+ID4NCj4gPiA+ID4gIHRhcmdldC1tb2R1bGVANzAwMCB7LyogMHg0NGUw
NzAwMCwgYXAgMTQNCj4gPiA+IDIwLjAgKi8NCj4gPiA+ID4gIGNvbXBhdGlibGUgPSAidGksc3lz
Yy1vbWFwMiIsICJ0aSxzeXNjIjsgLXRpLGh3bW9kcyA9ICJncGlvMSI7DQo+ID4gPiA+ICt0aSxo
d21vZHMgPSAiZ3BpbzAiOw0KPiA+ID4gPiAgcmVnID0gPDB4NzAwMCAweDQ+LA0KPiA+ID4gPiAg
ICAgICAgPDB4NzAxMCAweDQ+LA0KPiA+ID4gPiAgICAgICAgPDB4NzExNCAweDQ+Ow0KPiA+ID4N
Cj4gPiA+IExldCdzIHNpbXBsaWZ5IHRoaW5ncyBhIGJpdCBmaXJzdCA6KSBXZSBzaG91bGQgYmUg
YWJsZSB0byBkcm9wIHRoZQ0KPiAidGksaHdtb2RzIg0KPiA+ID4gcHJvcGVydHkgZm9yIGFsbCBn
cGlvIGluc3RhbmNlcyBhbmQgdGhlIHJlbGF0ZWQgcGxhdGZvcm0gZGF0YS4gSSdsbA0KPiA+ID4g
cG9zdCBhIHBhdGNoIGZvciB0aGF0IGFmdGVyIC1yYzEuDQo+ID4gPg0KPiA+ID4gSWYgdGhlcmUn
cyBzb21lIG5vbi1jb3NtZXRpYyBmaXggaGVyZSB0b28sIHdlIHNob3VsZCBuYXR1cmFsbHkgYXBw
bHkNCj4gPiA+IGEgZml4IGZvciB0aGF0IGZpcnN0Lg0KPiA+DQo+ID4gTm8sIHRoZXJlIGlzIG5v
IG90aGVyIGZpeCBoZXJlDQo+DQo+IE9LIHRoYW5rcyBmb3IgY29uZmlybWluZyBpdC4NCj4NCj4g
PiA+ID4gLWNsb2NrcyA9IDwmbDRfd2t1cF9jbGtjdHJsDQo+ID4gPiBBTTNfTDRfV0tVUF9HUElP
MV9DTEtDVFJMIDA+LA0KPiA+ID4gPiAtIDwmbDRfd2t1cF9jbGtjdHJsDQo+ID4gPiBBTTNfTDRf
V0tVUF9HUElPMV9DTEtDVFJMIDE4PjsNCj4gPiA+ID4gK2Nsb2NrcyA9IDwmbDRfd2t1cF9jbGtj
dHJsDQo+ID4gPiBBTTNfTDRfV0tVUF9HUElPMF9DTEtDVFJMIDA+LA0KPiA+ID4gPiArIDwmbDRf
d2t1cF9jbGtjdHJsDQo+ID4gPiBBTTNfTDRfV0tVUF9HUElPMF9DTEtDVFJMIDE4PjsNCj4gPiA+
DQo+ID4gPiBOb3Qgc3VyZSBpZiB0aGlzIHJlbnVtYmVyaW5nIGhlbHBzLi4gSXQgbWlnaHQgYWN0
dWFsbHkgbWFrZSBpdA0KPiA+ID4gZWFzaWVyIHRvIGludHJvZHVjZSB3ZWlyZCBidWdzIGlmIG9s
ZGVyIGR0YiBpcyB1c2VkIHdpdGggYSBuZXdlciBrZXJuZWwuDQo+ID4NCj4gPiBBY3R1YWxseSBJ
IGhhZCBzb21lIHRyb3VibGUgd2l0aCBvbGQgdmVyc2lvbiBvZiBrZXJuZWwgd2hlcmUgSSBqdXN0
DQo+ID4gdXNlZA0KPiA+IEdQSU8yIGRlZmluZSB0byBlbmFibGUgZ3BpbzIgY2xvY2sgYnV0IGl0
IGVuYWJsZWQgZ3BpbzEuIFRoYXQncyB3aHkgSQ0KPiA+IHRob3VnaHQgb2YgZml4aW5nIHRoZSBu
dW1iZXJpbmcgaW4gY29kZS4NCj4NCj4gWWVhaCBmaXhpbmcgaXQgbWFrZXMgdGhpbmdzIGVhc2ll
ciB0byBmb2xsb3cgOikNCg0KVGhhbmtzIPCfmIoNCg0KPiA+ID4gPiBAQCAtNzIsOSArNzIsOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9tYXBfY2xrY3RybF9yZWdfZGF0YQ0KPiA+ID4gYW0zX2w0
X3Blcl9jbGtjdHJsX3JlZ3NbXSBfX2luaXRjb25zdA0KPiA+ID4gPiAgeyBBTTNfUk5HX0NMS0NU
UkwsIE5VTEwsIENMS0ZfU1dfU1VQLCAicm5nX2ZjayIgfSwgIHsNCj4gPiA+ID4gQU0zX0FFU19D
TEtDVFJMLCBOVUxMLCBDTEtGX1NXX1NVUCwgImFlczBfZmNrIiwgImwzX2Nsa2RtIiB9LCAgew0K
PiA+ID4gPiBBTTNfU0hBTV9DTEtDVFJMLCBOVUxMLCBDTEtGX1NXX1NVUCwgImwzX2djbGsiLCAi
bDNfY2xrZG0iDQo+ID4gPiB9LA0KPiA+ID4gPiAreyBBTTNfR1BJTzFfQ0xLQ1RSTCwgYW0zX2dw
aW8xX2JpdF9kYXRhLCBDTEtGX1NXX1NVUCwNCj4gPiA+ICJsNGxzX2djbGsiIH0sDQo+ID4gPiA+
ICB7IEFNM19HUElPMl9DTEtDVFJMLCBhbTNfZ3BpbzJfYml0X2RhdGEsIENMS0ZfU1dfU1VQLA0K
PiA+ID4gImw0bHNfZ2NsayIgfSwNCj4gPiA+ID4gIHsgQU0zX0dQSU8zX0NMS0NUUkwsIGFtM19n
cGlvM19iaXRfZGF0YSwgQ0xLRl9TV19TVVAsDQo+ID4gPiAibDRsc19nY2xrIiB9LA0KPiA+ID4g
PiAteyBBTTNfR1BJTzRfQ0xLQ1RSTCwgYW0zX2dwaW80X2JpdF9kYXRhLCBDTEtGX1NXX1NVUCwN
Cj4gPiA+ICJsNGxzX2djbGsiIH0sDQo+ID4gPiA+ICB7IEFNM19UUENDX0NMS0NUUkwsIE5VTEws
IENMS0ZfU1dfU1VQLCAibDNfZ2NsayIsICJsM19jbGtkbSIgfSwNCj4gPiA+ID4geyBBTTNfRF9D
QU4wX0NMS0NUUkwsIE5VTEwsIENMS0ZfU1dfU1VQLCAiZGNhbjBfZmNrIiB9LCAgew0KPiA+ID4g
PiBBTTNfRF9DQU4xX0NMS0NUUkwsIE5VTEwsIENMS0ZfU1dfU1VQLCAiZGNhbjFfZmNrIiB9LA0K
PiA+ID4NCj4gPiA+IFNvIGlzIHRoaXMganVzdCByZW51bWJlcmluZywgb3IgZG8gd2UgaGF2ZSBz
b21lIG90aGVyIHJlYWwgYnVnIHRvbyBoZXJlPw0KPiA+DQo+ID4gSnVzdCBudW1iZXJpbmcgdG8g
bWFrZSB0aGluZ3MgY29uc2lzdGVudCB3aXRoIHJlZmVyZW5jZSBtYW51YWwuDQo+ID4gTGV0IG1l
IGtub3cgaWYgaXQgaXMgd29ydGggZG9pbmcgdGhlbiBJJ2xsIHNlbmQgYW5vdGhlciBwYXRjaCB3
aXRoDQo+ID4gdXBkYXRlZCBkZXNjcmlwdGlvbiBvdGhlcndpc2Ugbm90IPCfmIoNCj4NCj4gT0sg
eWVhaCBsZXQncyB3YWl0IGEgYml0LiBUZXJvIG1pZ2h0IGhhdmUgbW9yZSBjb21tZW50cyB0b28u
DQoNCg0KU3VyZSwgd2lsbCB3YWl0IGZvciBoaXMgY29tbWVudHMgYW5kIHlvdXIgcGF0Y2gNCg0K
DQo+IFJlZ2FyZHMsDQo+DQo+IFRvbnkNCg0KUmVnYXJkcw0KQW5rdXINCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQogVGhpcyBlbWFpbCBpcyBjb25maWRlbnRpYWwgYW5kIG1heSBj
b250YWluIGluZm9ybWF0aW9uIHN1YmplY3QgdG8gbGVnYWwgcHJpdmlsZWdlLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IHBsZWFzZSBhZHZpc2UgdXMgb2Ygb3VyIGVycm9y
IGJ5IHJldHVybiBlLW1haWwgdGhlbiBkZWxldGUgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaGVk
IGZpbGVzLiBZb3UgbWF5IG5vdCBjb3B5LCBkaXNjbG9zZSBvciB1c2UgdGhlIGNvbnRlbnRzIGlu
IGFueSB3YXkuIFRoZSB2aWV3cyBleHByZXNzZWQgaW4gdGhpcyBlbWFpbCBtYXkgbm90IGJlIHRo
b3NlIG9mIEdhbGxhZ2hlciBHcm91cCBMdGQgb3Igc3Vic2lkaWFyeSBjb21wYW5pZXMgdGhlcmVv
Zi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
