Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A48CFCBD
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfJHOq7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:46:59 -0400
Received: from mail-eopbgr70092.outbound.protection.outlook.com ([40.107.7.92]:11758
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725939AbfJHOq6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:46:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Na9Z1oTAB4RgGv3yFK20tELnMhnFY+GqiRiqQrJ0HeT8TinXcd6MiGTQm99rzBZvHfCBY9aLKqNGRoCnPCyzdnED9QoLxWNRlOmq73py+CfVRtbnFcLR6NiLHnDPr+jQa9bJApJaF/fuGlXjN5XhU0t+9U6oiYIg5g7ww1rK+zjcshDE5r3B1Q73sFybbL46LTNi7o79kBO4wvws6QaVenS93fyFb7FdOgxgYBF3jtiQauX84YAmhyMXyF8k8Pr78bhrQlpT7urQWfR/rwnAo6o3FqJChIud1rWozqQNtl2KkAu0A+NzkfC4L2ZrNHLKtwiADX7BRZjESUEGpYaRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOe7GHC2RVI/ZQ6GQlc6KTu4q9QEC1FYz/m42sAJdNE=;
 b=W+hAGELJcdHa6E9seyLHrCi2vHb4Sd3VbhPv8ATsRibZww8Kd+C0p0pm9BIG2pAezUrMkJwstGILLRrBll6hwOy/nx+oazfEBh7f8ozps3QvXOtv6AoVinGse7xIwfS4m2Uh6udhzeTAuDn5ePiFWP0+dkxahPDEga1aCxUyonTQmbWRjWi+4EQ6N1ne/EN8A+rzpOIrpEknptg4Yeoa3SnAWW87FBFeWMCbITEVMvZ7dGfN/ssUl1QVvpXtF0dfP6yEhOA/mfFhJseFiGpsGOOm2Di85Gt8TLdWgwvS2XCEnkxtky6evI/DFfAtW+8vgefuO3oWVi2i+1eyylDLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOe7GHC2RVI/ZQ6GQlc6KTu4q9QEC1FYz/m42sAJdNE=;
 b=Od9Jac7DDnrsxH3nxWk1EDnBJqxO19SoiBtUbECIbeC4PEviD7nM4Gb+3yXeSBMCB1R98wOQt+nLK5cotKO5d6aJCLAo/lwGSe1mg7H1ah8hrYXU+qDC7aaiTgtlxikmhfwGxTjrtoV5xo21ImAxKsGiONvEW13yfhRPZxj9hVg=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2415.eurprd07.prod.outlook.com (10.168.138.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.15; Tue, 8 Oct 2019 14:46:52 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c%9]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 14:46:51 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAFGYQD///NzgIAILT2AgAAGboA=
Date:   Tue, 8 Oct 2019 14:46:51 +0000
Message-ID: <e3f824c9-92bd-1750-bdd4-dce61e618008@victronenergy.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
In-Reply-To: <20191008142349.GE5610@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2001:1c01:3bc5:4e00:58f1:a5aa:4c48:a7ed]
x-clientproxiedby: AM0PR02CA0100.eurprd02.prod.outlook.com
 (2603:10a6:208:154::41) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79d92dc1-557d-4b96-a9dc-08d74bfe5ad6
