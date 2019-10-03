Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C05C99A1
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 10:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfJCIQu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 04:16:50 -0400
Received: from mail-eopbgr80097.outbound.protection.outlook.com ([40.107.8.97]:14823
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725613AbfJCIQu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 04:16:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZqYaigtA9y73xoUn/rZDzSXA7TL7lgAWx6TVANyKfOiytafdIAjJVc5hdvxOPlf+cwmrFPADKpjtCzsweAJ1riHrIb/qqmrBdWKJFPUrVBWsJui8zeUJXuDRhGVwG+bHKXsv1XBYHF8PlMPeC2ADYyrmGC2M21rUM2scCAPrcQVmWnCnVO1ED7AQEOF5x2M6sXvAuzp+q5vC7jwNKtTp7jysHwtBvr/fjOary3Vmp3q9c/pnnh4KKi5CkilvH1Vc13aI3brRiaTIumNgdxZAf8zFr33Z8FbZIUUa1NrvTEXFjUqewbUf2557Ix0BSFKIo4Uos4zSh6pJFo0KoGjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH+cbg4+TqV2TOXBSNXhCukVnIsqCRqtOdhafimfPfA=;
 b=flxxnnid5cqETR/cHKCssgoc0NBrPGgX37OC9fOFMcJNs0thKyOpQLPmDfS0VUUFSNhQVR/5B49TuHm2CCg6t1DlV2QfBBOTDlCYlQGIiQr9k+rh2U+d9Urq9rpEnazgAiAEsDRRKLHAooMKgSyPKtzZofiiUUdZzjzRpUP5iyOBNr+Ix89pbA+TaLpUPM2Qfi7c4MZd3Yyks57TmDSP2aVZRP8kkG2RTsR0uYWMO9HNyMgeuv+kWnBNZBlR+aa8iInficswyhYupkFAQgmu/1ateKjozwyBBf6I6MRNWg/lK3tmlbOKRRao8z+ppUjhnoErjbvWhJ4fe7UhCaxQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH+cbg4+TqV2TOXBSNXhCukVnIsqCRqtOdhafimfPfA=;
 b=x4jSe6lb3+HY2SEFFxTFmgTJfba+zzLblFGDSjf1W16kxFbKixCqJ1nJPuu5UAdQIzY9JJQKbH/vbLOts4ae9FZL5c4vgqkTo197Yz3N43aMBUOKZN6jF3GZqb6IEPRwIBpq7n5eQDBZryLLctXva/NCZT5P3OvvBDMH1+ptpkU=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
 VI1PR0701MB2749.eurprd07.prod.outlook.com (10.173.80.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.21; Thu, 3 Oct 2019 08:16:46 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::dc92:2e0d:561a:fbb1]) by VI1PR0701MB2623.eurprd07.prod.outlook.com
 ([fe80::dc92:2e0d:561a:fbb1%8]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 08:16:46 +0000
From:   Jeroen Hofstee <jhofstee@victronenergy.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Topic: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Thread-Index: AQHVeQdofKkOWkby2kaW5oWVx4ahWqdHbuCAgAEk2gA=
Date:   Thu, 3 Oct 2019 08:16:46 +0000
Message-ID: <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
In-Reply-To: <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.126.8.10]
x-clientproxiedby: AM0PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::14) To VI1PR0701MB2623.eurprd07.prod.outlook.com
 (2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a159a511-797e-411f-806e-08d747da082e
x-ms-traffictypediagnostic: VI1PR0701MB2749:
x-microsoft-antispam-prvs: <VI1PR0701MB2749DFC242E75BC6ED459DEDC09F0@VI1PR0701MB2749.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(199004)(189003)(81166006)(86362001)(6486002)(31696002)(81156014)(99286004)(71200400001)(7736002)(71190400001)(8676002)(6116002)(3846002)(31686004)(14454004)(4744005)(478600001)(2906002)(229853002)(6512007)(2501003)(6246003)(66946007)(5660300002)(66476007)(66556008)(64756008)(66446008)(14444005)(4326008)(66066001)(36756003)(256004)(65806001)(305945005)(8936002)(110136005)(65956001)(6436002)(25786009)(102836004)(54906003)(11346002)(58126008)(446003)(316002)(2616005)(53546011)(476003)(6506007)(386003)(186003)(52116002)(486006)(76176011)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2749;H:VI1PR0701MB2623.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: victronenergy.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zL5IXKhQ911gDMySrESPIpcJtYog3zFE49keerOfBznCtuswrf7YwmvwPIgF1UsspAqxaz74HbY/gM/Dl06Nzw4LYYvQtAGOUPN/fmy1wKQWhAb+6A5IDuY2pIe2hp/KUemU7qWn6UjW8jaCQGIWQcUK8+7qPJCY7JBSldAEMhxZVx0zJjRrXHSMEtQIEsuIaoPkU97qiW4fFm7Yr/ruVLOuTH/3cDFzmGq0AoSgXY+DKt6ks37okuBhJAiX8nJrRYqiDOT5dP2ey2vxq1DZguGVgbU/HN5LWO6rXKBjYS2WF8SJbwaFUj+h3Bm1yvvhI3bj4WJSSUE4k3ChsosDEkciOGvnwxbSODYO+sc4dObTP1RKpLnz7DwbQEab2CKSbtg7RT3++9Ogww19SthWerCTKL/IfPLAhhVkddQSvo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E369A5D265D0944841A4077B9CB9A5C@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a159a511-797e-411f-806e-08d747da082e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 08:16:46.4701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjP1RxZNM+nDR4pToRzdV85TULpxgbDmtyxpe07rZp9sCsbrD+cb7Rd79p07dDwTuz4mHGyltiDLTUyfNq55Ep6mjvQpOhD7xT2GXtI73oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2749
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gR3J5Z29ycmksDQoNCk9uIDEwLzIvMTkgNDo0OCBQTSwgR3J5Z29yaWkgU3RyYXNoa28g
d3JvdGU6DQo+DQo+DQo+IE9uIDAyLzEwLzIwMTkgMTI6NTQsIEplcm9lbiBIb2ZzdGVlIHdyb3Rl
Og0KPj4gY2QyOGQxZDZlNTJlOiAoIm5ldDogcGh5OiBhdDgwM3g6IERpc2FibGUgcGh5IGRlbGF5
IGZvciBSR01JSSBtb2RlIikgDQo+PiBicm9rZQ0KPj4gdGhlIGV0aGVybmV0IG5ldHdvcmtpbmcg
b24gdGhlIGJlYWdsZWJvbmUgZW5oYW5jZWQuDQo+DQo+IEFib3ZlIGNvbW1pdCBpcyBpbmNvcnJl
Y3QgKGJ5IGl0c2VsZikgYW5kIHRoZXJlIGFyZSBmZXcgbW9yZSBjb21taXRzIA0KPiBvbiB0b3Ag
b2YNCj4gaXQsIHNvIHBscy4gdXBkYXRlIHJlZmVyZW5jZSB0byBjb21taXQocykNCj4NCj4gYmIw
Y2U0YzE1MTdkIG5ldDogcGh5OiBhdDgwM3g6IHN0b3Agc3dpdGNoaW5nIHBoeSBkZWxheSBjb25m
aWcgbmVlZGxlc3NseQ0KPiA2ZDRjZDA0MWYwYWYgbmV0OiBwaHk6IGF0ODAzeDogZGlzYWJsZSBk
ZWxheSBvbmx5IGZvciBSR01JSSBtb2RlDQo+DQo+DQpJIGRvbid0IHNlZSB3aHkgdGhhdCBpcyBy
ZWxldmFudC4gVGhlIG1lbnRpb24gcGF0Y2ggaW50cm9kdWNlcyBhDQpiYWNrd2FyZHMgaW5jb21w
YXRpYmlsaXR5IGZvciB0aGUgZGV2aWNlIHRyZWUuIFRoZSBwYXRjaGVzIHlvdQ0KbWVudGlvbiBk
b24ndCBmaXggdGhhdCBhbmQgaGVuY2UgYXJlIHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KDQpG
dXJ0aGVybW9yZSA0LjE5IGlzIGZpbmUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gaW5jbHVkZSBp
dCBpbiBzdGFibGUNCmFuZCBoYXZlIGEgbm90ZSB0byBtYWtlIHN1cmUgYWxzbyBvdGhlciBwYXRj
aGVzIGFyZSByZXF1aXJlZCBldGMuDQoNClJlZ2FyZHMsDQoNCkplcm9lbg0KDQo=
