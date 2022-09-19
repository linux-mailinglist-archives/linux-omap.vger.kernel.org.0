Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C8C5BCBE7
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 14:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiISMhX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 08:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiISMhW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 08:37:22 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe07::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D25427FD6;
        Mon, 19 Sep 2022 05:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpdufQzjkI+NOqX1rab0ml+WzmN1HXtKVfuqyHu/omZvBp8F56YmjZY66ChgenQqfAte4Aozas4qGXqYsaGaxJwiuDQCttPnwltRlZyjWV3PYUvkVN+oCuLSyVNvSX9eqaIummRTekYCPwSX2n18zc5D96Wh4muqW0BDHYSfEfWp203m4wJrH5ScepAGrtCPfXGzGc07ckX4H5TiBKB+/9qSQ1sSPBQOqTZkn6E8E2zxL9ilvTaEWqDtws5AJC6oSeLQWEk6rEyct71umrmuOfomE8sWPzgK58RIRPsgnRgCI9iUbyVgYFjlP55nA3ULVCPOF/5j4MWGzjoMVKP+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+5IaRa33XWmHI1pR6qKRX4poGE1aJeAFyHiOXpq62E=;
 b=kFZ7AcTZ2ght2I823o/ofQjjGupH+xRh/j58CKYtYHuy+A01sYhLGL5y7QN6VLOZu8p2jcFeVT9kB0yNy/tqB7rG/Zb180R2Mp86KIL0P6jsptYayeqbGYKtzQIc4Yoop8cV34i3JhoWQjgd7SQv8uEY0Fq8FWKbeakTq6R+uQv8WoSTzpQBSE+NdXBO15dp03u5Y0WHNOoTabSJ0vLAIEdXsGenjmmAIcsOTDan+iQ+sJC+4PdajM/Lqqi6vB+e2F1UNpb85j/3z4Qb1rLWdoC4Q67A+BhQUIOROrj9SEMppGD0PgGRj+pECgVq+rbbgC/Hdqz9KL9fl7/LJy+8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+5IaRa33XWmHI1pR6qKRX4poGE1aJeAFyHiOXpq62E=;
 b=uStt7mHpraoxh3JlI4JzH+WXSW6UEXr6bALxd63biow6fXab31cLlv1QZof7lCxYW/w2reOz8fdstNE6hRaoNrNGXFtC1V6K6tSdYwabVj4U/XlADl0kM5dW5i05qN7mTnFbclkQgCe9fABhU7XjzVwdx2Qe7/pF5fDT2KYmcreMGo6wp8RrANfMDiqDr7vOQvUAKXKrxjYy1149WV8fqMyKtVf/3UQpRB+ht5Pq1fj2XohDFluydozdxjtV1J8W1iUAiQBqRbPRHG+jTgFdbS87OdQzyhZSaWexLpWTmvFEzHRnn7Cox7iI6bXlTIwVSOUtaA4kK1QYssMNbIDo1Q==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by DB4PR10MB6309.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 12:37:15 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656%4]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 12:37:15 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/3] memory: omap-gpmc: allow shared wait pins
Thread-Topic: [PATCH v5 1/3] memory: omap-gpmc: allow shared wait pins
Thread-Index: AQHYzAsM6L4nQgqy4kyNrA5ZU3cEJK3msQKA
Date:   Mon, 19 Sep 2022 12:37:15 +0000
Message-ID: <7c13efa554d12324d402690753c27a8c0e803867.camel@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
         <20220916120749.2517727-2-benedikt.niedermayr@siemens.com>
         <5d4d9412-6445-f3a3-0f86-6c41a37dca70@linaro.org>