x-ms-traffictypediagnostic: VI1PR0701MB2415:
x-microsoft-antispam-prvs: <VI1PR0701MB24152E784635D3EBBD44AA29C09A0@VI1PR0701MB2415.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(199004)(189003)(4744005)(486006)(5660300002)(81156014)(305945005)(478600001)(86362001)(25786009)(81166006)(31696002)(7736002)(8936002)(8676002)(476003)(46003)(186003)(446003)(11346002)(6506007)(386003)(52116002)(76176011)(102836004)(316002)(53546011)(110136005)(54906003)(58126008)(2616005)(99286004)(36756003)(71200400001)(6486002)(229853002)(71190400001)(256004)(66556008)(66946007)(66446008)(66476007)(64756008)(6246003)(6512007)(2906002)(31686004)(65806001)(6436002)(14454004)(65956001)(4326008)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2415;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PFzaOCfpXzfJ0IzUzxkzOVDk4QadGP8+eQL4yG3iQNQFGDQnS8rF2inhCV2trJib/aMWVZJ9dhEixWKl3lQ8XgzjVNmDezYR9C77okr9E2dtEuBpFQ+kSy+gEcFODsdK7JE63KS/8aiOGFEw8w8ktK07XRbKI+smhx0/QDhJ9RQ2V9yZYWB4nQQSiepHc+dLPfg9fh1HJXd7JZesEFRHsK7OxTI+trYQwu+YmKuqoBwTv8BwMWhXi494p9b5W2f1rxw03lWHNxnwuRu823NXdBCgbja2Z0QpCE0ZKXLSVO6W/VhBBnfWnbXPAK/nCw7hLpe91Z6uIkQQwH5ESSTT8WCOLTRsqcytPBG4myTyp9L09M4LncFzthEhJEQNldeWpTUs0QeO58cxYJOOUYArvUo2fTPWbpveQERnAIu043Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D6D65D68B507E4CBD6C706EF6CA5632@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d92dc1-557d-4b96-a9dc-08d74bfe5ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 14:46:51.6487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmEONF7CJPz85G8hRDKLUK5kIa1TYhLjCSfqTJLPtnwmF162sCKO4pUgn7Oz32f0omHe/bUMRfoFRsG3lsDjFdIZGs1b0fjDsuvroNA/pkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2415
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gVG9ueSwNCg0KT24gMTAvOC8xOSA0OjIzIFBNLCBUb255IExpbmRncmVuIHdyb3RlOg0K
PiAqIEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+IFsxOTEwMDMg
MDI6MzJdOg0KPj4gT24gMDMvMTAvMjAxOSAxMToxNiwgSmVyb2VuIEhvZnN0ZWUgd3JvdGU6DQo+
Pj4gRnVydGhlcm1vcmUgNC4xOSBpcyBmaW5lLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGluY2x1
ZGUgaXQgaW4gc3RhYmxlDQo+Pj4gYW5kIGhhdmUgYSBub3RlIHRvIG1ha2Ugc3VyZSBhbHNvIG90
aGVyIHBhdGNoZXMgYXJlIHJlcXVpcmVkIGV0Yy4NCj4+IEhlbmNlIGFsbCBhYm92ZSBwYXRjaGVz
IHdlbnQgaW4gNS4xIGl0IHdvdWxkIGJlIGNvcnJlY3QgdG8gbWVudGlvbiBvbmx5DQo+PiA2ZDRj
ZDA0MWYwYWYgbmV0OiBwaHk6IGF0ODAzeDogZGlzYWJsZSBkZWxheSBvbmx5IGZvciBSR01JSSBt
b2RlDQo+IEplcm9lbiwgY2FuIHlvdSBwbGVhc2Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIHdpdGgg
dGhlIGZpeGVzDQo+IHRhZyBjaGFuZ2VkPw0KDQoNCk5vdCBhdCB0aGUgbW9tZW50LiBJIGFtIHJp
Z2h0IHRoYXQgdGhlIG1lbnRpb25lZCBjb21taXQNCmlzIHRoZSBmaXJzdCBvbmUgdG8gYnJlYWsg
dGhlIGV0aGVybmV0LiBHcnlnb3JpaSBpcyByaWdodCBpdA0Kc2VlbXMgdGhhdCB0aGF0IGNvbW1p
dCBzaG91bGRuJ3QgYWZmZWN0IGl0LCB5ZXQgaXQgZG9lcy4NCg0KU28gSSB3b3VsZCBsaWtlIHRv
IHVuZGVyc3RhbmQgaG93IGl0IGJyZWFrcyB0aGluZ3Mgc28gSSBjYW4NCnVwIHdpdGggYSBzZW5z
aWJsZSBjb21taXQgbWVzc2FnZSAob3Igd2UganVzdCBkcm9wIHJlZmVyZW5jZQ0KdG8gb3RoZXIg
Y29tbWl0cyBzbyBJIGRvbid0IGhhdmUgdG8gZGlnIHRocm91Z2ggdGhlIDUuMSBoaXN0b3J5LA0K
dGhlIHBhdGNoIGJ5IGl0c2VsZiBpcyBhbHNvIHZhbGlkKS4NCg0KUmVnYXJkcywNCg0KSmVyb2Vu
DQoNCg==
