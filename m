Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8A65ACEA6
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbiIEJOu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 05:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiIEJOt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 05:14:49 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D943C1F9;
        Mon,  5 Sep 2022 02:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpbjXg/AL65FWl12OLyqBDzYS6L2vFYldsov5pK1ItQeiG27aN1qrXv/uQsD4p32x9S+A48jAhC6pN4q1dACHhlSOc7sn7Mc7YtTz20mdCxbRCLPCCrzMvMVFZL6mRm81Ml8cO68y4FYLU/QxXDkULdzlxR5NuxTx9sf8WYPizQU0t2t8diuTu0F6q8acZ7KDBrfpr0TUazw3mZVSAw4oCZTSyMSRgcTt5rDaw/RQ1YFr/U5h33vMPm85Tl7QfbPPLidZCegLswqywZXFEhKZ3iW2JgIHXVo7iMT05r5hcAUg4bdpHIO77X6DZz9gdmqOk6EtFThLnisyopE8OaawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj52/wk6lDLW7rkpmjZL65Nn1O89sZ2s2RVatB0FcuA=;
 b=KgH/Gk+G49GGTbAM89dckfUmuX3YsylLbp8eC/S7psu0sAn6BJtiEh8iFX/1n7HLIkj5CKVZzHeALVHbEreyfBBgBSVr5/6CO0hRGM7VcHCm7Q52X38TuBfLuEwE2eGi0UaMOVrinY9o2q5UfZZUgM3T0AjulQBVNywLvJWP6qPp36bLeSAsBjqJAojwWiv+YBeWrowLnN42lxW6ZcabcKssPsAQhR5q+YaLpqZ62t6gaazfn8zTRwRQ6EMq01o5JpHMx0/+tchfsqd++akxMFpg4SZl2xhAcbsndRzL7sQlrjzebpdGRfpaduPWAvcCNrLl26aAJyD/0NQCotPOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj52/wk6lDLW7rkpmjZL65Nn1O89sZ2s2RVatB0FcuA=;
 b=lTelGnwT9wHQdZ/EP1TQk+AV243XjMejR5KWoH13WAak/PXl/1dFe7ydSncOIlHjHVeN6LubVTl9NxvvnKDGw01CqSdHFELi+8/Fu7A5/9EDedMVYlm5LaFEZ3P6FRmFa3yUNWaG3I4/5jB6zzkoqS5y8QqDRvv9UiUegjEiVD764ZSva+tas/DwTMbpbGZatzvr/hySnaBNn7kCVSXXV9HT7AX1rgndplB3loJhJQnIGp3bfo1rbxIbwd8u/yS1CuODywtb1u/KAqWhDjBOQeWmb+mVgdsDgj2qZtSanym01J449m+qAEzL5F3OP3JjmFcUR/EmLptZqzVEMeybLA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PR3PR10MB4111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 09:14:45 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf%7]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 09:14:45 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Topic: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Index: AQHYwQVr/FYdP5u1PkWzXBuYLjmi3q3QjdaA
Date:   Mon, 5 Sep 2022 09:14:45 +0000
Message-ID: <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
         <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
         <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