In-Reply-To: <5d4d9412-6445-f3a3-0f86-6c41a37dca70@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|DB4PR10MB6309:EE_
x-ms-office365-filtering-correlation-id: 7242cc72-d6ae-48bf-6e4f-08da9a3baf15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BwKQ9DbpstdTF2/yLVTgi4eZxgavX0CJ6Mz1I5qQiCFKGvcjYcEq3P+Elv1ShD6W9SJF3/F7Oaoj35kGM/HT4rJRsEIErVP4r5IfbcxCnTHOsGtHPGBiOY80jHk4I4n91aUAYhYLmdpeBwNusQSqEuq9pn5FezCyPVzKhFDJFIBBZh4Zubrc9ma5QyT04WBGESE5QEraprAKE1RcLAn/Itp8I4NMDyUB54X9oPNiWhVSrq1jelWHQhkh9HlJs63Q1RZQD7eKUU1gYVWTmgzfjryGuI3oQSZ7nkpBxz5lGBNxMwMhqAoXQAHO9EN9na0CFATT66TaE/u1v0yXj2HOLsIS14EyBbxJmdU56doWhj9Qw8MXmBAcv57MOWsXM81we4u4w+KIEZoz+w3dlGg+87M7xmi1i4kkH9DzQn9ha2PUxVzDc1QPQDtzGuuNyKThtX6E0DSpS0i0+cXSaUwMR8RnpYRxPZTipX4zvZmIKAasQ7LFhOJdqdJfClLah6iFYaCQ9rt21ogYGVN9pXXFtEqMb4/QytvpoRmuJtBPvtf9JeWqpE/FAPz7kr+KH9kXdO9NPbcC7z36FVoeLhoG7LygRXEQyOxCDkAZmldK6rlzA9lhVqgdItCBvRYXothWh/W2i8CRwJU9PPgJ1orzW1H2Es+500DkIC9+AE3G2HFgmWw3dxutdDwfeCvxTFi3MS83QMx4oFIV2G9kHxPRGexV3s9+FTjYuLy9QLKkB2Tuf7NFz2vIOwyqPZKPbkFV7YhAQ9Y0MP8jsqkFbeDQMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(54906003)(122000001)(41300700001)(53546011)(6512007)(6506007)(71200400001)(36756003)(38100700002)(66476007)(110136005)(64756008)(38070700005)(8676002)(66946007)(76116006)(4326008)(3450700001)(66556008)(82960400001)(66446008)(86362001)(316002)(83380400001)(478600001)(6486002)(186003)(8936002)(2616005)(91956017)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjVBakNMdG9ONjJHbVlrV1BmT282OC9CbHFka0k0MEdqb1F2MGova0J3VFpJ?=
 =?utf-8?B?ZGUvS1BpejRDVXc4Y2dXb1VFMjBCZW1wVisyUnVRdEphcG4rTWEvY3RCUnVY?=
 =?utf-8?B?c1ZHU0NWdGtqcEFwSGVDb0UwWGw4RnBzb0NLSUpqRnJKVUNEbXk5TlF6OHEz?=
 =?utf-8?B?T0tybW05M3ZVVUQ2WHhzZi9rWWQ3R3RzbDRjVnlBUTJxeGtMK3JFaHpHZHFC?=
 =?utf-8?B?Q1oxT0FmOTBwdXJ0dTd1aHFyYVJiaEp6TWFaU1lIZFFuN0ZUQUNwbEZjTW92?=
 =?utf-8?B?R2tMWTk2QkRyVXVPa3NBTkFNT1BvMVgzcmFXeE91R29WUE56NklvR1hEM3Bw?=
 =?utf-8?B?NG5mcXFZVFJYUzdRenBiZXJhd0NQRGl5QnM0L0ZNZGp0RjU3b2Z1STZLYzNk?=
 =?utf-8?B?NXhxQ1N3VWtsakhzMTBETzEwZUh3NnVGUVdIRWpQaUZUTnV6dUhwd2ZIZG1t?=
 =?utf-8?B?UmgzMUp0SDFGRkl6L21PZXgraHBodHRoUElNcnhTcWoyRVljbHJwYW9lN2dI?=
 =?utf-8?B?UnZJbURrWndNSnkxWGdJU1NmMFhlYkIzaWdLOFNPZWVEUUdVdjN5TGZuekNM?=
 =?utf-8?B?Z0doWjFRdHRSU0ZvdVNmblNhanc1SjN1Z3Z2MjE5cGVTa0kzTVN4MTc2bHRQ?=
 =?utf-8?B?S3RTOU1rVjNDakxob28rVzc1aTdqNVVPL0ZxMTMwbHRqeURyNW1KV1ZMWHhm?=
 =?utf-8?B?SWFNZSs0RDBIM0VZZmxNQ2dxMmgxem1rMHJUdFI0bzVJd2p6aHp1S1FieGdQ?=
 =?utf-8?B?dC9ad3U2WHFqQk1ZSEpIVFZZcGwrVDY2OEVObWVlSEM4aHFFS0FjYStqUzRz?=
 =?utf-8?B?bjNnVnk1dTF1WUo5YXBCZG1yU3NjMkc2YmpYRkkyOSsway9uQlpaNW5DSXJC?=
 =?utf-8?B?aFlja1pNMXBmb3h2RDlrN1JDeGVDdlZUck5zekNIbk52SUUyOXNIbzRjbG5t?=
 =?utf-8?B?WWVJQXNncnZONjdBMmg5Nm9hQitTTlFHRlFwY0c0Qy9mcW1WcVdVWmxtRDh4?=
 =?utf-8?B?Yi9Qa1pxSjlxQTVEQ1JLR0dMOWVjdmxWcFM1MGprNXZWbVFHbERtN2NFdmtj?=
 =?utf-8?B?SEhNYno0MEFRZmhwUzZzTGllVHRRdnl2M2V3cUJRQnd5Q2NEd0k0RjEwdHor?=
 =?utf-8?B?ZmJzT3pMVDNMb3ZaRnNUcnE2K2w3eTYzTTU1Y3ZIV3pNK29qbERWZUlwMURh?=
 =?utf-8?B?OXhIaGR2aTVvbmFHYUVnanBBOEFzMWFrQnNYV3VvZ040c3Y1cWNqREpic0ox?=
 =?utf-8?B?K0RzVzhjb2M4Ymo4RVEvOTN3ODZmYzRYV2FuZ0tHOHVOZ2FoaGhESk1uMmRZ?=
 =?utf-8?B?VEtPeHYrbEhzZWFsZmExdTRtVlJ4WUU2MmxRSmRYWWMvNVVHTkRCc0JYS3Fy?=
 =?utf-8?B?V016cTl6bzExQ1J2R0dGNHI2YnRxcEFFT215Yzd2RkJqak1XMnRaV2paTDlR?=
 =?utf-8?B?dk5sMlkxOGpmVkVETWJKNWplVXZHdGJzUXFqK1FGT3I4U1RTMUtBN04vTEJi?=
 =?utf-8?B?ajlISWdNSm1LVXBpL3dFWVdDWmk2RXFXSThFbVJNZEdmTlA3SWN4c01TU0xx?=
 =?utf-8?B?TGs4ekxHc0RTdS9ZT0dXZ3hoc0FwU2ZJSGdwR1hHbEJZbmVaMFhIaGFmWVNZ?=
 =?utf-8?B?TitxaVRpa0QzQjhHUzl0UGppU1JJT2xZWXdjaE5QdXZhNVk4SHdFWVhHZTZL?=
 =?utf-8?B?REpmeHRlbWxCSHBnbUkwaVNXV0cyYlpOU3Y1UFdxVlBUWU1iVDFmTGZzVlZv?=
 =?utf-8?B?RXBvQWVwQmUraDNESVU4VU85VlNyM1FERmpxRGRlRSt6bXZpUlFrb3FKTWlx?=
 =?utf-8?B?MysxM0FhTThqVnExUXRtODB1ZzdBV2xydEh6YlI1bDN0ZXYxZlFXMUVaR2di?=
 =?utf-8?B?N3MxQllPSGdla1FUdnVEUXB3YVNKUHdIZGZQMS9NMXRSU3J6SS9SRWMwWml6?=
 =?utf-8?B?QlRWL09OSFZyOVVuQ3BMYUE3V0dKMlAvRVF2QXZKUkNmZmJiNDNXcFIxYjR1?=
 =?utf-8?B?WDErTklnUUtIYStrQzhIZ3NteTdRT1pMYlZKYjdMemRIQTJWVHBVbWtpVmZM?=
 =?utf-8?B?L3FxUDQra3k4ejBoRjdsU044c0JrMWFRS3pxT1VqbFp3MzQ2VEFLN0VaZkFM?=
 =?utf-8?B?WlRPSCtWUUMxRzI0d1hsaHRRRmxkOTU1QU1UbWo5REpxQUdheU1GY056S1VO?=
 =?utf-8?B?K0JKeGo2T2U2d21DT2JLV3Vma1FCZVhOMFJmTS9ERS9OVVRrMmUzM1BTM21F?=
 =?utf-8?Q?ctQrBrZX2p/jGiLvRXPf8kmG+C1hGYZj9xAyu1vCRg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E2B20FD88A56A478AE1A066FCD382E5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7242cc72-d6ae-48bf-6e4f-08da9a3baf15
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 12:37:15.7043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnjRgMau7SqkEleS3qt+nIghZ5NU6888AdvM8dzYsCMjz1fvtUXKKB8p3SezfgpqcjdYPlCUmpV+scM6pL0W+w9tTMYsV7uXqvjuL09UOhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6309
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiBNb24sIDIwMjItMDktMTkgYXQgMTE6MzQgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE2LzA5LzIwMjIgMTQ6MDcsIEIuIE5pZWRlcm1h
eXIgd3JvdGU6DQo+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVy
bWF5ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBOZXdlciBrZXJuZWxzIHJlZnVzZSB0byBwcm9i
ZSB3aGVuIHVzaW5nIHRoZSBzYW1lIHdhaXQgcGluIGZvcg0KPiA+IGRpZmZlcmVudCBjaGlwc2Vs
ZWN0IHJlZ2lvbnMuDQo+ID4gQnV0IHRoaXMgbWF5IGJlIGEgdXNlY2FzZSB3aGVuIGNvbm5lY3Rp
bmcgZm9yIGV4YW1wbGUgRlBHQSBvciBBU0lDDQo+ID4gbW9kdWxlcyB0byB0aGUgZ3BtYywgd2hp
Y2ggb25seSBnb3Qgb25lIHdhaXQgcGluIGluc3RhbGxlZC4NCj4gPiANCj4gPiBUaGUgd2FpdC1w
aW4gYWxsb2NhdGlvbiBpcyBub3cgdHJhY2tlZCBieSB0aGUgZ3BtYyBkcml2ZXIgaW4gb3JkZXIN
Cj4gPiB0byBiZSBzdXJlIHRoYXQgdGhlIHdhaXQgcGluIGhhcyBiZWVuIGluZGVlZCByZXF1ZXN0
ZWQgYnkgZ3BtYy4NCj4gPiBUaGVyZWZvcmUgdGhlICJ3YWl0X3Bpbl9hbGxvY19tYXNrIiBoYXMg
YmVlbiBpbnRyb2R1Y2VkLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmVkaWt0IE5pZWRl
cm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jIHwgMTIgKysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyBiL2RyaXZlcnMvbWVtb3J5L29tYXAt
Z3BtYy5jDQo+ID4gaW5kZXggZDliZjFjMmFjMzE5Li5lYTQ5NWU5Mzc2NmIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMNCj4gPiArKysgYi9kcml2ZXJzL21lbW9y
eS9vbWFwLWdwbWMuYw0KPiA+IEBAIC0yMzIsNiArMjMyLDcgQEAgc3RydWN0IGdwbWNfZGV2aWNl
IHsNCj4gPiAgCWludCBpcnE7DQo+ID4gIAlzdHJ1Y3QgaXJxX2NoaXAgaXJxX2NoaXA7DQo+ID4g
IAlzdHJ1Y3QgZ3Bpb19jaGlwIGdwaW9fY2hpcDsNCj4gPiArCXVuc2lnbmVkIGxvbmcgd2FpdF9w
aW5fYWxsb2NfbWFzazsNCj4gPiAgCWludCBuaXJxczsNCj4gPiAgCXN0cnVjdCByZXNvdXJjZSAq
ZGF0YTsNCj4gPiAgfTsNCj4gPiBAQCAtMjIyMSw5ICsyMjIyLDE2IEBAIHN0YXRpYyBpbnQgZ3Bt
Y19wcm9iZV9nZW5lcmljX2NoaWxkKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4g
IAkJCQkJCQkgR1BJT19BQ1RJVkVfSElHSCwNCj4gPiAgCQkJCQkJCSBHUElPRF9JTik7DQo+ID4g
IAkJaWYgKElTX0VSUih3YWl0cGluX2Rlc2MpKSB7DQo+ID4gLQkJCWRldl9lcnIoJnBkZXYtPmRl
diwgImludmFsaWQgd2FpdC1waW46ICVkXG4iLCB3YWl0X3Bpbik7DQo+ID4gIAkJCXJldCA9IFBU
Ul9FUlIod2FpdHBpbl9kZXNjKTsNCj4gPiAtCQkJZ290byBlcnI7DQo+ID4gKwkJCWlmIChyZXQg
PT0gLUVCVVNZICYmDQo+ID4gKwkJCSAgICB0ZXN0X2JpdCh3YWl0X3BpbiwgJmdwbWMtPndhaXRf
cGluX2FsbG9jX21hc2spKSB7DQo+ID4gKwkJCQlkZXZfaW5mbygmcGRldi0+ZGV2LCAic2hhcmVk
IHdhaXQtcGluOiAlZFxuIiwgd2FpdF9waW4pOw0KPiA+ICsJCQl9IGVsc2Ugew0KPiA+ICsJCQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiaW52YWxpZCB3YWl0LXBpbjogJWRcbiIsIHdhaXRfcGluKTsN
Cj4gPiArCQkJCWdvdG8gZXJyOw0KPiA+ICsJCQl9DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJ
c2V0X2JpdCh3YWl0X3BpbiwgJmdwbWMtPndhaXRfcGluX2FsbG9jX21hc2spOw0KPiA+ICAJCX0N
Cj4gDQo+IEFuZCBob3cgZG8geW91IGhhbmRsZSBzaGFyZWQgcGluIHdoZW4gdGhlIG9yaWdpbmFs
IG93bmVyIHVuYmluZHM/DQpTbyBmaXJzdCBvZiBhbGwgdGhpcyBjb2RlIG9ubHkga2VlcHMgdHJh
Y2sgb2YgdGhlIHdhaXRfcGluIGFsbG9jYXRpb24gZnJvbSB3aXRoaW4gdGhlIGdwbWMuIElmIGFu
eSBvdGhlciBkcml2ZXIvY29kZQ0KYWxsb2NhdGVkIHRoaXMgcGluIHRoYW4gdGhlIGV2YWx1YXRp
b24gZ3Bpb2NoaXBfcmVxdWVzdF9vd25fZGVzYygpIHdvdWxkIGZhaWwgc2luY2UgdGhlIHBpbiBo
YXNuJ3QgYmVlbiByZXF1ZXN0ZWQgYnkgdGhlIGdwbWMgaXRzZWxmLg0KVGhlIHRlc3RiaXQoKSBv
bmx5IGNoZWNrcyBpZiB0aGlzIHBpbiBoYXMgYmVlbiBhbGxvY2F0ZWQgYnkgdGhlIGdwbWMgaXRz
ZWxmLiBJZiB5ZXMsIHRoZW4gdGhlIHdhaXRwaW4gY2FuIGJlIHRyZWF0ZWQgYXMgc2hhcmVkIHdh
aXQgcGluLiBJZiBubywNCnRoZW4gYW5vdGhlciBkcml2ZXIgYWxsb2NhdGVkIHRoZSBwaW4gYmVm
b3JlIGFuZCB3ZSByZXR1cm4gYW4gZXJyb3IuDQoNClRoZSBncG1jIG11c3QgYmUgYWJsZSB0byBy
ZWxlYXNlIHRoZSB3YWl0X3BpbiBpbiB0aGUgd2FpdF9waW5fYWxsb2NfbWFzaywgdGhhdCdzIHRy
dWUuIFRoZSBvbmx5IHNlY3Rpb24gd2hlcmUgdGhlIHdhaXRwaW5fZGVzYyBpcyByZWxlYXNlZCAN
CmNhbiBiZSBmb3VuZCBmdXJ0aGVyIGRvd24gaW4gdGhpcyBmdW5jdGlvbjoNCg0KZXJyX2NzOg0K
CWdwaW9jaGlwX2ZyZWVfb3duX2Rlc2Mod2FpdHBpbl9kZXNjKTsNCg0KWW91J3JlIHJpZ2h0LiBJ
IG11c3QgYWRkIHRoZSByZWxhc2UgbG9naWMgaGVyZSBhcyB3ZWxsLg0KDQoNCg0KIA0KPiANCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
