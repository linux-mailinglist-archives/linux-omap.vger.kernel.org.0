Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A812CFE6D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 18:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfJHQCv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 12:02:51 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com ([40.107.8.91]:40270
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726211AbfJHQCv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 12:02:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8stZ60f+48Y9X0BHh7NwFVnjpf1uY1/lTXpvIAX6uwsm6+a6gH4qy8jyxLYgiy32S0kjUB+bbv9az0Ymtmvc2W6abo3UGrV3p0TtwcsIgPsTH+F0xCKpCBQnEkJY6q5GYNaubOAv03WAbloC5hiyt7Tn01jQS7vAvfhA6IvXHOH/L52sTiCx5jChpPYYtbedbWl4HsphX9H1m+bWfoVOY+VY2wyQSlgJtZ5nuNQXTlMjLxD2gbEzJ68vjJVmyB4JvgT7CIpebf8FKxcoc/oCoUPbBk3xOvmv4fRy7hSLxacBVSGvMWgpbfOW2twS6oSObuV1lH6V1fBfPKxqb8RpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPbiwc2u+DOMU9ienA5ScEKJdDxtjzBcZLyObfwc8Oc=;
 b=Q1AYipSEIGvOReD7qORCA1XVtudkrPrs0317EidXxUqbNxLaGXmOwBXlpX30uvTf4B6iYVQu/sF7HXnmtw9De+fYzWTI6EGf/Qy4ii4HxdncpV5Y+jvzwbIvLmLs/Kua090jp0gEZFqa4hvoSbA5K/1ZG0DWbHiLzHI38GAlIgGc92jke02zVRNtAe+4zV2P9T2271B3WwGrqsHq46dYzZAsuZVlNLzG94qVDCK86MGSJKY4NWls8A6zz1m1TyYZxPch51lPdDP0JVzFIedklaPtAseRPmEZG/0jG9e3HuHBpa0/kKR0ZKu5n0RRJ29ZQGesjZhF8rrBb9d9ic6y0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPbiwc2u+DOMU9ienA5ScEKJdDxtjzBcZLyObfwc8Oc=;
 b=eWcS1Fu8ZckNzONUc+cioQp93IrnIoY8Ci4Z40KQwWvWfke3oDpPgr0TDSSsFI9puH01DOP69yc7qAlg31/QB51rXFEqBDMQxn4na5Mt4X4/PyjYRuH3funa9ElrAP6Vt6jhMcyz3wNvmCPexf9Oae95soI7XWGg/Pxsq04uB8w=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2767.eurprd07.prod.outlook.com (10.173.81.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.15; Tue, 8 Oct 2019 16:02:47 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::49b7:a244:d3e4:396c%9]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 16:02:47 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAFGYQD///NzgIAILT2AgAAbpYA=
Date:   Tue, 8 Oct 2019 16:02:47 +0000
Message-ID: <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
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
x-clientproxiedby: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ac11550-4419-4fcc-5913-08d74c08f613
x-ms-traffictypediagnostic: VI1PR0701MB2767:
x-microsoft-antispam-prvs: <VI1PR0701MB27675FD68D211F1B5AE4E4E0C09A0@VI1PR0701MB2767.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(199004)(189003)(58126008)(386003)(110136005)(31696002)(486006)(52116002)(76176011)(2616005)(446003)(476003)(11346002)(316002)(6506007)(54906003)(53546011)(46003)(102836004)(66476007)(2906002)(66446008)(64756008)(31686004)(6116002)(71200400001)(186003)(71190400001)(66946007)(66556008)(6512007)(4326008)(229853002)(6486002)(6436002)(305945005)(36756003)(7736002)(99286004)(81166006)(65806001)(65956001)(256004)(8936002)(8676002)(6246003)(5660300002)(14454004)(81156014)(4744005)(25786009)(478600001)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2767;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TkKtyQw/6461im1gKvbuxN2JmsgV978+sJVr79VB7FBMiAJ/Gcyb18k96CRQp8hjMOJxOPv1KIeNL4vz4r08LLEB4IhpIDBiVSwuNvaN9DNjMB8gpuOxLyrHlaNmMWhh1jpNH9yjnpEbNip9eJfDZh8cY7rN9p2XI61eUGK2HkjuJlGQlZNd6wl//fG0U48p1ZwgufHFTtqkfmVQlw7lqXDQNQ1agN0OvVzwfB41VjIWG/GnZJf9ho6sErxKHqXMsdLi7Y91KYohP+KlOl91sUolcj5a8i0uMb8FQnFPWNEmx8T24eHwD7p/PLRi/gUisolk4DEVOv/J3GxmabQ1JRzzuNB7t7xYwq+B4XhoLJ2jhM3rSCmRljIthN0A4w+2jx/xvQSmYVwW/a+cXgdilyY+SB9Yp5kOC2wlATgyfhQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D25751073CDE47498688199522BD3F1F@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac11550-4419-4fcc-5913-08d74c08f613
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 16:02:47.0885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52N2+ffncErrgmYFd24NIX/nDs2AmCdk65G11mNkcdQdQ/rxXcZr6NCADaSOx8WNVx6RNXfmLydECehXoWXsKhhUxQcg1R0Vft8BQzV1cBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2767
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
dGhlIGZpeGVzDQo+IHRhZyBjaGFuZ2VkPw0KPg0KDQpGb3IgY29tcGxldGVuZXNzLCB0aGVyZSBp
cyBubyAiRml4ZXMgdGFnIiBhcyB5b3UgbWVudGlvbmVkLg0KVGhlIGNvbW1pdCBvbmx5IHJlZmVy
cyB0byBhbm90aGVyIGNvbW1pdCB3aGljaCBpbnRyb2R1Y2VzDQphIHByb2JsZW0uDQoNClJlZ2Fy
ZHMsDQoNCkplcm9lbg0KDQo=
