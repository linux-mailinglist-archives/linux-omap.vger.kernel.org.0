Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830E636FA4
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2019 11:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfFFJQ2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Jun 2019 05:16:28 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:11492 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfFFJQ2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Jun 2019 05:16:28 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Nicolas.Ferre@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Nicolas.Ferre@microchip.com";
  x-sender="Nicolas.Ferre@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Nicolas.Ferre@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Nicolas.Ferre@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; 
   d="scan'208";a="33338295"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2019 02:16:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Jun 2019 02:16:10 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 6 Jun 2019 02:16:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bceBaSHhJMb3EgK19IHCXoZ4gyVaVTLvxxmaZJIMaH4=;
 b=x6Lg9EPzsFazBp8bZx4GrMJZxRHB8/4G/LlRvQMZenq4FTZnTQGQXndQh8xTuzXQqVq2mAs4RN04McOjW1nL/kqoKCDXTSwwaNhhsq7KTMFMCy2DneVQELChCVP83qwPH+NUF29cjolfjDQC52+1sdkbYRtCzwfptYlAxjogG+I=
Received: from MWHPR11MB1662.namprd11.prod.outlook.com (10.172.55.15) by
 MWHPR11MB1901.namprd11.prod.outlook.com (10.175.54.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 09:16:06 +0000
Received: from MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3]) by MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3%6]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 09:16:06 +0000
From:   <Nicolas.Ferre@microchip.com>
To:     <krzk@kernel.org>, <arm@kernel.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <linux@armlinux.org.uk>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <vz@mleia.com>,
        <slemieux.tyco@gmail.com>, <jason@lakedaemon.net>,
        <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <aaro.koskinen@iki.fi>,
        <tony@atomide.com>, <dinguyen@kernel.org>,
        <marc.w.gonzalez@free.fr>, <mans@mansr.com>, <liviu.dudau@arm.com>,
        <sudeep.holla@arm.com>, <lorenzo.pieralisi@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
        <linux-omap@vger.kernel.org>
