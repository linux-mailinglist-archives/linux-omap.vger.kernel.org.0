Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A65BD0C3B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 12:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfJIKJq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 06:09:46 -0400
Received: from mail-eopbgr50109.outbound.protection.outlook.com ([40.107.5.109]:44455
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729320AbfJIKJp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 06:09:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY8SG8EOmpRlPoP6sv48vJpXm3RnL/qKMX8A2lJK0iBUvui5J8FShvMXbElBDFoo8Ho8DnZtPkKtaZPr769GsZw8M64Og+ZQo5l5rwI1heTP9aNWb90fx547GtxpVgNrfbwmXiS57yj10mkg8RM0CnI47R55Xaz06/tENd54ckZH0X+fm9xKZZUnMQdl5BYVPYeplKeM1sakZF/K6egtubcgalOGgNCF7VmTchCr9PCw/EgVBXnyVerq3/SgocfUob2XJlp4vN70HZ1FlXvOrymXE6yXZeVhfm80MI4notVAMb1e4cSdD21Bf0QfKzkeOsHpesYRaMcXXOSOMAcOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW/nZvyfHL9xuk/MVAiFnI8cho3D2YkMLozqE2nNyZY=;
 b=BI7YOTeOJdiPBM2RUSQtlw5Qh1WiBETWF+HvxCOEIPZfPayzDUUTqpAxdRJOtPgBoESaA2y3P0FzV3AqFK/jWAl6/sXj/c6Oja8B0lGejIldZpFgVH0jEgFyJWWCczrBzQhZKEOMnyb5gCIxFjiz+ivWe5D7uEKdlgvjR6huGUyvJxbvml5ENu+vWfvjIH0ZvRH9qb/g1HUv61SM2pMkWq81r3ZZ+aqaAQVGLKQjCEUJmgmTy4cs51crqNHxSXVHuBVv02jPmgaB9zWTY3gRaxfuVxq0CsgsGc8a7DRSXqc757q51uPH1S/Dvflkh4AF00pb3rSb9Q4/zjpLJAdlEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW/nZvyfHL9xuk/MVAiFnI8cho3D2YkMLozqE2nNyZY=;
 b=IbOwYJB49kx3CrBnPJH7pY1yxDnUQdl0hLPuiOFPMMNPaCKcal1v9FkQYB5fVbQRArngFGiOyjPvoDK+5Hjoq3xoLojgss8ihvFb4rl2vgZSDTXrLlUXE6u3EwPFMKxs4ZMpfWWmrMivSlmdJpRYV6RatuZwF0wlqO9rNArAmoY=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2909.eurprd07.prod.outlook.com (10.173.73.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.15; Wed, 9 Oct 2019 10:09:40 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c%9]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 10:09:40 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAFGYQD///NzgIAILT2AgAA9LID//+GwAIAAB/aAgAACjgCAACOmgP//33OAACLu/QAAAOwJAA==
Date:   Wed, 9 Oct 2019 10:09:40 +0000
Message-ID: <c486a797-6305-8a62-8604-aef5e835ae72@victronenergy.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
 <20191008161416.GG5610@atomide.com>
 <4fa5393d-0b2c-4b8c-128a-81ab05a14a82@victronenergy.com>
 <20191008165154.GH5610@atomide.com>
 <a8a72544-7f30-c896-22e4-7d85bd0b4235@victronenergy.com>
 <20191008170259.GI5610@atomide.com>
 <6dbdf76a-5c04-63ef-0676-5b02fd29c456@ti.com>
In-Reply-To: <6dbdf76a-5c04-63ef-0676-5b02fd29c456@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2001:1c01:3bc5:4e00:e10d:6b90:6703:aa06]
x-clientproxiedby: AM0PR05CA0058.eurprd05.prod.outlook.com
 (2603:10a6:208:be::35) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b79851ad-2235-4c5d-8293-08d74ca0cc2f