In-Reply-To: <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45cfbe20-134c-4935-8f46-08da8f1f1366
x-ms-traffictypediagnostic: PR3PR10MB4111:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZM4f0iywrTHNS83ukht7lkBN8EM93T4gcKtKA1BivsDIIh6nCk8vjfPUm5XV27lJs8Cokp7dhjZIRQTmtOpfo6hSDhoULSKS8KenuZdwDDHOwbbyuQ1r+ElqHMl/x6PxCpjLkd2jHNIHqvs8630VkhSGO/6AAF5UQZQuXXcOaEffZhT0rSsPDn1vm0aF8ezp2KcJKgPlhhvOuuF6EMOuKGOr1/cM5Vv0MXD8LvS1ayfbBG1zg6SayDnkiEe96qkA1K+hyKE6O+9vVLu2bzCwyEqlRNDcSIdOA7O87Qlp16PQvSPx6DGYF4vIZi7WgmwnD5DMbn+hKrT5RBw0CWpf+T+h1ydd0qtEe2e5qgpae7tXo91j7xrxLmEGItziGDfCctswfMifMjeu5FEI2d/C4xr13B2YVH7OOUSbOypVGx38KaQlQnCrkb0Q9nvxXWArBh5OUKQv3/GJpXUNiud2GB3YXapA0zlVCyKXN38Dx42eJRcW0bGm4+eIBUoyPNsZUknKwLTdL0A7h2eif/bGehWTD892VTkvPhYvsMEs2mHVJV6XELOZlfKpnmj4o0GT0eEvwCPy2gJqQ7GJuKrDy5qrSHvHr4u07e7Gq1+oEdLL5NwirrKgobAiqugqOOPM8knR9vQlzcBMRKXVB66ueH1esIowTtRTvF+7KQ32D7x/X4sP52+VctnTDlRjDKTIk49Cnz5584EWZjI+c9DvFaRAxs29NRAq3DJQxxisroFQdXuvbyC70j1D8Im9FVlxhbo0pKbADeJKBAooOpV8sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(66476007)(4326008)(8676002)(64756008)(66446008)(91956017)(76116006)(66946007)(8936002)(5660300002)(66556008)(6506007)(478600001)(53546011)(26005)(6486002)(71200400001)(41300700001)(6512007)(186003)(2616005)(36756003)(316002)(54906003)(110136005)(86362001)(82960400001)(3450700001)(38100700002)(2906002)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUk3WFRaVHhNNS8vVFZmK1NNcVVEVXVhdll4R0JKTW85Rm85WEs4YzIxNEpQ?=
 =?utf-8?B?dWJaa1JOd1FHY1F2WUdpNUNxTEhscVhKN2dvUG9Lakw4K3pURWxRSVpEVUxX?=
 =?utf-8?B?NHhjSzI3Q3laOXUzU1hmUnExZE4zNVhTbEJZVlhaZmc0MTZtT0h4TERublJZ?=
 =?utf-8?B?N3p5bVBvSThzMnVuWTdYNE9XUU0zUkhGOEZ5cXhKSlQxb1JpdnVITVR3Tkp6?=
 =?utf-8?B?b0tuZVF5RmRUNXovVVR2Z0NiTEs0QnBKc3lHQzgxd0FBK05kYXlRZ2tsdlpM?=
 =?utf-8?B?QjRZa3pNNGNLRDUvVlRCK1dRVFpDeGNvaWJVZWtrWmZtZUFQalk0bWp2bTU3?=
 =?utf-8?B?QU5iN1VTMkl6Vzl1QjRBZ2NhclFJM1B4U0M0ZElQVmUweDA5d0R5Z0haU0li?=
 =?utf-8?B?MHovZW01eUx5RzJJeXgzbTVpbUJ0UkhBV3VrUEY2VFBmRmczSWxiaENIUGRK?=
 =?utf-8?B?M1VveGRoRTZVaEFiL3FQU2NZc05mbkpLTVJTUVZmOEloaVJ1eS9kSlNqYVVu?=
 =?utf-8?B?V3FoaE1GcmQ5KzlVMFVXaDJNTytrZnV5UVlkdld2VmJodVlOT1lHeStnVzZS?=
 =?utf-8?B?eFZ5NU5sNzAxbkt0MWNBQmx4clArRDhuUFE3RnZkTjcydFNVTWhLWkh3RllT?=
 =?utf-8?B?cnIxYzF6TDUvQytzbVF4eDc1a0t4L0JiR2FxOW9HTHdUaU9acEJsdGVNQ3NV?=
 =?utf-8?B?OSszZ1Zna2Q0ZHlJY2xnZzlEdlZaejJyVG44VTVPaTU5b2xmck4yZXZURWdw?=
 =?utf-8?B?RUVmU3pGckVxbHdaTStaOTBBVkZYMnppUUhmT0pzeGUwTXVqOUdkZUlqYzBv?=
 =?utf-8?B?ZmR1TndaVVVNN0ZWeDU3MTdkSVFITDF5TzVPUS9MN1I2YlMrZDZoKzZPMGpH?=
 =?utf-8?B?dWx5bWZVMmxGV1JmZGRRbUJtTWdpV2M4S3FFdG1NSTFKblpIN29HSWZET3BF?=
 =?utf-8?B?eEk1ZVVtbitEckNoR2IxeVhVdmVsM2hLTmp3QnQyc1JueGM1TGUvTWM1dzR1?=
 =?utf-8?B?STV0MmRDQ2RDcWJVTHJ3dW9rTDVRaWxZNUJ4QXpjajRCRGl1ZDJDREtmYmxP?=
 =?utf-8?B?a0E0Vnh3K0xkZG1TeG1mY2VWTHVpSit3YitKeFdqTGVrR1lYa2psb2hlY2tz?=
 =?utf-8?B?QVdsbXVqNzI1Q044ZXZBOVB5bFRMY051SUpDSlo1U2RWUzgwRWFtV3RNL1lJ?=
 =?utf-8?B?aUhJNUJyMlQrYkMybVZhdkliUWV3RlV1S2kzZXAzc0JjcFo3elI0YmN2TFhP?=
 =?utf-8?B?K3MyV3hxaGNubkJJZkl2KzR3MFZrSkptNXFicW9OWFVQSW5PaXdzZFRFUmFZ?=
 =?utf-8?B?RFFwQ1pZSjlzd3B3UExzcTRRai9HaUlrdG1xbnV5M0ZFR0szMVFaL3k2bkFs?=
 =?utf-8?B?LzlNSDJmemZzVmE4QVM4SE5ZMVhDMlF2RElFa1pSeCtRdmduM0VnK3E5eFRo?=
 =?utf-8?B?c2NQbzBCUm1leGJEa0E1eFhJemU5c1dvOWdDd0dkaGV6dnQySGRZWlJoSXg0?=
 =?utf-8?B?bmhTTmpXRVBzRXpLNjBpcGZtNHh5OE9CNFhYUW4rdnFHL1lEMkxyM0lGVU1z?=
 =?utf-8?B?NEpSY3pNQUxrWFVKVk4rRzVLWDN0NkZzQXZSYVZjK2EycUlZci9PdGdxMFlP?=
 =?utf-8?B?Q3d5eVMxUHNNWVZvZ1VRZmZKTFFjZkwxNjZyVXVsM0ZNMG1sZFp0ZlcvWTBC?=
 =?utf-8?B?SUsvc0M4bzhvOFFqWGI4OFJQSWprckw3Q1hVSUd3clBjbkNzL3hEK0kwVG1J?=
 =?utf-8?B?Z0txWEFHQ2k1d3FpR3E1eEFtYjgyd2ZzTU80V0xKUEw0dEk1SEVnU2taSERW?=
 =?utf-8?B?NHl0Qi9YQzVnTmF6Q1gzbjlPdjlwQTZia05yQjJoUnJPTUN3S3JZdExXSXJa?=
 =?utf-8?B?b0prVDRQcHF6OCtSRHJxSzVIZGM0aHRDbUdFWkNKTWRBbDdPd2NrK3kvZGVZ?=
 =?utf-8?B?R29SekF1RjRPUFZFbWlpdm1WRXdDOVFPeHl5U1htekg1UVlNR0FHd1grMktt?=
 =?utf-8?B?K2pYY0laTEJzTTZYZUVNN1RZR0dHQ0doT0RNTjZsSUxqa1U0VktybTVZdDR3?=
 =?utf-8?B?d1RrQ003Vk5LelF0d1FJbjc0RlZOWFdHTVFMSkgxVFdkVUtLMHFiTm5NUk95?=
 =?utf-8?B?dkZ3QTkzRmdoMXdPakpZN2hyamJEUW5WSXFsUGRYNkE5Zms4RUcwUUd2UmV5?=
 =?utf-8?Q?YKQ6cumTyenRlhSc7XCsuWs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCCC7710E1FCB2469392A7751543B411@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cfbe20-134c-4935-8f46-08da8f1f1366
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 09:14:45.8280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wesKRvunHXfj7eu9MsiMYxqEgoVzjQ/Y1pl34B+jogVenrZ4hK87FKEkow0Embmjcg0pZb6o18yc79esrr9QY5uuTrh8Zc/A9quksCN0mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4111
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTA1IGF0IDExOjU2ICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0K
PiBIaSBCZW5lZGlrdCwNCj4gDQo+IE9uIDA1LzA5LzIwMjIgMTA6MTcsIEIuIE5pZWRlcm1heXIg
d3JvdGU6DQo+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5
ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBBZGQgYSBuZXcgZHQtYmluZGluZyBmb3IgdGhlIHdh
aXQtcGluLXBvbGFyaXR5IHByb3BlcnR5DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmVuZWRp
a3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbQ0KPiA+ID4NCj4g
PiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLWNoaWxk
LnlhbWwgICAgICAgICB8IDcNCj4gPiArKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy90aSxncG1jLWNoaWxkLnlhbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMvdGksZ3BtYy0NCj4gPiBjaGlsZC55YW1sDQo+ID4gaW5kZXggNmUzOTk1YmIxNjMwLi43Yzcy
MTIwNmYxMGIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLQ0KPiA+IGNoaWxkLnlhbWwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3Rp
LGdwbWMtDQo+ID4gY2hpbGQueWFtbA0KPiA+IEBAIC0yMzAsNiArMjMwLDEzIEBAIHByb3BlcnRp
ZXM6DQo+ID4gICAgICAgIFdhaXQtcGluIHVzZWQgYnkgY2xpZW50LiBNdXN0IGJlIGxlc3MgdGhh
biAiZ3BtYyxudW0tDQo+ID4gd2FpdHBpbnMiLg0KPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gIA0KPiA+ICsgIGdwbWMsd2FpdC1waW4t
cG9sYXJpdHk6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBXYWl0LXBpbiBw
b2xhcml0eSB1c2VkIGJ5IHRoZSBjbGllbi4gSXQgcmVsYXRlcyB0byB0aGUgcGluDQo+ID4gZGVm
aW5lZA0KPiANCj4gZGlkIHlvdSBtZWFuICJjbGllbnQ/Ig0KPiBDYW4geW91IHBsZWFzZSBzcGVj
aWZ5IHdoYXQgdmFsdWUgaXMgZm9yIEFjdGl2ZSBMb3cgdnMgQWN0aXZlIEhpZ2g/DQoNClllcywg
dGhhdCBtYWtlcyBzZW5zZS4gQW5kIHllcyBJIG1lYW50ICJjbGllbnQiLiBNeSB0eXBvLi4uLi4N
Cj4gDQo+ID4gKyAgICAgIHdpdGggImdwbWMsd2FpdC1waW4iLg0KPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+IA0KPiBXaHkgY2FuJ3QgdHlw
ZSBiZSBib29sZWFuPw0KDQpPZiBjb3Vyc2Ugd2UgY2FuIHVzZSB0aGUgYm9vbGVhbiB0aGVyZS4g
SW4gdGhhdCBjYXNlIEkgc2hvdWxkIGdpdmUgdGhlDQpwcm9wZXJ0eSBhIG1vcmUgbWVhbmluZ2Z1
bCBuYW1lIGUuZy4gd2FpdC1waW4tYWN0aXZlLWhpZ2ggb3Igd2FpdC1waW4tDQphY3RpdmUtbG93
LiANClNpbmNlIHRoZSBkZWZhdWx0IGJlaGF2b3VyIG9mIHRoaXMgcGluIGlzIEFjdGl2ZSBIaWdo
LA0KYSBib29sIHByb3BlcnR5ICJncG1jLHdhaXQtcGluLWFjdGl2ZS1sb3ciIHdvdWxkIG1ha2Ug
bW9yZSBzZW5zZSBmb3INCmJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LiANCklmIHRoZSBwcm9wZXJ0
eSBpcyBtaXNzaW5nLCB0aGFuIHRoZSBwb2xhcml0eSBzdGF5cyBvbiBBY3RpdmUgSGlnaCBsaWtl
DQpiZWZvcmUuDQoNCj4gDQo+ID4gKyAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICAgIGdwbWMs
d2FpdC1vbi1yZWFkOg0KPiA+ICAgICAgZGVzY3JpcHRpb246IEVuYWJsZXMgd2FpdCBtb25pdG9y
aW5nIG9uIHJlYWRzLg0KPiA+ICAgICAgdHlwZTogYm9vbGVhbg0KPiANCj4gY2hlZXJzLA0KPiAt
cm9nZXINCg0KY2hlZXJzLA0KYmVuZWRpa3QNCg0K
