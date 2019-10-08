Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF937CFF6C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 18:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbfJHQ7e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 12:59:34 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com ([40.107.14.133]:6630
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729193AbfJHQ7e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 12:59:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn1ODnR2lrxCJABsGsArdQ+QzEPFCbCIAc35lUg7Gy2+O+BTimzybi/tA/YpOTBY5R+wGFJJvSidWxiR62ggzTHKpj2ompFmyYxfrRAOfCFw23N0VUWDsa7LHLwpJTf7mqPHuP6+FQDwYAa9Fa9nzvY7fdnoSvF1p3CMTSvLJh2ui5dtamOEH0FUA6tfkPJXUozOeZOFAlc+fTtpMZQMIASVo9c0SzOj1pSgc/AdapYGQYgAAjaVe7QVJ+FDDsK/WNEEuVs8l3efjIbUCfpgFVEwmhIuPPpFnxMQDJyGk7p0ZL1SpqflTSEDQJNAYGXKxfIJNz2H2tiQWJ4DoAAQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEw7pUjozMnzC7qt2kR2QOT7iD/dGDHJL+Vtrnqvk3o=;
 b=Rl1mwxcppykNcEX8mv1VSG8r6ev0RcUi1kwqWzNDZap6n9G+e/MHGWVdjq8vhRSggpvhhar1X567aOG7B6I7I87y06UjKbjm0vLAoT/mSuVJIiLWOmA1hZUWA2W0JaTlkZLRl/dO+DC/HI9+jOuG7OQZEPqhK/6sqXnY9vCX2uFjXtV6PyJttNBl4YisVPNwgG+FivDwIt2wEfUnQzV2yDMFoty2EtzrRQd4QKOhCpFR1g41Qj6xMaAiSXezNcM490Rct++vJUt8tuiWa0ZhVsLHAHWsIOpD2zQMPDgBh1eaQVhpsy6u9aByyHRybI3LT5ykdQQoTYZiIS6dTxpsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEw7pUjozMnzC7qt2kR2QOT7iD/dGDHJL+Vtrnqvk3o=;
 b=rCFjsytz+DAzq8maaKtU0QXgaFKMpYTg7MLQzXO4/DAjOQF6Tm0XoLTYDrajIzqyz1aVchNeVd77QRqATKmz2/FmPAZqoBYz3fH+wjvIWeLJ5QycUvCRurVC0p1YLHlY4m3ZKjyLzNFHQmVYvPSZwuEcvBktErljg6nYtvFKfo4=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2349.eurprd07.prod.outlook.com (10.168.137.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.11; Tue, 8 Oct 2019 16:59:30 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c%9]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 16:59:30 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAFGYQD///NzgIAILT2AgAA9LID//+GwAIAAB/aAgAACjgCAAAIfgA==
Date:   Tue, 8 Oct 2019 16:59:30 +0000
Message-ID: <a8a72544-7f30-c896-22e4-7d85bd0b4235@victronenergy.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
 <20191008161416.GG5610@atomide.com>
 <4fa5393d-0b2c-4b8c-128a-81ab05a14a82@victronenergy.com>
 <20191008165154.GH5610@atomide.com>
In-Reply-To: <20191008165154.GH5610@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2001:1c01:3bc5:4e00:71f7:17:8b3a:e5f1]
x-clientproxiedby: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36a8acc1-5b23-4ada-e449-08d74c10e2c8
x-ms-traffictypediagnostic: VI1PR0701MB2349:
x-microsoft-antispam-prvs: <VI1PR0701MB2349844A60FD0CF13850448FC09A0@VI1PR0701MB2349.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(189003)(199004)(66556008)(6246003)(31686004)(66476007)(2616005)(81166006)(186003)(6116002)(54906003)(76176011)(52116002)(256004)(58126008)(6512007)(81156014)(14454004)(8936002)(478600001)(64756008)(66446008)(2906002)(476003)(8676002)(6486002)(36756003)(25786009)(4326008)(53546011)(102836004)(386003)(6506007)(229853002)(6436002)(66946007)(486006)(316002)(65956001)(65806001)(305945005)(5660300002)(46003)(71190400001)(71200400001)(99286004)(6916009)(86362001)(446003)(7736002)(31696002)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2349;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJLNqdAxpPkeUx8J3IRzj2sPCY9BDzK+U4vOxDO0eSYsn9pJu4+b3qdgaErlXTcswT1JnOthRxUGcr5KJDJBVloMTlow83bHcXMXPKK0Wkj4W8Dr9TpPMTPOnlkYV8YbV6fdOcbwU/b2OMiZKjcXJkDPa+F3UmsMjgA0QqtjWCl5AlMUAhAvWGYWT4zExZYB1UpimVuKu+2OK3/FyfrOeS0e7fYFxb07NABiMC/g6gb3UrKMMoRqG5sHYawMX0AN/wp6U03LHwyXzM3iX74umSKcYlvBS0+BnZjuVW4COSUebJYn8GVINeGJHoNW0r4TkfP3GQT4teVHun7pG0AVY2fTyQIypguJBcMlKNm4e5wDpfqPel4s55V7vvse3WUk7+566KN8lLKtLyMdIh7DrB07drY4+bMP43UfvC1Jax8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <05C402CF9A686B4D92CCC988E7E130AA@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a8acc1-5b23-4ada-e449-08d74c10e2c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 16:59:30.6107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqQ+R1yXnTe3XvSKmni63gp31KKekAZL0lm2m2WEN22UyHcQTGSGbCmMBwHNuhRC4bgJjckWIhJe2hbbhFodRMXKacfdgoZbC+lqiR8VZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2349
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGksDQoNCk9uIDEwLzgvMTkgNjo1MSBQTSwgVG9ueSBMaW5kZ3JlbiB3cm90ZToNCj4gKiBKZXJv
ZW4gSG9mc3RlZSA8amhvZnN0ZWVAdmljdHJvbmVuZXJneS5jb20+IFsxOTEwMDggMTY6NDNdOg0K
Pj4gSGVsbG8gVG9ueSwNCj4+DQo+PiBPbiAxMC84LzE5IDY6MTQgUE0sIFRvbnkgTGluZGdyZW4g
d3JvdGU6DQo+Pj4gKiBKZXJvZW4gSG9mc3RlZSA8amhvZnN0ZWVAdmljdHJvbmVuZXJneS5jb20+
IFsxOTEwMDggMTY6MDNdOg0KPj4+PiBIZWxsbyBUb255LA0KPj4+Pg0KPj4+PiBPbiAxMC84LzE5
IDQ6MjMgUE0sIFRvbnkgTGluZGdyZW4gd3JvdGU6DQo+Pj4+PiAqIEdyeWdvcmlpIFN0cmFzaGtv
IDxncnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+IFsxOTEwMDMgMDI6MzJdOg0KPj4+Pj4+IE9uIDAz
LzEwLzIwMTkgMTE6MTYsIEplcm9lbiBIb2ZzdGVlIHdyb3RlOg0KPj4+Pj4+PiBGdXJ0aGVybW9y
ZSA0LjE5IGlzIGZpbmUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gaW5jbHVkZSBpdCBpbiBzdGFi
bGUNCj4+Pj4+Pj4gYW5kIGhhdmUgYSBub3RlIHRvIG1ha2Ugc3VyZSBhbHNvIG90aGVyIHBhdGNo
ZXMgYXJlIHJlcXVpcmVkIGV0Yy4NCj4+Pj4+PiBIZW5jZSBhbGwgYWJvdmUgcGF0Y2hlcyB3ZW50
IGluIDUuMSBpdCB3b3VsZCBiZSBjb3JyZWN0IHRvIG1lbnRpb24gb25seQ0KPj4+Pj4+IDZkNGNk
MDQxZjBhZiBuZXQ6IHBoeTogYXQ4MDN4OiBkaXNhYmxlIGRlbGF5IG9ubHkgZm9yIFJHTUlJIG1v
ZGUNCj4+Pj4+IEplcm9lbiwgY2FuIHlvdSBwbGVhc2Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIHdp
dGggdGhlIGZpeGVzDQo+Pj4+PiB0YWcgY2hhbmdlZD8NCj4+Pj4+DQo+Pj4+IEZvciBjb21wbGV0
ZW5lc3MsIHRoZXJlIGlzIG5vICJGaXhlcyB0YWciIGFzIHlvdSBtZW50aW9uZWQuDQo+Pj4+IFRo
ZSBjb21taXQgb25seSByZWZlcnMgdG8gYW5vdGhlciBjb21taXQgd2hpY2ggaW50cm9kdWNlcw0K
Pj4+PiBhIHByb2JsZW0uDQo+Pj4gV2VsbCBwbGVhc2UgYWRkIHRoZSBmaXhlcyB0YWcsIHRoYXQg
d2F5IHRoaXMgd2lsbCBnZXQNCj4+PiBwcm9wZXJseSBhcHBsaWVkIHRvIGVhcmxpZXIgc3RhYmxl
IGtlcm5lbHMgdG9vIDopDQo+PiBCdXQgNC4xOSBpcyBmaW5lLCB0aGlzIGlzIGFuIGlzc3VlIGlu
IDUuMSBhcyBpbiBFT0wuLi4NCj4+IEkgcmVhbGx5IGRvbid0IHVuZGVyc3RhbmQgd2h5IEkgc2hv
dWxkIHdhc3RlIHRpbWUNCj4+IHRvIGZpZ3VyZSBvdXQgd2hhdCBoYXBwZW5lZCBleGFjdGx5IGR1
cmluZyB0aGUgNS4xDQo+PiByZWxlYXNlIGN5Y2xlLi4uDQo+IEhtbSBzbyB3aGF0J3MgdGhlIGlz
c3VlIHdpdGgganVzdCBhZGRpbmcgdGhlIGZpeGVzIHRhZyBHcnlnb3JpaQ0KPiBzdWdnZXN0ZWQ6
DQo+DQo+IDZkNGNkMDQxZjBhZiAoIm5ldDogcGh5OiBhdDgwM3g6IGRpc2FibGUgZGVsYXkgb25s
eSBmb3IgUkdNSUkgbW9kZSIpDQo+DQo+IE5vIG5lZWQgdG8gZGlnIGZ1cnRoZXI/DQoNCkdyeWdv
cmlpIGRvZXNuJ3Qgc3VnZ2VzdCB0byBhZGQgYSBmaXhlcyB0YWcsIGp1c3QgdG8gY2hhbmdlIHRo
ZSByZWZlcmVuY2VkDQpjb21taXQgdG8gYW5vdGhlci4gT2J2aW91c2x5IEkgd291bGQgbGlrZSB0
byB1bmRlcnN0YW5kIHdoeSBhbm90aGVyIGNvbW1pdA0Kc2hvdWxkIGJlIHJlZmVyZW5jZWQuIEFu
ZCB0aGVuIEkgc2hvdWxkIHJlYWQgYW5kIHBhcnNlIHRoZSByZXNwb25zZSwgc28gdGhlcmUNCmlz
IG5vIHNwZWNpYWwgcmVhc29uLCBqdXN0IHRpbWUuLi4NCg0KUmVnYXJkcywNCkplcm9lbg0KDQo=
