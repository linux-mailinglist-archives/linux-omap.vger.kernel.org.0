Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567E241D68A
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 11:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbhI3Jm4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 05:42:56 -0400
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:25347
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349448AbhI3Jmz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 05:42:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9GCVE9Y+zOdf58D/9eVItuZf+aTAgS3smY3R7i6cBs794gWAyXlN795GwKDIYUR90YTzLJL8jtkimE3MMnI1WV8OSyQb+X+JyxipLYNHK/e9Gfchm1EaR6uMqe5y0YAQPWLFElSjGS6h/8oKJkTwSaWicXrztAgLzgiarVHICMVOcRiPnwfSLxluRUndY00kZKid5kbua6DsVlrXb5Ea49/Ah0WniRR7W0SkIVUuQqVDw5ymgI7j1K4fdwkQL1T+Gb3MW1Ur4V60JU7Xr79IdqfWDh7va20U7gnaUrofIv0XQFgl9va30EvGQqZ4EumdbUhsOGHD/H6J9Z3SSu9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WESa+WvF399G6kYzY5VmzYwVMIj/crMQVSWjh2/JTFA=;
 b=PETVWYlcnzeZeJ4rkKaEa5zwxbDRBCGGGoLvxfBjfmHWijkZ4jqFuBlN0Y/Ybi+vvGBiuO5mjTdQHzWgQmawe/rn0BJ+JF8EUWpnrBL9fqb9pIZhi5OV0TWY+Qwo7e37m5hqGDcpU/d8tSxE2zPb5+zXUlAYDZZHUKlDITAc11scEAshgjpwswFLgBAXzTTcdIuHQUOVXAHx8zaaST/QomlpXcvabNAbrt47jtYKDIQTCJhAEZKG2xMuc/qXJfyJG5IlsDsJbHzWB4s2MKFnE0TyXktpH/nmrbhGHT1rtOueMZfUZV/cH9qxpBZRAaXrjJbBWh4TOYLgT1GupZEOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WESa+WvF399G6kYzY5VmzYwVMIj/crMQVSWjh2/JTFA=;
 b=DLcsCxf/c10oZeeVp4ViOnI/znBjMs9+MUA57RS1iMPptNXk1LVRbVPdAH7KSw9nPKU63jBj6Ko8yOJ+Jd7+ltgq4HpUbsjK2OMn08IuJyjx1GCimQ7j2m05H7UUW0k2FuLWKzY/4eCzoBmYpotGd4HPGUcYuCeJE05Dcs9M1g8=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2777.eurprd03.prod.outlook.com (2603:10a6:3:eb::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15; Thu, 30 Sep 2021 09:41:10 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 09:41:10 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>
CC:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Thread-Topic: beaglebone black boot failure Linux v5.15.rc1
Thread-Index: AQHXqtte0LDyC49C8Eq6XS7e5X9lNKunwNEAgABs14D//+JeAIAAASKAgAAtVQD//+0NgIAEjN4AgAFrxACAAIuUAIAACS2AgAEZZICAA79KgIAIvgMAgAAZQ4A=
Date:   Thu, 30 Sep 2021 09:41:10 +0000
Message-ID: <06b98a5d-5a16-2210-027c-358d45b2887f@fi.rohmeurope.com>
References: <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com> <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
 <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
 <9c80c7af-daf5-c521-fe59-1f0c222a23e1@fi.rohmeurope.com>
 <CAOCHtYhC7f43wz+G-mxwutzoJDm8rhZWxf4Jd9+VHAbxPfPjTw@mail.gmail.com>
 <YVVxBFsFUx0ZMoE1@atomide.com>
In-Reply-To: <YVVxBFsFUx0ZMoE1@atomide.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b12b87f8-8148-423d-e519-08d983f66f9e
x-ms-traffictypediagnostic: HE1PR0302MB2777:
x-microsoft-antispam-prvs: <HE1PR0302MB27773B067321C0F84E4E627FADAA9@HE1PR0302MB2777.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BJQdvlHGDPx3N3PVFLJy1VkOvBg/FaZzr/fGaSUXPbqm8E54IjWpJrTB++iopdcYm5OfOoONhAhaBLpIE9vYmyGDKYUvC61zoobBbJN9AL9FEe9dbLJsr5DAtGP7wNbsfAbPXqmhdSKKanpyi/dPxJIvac8Y2SgqffPvS4nlwHpCYCBNt4YGUSs3NXC3m5ECpaOA6RrAMnwO7+abOX5ESm4R4zIHho2aif7tLmDh5MjaJrnPpk8WS4KGj1BXAx0RTAP1z5OvXsib8qgDAJejIiekwAGtX4UCsB28Jts+DMbPAaYiBeAgzavowINvdQjndax3OcS5DkQ/ePNJtXSGrsbNMgx8T7cuGI51eYQVuzegCBoYs0D4MiP1MQvexY6Y/PT49EapapZJVedQrYE8Jwn52yt3l8ihdjdDp/A/v8NBKV8fn1vnPtGtykU1Xt/MEuW6jL7zZPOXIOKZ7WyI8yZ56FOvdXYp9CJ7NfOkV8lJ/OsF4qoY3v7/YOzycYU2vg6wsGW3VTe6KaBhK6yXgNmC7Fx9jQ3T1lIS4q3dp3NXYGXjb/4/9I/EcQThy3/9T7znTGqy8cyx1x1yd/7iqqtPUTcqrplyMZJiYpft9q+Uoc31QUazkWJzqWxG6iob0gKPkpuL7CknRfdOhm9pme2iigt/Ckbd4j8X/iOPxg68yOJbjudYssTkunotLjwF1c/cFL0Xh4Row4zmkMT4T61BscsijMSXnal+1UuDOiPxkF922BwNwkI018vBlGVJyMlvsuK5tIojBi5OmDi9u6gYCcrLQD/u8fUw/j689YOy66ONbB5UHKDdp6FzEpohrDKydtIl0K96Pa+o71gb975Sc3ThMxAutEYM6n4yrBI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(2906002)(76116006)(86362001)(2616005)(38100700002)(64756008)(66446008)(66476007)(66556008)(7416002)(316002)(122000001)(508600001)(66946007)(4326008)(26005)(110136005)(83380400001)(31696002)(6486002)(54906003)(31686004)(8936002)(8676002)(38070700005)(71200400001)(6512007)(966005)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnRHRkZEZnhuaVJobTJoK2RFR3o1K1F1NWJ3TWVEWlkxemJuM0QyRDhOQXVn?=
 =?utf-8?B?OWhGWUlkV0ZBU2JZdUF1OVh1anpEQkRSMFAzNEpmdE42R3Z2V2s5TmZDVG55?=
 =?utf-8?B?N1Q1UmJRUVV4cTQrN0lBczh1ZWF2U20veHkxejU1NXJMbjhlR2hFMVJ5Z1Zt?=
 =?utf-8?B?cWZOU0ZUaDVpUHM2QU9aRnRCWjZmMUFCdklsU3VKdkxLMXhwdnBEbTd2eEpQ?=
 =?utf-8?B?Q1lBRFZUNklFQnBHS21tVnY3dWlFdm0xZ2kwMGRSbWtraERPWEdXeUI5L25z?=
 =?utf-8?B?b1ZacU1oL2FGU0g1YlhTV2IxSU5iY2JKbTM4QkRxbnhFY29laGlueFlLaHRS?=
 =?utf-8?B?NSs0dDhBWityM3d1dmRvc0hTTnp5WGpHRTdSbklYYXcwamdNMUFYZlhGLzhv?=
 =?utf-8?B?am04NWVVTWxaOVd4RitmcWhZWUQveHlqY001WGhsRXNJbzlFbzhOODJRUzI5?=
 =?utf-8?B?Tzh2U3VWdFc3MlV1di9nM0FBT01RVmhuUWt3OW0vSmVrQ3EvM29MWXFIdm1R?=
 =?utf-8?B?N0xzNWNJU3dGTDVhYWIyUkRjLzFVN0xmQU5FUTBmaGJvWVlRN2FZNnVaa24v?=
 =?utf-8?B?Nm9sa25KWUxEQlhYSVBrY1hra1pldmt5SEtEbEZjckNaR2xybGxyVkFUbENa?=
 =?utf-8?B?dVRBRk0reTNxRWh4QUt5Q2J5TmdjWWYxUlhxOUZUQkxvclB2WjVDdy9SMExR?=
 =?utf-8?B?WlJrdFN0VytyK3h2L0RxSUdpaWJWQSs3ejlEdmREdG90R3pwR1ZKblV2YUhy?=
 =?utf-8?B?TjJ4WVpFZERmZFlyd1B4V1FsdWlpSlYwWUhCMUV3bDRCaEpmamVkREtDbjFh?=
 =?utf-8?B?UmRyRkM1RnpKZXBwMEN2VTNLcFBEbE9rWHIxQXY5b2tla0sxMEVEdjJwbVhH?=
 =?utf-8?B?MjZZbDJMd2tkYkt0azZPZlJWUDJ2ZCtDZ2hBUDZUSnJ5S1RoTU9TUFFNbWJM?=
 =?utf-8?B?TnZoSHAybTFqcU05WjFndjFsV1VJbEtNZUFMaEM2L0lTSXFGT3RNSzgzYlpZ?=
 =?utf-8?B?VzBNWHRTK3daSHRyRlNRZUpCTmpSeXUwcllsaGpodGFKZzlxMXVWUVlTTEps?=
 =?utf-8?B?bnV1dEE4ZHdSY3FnbGJPZm1kRHZhZzVyemFqY1Q0cTJscGpVc2dOU0dka1I0?=
 =?utf-8?B?ck5SdEJEZ1Voc0dyTExTTzcrV3VZdkdjZnZodTdqd2lOTUhhSE9zSElCVUlC?=
 =?utf-8?B?YW16VmpjaWJXTEdKcjEvdXV0dllPU1BTS1NWa3V6UDBsRlRLbTkzcE9xYlBs?=
 =?utf-8?B?dCtuMGRkVmlhaTBPZ244QVo5UERyR1JCaUZZdnAySXI0ZUFZRFIrUWVBeFpm?=
 =?utf-8?B?eGZlaTBzQzkxZjM5Y0dxRkZEWFZVTlFQRmxxMlBvaUQvQmFsaWg1U3RwZ1pR?=
 =?utf-8?B?TkV4N3d4eFZFdDNZSEF0cEhaMkhQZGNlemZ6WVNwZy9YRllqTXViK0VMcFpR?=
 =?utf-8?B?MGhTVlZyNE1qVzl0S3Rod1NMcnBQOEFOTll0Mm1xQUFvZVlOdWd2aHJZQkxh?=
 =?utf-8?B?VzBGRWxWaU94MlltNVpEcGhLazgzN2RCSURkL0JEZC9KVXA3Mm9NSXk3SVV2?=
 =?utf-8?B?UW9FNUtFeiswVmloTlQ2QTZCMEJJZFVDd3ErQzNuOWNXKzdLcEJ5UEEyNnFK?=
 =?utf-8?B?ZXptME50UUlrNEttL0RlNWdlaHBkWXVuR3dUWm5ILzZic2YxU3hxM1grbDBr?=
 =?utf-8?B?b3NHc1R5bVpFdlBwQU1lSUg0a0lxU09wVW0wMzV2UlMrVExwZTZiM0pKd3ds?=
 =?utf-8?Q?Mfk9e/K3bEK923OCNA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BEDD51F5A14E64E9773C5C150DB75B9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12b87f8-8148-423d-e519-08d983f66f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:41:10.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDplhOQammJmVDgEKjzzSCcx+lDPTuQbPBx4uYJkC73oJBBW158i6573LRf9g9SCSCGJ7AX6vKaYrCNgEUJ1Fcrq04obdnhQBaqHrKBDNz4CGJLlC8t/wX19Zbf0AzE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2777
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzLg0KDQpPbiA5LzMwLzIxIDExOjEwLCBUb255IExpbmRncmVuIHdyb3Rl
Og0KPiAqIFJvYmVydCBOZWxzb24gPHJvYmVydGNuZWxzb25AZ21haWwuY29tPiBbMjEwOTI0IDE4
OjQxXToNCj4+IE9uIFdlZCwgU2VwIDIyLCAyMDIxIGF0IDQ6MjggQU0gVmFpdHRpbmVuLCBNYXR0
aQ0KPj4gPE1hdHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+Pj4gTWF5
YmUgYSBzdHVwaWQgcXVlc3Rpb24gLSBob3cgdG8gZmluZCBvdXQgdGhlIGV4YWN0IHJldmlzaW9u
Pw0KPj4NCj4+IFJ1bjoNCj4+DQo+PiBoZXhkdW1wIC1lICc4LzEgIiVjIicgL3N5cy9idXMvaTJj
L2RldmljZXMvMC0wMDUwL2VlcHJvbSAtbiAyOCB8IGN1dCAtYiA1LTI4DQo+Pg0KPj4gVGhlbiBs
b29rdXA6DQo+Pg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2JlYWdsZWJvYXJkL2ltYWdlLWJ1aWxk
ZXIvYmxvYi9tYXN0ZXIvcmVhZG1lLm1kDQoNClRoYW5rcyENCldoYXQgSSByZWFkIG91dCB3YXM6
DQpBMzM1Qk5MVDAwQzAzNjE0QkJCSzkwMTgNCg0Kd2hpY2ggSSBhc3N1bWUgbWVhbnMgdGhlIFJl
diBDLiAoVHdvIG9mIHRoZSBib2FyZHMgaGF2ZSBlbGVtZW50IDE0IA0KcHJpbnRlZCBvbiBQQ0Is
IG9uZSBoYXMgYmVhZ2xlYm9hcmQuKQ0KDQo+IA0KPiBTbyBkbyBJIG5lZWQgc29tZSBrZXJuZWwg
bW9kdWxlIGZvciB0aGlzIHdpdGggdGhlIG1haW5saW5lIGtlcm5lbA0KPiBsb2FkZWQ/IEkgZG9u
J3QgaGF2ZSBlZXByb20gbGlzdGVkIHVuZGVyIDAtMDA1MC4gPg0KPiBJIGFsc28gc2VlIGVlcHJv
bSBvbmx5IGZvciBhbTMzNXgtcG9ja2V0YmVhZ2xlLmR0cyBhbmQNCj4gYW01N3h4LWJlYWdsZS14
MTUtY29tbW9uLmR0c2kgc28gbWF5YmUgaXQgc2hvdWxkIGJlIGp1c3RkIGFkZGVkPw0KDQpJIGRp
ZCBoYXZlIHRoZSBlZXByb20gZHJpdmVyIGxvYWQgYW5kIGVlcHJvbSBhY2Nlc3NpYmxlIC0gYW5k
IEkgZG9uJ3QgDQp0aGluayBJIGhhdmUgYW55IERUUyBtb2RpZmljYXRpb25zLiBQZXJoYXBzIHlv
dSBqdXN0IGRvbid0IGhhdmUgdGhlIA0KY29ycmVjdCBlZXByb20gZHJpdmVyIGVuYWJsZWQgYXQg
Y29uZmlnPw0KDQoNCkJlc3QgUmVnYXJkcw0KLS0gTWF0dGkNCg==