x-ms-traffictypediagnostic: VI1PR0701MB2909:
x-microsoft-antispam-prvs: <VI1PR0701MB2909FEDDF87E2E139CEA82ABC0950@VI1PR0701MB2909.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(189003)(199004)(76176011)(71190400001)(25786009)(6512007)(386003)(46003)(53546011)(31686004)(52116002)(6506007)(478600001)(71200400001)(446003)(86362001)(11346002)(256004)(14444005)(5660300002)(8936002)(6436002)(102836004)(54906003)(66476007)(8676002)(6246003)(65806001)(31696002)(66946007)(36756003)(14454004)(186003)(66556008)(64756008)(316002)(66446008)(65956001)(99286004)(2616005)(2906002)(476003)(486006)(4326008)(229853002)(6116002)(81156014)(305945005)(7736002)(81166006)(58126008)(110136005)(6486002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2909;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oPbRZoVtZhl3jWUOS/mNy04UkCnGY5fLiXnppB7ihHXBz9RA1+Nb+++eronvyzFfoM9MBhT8A/lpcapOmpMtbYAIDiF7RjmqE1F/rKUC6l9q9a1EXKT1PbCnhI4HO+l5oT8VgZp8LqdguTxeHJf5ZqCZrVHLgKfSzxfrNVK0WYBlFUpqg5tGkuJHeRhGMehsqXPaSffezNCencjk6EOclvsnBro1VgGkV4z7ZWWAZ//xF3ShQ+1XodgjgUd1aS/p5/6k4ansaUoym2dnSc1DL/goZ16jGVN+kF2V2+V0yIURu6NZWjDP0wQtPVFCAyCdhEhmGbAPil3JT6ow9pAw57XPnR3k5uB9QDfZZEkyM3/DykTBWwkkmhjo42LDqT0msKA3fakoE9PqNCn0PzryA6u5+fwn+rgmcoiDN1MMKz4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B1DCEF4A23B7B41A86D797B330A500F@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79851ad-2235-4c5d-8293-08d74ca0cc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 10:09:40.2177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OOgY9v0801FN3o4q1GIgoglMVPgi+2L+6Wy7JMIZiHAGNiwraAqzHlC5EAT0jztxkZD/aWBSYc6dY+mw3M3I1VMOzqNfBgmSNTme7+yoPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2909
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gR3J5Z29ycmksDQoNCk9uIDEwLzkvMTkgMTE6NDMgQU0sIEdyeWdvcmlpIFN0cmFzaGtv
IHdyb3RlOg0KPg0KPg0KPj4+IEdyeWdvcmlpIGRvZXNuJ3Qgc3VnZ2VzdCB0byBhZGQgYSBmaXhl
cyB0YWcsIGp1c3QgdG8gY2hhbmdlIHRoZSANCj4+PiByZWZlcmVuY2VkDQo+Pj4gY29tbWl0IHRv
IGFub3RoZXIuIE9idmlvdXNseSBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgYW5vdGhl
ciANCj4+PiBjb21taXQNCj4+PiBzaG91bGQgYmUgcmVmZXJlbmNlZC4gQW5kIHRoZW4gSSBzaG91
bGQgcmVhZCBhbmQgcGFyc2UgdGhlIHJlc3BvbnNlLCANCj4+PiBzbyB0aGVyZQ0KPj4+IGlzIG5v
IHNwZWNpYWwgcmVhc29uLCBqdXN0IHRpbWUuLi4NCj4+DQo+PiBPSyBzdXJlLiBXZWxsIG9uY2Ug
eW91IGd1eXMgaGF2ZSB0aGUgY29tbWl0IGZpZ3VyZWQgb3V0LCBsZXQgbWUNCj4+IGtub3cgd2hh
dCB0byBhcHBseS4gQW5kIHdlIGtub3cgR3J5Z29yaWkgaXMgbW9zdGx5IHJpZ2h0IGJhc2VkDQo+
PiBvbiBoaXMgaGlzdG9yeSBvZiBjb21tZW50cyBzbyBiZXN0IHRvIG5vdCBpZ25vcmUgdGhhdCA6
KQ0KPg0KPiBTcnksIGJ1dCBJIGRvIG5vdCB0aGluayBteSByZXF1ZXN0IGlzIHNvbWVob3cgc3Bl
Y2lhbC4NCj4gWWVzLCB5b3VyIHBhdGNoIGlzIGNvcnJlY3QgYnkgaXRzZWxmLCBidXQgY29tbWl0
IGRlc2NyaXB0aW9uIGlzIG5vdDoNCj4gMSkgY29tbWl0IGNkMjhkMWQ2ZTUyZTogKCJuZXQ6IHBo
eTogYXQ4MDN4OiBEaXNhYmxlIHBoeSBkZWxheSBmb3IgDQo+IFJHTUlJIG1vZGUiKcKgIHdoaWNo
IHlvdSd2ZSBtZW50aW9uZWQgaXMgQSBCVUcNCj4gYW5kIHNob3VsZCBub3QgYmUgbWVyZ2VkIGZp
cnN0IG9mIGFsbCAod2hpY2ggeW91IGNhbiBmaW5kIG91dCBieSANCj4gcmVhZGluZyBjb3JyZXNw
b25kaW5nIHRocmVhZCkuDQo+DQo+IGp1c3QgdHJ5IGNoZWNrb3V0IHRoYXQgY29tbWl0IGFuZCBh
cHBseSB5b3VyIHBhdGNoIG9uIHRvcCAtIG5ldHdvcmtpbmcgDQo+IHNob3VsZCBub3Qgd29yay4N
Cj4NCj4gQnV0IGl0IHdhcyBtZXJnZWQgYW5kIG5vdCByZXZlcnRlZCAtIGluc3RlYWQgdHdvIG1v
cmUgcGF0Y2hlcyB3ZXJlIA0KPiBhcHBsaWVkIHRvIGZpeCByZWdyZXNzaW9uLg0KPg0KPiAyKSBU
aG9zZSBjb21taXRzIGFyZSBkZWZpbmVkIGZpbmFsIGJlaGF2aW9yICh3aGljaCBpIGFnYWluIGV4
cGxhaW5lZCANCj4gYWJvdmUpIGFuZCB0aGF0IG5ldyBiZWhhdmlvciBoYXJkbHkgY2FuDQo+IGJl
IGNhbGxlZCAidGhlIGJ1ZyBpbiB0aGUgYXQ4MDN4IGRyaXZlciIgYXMsIHVuZm9ydHVuYXRlbHks
IHRoZXJlIHdlcmUgDQo+IG5vIGNvbW1vbiBjb25jbHVzaW9uIGhvdyBkZWZhdWx0IHZhbHVlcyBm
b3INCj4gUlgvVFggZGVsYXkgc2hvdWxkIGJlIGhhbmRsZWQgdnMgcGh5LW1vZGUgPSAicmdtaWkt
dHhpZCIvInJnbWlpLXJ4aWQiLg0KPiBPcmlnaW5hbGx5IG1hbnkgUEhZIGRyaXZlciBrZXB0IHRo
ZW0gZGVmYXVsdCAoYXMgcGVyIGJvb3QgDQo+IHN0cmFwcGluZy9ib290bG9hZGVyIGNvbmZpZ3Vy
YXRpb24pLCBidXQgbm93DQo+IHNvbWUgZHJpdmVyIChpbmNsdWRpbmcgYXQ4MDN4KSBzdGFydGVk
IGRpc2FibGluZyBSWCBkZWxheSBpZiANCj4gInJnbWlpLXR4aWQiIG9yIFRYIGRlbGF5IGlmICJy
Z21paS1yeGlkIi4NCj4NCj4gSGVuY2UsIHBscyB1cGRhdGUgY29tbWl0IG1lc3NhZ2UgYW5kIGFk
ZCBwcm9wZXIgZml4ZXMgdGFnLiBzbXRoIGxpa2U6DQo+ICJOb3cgYWZ0ZXIgY29tbWl0IDZkNGNk
MDQxZjBhZiBuZXQ6IHBoeTogYXQ4MDN4OiBkaXNhYmxlIGRlbGF5IG9ubHkgDQo+IGZvciBSR01J
SSBtb2RlIHRoZSBkcml2ZXIgd2lsbCBmb3JjaWJseSBkaXNhYmxlDQo+IFJHTUlJIFJYIGRlbGF5
IGlmIHBoeS1tb2RlID0gInJnbWlpLXR4aWQiIGlzIHNwZWNpZmllZCBpbiBEVCB3aGljaCANCj4g
d2lsbCBicmVhayBuZXR3b3JraW5nIG9uIC4uDQo+DQo+IEhlbmNlIGNoYW5nZSAuLiB0byBlbnN1
cmUgLi4uDQo+IEZpeGVzOiAiDQo+DQo+DQoNClllcywgdGhhdCBwYXJ0IGlzIGNsZWFyIHRvIG1l
LCBhbmQgSSBhbSBub3Qgc2F5aW5nIHlvdSBhcmUgaW5jb3JyZWN0LA0Kb25seSB0aGF0IEkgd291
bGQgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSBhYm92ZSBjb21taXQgcG9wcyB1cA0KKHNpbmNlIGl0
IG1ha2VzIG5vIHNlbnNlIHRvIG1lIGFzIHdlbGwsIG15IG93biBjb21taXQpLiBBbmQgdGhlIHJl
YXNvbg0KaXMgcmF0aGVyIHNpbGx5LCBJIGd1ZXNzLi4uIEkgZml4ZWQgaXQgb24gbWFzdGVyLCB0
aGVyZWFmdGVyIGNoZWNrZWQgdGhlIA0KNS4xIGJyYW5jaCwNCndoaWxlIGtlZXBpbmcgdGhlIGZp
eGVkIGR0Yi4uLiA6KA0KDQpMZXQgbWUgY2hlY2sgdGhhdCBhbmQgSSB3aWxsIHNlbmQgYSB2Mi4g
TGlrZWx5IHRvbW9ycm93DQooSSBhbSBub3QgbmVhciB0aGUgZGV2aWNlIGF0IHRoZSBtb21lbnQp
Lg0KDQpSZWdhcmRzLA0KDQpKZXJvZW4NCg0K