CC:     <geert+renesas@glider.be>
Subject: Re: [PATCH v2] ARM: configs: Remove useless UEVENT_HELPER_PATH
Thread-Topic: [PATCH v2] ARM: configs: Remove useless UEVENT_HELPER_PATH
Thread-Index: AQHVHEh4SI32peV3o0KU04KHNcXAcQ==
Date:   Thu, 6 Jun 2019 09:16:06 +0000
Message-ID: <58ffd0ff-42e8-1011-0329-65957717de72@microchip.com>
References: <1559636093-26005-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1559636093-26005-1-git-send-email-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27)
 To MWHPR11MB1662.namprd11.prod.outlook.com (2603:10b6:301:e::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a49eea-bdcb-4b81-d366-08d6ea5f9ace
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR11MB1901;
x-ms-traffictypediagnostic: MWHPR11MB1901:
x-microsoft-antispam-prvs: <MWHPR11MB19011A9D7523C0FF4B3D9D76E0170@MWHPR11MB1901.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(39860400002)(366004)(396003)(189003)(199004)(2201001)(71190400001)(71200400001)(66066001)(68736007)(81166006)(186003)(229853002)(7736002)(66446008)(81156014)(31686004)(6246003)(110136005)(2501003)(8936002)(6436002)(316002)(256004)(31696002)(14444005)(6486002)(8676002)(99286004)(6116002)(478600001)(7406005)(86362001)(53936002)(36756003)(305945005)(76176011)(386003)(6512007)(486006)(6506007)(53546011)(4326008)(5660300002)(66556008)(25786009)(446003)(72206003)(11346002)(26005)(3846002)(66946007)(2616005)(66476007)(73956011)(476003)(102836004)(14454004)(52116002)(7416002)(2906002)(64756008)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1901;H:MWHPR11MB1662.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aOPfPjcH62v5I+K00C/2ptOY3keWHUNavpa36Q0WSExy9NPWaxaHK2WOM2yUGFKW1V8RVmf/tgzhKAxCQGrmMd6xjzigiV+lndKGzXZ/UVmb02IHKQHtfyuBXrqgreNLZmhAA8pwiB+jNyiUlvrB0oqDWs0Q9dOMHMnAvJSEKU5spQNbhqDL1txjVYxqkEi1NhD19Ax/OEOFfeiUWdiI+aCh59vEDuhZMLgxMM6qRCtBWgNcrjawCOMJnpZ9MFgWsyfMm/5Sbo104ak7bBpS99IrjjqrtYMT83ySurIwRSD9d2Zd3ifsWmXQqkKFawwXj2DO8QGV80N6gzeiFBUKd2cAfCmSz8QLigI34PDPW8VKKZy30xAQqxNxpjV+ZpiKj6wc+OyXHx3S0Rm0BoPGLm76Uu+J8VyzkiO0xzNED94=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F16069370D8F9048951C20B6228FFB3B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a49eea-bdcb-4b81-d366-08d6ea5f9ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 09:16:06.2464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nicolas.ferre@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1901
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gMDQvMDYvMjAxOSBhdCAxMDoxNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gUmVt
b3ZlIHRoZSBDT05GSUdfVUVWRU5UX0hFTFBFUl9QQVRIIGJlY2F1c2U6DQo+IDEuIEl0IGlzIGRp
c2FibGVkIHNpbmNlIGNvbW1pdCAxYmUwMWQ0YTU3MTQgKCJkcml2ZXI6IGJhc2U6IERpc2FibGUN
Cj4gICAgIENPTkZJR19VRVZFTlRfSEVMUEVSIGJ5IGRlZmF1bHQiKSBhcyBpdHMgZGVwZW5kZW5j
eSAoVUVWRU5UX0hFTFBFUikgd2FzDQo+ICAgICBtYWRlIGRlZmF1bHQgdG8gJ24nLA0KPiAyLiBJ
dCBpcyBub3QgcmVjb21tZW5kZWQgKGhlbHAgbWVzc2FnZTogIlRoaXMgc2hvdWxkIG5vdCBiZSB1
c2VkIHRvZGF5DQo+ICAgICBbLi4uXSBjcmVhdGVzIGEgaGlnaCBzeXN0ZW0gbG9hZCIpIGFuZCB3
YXMga2VwdCBvbmx5IGZvciBhbmNpZW50DQo+ICAgICB1c2VybGFuZCwNCj4gMy4gQ2VydGFpbiB1
c2VybGFuZCBzcGVjaWZpY2FsbHkgcmVxdWVzdHMgaXQgdG8gYmUgZGlzYWJsZWQgKHN5c3RlbWQN
Cj4gICAgIFJFQURNRTogIkxlZ2FjeSBob3RwbHVnIHNsb3dzIGRvd24gdGhlIHN5c3RlbSBhbmQg
Y29uZnVzZXMgdWRldiIpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPg0KPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoN
Cj4gMS4gUmVtb3ZlIHVucmVsYXRlZCBmaWxlcy4NCj4gMi4gQWRkIEdlZXJ0J3MgYWNrLg0KPiAt
LS0NCj4gICBhcmNoL2FybS9jb25maWdzL2FjczVrX2RlZmNvbmZpZyAgICAgICAgICB8IDEgLQ0K
PiAgIGFyY2gvYXJtL2NvbmZpZ3MvYWNzNWtfdGlueV9kZWZjb25maWcgICAgIHwgMSAtDQo+ICAg
YXJjaC9hcm0vY29uZmlncy9hbTIwMGVwZGtpdF9kZWZjb25maWcgICAgfCAxIC0NCj4gICBhcmNo
L2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgICAgICB8IDEgLQ0KPiAgIGFyY2gvYXJt
L2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZyAgICAgIHwgMSAtDQo+ICAgYXJjaC9hcm0vY29u
Zmlncy9hdDkxX2R0X2RlZmNvbmZpZyAgICAgICAgfCAxIC0NCg0KWy4uXQ0KDQo+ICAgYXJjaC9h
cm0vY29uZmlncy9zYW1hNV9kZWZjb25maWcgICAgICAgICAgfCAxIC0NCg0KZm9yIGF0OTEgKGF0
OTFfZHRfZGVmY29uZmlnICYgc2FtYTVfZGVmY29uZmlnKToNCkFja2VkLWJ5OiBOaWNvbGFzIEZl
cnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQoNCj4gICBhcmNoL2FybS9jb25maWdz
L3NvY2ZwZ2FfZGVmY29uZmlnICAgICAgICB8IDEgLQ0KPiAgIGFyY2gvYXJtL2NvbmZpZ3Mvc3Bl
YXIxM3h4X2RlZmNvbmZpZyAgICAgIHwgMSAtDQo+ICAgYXJjaC9hcm0vY29uZmlncy9zcGVhcjN4
eF9kZWZjb25maWcgICAgICAgfCAxIC0NCj4gICBhcmNoL2FybS9jb25maWdzL3NwZWFyNnh4X2Rl
ZmNvbmZpZyAgICAgICB8IDEgLQ0KPiAgIGFyY2gvYXJtL2NvbmZpZ3Mvc3BpdHpfZGVmY29uZmln
ICAgICAgICAgIHwgMSAtDQo+ICAgYXJjaC9hcm0vY29uZmlncy90YW5nbzRfZGVmY29uZmlnICAg
ICAgICAgfCAxIC0NCj4gICBhcmNoL2FybS9jb25maWdzL3RjdF9oYW1tZXJfZGVmY29uZmlnICAg
ICB8IDEgLQ0KPiAgIGFyY2gvYXJtL2NvbmZpZ3MvdTMwMF9kZWZjb25maWcgICAgICAgICAgIHwg
MSAtDQo+ICAgYXJjaC9hcm0vY29uZmlncy91ODUwMF9kZWZjb25maWcgICAgICAgICAgfCAxIC0N
Cj4gICBhcmNoL2FybS9jb25maWdzL3ZleHByZXNzX2RlZmNvbmZpZyAgICAgICB8IDEgLQ0KPiAg
IGFyY2gvYXJtL2NvbmZpZ3MvdmlwZXJfZGVmY29uZmlnICAgICAgICAgIHwgMSAtDQo+ICAgYXJj
aC9hcm0vY29uZmlncy94Y2VwX2RlZmNvbmZpZyAgICAgICAgICAgfCAxIC0NCj4gICBhcmNoL2Fy
bS9jb25maWdzL3pldXNfZGVmY29uZmlnICAgICAgICAgICB8IDEgLQ0KPiAgIGFyY2gvYXJtL2Nv
bmZpZ3MvenhfZGVmY29uZmlnICAgICAgICAgICAgIHwgMSAtDQo+ICAgNjkgZmlsZXMgY2hhbmdl
ZCwgNjkgZGVsZXRpb25zKC0pDQpbLi5dDQotLSANCk5pY29sYXMgRmVycmUNCg==
