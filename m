Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C432F5BEA
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 09:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbhANH7k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 02:59:40 -0500
Received: from mail-am6eur05on2048.outbound.protection.outlook.com ([40.107.22.48]:10720
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727976AbhANH7j (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Jan 2021 02:59:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqZQtxRdUuNphbCqqPsqk+nrsA8Hms2OseZWCn40IXmd+2cmCdoOf4oG8MoZ2fpeAR2DB3NIOD1hSZGQDyme/0IiNtnbsDyRclNhjvyNBp+zfW53ALTKOv+9GAWfFeYGIt+JFx9irJLM3RQ6GI4mKsZNQBcz1AKJDzH0A6OXwTc84VSH/ZsvUa+pUIT98P4AQuZGn7q3j93zkg82HnqfkIheADD7FUltqUTOv5/1z8hh0sZ/A2qUMFtVeP9jMvGVfsffUcasEL8Dh69PzNfCBP3n+Tdh3cx4QZofsqsIzwALqiQ9XuGN+iASIAM5GEy3eKvG5g99ZZDifNd2NDIk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHCGJyHfcQv3hKmy/vV7EHwokfHp8EkLpyxE4Gy7ZW8=;
 b=GkfttDmT0NkX/RucJ69cISxs4sWpuQE4D7vauwxrnbHrleaH7N5BddYXUEoa4jgmpr1uqGuaALxVLm4Hi8tYUlIsQh1nscipZhVHNluObsxgVcq1YdiHK7q1GJbTzvwcUtQF4bTPP52arKUUd3QX2EMpi12ESSWR2Dvoi2K6HdmRGAfl+b2WapnGyYq87yIIGquZFl+vKPv93gMWdIgUA9BUURBcG36zmGdbTiuM8zo5g8h4hlS2jA6XPO4LmoFAA9WFf/n2d4a++1OjASdJZZdBljl7Xhb4g8vHQcWmdfwXCdDqMOy3Lfuifi3Db7JmSMNTuwa9FUJwGKZQr1uICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHCGJyHfcQv3hKmy/vV7EHwokfHp8EkLpyxE4Gy7ZW8=;
 b=na1LJVy4jtA2FLG3FDRhqlXyKRB6XjCKuDQrv8LnQaJsQ2lsOgrC6pJxcVm/j9ks1EtEerfHwUZMMSHG4ngzs3AvNdELVt3Z79xObd0B0rUAqCgW9oD4eRAKff9JS6ZNDGth6AAFAGzwGhA+llh9ovnj0GokPU79F4D4dTj3zGU=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2764.eurprd03.prod.outlook.com (2603:10a6:3:ee::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Thu, 14 Jan 2021 07:58:48 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 07:58:48 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "tony@atomide.com" <tony@atomide.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "rogerq@ti.com" <rogerq@ti.com>, "s-anna@ti.com" <s-anna@ti.com>,
        "bcousson@baylibre.com" <bcousson@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "d-gerlach@ti.com" <d-gerlach@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "t-kristo@ti.com" <t-kristo@ti.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Thread-Topic: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Thread-Index: AQHW6cZvkfsEN6ZhKUOK+ALMm/xx+qolvVmAgAAFFQCAAAF+gIAAC6CAgADobICAAAqngA==
Date:   Thu, 14 Jan 2021 07:58:47 +0000
Message-ID: <1c7301145600dabbb95402c7df0cf00b7bdd7fdd.camel@fi.rohmeurope.com>
References: <20201026112222.56894-1-tony@atomide.com>
         <20201026112222.56894-14-tony@atomide.com>
         <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
         <X/8ei0o9ULpRdx7T@atomide.com>
         <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
         <X/8kDzoADvcnNHxC@atomide.com> <X/8tz/2v4bnbF0TZ@atomide.com>
         <X//wx/oSTpXKpY75@atomide.com>
In-Reply-To: <X//wx/oSTpXKpY75@atomide.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00b6431d-9502-44a9-78cd-08d8b8623964
x-ms-traffictypediagnostic: HE1PR0302MB2764:
x-microsoft-antispam-prvs: <HE1PR0302MB2764204C02A63612ACF11136ADA80@HE1PR0302MB2764.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2PUaX9EjfgOaJOAoMKIeu5FDpJsVDKEdbmQCZ7qIXOn64gFAh1b3Lv/wauSNOlgv2RlHmn1ZYYqnHxVagqhcLwV1JCYEK4I4VtYihgtijOZmZuIjB4siTBr4MXBfxt3HbuoGvbSMMqVq3ZBNWRgBE8zrvEdL7ySL5yPQsBWV9im36mkhVQmYruDWsdLw7x2l1Y3Xp7OUkb8IZhA3rIkVXgBcnPzJwVkUhcCOu53fyhJ1qLeLmtgC3FCo21i9PSvtd9fr5ZXh26OD5ew2+VOUrCzefqiDPBSrJvnuo1xDehMjdoO1dmkYxLBXt+Y3HoAiSmnraywVgyTkUJ6YVuRwivN+Yk5gWg3+KXzTJzIrtVBGvTP0ilK8sJf6MOYtcvlUG650JbXbl+mwgIfL+JP9Iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39840400004)(396003)(346002)(366004)(6512007)(66476007)(478600001)(6486002)(3450700001)(5660300002)(64756008)(66946007)(66556008)(8676002)(86362001)(186003)(8936002)(76116006)(83380400001)(6506007)(4326008)(110136005)(54906003)(316002)(2616005)(2906002)(71200400001)(66446008)(26005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SUsrMENBNlp4QnJkSWQvQ293REY1cDExVUt3L3lQWWpsbVFITkxGdkV3dnpp?=
 =?utf-8?B?djRrZTVPcGxvYXFYYXZZZHYvTm9rblk5V3RvUzZhdzVvY2ZWL3k0bnovUFht?=
 =?utf-8?B?cGdDM1RNdTYrWCtrODA2N0FaZW5wQ2VIRHZYa3Q0NWJpQ1YyeTdYbHk1ME03?=
 =?utf-8?B?dzhFTXRKLzFmN1o4RnlMWm9kRDBNelRoUTF2b3hXY05Cb05yRGczS0w2bmll?=
 =?utf-8?B?VnJ3b0FKdlh2RmZpMnhtZlVxUW0xczg2ZHNOY2taOW5KWkd1ZmRGWm13SHhs?=
 =?utf-8?B?eWczYnpIRG9iTDlDWTBvN1ZaUTBZUisybHhvZ1gzT3I0bFJRTWQ0ckh2OXha?=
 =?utf-8?B?ZHdMMTNvcEJvL05BQmsvY0hmaERrV0VvRUNrWUJ5SHQvcGlGa29oMGVMWWs2?=
 =?utf-8?B?UUVic2xnUXJWekI5M3ZjejV4NytBZ0FGNGlWQmk5WE5zMnM1d2JNU0w3bzVm?=
 =?utf-8?B?eEk5K201cUZuOUY2VEE2UFAwbFBydWdpVFZZb1ZKdUwvYTh0dXpiTmlOdkQz?=
 =?utf-8?B?eEowUUdGZnViYWZRVUdFZzgyZGJYYkkycUJKYjZQZmYyRVBRbXFwTitUcmZI?=
 =?utf-8?B?KzdwQmI3eitkMWhLbCszVFBOUTJYb0xtLzlxay9yd01zdEJwNUpVU1JybVpI?=
 =?utf-8?B?aWFQcDhpMS9UVytzaGVWbmRGYldQdno1TlZwUzBmeHRwWFRaaWJyUnRSUGVX?=
 =?utf-8?B?Z0FYYlA5TnQyK2ZDTDZtNERBbHQxZ3VmZzVtejRHSkpUUjBUUzZ0Z2MyUDF6?=
 =?utf-8?B?NzFmdXdneUhQOTZYSjFUenV6a29PZ0JmMC9pUnBTT2lmRVcvcmNYU2VDY1g5?=
 =?utf-8?B?TWNSbE5wYm8zaTJKcVVuMzNnRlVTbWlGaVo4Mm10QTFKRVUzc1pHY3RmQkd5?=
 =?utf-8?B?TnFLRSt1NXN3MUc0ZFF3Z2hlVTJheThkNkkyNE84TWRVZmZjR0ljTEdTOUJY?=
 =?utf-8?B?OE5uVENpRnBLYXZJSTAxUzZGdnlIQkhSVnZYUmxVMXVaN0t2L2kvMGt0cFpB?=
 =?utf-8?B?YVMyNHVSd3R2Wjl1UnNibXRlekp1Z0h0UExyZmhYWFBIL1BoTkkvbFBFYU9I?=
 =?utf-8?B?Rzk3bkw0aGhYZTFaTGc0WHR2SXlacDl5d0RuazB4dmZERWE0RlhKODFvbFRT?=
 =?utf-8?B?Vm9QYTNzUWRGVUtzaDVwQy8xQWFUSHRQSEUxQzIxMkFzVGVMbVJzZFRSYWRp?=
 =?utf-8?B?VG5UZElEc3FVNzlJSTRPaDI4L0hHdXgwcm5sWTUxbW56cDNwYVJ5dU13K3hy?=
 =?utf-8?B?LzFuNEtMYi9TSkhQb01Jb0JEaVRCTmNnLzJEYWU3Uzk0QjVxV25GdmlMdFln?=
 =?utf-8?Q?rFHiX8ax9QE55BEj00N1MgAz98r70yzCt6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <04906E591168FD4F8E413A55DE9B8C67@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b6431d-9502-44a9-78cd-08d8b8623964
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 07:58:48.1387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 717cBuhNs86sl+X4okGCEYO1YxRWqS2+Y51IS6Qx08v32Z5N60ebfo8NPXFQVr9ZXBV6z2He/NX6VKj2C0gLKacONJN9PRP073Zr9LDb02fLpoMEv3kOGUxlmfpCBY06
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2764
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

TW9ybmluZyBUb255ICYgQWxsLA0KDQpPbiBUaHUsIDIwMjEtMDEtMTQgYXQgMDk6MjAgKzAyMDAs
IFRvbnkgTGluZGdyZW4gd3JvdGU6DQo+ICogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNv
bT4gWzIxMDExMyAxNzozMF06DQo+ID4gKiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29t
PiBbMjEwMTEzIDE2OjQ4XToNCj4gPiA+ICogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4gWzIxMDExMyAxNjo0Ml06DQo+ID4gPiA+IE9uIFdlZCwgSmFuIDEzLCAyMDIx
IGF0IDU6MjMgUE0gVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbQ0KPiA+ID4gPiA+IHdy
b3RlOg0KPiA+ID4gPiA+IFN0cmFuZ2UsIGJiYiBoYXMgYmVlbiB3b3JraW5nIGZvciBtZSB3aXRo
IE5GU3Jvb3QsIHRoYXQncw0KPiA+ID4gPiA+IHdpdGgNCj4gPiA+ID4gPiBvbWFwMnBsdXNfZGVm
Y29uZmlnLiBDYXJlIHRvIHNlbmQgeW91ciAuY29uZmlnIHNvIEkgY2FuIGdpdmUNCj4gPiA+ID4g
PiBpdCBhDQo+ID4gPiA+ID4gdHJ5IHRvbW9ycm93Pw0KPiA+ID4gPiANCj4gPiA+ID4gU2VudCBi
eSBwcml2YXRlIGVtYWlsLg0KPiA+ID4gDQo+ID4gPiBPSyB0aGFua3MuDQo+ID4gPiANCj4gPiA+
ID4gSnVzdCB0cmllZCBvbWFwMnBsdXNfZGVmY29uZmlnLCBhbmQgaXQgYWxzbyBoYW5ncyBkdXJp
bmcgYm9vdC4NCj4gPiANCj4gPiBIbW0gYW5kIEkganVzdCB0cmllZCBhbmQgYmJiIHN0aWxsIGJv
b3RzIE5GU3Jvb3QgZm9yIG1lIGF0IGNvbW1pdA0KPiA+IDVhMjMwNTI0Zjg3OSAoIkFSTTogZHRz
OiBVc2Ugc2ltcGxlLXBtLWJ1cyBmb3IgZ2VucGQgZm9yIGFtMw0KPiA+IGw0X3drdXAiKS4NCj4g
PiANCj4gPiA+IEhtbSBPSy4gV2lsbCBnaXZlIGl0IGEgdHJ5IHRvbW9ycm93Lg0KPiANCj4gTm90
IHN1cmUgd2h5IHlvdXIgYmJiIHdvdWxkIHByb2R1Y2UgYWxsIHRoZSBkZWZlcnJlZCBwcm9iZSB3
aGlsZSBtaW5lDQo+IHdvbid0Lg0KPiANCj4gSG93ZXZlciwgSSd2ZSBub3RpY2VkIHRoYXQgd2Ug
bmVlZCB0aGUgZm9sbG93aW5nIHBhdGNoIG9uIG9tYXA0LzUgYW5kDQo+IGRyYTcgd2hlbiBwbGF5
aW5nIHdpdGggdXBkYXRpbmcgdGhlbSB0byB1c2UgZ2VucGQuDQo+IA0KPiBNYXliZSB0aGlzIGFs
c28gZml4ZXMgeW91ciBib290IGlzc3VlIGlmIHlvdSBjYW4gZ2l2ZSBpdCBhIHRyeT8NCj4gDQoN
CkkgZG8gYWxzbyBleHBlcmllbmNlIHRoZSBib290IHByb2JsZW0gZGVzY3JpYmVkIGJ5IEdlZXJ0
Lg0KDQpIZWFkIGJlaW5nOg0KYjA2MjVhZmUzMDUyNTNkMDgzMWFmOTI4OWIzN2M5MDZjMThhNzgx
Yg0KQVJNOiBPTUFQMis6IERyb3AgbGVnYWN5IHBsYXRmb3JtIGRhdGEgZm9yIGFtMyBtcHVzcw0K
DQo9PiBCQkIgYm9vdHMgT2suDQoNCkhlYWQgYmVpbmc6DQo1YTIzMDUyNGY4NzkyNmYyNGQ2Mzdm
ZTYyZmQ2ODlmN2Y4NmY1MDM2DQpBUk06IGR0czogVXNlIHNpbXBsZS1wbS1idXMgZm9yIGdlbnBk
IGZvciBhbTMgbDRfd2t1cA0KDQo9PiBCQkIgYm9vdCBmYWlscy4gKEkgZG9uJ3QgaGF2ZSBhbnkg
ZGVidWcgcGFyYW1ldGVycyA9PiBsYXN0IHRoaW5nIEkNCnNlZSBpbiBVQVJUIGlzIGZyb20gdUJv
b3Q6DQoNCkJ5dGVzIHRyYW5zZmVycmVkID0gODk4NDkgKDE1ZWY5IGhleCkNCktlcm5lbCBpbWFn
ZSBAIDB4ODEwMDAwMDAgWyAweDAwMDAwMCAtIDB4OTI4MjAwIF0NCiMjIEZsYXR0ZW5lZCBEZXZp
Y2UgVHJlZSBibG9iIGF0IDgyMDAwMDAwDQogICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBh
dCAweDgyMDAwMDAwDQogICBVc2luZyBEZXZpY2UgVHJlZSBpbiBwbGFjZSBhdCA4MjAwMDAwMCwg
ZW5kIDgyMDE4ZWY4DQoNClN0YXJ0aW5nIGtlcm5lbCAuLi4NCg0KSGVhZCBiZWluZyANCg0KNWEy
MzA1MjRmODc5MjZmMjRkNjM3ZmU2MmZkNjg5ZjdmODZmNTAzNiArIHRoaXMgcGF0Y2ggDQpBUk06
IGR0czogVXNlIHNpbXBsZS1wbS1idXMgZm9yIGdlbnBkIGZvciBhbTMgbDRfd2t1cCAoKyBwYXRj
aCkNCkJvb3Qgc3RpbGwgZmFpbHMgZm9yIG1lLg0KDQpQbGVhc2Ugbm90ZSAtIG15IGVudmlyb25t
ZW50IHRha2VzIHRoZSBpbnRlcm1lZGlhdGUgYnVpbGQgcmVzdWx0IGZpbGU6DQphcmNoL2FybS9i
b290L2R0cy8uYW0zMzV4LWJvbmVibGFjay5kdGIuZHRzLnRtcA0KDQphbmQgY29tcGlsZXMgdGhp
cyB3aXRoICctQCcgdG8gYWxsb3cgZnVydGhlciBvdmVybGF5cy4NCg0KQmVzdCBSZWdhcmRzDQoJ
TWF0dGkgVmFpdHRpbmVuDQoNCg==
