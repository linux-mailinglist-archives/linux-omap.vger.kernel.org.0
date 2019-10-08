Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71012CFF14
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 18:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfJHQmv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 12:42:51 -0400
Received: from mail-eopbgr10129.outbound.protection.outlook.com ([40.107.1.129]:62532
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726138AbfJHQmv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 12:42:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp9/7TZOL+JQhhZis1fnQch0lKhrOGl5El76MynekUTHDho2MrjBL6877ZAypgUUVk0V3AaxNxkn+9nkE8J4/MQW+WHZr/F5HPndOz3rAM1ypLy09jT/+UQkcH8yegWbHdo0nf5k0GW6PpMhawGnoDG5207bp9A2InbwDMM0wzRyk6Bg24F7t/uWG328zYcPk5xOGjO2Q46U6SbJUQTdB/RmRit1ZZ3oz3dbZFQW/q3jXlm7rqI3ufWoQ5K1hyXu1i6PlvNpKKM2JSc5xdskRTKFuNexJA//OAxbZ1a/z1CNWa/AzYbN387uPXE+eLUeqQXnmwrkGDNLKMNbKzPtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hetplaNK77tsE1ORzZ46JT/WxlSAplenEzaXRqzKxp8=;
 b=hZaPd8mLhMWowYMEL5S6rdNwQtp5WL0PVQUpDeutJAFl9+/Mci0q0s7ezaOh0vEOlfWPiMfpali8xICCs3YjnEU/JgTkPId8KnYoac9BXo94buFVCI2DANFZeCBU2qrNH52E017IKlJiplLt6nxOd0oWmvLHNZjbn1sG5y8LrFyjseJlY1X6OM9SjsklO1T+U+0OmpiVVMb5DUKHPrINxkXjw1YfIbX/FK7Jh6uKyk5Iq8K32CqkzSoOZdyYuT3uIXBiDfQw7QY3zDIhtUdv2Jgt0O/9PJEJ6WbPi//ctZZ3v/uqjdba6kx5ELWN50iBXcfTRe0MnlYxFfWEQ/8vjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hetplaNK77tsE1ORzZ46JT/WxlSAplenEzaXRqzKxp8=;
 b=e064i82hoQKWSz86JyNewv+3aO8F5RwVFl9YKRcAZX39C3nO/T8vVsnMCewXD51AodXP8Ybi3QCAInxPiWdceeaATwAZ5rEUv4KLVOxUIPQdx1c5kJv46LwDCmiBnq06n4+0RRyVEhl8e/3ClJNiYuwc3WiHfcTDiX1hDEk244o=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2528.eurprd07.prod.outlook.com (10.168.133.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.13; Tue, 8 Oct 2019 16:42:47 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c%9]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 16:42:47 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAFGYQD///NzgIAILT2AgAA9LID//+GwAIAAB/aA
Date:   Tue, 8 Oct 2019 16:42:47 +0000
Message-ID: <4fa5393d-0b2c-4b8c-128a-81ab05a14a82@victronenergy.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
 <20191008161416.GG5610@atomide.com>
In-Reply-To: <20191008161416.GG5610@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2001:1c01:3bc5:4e00:71f7:17:8b3a:e5f1]
x-clientproxiedby: AM4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::19) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c1b6bda-bee2-4976-6ad6-08d74c0e8cbe
x-ms-traffictypediagnostic: VI1PR0701MB2528:
x-microsoft-antispam-prvs: <VI1PR0701MB2528D137CF1D6C6F9E3CB127C09A0@VI1PR0701MB2528.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(199004)(189003)(4326008)(186003)(6436002)(99286004)(6116002)(6486002)(2906002)(6246003)(76176011)(66556008)(31686004)(66946007)(71200400001)(102836004)(36756003)(66476007)(25786009)(6916009)(64756008)(66446008)(52116002)(6512007)(229853002)(71190400001)(305945005)(65956001)(65806001)(53546011)(256004)(386003)(7736002)(6506007)(14454004)(446003)(11346002)(31696002)(86362001)(58126008)(54906003)(316002)(486006)(46003)(5660300002)(478600001)(81156014)(8936002)(81166006)(8676002)(2616005)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2528;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rQTwgVADyjSlbhBQffTH9lz9Sjnq3D2SiNNz+kwxIjA8TwsRiUgbYnJpagjIvFct+vEo3GnGq2/jtS0Ow2+ONDCAJthqb3PSoP6ZZ8wLnHUeKfVAf2zjaRYOqDIiC9tkIjYHk/6g2jgwZfA/4zrVRBfmseUUafsy9bgIWShO6y3aTNijDhdIMbhsAZdRAZZFw5OQacGm7Sizd5stmNeK1nGn86Sgmbzt8hZxTjVAqTH14p1ZsTMQV0dhGWXHDgmfbfV5il+dTGTAqGj0fluBxXvNE4ZDYf/Q3lw76lBAg04RXV7ESOTeyiOrOmcf6y0TFGr27lpxQyf3sP2/1DfEmYGx0MME1b5V0r+OQp9TDHyn2OEhQG0MEOGQjjnV2IaZCotQpxg7OiEn+7CbkUl6Llm9z19kdOQRC+f8ZHtR1k4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D3318AB959123469B049ABE63C6EF67@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1b6bda-bee2-4976-6ad6-08d74c0e8cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 16:42:47.2476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlF8xztmSSwo41mTeffQeJ2XUC+mAIu7CD7DTouBrBxu/Z4Xh9tcg6JnVokp3oXDZLrRAdnWzUpXhQ+p98Kh4ZmzC+KVf2dgh03Sv8wDmfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2528
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gVG9ueSwNCg0KT24gMTAvOC8xOSA2OjE0IFBNLCBUb255IExpbmRncmVuIHdyb3RlOg0K
PiAqIEplcm9lbiBIb2ZzdGVlIDxqaG9mc3RlZUB2aWN0cm9uZW5lcmd5LmNvbT4gWzE5MTAwOCAx
NjowM106DQo+PiBIZWxsbyBUb255LA0KPj4NCj4+IE9uIDEwLzgvMTkgNDoyMyBQTSwgVG9ueSBM
aW5kZ3JlbiB3cm90ZToNCj4+PiAqIEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaS5zdHJhc2hr
b0B0aS5jb20+IFsxOTEwMDMgMDI6MzJdOg0KPj4+PiBPbiAwMy8xMC8yMDE5IDExOjE2LCBKZXJv
ZW4gSG9mc3RlZSB3cm90ZToNCj4+Pj4+IEZ1cnRoZXJtb3JlIDQuMTkgaXMgZmluZSwgc28gdGhl
cmUgaXMgbm8gbmVlZCB0byBpbmNsdWRlIGl0IGluIHN0YWJsZQ0KPj4+Pj4gYW5kIGhhdmUgYSBu
b3RlIHRvIG1ha2Ugc3VyZSBhbHNvIG90aGVyIHBhdGNoZXMgYXJlIHJlcXVpcmVkIGV0Yy4NCj4+
Pj4gSGVuY2UgYWxsIGFib3ZlIHBhdGNoZXMgd2VudCBpbiA1LjEgaXQgd291bGQgYmUgY29ycmVj
dCB0byBtZW50aW9uIG9ubHkNCj4+Pj4gNmQ0Y2QwNDFmMGFmIG5ldDogcGh5OiBhdDgwM3g6IGRp
c2FibGUgZGVsYXkgb25seSBmb3IgUkdNSUkgbW9kZQ0KPj4+IEplcm9lbiwgY2FuIHlvdSBwbGVh
c2Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIHdpdGggdGhlIGZpeGVzDQo+Pj4gdGFnIGNoYW5nZWQ/
DQo+Pj4NCj4+IEZvciBjb21wbGV0ZW5lc3MsIHRoZXJlIGlzIG5vICJGaXhlcyB0YWciIGFzIHlv
dSBtZW50aW9uZWQuDQo+PiBUaGUgY29tbWl0IG9ubHkgcmVmZXJzIHRvIGFub3RoZXIgY29tbWl0
IHdoaWNoIGludHJvZHVjZXMNCj4+IGEgcHJvYmxlbS4NCj4gV2VsbCBwbGVhc2UgYWRkIHRoZSBm
aXhlcyB0YWcsIHRoYXQgd2F5IHRoaXMgd2lsbCBnZXQNCj4gcHJvcGVybHkgYXBwbGllZCB0byBl
YXJsaWVyIHN0YWJsZSBrZXJuZWxzIHRvbyA6KQ0KDQpCdXQgNC4xOSBpcyBmaW5lLCB0aGlzIGlz
IGFuIGlzc3VlIGluIDUuMSBhcyBpbiBFT0wuLi4NCkkgcmVhbGx5IGRvbid0IHVuZGVyc3RhbmQg
d2h5IEkgc2hvdWxkIHdhc3RlIHRpbWUNCnRvIGZpZ3VyZSBvdXQgd2hhdCBoYXBwZW5lZCBleGFj
dGx5IGR1cmluZyB0aGUgNS4xDQpyZWxlYXNlIGN5Y2xlLi4uDQoNClJlZ2FyZHMsDQoNCkplcm9l
bg0KDQo=
