Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B3B645CEF
	for <lists+linux-omap@lfdr.de>; Wed,  7 Dec 2022 15:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiLGOws (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Dec 2022 09:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiLGOwq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Dec 2022 09:52:46 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141279FFA;
        Wed,  7 Dec 2022 06:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqyTlVf/6z7TLXSmZv5Hnw9lf33sT4mGdv8CIBuRmslM9sibWZaGYmlrKiHt/50kZ6tn/J/lXwX2IJlZe5ejfqz/59ga6JvcJ1Gj95dNzbRiC8jTg10wGTs4IESAX481qMQvxQpIDOnXKBP5vh/rLFWnyGm0I5yNNk195Tl9eLfJB0gvhZE+CZisW1TPk64JtcFHU50xFGZcAiEftfNWWgj4BROXhVQNWhDaugapGly25O5OaWBpup0joyU2N5B4FGPQaxf0GLJ61KGc56juHxDpSooWRvC0ZK8SlmBGjABrUIw65RuSh+5+VmcHfzkgnMdn4pxD/fk91IJENmzuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97qd4dNXHvOBYw/euWtFbicIaQjUzmUEkwM/epPyczU=;
 b=eL9pMdWaJkSrf6JATCsOjIcSLfqMm1SN9stJtLwUuAhpP4XTcZZTy36gbHOi7lGABrBLOuKURRHE767yGKu2t6SrOYbkaD7P3H0pazEXYBlfWrKeasX0DXy7UCYhnFY17pJKQxVpvf5q5PEOGuCs20qju6LXkzF3PC7WenjK5672s3XAcT+RHIr1o6KWpGBumAB3ybnTaBqHybz2JySgEVJvecHbaJQRpKEkDZQ2PFXwizbJZ+3EyemqPHzh/jyRBUrKHMrxa/Id6/25c1lWeRTuPyjxoSDa6q2aiDDwMiG6VOCUTfssYQw6FP03XeGBJ6X8I5MmVzE5vXto7lUHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97qd4dNXHvOBYw/euWtFbicIaQjUzmUEkwM/epPyczU=;
 b=PD0XP8i2kBOSEyoA6qHDqIkfj2mQYocYmCZ7uiGWpem4dbo3gbPzagshYcpP1hAHFT4hshJWhJPmWvm1PTlHM8Yeoz3c21TtspR1ioTO8R7StVjyeXWQVF0OT74hgvgGcnDkIYAC7Xt7G3okH7YqB+7vUZUSgJ06t12Qw2x0IvINq0YUIrTHcn5KIZlzdOPt2jhHQ8ruNwT9EWNVkXOd55g4EllPBS9jAsTvHuKVcOvdFaVoi7Q6o0u86/MDQ2BpDv/8/7KrtkwZ70hLUJQciUXwuvsIfgqmmMRtr8TuTiyuVJuTWHyI9Y0seZEG8r2304kagwqLkA0J9VQ5S1C1Qg==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by GV2PR10MB7007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 14:52:41 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 14:52:41 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Topic: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Index: AQHZCkMWzmVLjxOYAU2QxNHfyRTG2q5igpUA
Date:   Wed, 7 Dec 2022 14:52:41 +0000
Message-ID: <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
         <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
         <Y5CafQpZnjSSCMoj@atomide.com>
In-Reply-To: <Y5CafQpZnjSSCMoj@atomide.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|GV2PR10MB7007:EE_
x-ms-office365-filtering-correlation-id: 9e36cfb6-d375-4fcd-a1a4-08dad862b101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MLUZmpj6wwR4FlxMW8RdgYLu7rTzNzMefqkR4k3Sq7l/Xwj8ecwXYVubH1QNY3Nzuqj9Vxz5LzKtzRKv87qxHiMo0YamGdjheeEI03Zf38jB3i4N+OY6Y2ZH9kXRwhvU8gIwV/cSan3rCyoW+tzFZMPY+uRxhwgj8LzRxG6ciXZWqkszQFgpUP9ao7zhtiHpT6z7thFFUof2P9utc3eFPogkqudR1fbKB+TSV/p/4xxYKtXMJQQKVm8rzoTLJx9CYkcYamUVs3Cuo0LozP5hfO1Okn8ed4d2Uf083r/Hx2WlWC7TnwWnbykSZtoiE7KiNUQNY5pUvhYRyagPwuvsQ6VPvrQ3G8GVXvCP9K7Q9IQXKwR1qhmSfxz7ol82eehI8plcv5VZxX+hyjJtRVYqn+IboSS67+9SekhyLZQID2HCzq2RU/VXWT75NLLdk3cUC9WK5Ze7YKkXXFoo+nDkdZhB4uk6wYfVJLtkoe0yZxpLu8o7lE/Q4l9QESy2DpfBNzCBNP7RVqq57WYg78lyJGTFMXOE4YPgH570FOcTYsq1YCPjZ93oguWD1eXUZBqSgSOjs0S28z7b3khwjV/OlBPWHhWxkehCqDVH6Iiwcnf9Hfe+jPOuV2y9DZnjWNZcCaqKsdLiqRFEpTlGIpyMlSnZMdb6uTY6yM6Jbu2AhGCa/uLqUoWfIs55ptyKV791o1/09uuwd/Gpohb8UeDweg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(54906003)(478600001)(6512007)(71200400001)(6486002)(316002)(110136005)(66476007)(91956017)(8676002)(64756008)(76116006)(4326008)(66556008)(66446008)(66946007)(6506007)(4744005)(41300700001)(3450700001)(186003)(2906002)(38070700005)(38100700002)(2616005)(5660300002)(8936002)(122000001)(82960400001)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0tYeW9TWmNKaUJBUTBZemtvcVFOU052cmJHRG8xWkZSby9hMVI5Vm5vUElt?=
 =?utf-8?B?SUIvM3Azamc3MjkzZzEwK29yUkl1N2Y3VjNpaGI0MVhyczU1cytUWTFGN2Jm?=
 =?utf-8?B?MEpaOG9TazNjWkgrczJpc0hPVlgvU0s1TjJoL3N2Vkc1UzZVRi96RVVtQjc3?=
 =?utf-8?B?K3JyRzZudnFYN3hDNDZMUWlpUFZVbDNLK3hiY1dtdFRxUG4weHlvTVdQRjhq?=
 =?utf-8?B?RnNGMmZVY2JqdVlDbHR4cElLOXVRVGtDcjZQYTRnM1RueVROdWpyaWQ1Nmxj?=
 =?utf-8?B?OUNRcmlWdnN4Y1FyRU9idXBMT1U5eWs3SmR0YVNXU1doYk9mSmEva2J1NmVO?=
 =?utf-8?B?YkdLT2ZpQmZTTnZncVFweXpWWnFoZnlYNGpFS25nSXROUlpDMzMwMm9zVnJ4?=
 =?utf-8?B?UzM3aU00YXhWcWhzU21pVVRvNkdnSkhqNGhXbHBRWHZoNisyZmdvbk1IbXFo?=
 =?utf-8?B?WEY4STNzbmJoS2pIY0xCUURJK1BFWm1RZkhjRWt4SHl6cktidzBCNzAyRW1o?=
 =?utf-8?B?NmZ4aXozaDhHd3BaV3p0aitwc1gyUk5hbGF5SS8wRHdLaU03aEdSdkpkZ09n?=
 =?utf-8?B?VWI4Skw0VlNYMUl5dkpSdCtodTlFSFY1OHVJclM1TDYzcjFMaDlBZ2hva2lB?=
 =?utf-8?B?TXFMWkdvYUJhUXNMR1NBbklxNDlsMGVYUk5QTUFQTVcybVlWTEsrdDRYbklJ?=
 =?utf-8?B?eStZWnJQVW1pMTEwSExSMWgvS1VPNXRiWE1YUVBXK1dudlU1RDJDMXFUU1U0?=
 =?utf-8?B?TXRnb0NPV1piM29zR1ZPdExTWE1WbkhJWlJUNThndS9hVE1rcG1yOUJuNWVR?=
 =?utf-8?B?UUFJRGlUSnVrMWFmeW56ZkZXSVJNL3Y2RVBUbnNyUFNkRU9CZDdxMjZ4V3ND?=
 =?utf-8?B?aXhJenB0SVI0SVZlMVBNVDRTTS9DWkdzQytlcGdSZkhWRnRtRGgrdlYwVXMr?=
 =?utf-8?B?WnVqZUVlcHNUQmN5Z1MvRTVVWjVqbXlZS3I5UVd1WjBZamQrRUc4dVVqa1ZD?=
 =?utf-8?B?eE52MWJqcXRVaXc1ek5mcURxUjFqd1NVUjRxTEhwN1htZVpEUFJnTGlXUU5h?=
 =?utf-8?B?N1c1a0l4MGd1eXNmV1VpTHFSMHFHTVVRVVkwMXRPZUpvOWVuSHdRb3J5NFkx?=
 =?utf-8?B?VndzaUk2d2JlSFA1YlN6TDBNblE5bDNscm9qS2t0LzVBbDhtcFNwK2dkRUZr?=
 =?utf-8?B?S2dDZVBCdDJUcXBZN2NiQWFXdks4MVBvNjdoWVJSaE83WXFLSEMrU3hrTDZn?=
 =?utf-8?B?eThVUGxyTzNrNkZURDFyUzc2SzVvK1B1S2R1eHo5N01KaGwrRWpoM1d2Yy9R?=
 =?utf-8?B?ZGlXbUJodXFIRGg5cjdJaGRvRVdidXdvRnF1aDZKS3Zoa1FDMzNZOG9yT1Bz?=
 =?utf-8?B?dHNCejRwbTFIck4xUlRWVlR6aWlFbG5EKysweWNoREJOR1R4bjUyVEhIc0dQ?=
 =?utf-8?B?SlhBdnUyL3p6d21pNzlBV1RGaXFqVFhUeGU2WTgzMGh6UVcvQWdrSGppR0Nx?=
 =?utf-8?B?MENDTjlBdnUwL2ZUY04rWDluTTRyMUg3dUxzL1pRNHovMWFuYUU5WFk3SEEr?=
 =?utf-8?B?dmNZTFlQV0ttQjB0NzJVeFdvYmZHNjBVT0tzZTd5RVZwWVVsREJ2NW5wNTY5?=
 =?utf-8?B?VUxNYm0vOUhBL08yc3Z5MGJENEwvalh0VzBJOTdGNjlLdTZYQTkyMlpYc2sz?=
 =?utf-8?B?N3REMHl3dWYzWW5nRVE2Z1RoaWVjZ0xIOFFCNll3LysydUl6Z25zeU11UHh1?=
 =?utf-8?B?MWNLWnBIdXQwUWwxRHIrMnhVVUw0SGtUT2pRU0ZXenJSYjh4SHdPc0Mzcm9j?=
 =?utf-8?B?aXVDTkp5YU84TDlHdlFxbWlwQVloRkZzOEdXTDYweFBDRk11TUdWWGRUbFZk?=
 =?utf-8?B?ajVKenJVekEzQ3ZtMWRNUFFUUlJsNzNpL242bXd2ZUp5aG1mdE01a0ZnWE4y?=
 =?utf-8?B?akFOaHFsT2dhalpYMVl3UnRXd2RDUFpFc2RBa1lGUXBremFvTzBNeGx2TVBn?=
 =?utf-8?B?UWtYSjczWEVXS280NWpuS2N5WGJva2ZMOFJqd0ZHdHZtOVV2NEN4L214UnZM?=
 =?utf-8?B?Q2IzNjF1WWhtNVl1NlRMeTZuN3JId09rN1NjS3RSYXpHWTZPRzRoTWdleldI?=
 =?utf-8?B?NGJYaTJQQzVXTFNQcFJqbm12cDd5N21tU1I2blN3V2xJUitEWU8xWjFTNzR0?=
 =?utf-8?B?ckxQeHE3SVMzTmlDV0VXeGtud2IvOHdTNGt6SGZjSXk4REJqcTBGVVNISW1O?=
 =?utf-8?Q?EuxLJHfpJFIR3kh00leWkGP9AHQIdFFAG2L9CD8Yxc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50932FC4BAC0B34099491FB39ABA4E41@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e36cfb6-d375-4fcd-a1a4-08dad862b101
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 14:52:41.3790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sB1+8gkHs9oMUymmwAq8Awqchf1E+IrbGshaD22dCWn82/LHx9SK2RUPcpVDSj0srULnpHka70/Ou+LyN3+/kYZP3SXAkq/I0adt3NEgGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7007
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgVG9ueSwNCg0KT24gV2VkLCAyMDIyLTEyLTA3IGF0IDE1OjUxICswMjAwLCBUb255IExpbmRn
cmVuIHdyb3RlOg0KPiBIaSwNCj4gDQo+ICogQi4gTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVy
bWF5ckBzaWVtZW5zLmNvbT4gWzIyMTEwMiAxMzoyMV06DQo+ID4gRnJvbTogQmVuZWRpa3QgTmll
ZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBUaGlz
IHBhdGNoIGludHJvZHVjZXMgc3VwcG9ydCBmb3Igc2V0dGluZyB0aGUgd2FpdC1waW4gcG9sYXJp
dHkgYXMgd2VsbA0KPiA+IGFzIHVzaW5nIHRoZSBzYW1lIHdhaXQtcGluIGZvciBkaWZmZXJlbnQg
Q1MgcmVnaW9ucy4NCj4gDQo+IExvb2tzIGxpa2UgTGludXggbmV4dCBjb21taXQgODlhZWQzY2Q1
Y2I5ICgibWVtb3J5OiBvbWFwLWdwbWM6IHdhaXQgcGluDQo+IGFkZGl0aW9ucyIpIGJyZWFrcyB0
aGUgb2xkIHNtc2M5MTF4IHVzaW5nIGRldmljZXMgc29tZWhvdyBmb3IgbmZzcm9vdC4NCj4gDQpD
YW4geW91IGV4cGxhaW4gaG93IHRoaXMgYnJlYWtpbmcgY2hhbmdlIGxvb2tzIGxpa2UsIGluIGJp
dCBtb3JlIGRldGFpbD8NCkknbSBhIGJpdCBjb25mdXNlZCBzaW5jZSB0aGUgY2hhbmdlcyBvbiBv
bWFwLWdwbWMgaGF2ZSBub3RoaW5nIGluIGNvbW1vbiB3aXRoDQpzbXNjOTExeC4gDQogDQo+IFJl
dmVydGluZyB0aGlzIGNvbW1pdCBtYWtlcyB0aGluZ3Mgd29yayBhZ2Fpbi4gQW55IGlkZWFzPw0K
PiANCj4gUmVnYXJkcywNCj4gDQo+IFRvbnkNCg0KY2hlZXJzLA0KQmVuZWRpa3QNCg==
