Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7843218415
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 11:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgGHJqA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 05:46:00 -0400
Received: from mail-eopbgr1310073.outbound.protection.outlook.com ([40.107.131.73]:38196
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728041AbgGHJqA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 8 Jul 2020 05:46:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1ozSssE5jHsfCRSSARqi/XXCe8dsPVXepGEtnNpeyFM2MwK2H6hxujIfuQms7Vpi9LP+MtRv5yYTKavjLaweWST1Coq/smkkPD+1oBg6B1jZ234iFp66GQfHSYn9Ccu4z8NtoE1ywxmkFKUVFtD2FSDaIFO3x7JlQ+nRn+G9cCZ5QRu2xXgVhN8pOz7c0ILZU4FxwOhrbdxYh19q2r9pPwckVkq61UTleyj8THBqbz54d96K2OnFdKLkdgFrpX6hDUdCr0SpRL5ZxNOiFHHTntAeNrWZCa1c3q2NyMwfErGkTjRgg3pOOFqgsY+FseGia+A3leNWj8VFkk/YwWKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe7DPebEyz9uzBOgAvDp5r3SLssuuMtuJLUR5qSm6sw=;
 b=PF0G3RIe7bShiX0xmdmMPYkrtLB3fbYghCTJuAO1KiXsGsEmenoMQ750kOwaRsjJ7YdwIDOycr5jSUSauB7m9ajtwMpV/H8sYGynduBiwFVT3LL6woInZUnASBPRvrY/6o/kBMNen70yBGV9yBtOokUqbpM+DbMgGhrXxN7WDQ3/kalKjth+8NhzMniKvCaQOGWM+Bzv9c7MfLFuSWNH7NHlbxDiQhqOan5hhbPpu9/UE4cQqOanm3/ACPO89oj5yVRSeRUP4Zuqb8fwc5EEQHNQk4+yb7j+co1Umd4Cd0pNvi0arhg0GQ0z3bE8OK3g1JxtiVDPPjiu3fXDuK+Few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe7DPebEyz9uzBOgAvDp5r3SLssuuMtuJLUR5qSm6sw=;
 b=PMTwEesk/CIf98z6Wn7Ouc1p3CYmwKvZmWo9P7T04v1ZfZ4pqAd4WFZu5dzTJZ/cgcRR+hUWe//w5vwrNtKH8444CeuC0zqYrpRgzfgdOJvRAGkitrDZX9c+1tUk1IlSYCSoKtWXioPiyDQjW6icvxoRvZ1eWAmh0U2OEFoOjgU=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HKAPR01MB3570.apcprd01.prod.exchangelabs.com
 (2603:1096:203:c6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 8 Jul
 2020 09:45:56 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 09:45:56 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: am335x: add support for Moxa UC-8100A-ME
 open platform
Thread-Topic: [PATCH 2/2] ARM: dts: am335x: add support for Moxa UC-8100A-ME
 open platform
Thread-Index: AQHWVIgIYQwC0/nPRUKB94S+FbD0mqj9bd7A
Date:   Wed, 8 Jul 2020 09:45:56 +0000
Message-ID: <HK2PR01MB32816EAA7257124DD4A4CB6EFA670@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB328129CEA1A9294A8715CE28FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200707175655.GA5849@atomide.com>
In-Reply-To: <20200707175655.GA5849@atomide.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 067b3221-7153-4a61-c883-08d82323b65a
x-ms-traffictypediagnostic: HKAPR01MB3570:
x-microsoft-antispam-prvs: <HKAPR01MB357032EDB9291EB57C5C61A0FA670@HKAPR01MB3570.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wm8t3pT+MdQmF4VpcLdcZYXLkxXf9RmrwvNrExrnP2E/Lzkopoj6luUwm3hHropvIU0yz/F3aF8ge6LzQszgl8hCelVMCVpWjVE0WY/b1yGwv3DHycjPdZjHAGItHOJmmN9Xc6upsoK6YQJQTXxpdyTbhb655knfOuIEoQAY2z0p0UziD4SkCq+ilWYI4b5piAe8VLYA7cmWTTjgJ8FrdkEtBeZ0Xszy6Kzic7U1P/fCSlYXVLtvgA3UIM0ThELwrOOVImFUcdEe1OamYqvgRf2etYRIyRCzIc2e/tFVIG2+Slq43h2wXVMKmA49Bdvd2amKrZIYlCRvpSS6sRouFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(4744005)(7696005)(26005)(52536014)(186003)(85182001)(478600001)(8936002)(8676002)(2906002)(4326008)(6916009)(55016002)(33656002)(316002)(54906003)(6506007)(9686003)(76116006)(71200400001)(66476007)(86362001)(66446008)(66556008)(64756008)(5660300002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: p3eWaLdwgTGu8PV00gTbuuOMzAU7TWa2sit7VgBxvRVAagKyVp3vKUXowqz4UKkP/MdvkF7RANM9ZBw4NugHT3eyFvu7TnNZKl9mM7KIk6lGsh67oj7jSnEyO4LoD80H88eiDxSLGWXNfanzrcsYxJMD6aihLC+eSEyX/PUfR83TOzzJ9RhI3AZc+JXEEPK32R+w9vsT624lVhzGjXlV/bsGCZ9+cI86wn+PGMVr/NbR06vtZhtw95Dry6d1MziRycM8/g4dvUywxnbHBk6kF4EabBjM+3PRj37NzINfSkQR2SIn1MpoBYWa1jVPc/81TNBCITSEpitrK5oZeGYO1CnynWnpZXp3B2BDkBAyjpTy41vv227//H0jioxxccNG6Xn6pJUSHlRlQ7xLilYMnkTJa7rOKfXP2WysiixGFYvS2oKEFtJO3azjmYwItGLj/Eo1frweaKoheZd/sw86V0C4zZho6s9ay3ZsGfisnkY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067b3221-7153-4a61-c883-08d82323b65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 09:45:56.1766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3AVsQ/9Dxh8VHP/2UXq1bUwC4bpeiFUhp3Wx4rz8Pee1+f4c2IaD0/NYt9oX3SC97bkSdSq0zUJ/1861Th84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR01MB3570
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIEFSTTogZHRzOiBhbTMzNXg6IGFkZCBz
dXBwb3J0IGZvciBNb3hhDQo+IFVDLTgxMDBBLU1FIG9wZW4gcGxhdGZvcm0NCj4gDQo+ICogSm9o
bnNvbiBDSCBDaGVuICjpmbPmmK3li7MpIDxKb2huc29uQ0guQ2hlbkBtb3hhLmNvbT4gWzIwMDcw
NyAwMzoyNF06DQo+ID4gVUMtODEwMEEtTUUgaXMgYWR2YW5jZWQgb2YgVUMtODEwMC1NRS1ULCBh
bmQgVUMtODEwMC1NRS1UIGlzDQo+IGRlcHJlY2F0ZWQuDQo+ID4NCj4gPiBVQy04MTAwQS1NRSBw
cm92aWRlcyBsYXJnZXIgUkFNIGFuZCBlTU1DLCBiZXR0ZXIgaW5wdXQgY3VycmVudCB0aGFuDQo+
ID4gVUMtODEwMC1NRS1UJ3MsIGFuZCBpdCBzdXBwb3J0cyBzZWxlY3RhYmxlIExURSBtb2R1bGUg
Zm9yIFVTL0VVL0FQQUMuDQo+IA0KPiBTbyB3aGF0IGFib3V0IHRoZSBleGlzdGluZyB1c2VycyBv
ZiBVQy04MTAwLU1FLVQ/DQo+IA0KPiBUbyBtZSBpdCBzZWVtcyB5b3Ugc2hvdWxkIGp1c3QgYWRk
IGFtMzM1eC1tb3hhLXVjLTgxMDAtY29tbW9uLmR0c2kgb3INCj4gc2ltaWxhci4gQW5kIHRoZW4g
aGF2ZSBtaW5pbWFsIGR0cyBmaWxlcyBmb3IgZWFjaCBtb2RlbC4gVGhhdCB3YXkgeW91IGNhbg0K
PiBlYXNpbHkga2VlcCB0aGUgc3VwcG9ydCBVQy04MTAwLU1FLVQgYXJvdW5kLg0KDQpUaGFua3Mg
Zm9yIHlvdXIgZ29vZCBzdWdnZXN0aW9uLCBJJ2xsIHRha2UgdGhpcyBpbmZvIGZvciBvdXIgaW50
ZXJuYWwgZGlzY3Vzc2lvbi4NCg0KQmVzdCByZWdhcmRzLA0KSm9obnNvbg0KDQo+IA0KPiBSZWdh
cmRzLA0KPiANCj4gVG9ueQ0K
