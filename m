Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D124143F8
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 10:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbhIVIqF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 04:46:05 -0400
Received: from mail-eopbgr80079.outbound.protection.outlook.com ([40.107.8.79]:40176
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233654AbhIVIqF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Sep 2021 04:46:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by7PXrCstQQM2TpXLTjFua4fTT7u6x5ej2Tfe9VHNcQrGO6dxuQK1T4JaLDoJBHzM+qK4ZLdRZYMkN9eGPEeY6uP76f9oz9vCwLI/qPu9HCM1REth8Z92B65IZOh4EGH7KuTz63sFPwn45EoJPkpoYIl7V6SzjlRutTQgTqdFHoBM7rXGAewzb87Y2Gc2oUMXG7h35QyHNJmP/OH5uxCmmcsCMegZhzxF0X9Rw+JfsoSxKLXjOx/r3TEbS1mkZBrwIOLiSg4IGvi5UtyhKiLuYKxo4Tk1sLSKRbP/3vRqN1lr7KZZyOFNN+c6xAr9YT0N4mDQ01eRODAnOo3SbvgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g0bC1jFq4wZdYfTOf2ZThqkAhK8jZV3vFsyZiymYeUA=;
 b=XuuMyvqwbOVNFvrioY3CmOq4MPwKEqNgoQj88x2Z58BZC9Ntf6EHWOA7S0/olGs1YdHmgTXw4O9Uu7j6zuBJl42v7BNNMj0/u2sjul2TZf1i4cPVxW56dZnaqO0sYhbjt6Cxig1VBG8E88CixifFfszbzH0Z97sjVi9CRVxT004yCLfCxR/MMZoVZ76MNLQ+mYHLgTdDmHRw5gBMqyibIJKdmdyiPjxP8a+gMQsYByDDLpJ8LBsf1jLVV1QMh8IAi9+tLH7ecebanNO0UcXDuGDGWsJ7z3/RnK+yinJtBZ7wgL88sICjnV1GPRtVS/ZqkQ+uELsQlbMpMO0gnHEE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0bC1jFq4wZdYfTOf2ZThqkAhK8jZV3vFsyZiymYeUA=;
 b=kUZkrbHujf17XIFK2R7JT/5niqTYvusGCMRipaisJJmwFmeiPgwc6NAhKc1h/ORbOQ2EKUilZnd6lI0aPxiqINgU8h/0AHc5G8PBvlvj/d7uNJM2oKfNt/xMgHOBowsiNf1tu1DGXp3PEFQ8+hVDkNL7kniW/5z6wdGOg001TkM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2586.eurprd03.prod.outlook.com (2603:10a6:3:eb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.18; Wed, 22 Sep 2021 08:44:32 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415%7]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 08:44:32 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Thread-Topic: beaglebone black boot failure Linux v5.15.rc1
Thread-Index: AQHXqtte0LDyC49C8Eq6XS7e5X9lNKunwNEAgABs14D//+JeAIAAASKAgAAtVQD//+0NgIAEjN4AgAFrxACAAaI8gA==
Date:   Wed, 22 Sep 2021 08:44:32 +0000
Message-ID: <34b4c7a7-155c-5f06-c5c7-54489a59bce1@fi.rohmeurope.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com>
In-Reply-To: <YUmOGFUFONR/ynfW@atomide.com>
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
x-ms-office365-filtering-correlation-id: 41f8ac79-742b-4b7a-1811-08d97da532a5
x-ms-traffictypediagnostic: HE1PR0302MB2586:
x-microsoft-antispam-prvs: <HE1PR0302MB25868854E64D20201AEF208DADA29@HE1PR0302MB2586.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jYbyWfTtWk/JIMIddLg066z/GWPF65q67o5n4RJkVVK6bKw21OSKjPqs+BSqFTfpEgiDx86/zbJejl0x4DbA6sI+FwEUQlTVxkcFfYOqLL1TsAFzeULF6O3O0jPz//X6sJlS+WXiWQ+JgYm42vVSnAFXqc9s/uAk9+QCufBSNtCa9AB1uymBKCsJCrwIDWax9kPnSfujbo5iiyy6SHUuQ045qcoUFwSU+y+yZ3zFbM4sgcN05NLVmyeZAW6JSAis+Glk1iBj5DoUJo7EHTvlS6vP557hrcO5E4bwj6YwLFr7tVQvJRJL8BgcGgAsUEOA71Xo8D6GAZKoawBtfDgGLN0DbokHhboUpcSTIxIQIYuKbDCJIyJt0kUr+GecnaL6qqjfu3CRW0vCf8W08AKR2pB+Yjkto88Pphtbi/T7IcDb9boplOhAgQA5k/qnsTvxlRhGBUmThx5gmUvLExrJ1HIP1i3Xm6HHapfGKC2tLgdEbMEA7xio4I3590UvogRAi8V7SUPfSJ4VkmNtSABe1WvrKmegFOgUnmv8u7+Wx1IM55Ors6oeGOqIsBHU8zmDzwEcgM2xrvZkI4LwPZwX4Dq4td8D0dWuMUc7xlsPwqCLDBjpA8iKiADg4QZc5D0LQ/uNuxtYvwSwBxgEG10TDs2vmnGJ+uRoz648a/I5aHK7pK9OP7drFVbkFSWDFENDJmjiMeQsSmCiJ53fVER5lwyz7j2ONI3AhhKCxIk8iYdxF77GTmBnBXiwbKhyecfdGB5a7a5WIzH993etaMx0sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(2906002)(6512007)(4744005)(64756008)(38100700002)(2616005)(8676002)(53546011)(6506007)(4326008)(508600001)(76116006)(122000001)(8936002)(71200400001)(38070700005)(186003)(110136005)(5660300002)(54906003)(86362001)(31696002)(6486002)(66446008)(66476007)(316002)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmZDZUNXSzZNZVNaMVFtZTNSazRCUHJmSTJWV3FucjRhNHF3TmRVL0hlcWs5?=
 =?utf-8?B?dTRWZWc0WDFrNjRTVDgrSTAzeWpPWGpKT0xKc2txdEhydmphOENSRmJxUHVZ?=
 =?utf-8?B?QWU2R0JFVEpQQUhnYVFaNzJxRkI0TzlvMi94SWlNbXBIL0pqTll1RHcxNFZz?=
 =?utf-8?B?SDBJRG82Yi9oaXEwZXZ0aHMwVDRKWDRjS25qMUdTczVLVTB5aTlmM0V5blNs?=
 =?utf-8?B?RVRNVmNLNUkvWEIrYnpMK0hHSVJ2QmE0MGNaQ3phY3RCeitqUmtPK25NbzFB?=
 =?utf-8?B?a0E3a2hJTnYxdXlOY01pbGErQTBiNnVuK002b0hEK3p3YjZ0bjVaTlJLNER3?=
 =?utf-8?B?bzB3bmZDSUQwQUt3MUVDMnNsVWlMZ3hrbjNCeUhhUXJkMjBVVTYzdjJSUXE3?=
 =?utf-8?B?UmU4dVdHMGNNVzlDaHZnQVdSbHpJREU5VzcybHFpbjdudTQ2b2gzeFN2akdy?=
 =?utf-8?B?N0tyNkZ1c2FzU2o1c0wraEVzLzZwV1B3WDhyei9VUGFYYzVtbVBxeEZDYzhl?=
 =?utf-8?B?WkQ4WER4aFBvWFo3OHlqTGdxdS94M3NqN2FIMXRwczVqT05rSXVYUHpUb29Z?=
 =?utf-8?B?RjdGQlREbFhVV0xEa3B3anBqTVdqNG9PSCtPWjFaT1o5ZnlQSFY2VnRVb3ZJ?=
 =?utf-8?B?cnFtWlJEU2pKazZpcHBZNklzRVpZd3FxcktTNm5MNDRUd2dSbzNhT2NDRy9v?=
 =?utf-8?B?WVhuM0JJY0J3NXZVQVNDRDkrTFVIWGs0NFhnZmhlMVh4ZytpS0dNMmxNTng3?=
 =?utf-8?B?Tnd5NUtQYXBYWktrSU5rMFlFNkhybUNEb3AwUzFJditLMytrQnZSZVRyOVM2?=
 =?utf-8?B?ZnpoUEQwMTVoVDA3REllWk5FSkt0RjNleGxmMVNLdG1JaVM4Z09QM1JETU9X?=
 =?utf-8?B?bVh6SVJvSkdlRUlnSnlsMWljNklYcWFIZis5ZmgvZ0JPL2V6dTNSWGZNWWJ5?=
 =?utf-8?B?NnJhWloraExoY1ZTdVY2NGZWTDZPRXpTaDE1TERtNmNUR3JGOWpBUzYrWnp4?=
 =?utf-8?B?djZmdStUWStKV1pEeHB4aDNNZ1pHb1Jwb0RUd1cxZitjbzRPcXNIWUtVMWEz?=
 =?utf-8?B?N0RZUFpxbVQ0dGg2cjBpV2tXa2I3eGlBZ2cxSzNsKzJpcE5lTWUramFsZUF1?=
 =?utf-8?B?SXRFNm84akRTSGhoc1NaeXQySGNnTTFNU3B0MVhWeTdTVm1KTXFsOTRqODJ6?=
 =?utf-8?B?L0t6MllrK1RZVWN6WW5kUmxxamFTUVQwbjFRS0loc2kvekI2dGNBS3gzRHBm?=
 =?utf-8?B?U2tYL2JmVkM0N2cvcS9MTWljWXZiR2hLYmNnYkFadHV2Qk1ZaVIxNUpnOGxQ?=
 =?utf-8?B?R2o1ZVRXYUFWYm5UY3Y0dDJJTlU3cjRkV0lBQUtVMnNpUCtqbStiZ2t4M1pH?=
 =?utf-8?B?ZkNCRkhrdUNLN0owa1JXZHVjUHdocWQza1MreHQ3VlhrY0F0R1dhV3JZNlZ1?=
 =?utf-8?B?dlRNQjFjMDYwbU40OUEwOFFjNTNmcGEvVUZjenNTSUNnMXZvVzRFQURlcnUv?=
 =?utf-8?B?WS9abVJ5bENnMFNSTDVlOElzcEtaUE5UVEFGblBWazhIbXFqVUtDSklaSEFK?=
 =?utf-8?B?dnBYNHhqc0l2SUVpeWx6K0QxNHZ5Q3dYM3Z0RFdPL0ZHSVUyVkVCTVhUdE9q?=
 =?utf-8?B?ZW4vcTE2VzZXc1ZZenUrRG9oSFRCYnlkQXF2THBSWC9MY1dSbktjVmQ4akhh?=
 =?utf-8?B?NzBoSFh4Nzc4REl4NWI2YUY4Q2djb1BXNGRLbFh2eSs3QXdJRjg1WWMrcmNF?=
 =?utf-8?B?dVZTVzc2QllaRk9oZUU2b01CZ3pWMW9Sc1Z2WHJsalRWbVZaVWU2RjBsdzZj?=
 =?utf-8?B?K09jKzF5eDJMaFgrL0kzUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A30B309E60B3584B996D7BA0284F7523@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f8ac79-742b-4b7a-1811-08d97da532a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 08:44:32.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhhP3ieSEdMLa5U+ZbVAz9ArKAU+eJP7Ws9y35t9D6wVrIz1S3GCpldnF6xqqIE2VIC3W0iZf/h9H9D/CyoRLnrCfbXUobT2zerN9/dxoPV7eyD7Pv4pyNDbklm0XbG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2586
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgVG9ueSAmIEFsbCwNCg0KDQpPbiA5LzIxLzIxIDEwOjQ3LCBUb255IExpbmRncmVuIHdyb3Rl
Og0KPiAqIE1hdHRpIFZhaXR0aW5lbiA8bWF6emllc2FjY291bnRAZ21haWwuY29tPiBbMjEwOTIw
IDA4OjIzXToNCj4gDQo+IEl0IGFsc28gYWxsb3dzIGxlYXZpbmcgb3V0IHRoZSB1ZGVsYXkgZm9y
IGRyYTcgaXZhIHJlc2V0LiBDYXJlIHRvIHRyeQ0KPiB0aGlzIGFuZCBzZWUgaWYgaXQgaGVscHM/
DQoNClRoYW5rcyBUb255LiBJIGFwcGxpZWQgeW91ciBwYXRjaCBvbiB0b3Agb2YgdjUuMTUtcmMx
IGFuZCBteSBCQkIgYm9vdGVkIA0KdXAgc3VjY2Vzc2Z1bGx5LiBJIGRpZG4ndCBnaXZlIGl0IG1v
cmUgdGhhbiBmZXcgYXR0ZW1wdHMgdGhvdWdoLiBEbyB5b3UgDQp0aGluayB0aGF0IGNvdWxkIG1l
cmdlZCBhcyBhIGZpeCB0byBtYWlubGluZT8NCg0KSWYgc28gLSBmZWVsIGZyZWUgdG8gYWRkIGEN
ClRlc3RlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9w
ZS5jb20+DQoNCkJlc3QgUmVnYXJkcw0KICAgLS1NYXR0aSBWYWl0dGluZW4NCg==
