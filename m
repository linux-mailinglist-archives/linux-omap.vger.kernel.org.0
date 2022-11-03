Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C34F61785B
	for <lists+linux-omap@lfdr.de>; Thu,  3 Nov 2022 09:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiKCIHa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Nov 2022 04:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiKCIH1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Nov 2022 04:07:27 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B666150;
        Thu,  3 Nov 2022 01:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McniIQlVZsdtD3Z+HD8amGaLH7SYIkM2/jMSfpnFwYteNJ+T/oAFrY7TyXb5Brkzo7lrz12DFbwLwWTxaiwqUYOmSldbCH8DA2j3QzhAKZF7pciG0aQPJI7ST0aZVQSSEnGEuzuxEVGBU5Z5YsPFVqzgiqTM0v6/pL5d9YJt7oZEdGc4xlb9zINUxJP23n7wMJ9s4FgPVKHJTtnptOgyPldEt+Oz5IzDwlSJ8qC+F06zoCGbFbnvGap8YyKl3cA3igAVcXpxrpJ1MHPlO+1YiVD5c+AzaUzeqoHJDesbW8BSFBcp3leli2eQOhe3rtXKunHRmHlvaeSp8ZuK/Shc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5E3Au6UVCtF2oZmtMQA1e9Nn3DLjiXPnplb3DcqWM4=;
 b=OHVHyIX3TH8P1z2htLDPgVZKb0G8klS+4g2FzRdUStvKYw837DWn+BgYXUUCcho9ByTLBicyzUrJeVUoM/PP+y6fK/91oYtnhpdiMxRU+bwsGpurH7PEVhS79rexBe+9U+SZ6gIaJiszzubG2tG8EGciZZIvvY5T0pcWD6ji0GHLFJLKcWy8WOx3WkhuNSTiqYiIh29wQ7ljACzbYDpSUsEPOcT2ktovXeZ6ZYCncmVH7uOG35p1LS9S+Oyq1tGrECrgp/iomxKP5QkkhTxaE+xD2YF5pf4qYqG95dgKLI/UAaFHZjx3uuH3SM4TAupf8brzmz8tmkorrAxlDrpVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5E3Au6UVCtF2oZmtMQA1e9Nn3DLjiXPnplb3DcqWM4=;
 b=RpGOFLdbuPjso2gRRVEGPArUOY+nMXKlKZrvGRWAz7DDIezTCvEdj6L7PlGCHkDhISpD5eczoaMxM/7sIUj6FphlAtYmRPUm+ZjLXaViPSCiivh67oqqu628H8nQYrH7t/uRtMNi9a9qRACCHYqf328HyEnUuXP+vFzZFm3InTWGIzBBXg+8iVGxFprJI3KQ4Egu/P751s1SwC1xYsHf3alF+Nswr62fQuxX77stkBzEKpfMG34VHj0xLP7bRVorzr9jUiHT/FnY0jL3oK8Q7WSKgDI0b+kbu0+Tbi1CJfrcMb0mS9ENJWwUkMW6tZNfvjZYVjN7Qf8zKyjumD+Dkw==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM0PR10MB3202.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:181::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:07:22 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695%5]) with mapi id 15.20.5769.016; Thu, 3 Nov 2022
 08:07:22 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 0/2] gpmc wait pin additions
Thread-Topic: [PATCH v9 0/2] gpmc wait pin additions
Thread-Index: AQHY7sPuzBIsS/5XbEupQ0kCeZvdXq4s2RIA
Date:   Thu, 3 Nov 2022 08:07:22 +0000
Message-ID: <119f5d609c50400e5b62b306733a62e8f92b6ce8.camel@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
         <166739782624.6087.4220604389047260115.b4-ty@linaro.org>
In-Reply-To: <166739782624.6087.4220604389047260115.b4-ty@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM0PR10MB3202:EE_
x-ms-office365-filtering-correlation-id: 67cb5c30-0e18-4f5a-26a2-08dabd726fc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JibLAOlqYQNC4vxw8o6J40YlHETrIlVnHsyzwBE1RndOBE1GgAVqxq2j1r/vLrCF2nkO16hNhG5soSyuDpnuOcsj32eKPqsUvCAFURNyRrARwiJci2sPAl0JyflTMYvxmRCyFcMSSzyWf2uSWlHTLlBLHypvLHCNHf6+D8G18ekQEbYU5CGs8aewV79K0VKW8IE3Umdl5DJpP8X6axvG5Re8evninJkCZ/1n7J/LhlYRJLwKpbeArllcA5wqppTbyA2eoGJlBKGHviVV+9BiDyRMjXmNCsA8jUyBceLM8NGbHDn+pmRbkUYhvofbZTUYXFW7UVXhjG7kviet7p6jLVLLrJtjwp67ACbE8ULOwjTHPuRPoO6tqSvyslXEJ0toLIYBDCuE+Xg10SA7v0l4BQe8wQ/9zbk3pxXLlCzebZG8iWVqsdmfqQb099RRpC/uFOexBDkWsscykupgbfCMYP/0WZQlD5Ts30cirH1tSzaWDrnE7bbIJvQuSY+nfXLC2sI+IoI0/nWWisV+Au6jHxRt9INHMM+VQwT40rUR6WdxZ9r7CENH7+kRa6CcuMdRInWdHLTZyAzN+3QUbG8JxTTqPTJSzx+GUBdxrqawvb+Hp+HaKhqQrAJs198TKSzWxDER8FEcQ51EYfbDUWV2NhYeykuhWZ51NQtw/xQAZe4/0vr52B8TeJIqmx7G7Rc3fPGZthdtvf7y41sNH0PpipM5Fl3Zkx3HqvtdIyewywvo0ireOAFmL2Dxkc1PAp4E6X9zv0+vfUxfxWk36fdzHuJCNJ8S8zIPurSmsAmsEoo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(6506007)(6512007)(86362001)(2616005)(186003)(38100700002)(66446008)(66476007)(8936002)(54906003)(66556008)(8676002)(64756008)(110136005)(478600001)(966005)(5660300002)(6486002)(38070700005)(4326008)(91956017)(76116006)(66946007)(41300700001)(82960400001)(45080400002)(122000001)(36756003)(71200400001)(3450700001)(316002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1RQY2t0QWU1dk1Ra1d3M0E5WUZoZ0dCYUYwaEJHaExpeVRacWhGczg4dndq?=
 =?utf-8?B?NHUvVmt5elE0Q21xdklQVjc3NzhxYm51NkIycXJwd2NKQ0VZdkM1aERsem1u?=
 =?utf-8?B?RjFvbWRXbUd4Yk5NV21ZVS9hVmU3bTB6Mk9YSmVTYVVuRlRCQnZVQTdMcHFw?=
 =?utf-8?B?dWcwekExZXd0Tzkyb2poSVdpTEpud0R5OTYzRGV3TFVUR2xKSG5BdW9Xa1NE?=
 =?utf-8?B?YWUxNWk1anBxaEs5TUZPNHQrb2taZjh4NTNyOXc2b3lYcUQ0eWJ0OHFNbnVM?=
 =?utf-8?B?WCswTjN6TlNLc1BoMWNsRUlwR2k4YjFYVGxlS2VITTMyWU5TUFBHVTM4NnJ1?=
 =?utf-8?B?aXFuWUlpNTZUdUgvTk8zVHlPUHFUUTJhODdEMDc0UVBPcTExSjZMZzZXcFBo?=
 =?utf-8?B?QXVPcy84SHlBUmZKMVFCdXlVUEZLbE1mRU01K2o3cmpzUkhQUWZLNXh0YlV0?=
 =?utf-8?B?VVNhZE5hbWxQbHhnOU9FWm9OV2hrUWorNzBYdkdOajY0eHNwZXhOZnI3SVdT?=
 =?utf-8?B?dnllemRNeFV6RjNwaGFiRE5Hd2dmeG5ZdlQ1YmwvL1F4aVpFN0VNY2NBTDJk?=
 =?utf-8?B?UjU4OGpsWGdhOFZNZlM4ZUFkdmpmWVVXZWx2WFFWU05rbFdCS0oySWxWOTNT?=
 =?utf-8?B?bTduVTVQZy8vQnNIV1hUbkZiVE5Ba0VtZjFvZFIwSUdNNjd5ZHgzZERhTnA3?=
 =?utf-8?B?a2ZQMFRBZEVtLzhtRWFtdEFvTlFiZ3ppMVdRNVB3RXJFUmswREFFWi9WVEEr?=
 =?utf-8?B?Z2FVVi9iQm1OMCt2dVpJY1RNa05LN29WOHJqelNWZVN1Y0wrdjFONG95ZTUy?=
 =?utf-8?B?MEMyK1FpTWsrc00xU1lNdlRnMk5WcEpGYnhiWVlrZnJIQUV1MjZqaUhVTzVo?=
 =?utf-8?B?WGZZcDVwS0M0VldINjdZcFlqR09HQWdDc1J1RnVGcGxKemhzWEFkbTR0OUZX?=
 =?utf-8?B?NlJUOUF4NmkxVFp5TVRrWVU1U21yeUc4b1ZtaGlwbVFFSFJTTVc5TUtYd3FE?=
 =?utf-8?B?VFZQUytuazY2YVFBZUEwcDVITUI0ZFFiTXorZEc3aUhUSWlTVGpMV0djMTVW?=
 =?utf-8?B?UDRER3R6NWdXZHRTRWZ6UnNkaHgrTmp1aEFDM2JoU2xLeTVpSGsxZ2FkR1M1?=
 =?utf-8?B?VUhaZkl1amtxN1RLMmhXcUkyZ1RjWGh1cjNzcUZTVVYyOTNmcUM5clpYdENL?=
 =?utf-8?B?U0VmNk5jUlBnYTZtYS8wQ1ZyQUt1azZrN0lLRldRdFRjZndja2hvT1JUbnpt?=
 =?utf-8?B?Y1FEQm53WG1ENTRkRXhyRU1tNXc4SkQ2RzRuU1VZZUlQYit4M3hqM2cyWm9H?=
 =?utf-8?B?cWlpcUlHdVlKZ1YrWmZkakZCTG5FdXlHek5wNy9jMU0wTmxsNjJidW5LQS80?=
 =?utf-8?B?Z0R6TDdFcSsydU9iWUM2dEkrdUl6cTJKUTBnRjRCSlRaUGlxTW5CbHVESDNP?=
 =?utf-8?B?dTVrSlpkcmh5R3FkZldQb1RJajVhOXBjMW93S0JzdGZzTE1leHlmdkNaL2JY?=
 =?utf-8?B?N1ZDTzhIMjBQRGVPUnVPTFNXZ1puQzdBN0p2TVZVNXptNUhIWHlCSFpLbHVZ?=
 =?utf-8?B?ZGZCSXlkWTd2cEVLYzNoUldxUU5Memk1RXltQzZTTW9qbzFOSUQxWXlSajNL?=
 =?utf-8?B?eGFIREpGYWFZVVBaYjloMnRJanRPcUwxY2M1SHpkNDlobGlzZ3pnY045N3Zt?=
 =?utf-8?B?MVpWdllYeUlrZk1Qem1qY0U1SEhrSFlIUGptRldtRm13L3UwbEQ4YkxsUGd3?=
 =?utf-8?B?dlg2anlzRDAvOFdLTmpYU0lVK1FyVDluRGRET3hlK1hyMVpsMmJjc2lHS3Ar?=
 =?utf-8?B?aWpJWi83bmdqU1V6OFZSaGZ5RS8xSm9zQUpWT2xFRlpTUmllSVd5MVEvcUlX?=
 =?utf-8?B?OUVoa3BsOVZWa1ZVWktZNDJKdGhBRUt2ZFNiUWFhMDI4N25maTdKeTRYd21k?=
 =?utf-8?B?Rk51dCtGbFVvNmVWekV1ZS9nZWtEQWI1eUdxeTR3dzhDRWJPREJSQjZ2Z2RI?=
 =?utf-8?B?Sy9jcUlrYXYreXZDRUxOVkZndHdvellISkRHVXN2MndFZXprTFJLNDloL29I?=
 =?utf-8?B?ckU5M3EyUkNtOWE0S0w3L2JleG1QeWlKR2dNZ3ovKzNyWHZsbW5jVER3Mzk3?=
 =?utf-8?B?aTBOS05iSmMxT2xwSXk5ZDdvRlRkNkc1THdPcjBPU0pGQkVlTk5Lald0dnpl?=
 =?utf-8?B?V3lGTGFvOUhsWVd5QXY4SGd0NFRwUHNONmdnMXJoWmNlb0laNDZ2dHhGWGVj?=
 =?utf-8?Q?MDDwV52qot+xTaxlmsmCcS/Ypro4E5DP/ZVQFiZKmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EA71475AD8EA34AA16757E11BF84FCB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb5c30-0e18-4f5a-26a2-08dabd726fc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:07:22.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXSObloc+tf8VnN8sE16PrV/8/jtgPHyg/l1Ap4BwPqZSEnCPxzrG/ZuzyR9eEsiiDemcPJrmKdP2UIlSQWy0ysy4azy56g6IrhzqxtBnPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3202
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gV2VkLCAyMDIyLTExLTAyIGF0IDEwOjAzIC0wNDAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBXZWQsIDIgTm92IDIwMjIgMTQ6MzA6NDUgKzAxMDAsIEIuIE5pZWRlcm1heXIg
d3JvdGU6DQo+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5
ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBDdXJyZW50bHkgaXQgaXMgbm90IHBvc3NpYmxlIHRv
IGNvbmZpZ3VyZSB0aGUgV0FJVDBQSU5QT0xBUklUWSBhbmQNCj4gPiBXQUlUMVBJTlBPTEFSSVRZ
IGJpdHMgb2YgdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIGRpcmVjdGx5IHZpYQ0KPiA+IGRldmlj
ZSB0cmVlIHByb3BlcnRpZXMuDQo+ID4gDQo+ID4gSXQgaXMgYWxzbyBub3QgcG9zc2libGUgdG8g
dXNlIHRoZSBzYW1lIHdhaXQtcGluIGZvciBkaWZmZXJlbnQNCj4gPiBjcy1yZWdpb25zLg0KPiA+
IA0KPiA+IFsuLi5dDQo+IA0KPiBBcHBsaWVkLCB0aGFua3MhDQo+IA0KPiBbMS8yXSBtZW1vcnk6
IG9tYXAtZ3BtYzogd2FpdCBwaW4gYWRkaXRpb25zDQo+ICAgICAgIA0KPiBodHRwczovL2V1cjAx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQu
a2VybmVsLm9yZyUyRmtyemslMkZsaW51eC1tZW0tY3RybCUyRmMlMkY4OWFlZDNjZDVjYjk1MTEx
M2I3NjZjZGRkOWMyZGY0M2NmYmRhZmQ1JmFtcDtkYXRhPTA1JTdDMDElN0NiZW5lZGlrdC5uaWVk
ZXJtYXlyJTQwc2llbWVucy5jb20lN0NhNzdiMGE3YWUwOWI0OGEzZDg3YzA4ZGFiY2RiMTQzNCU3
QzM4YWUzYmNkOTU3OTRmZDRhZGRhYjQyZTE0OTVkNTVhJTdDMSU3QzAlN0M2MzgwMjk5NDYzNzA4
MjUzNjglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZh
bXA7c2RhdGE9Y2ZOYU9GbWNMYmZoTGREUVk0T1ZlNm9uc1JHQTEzQiUyQnFVczB1THlsciUyQkkl
M0QmYW1wO3Jlc2VydmVkPTANCj4gWzIvMl0gZHQtYmluZGluZ3M6IG1lbW9yeS1jb250cm9sbGVy
czogZ3BtYy1jaGlsZDogYWRkIHdhaXQtcGluIHBvbGFyaXR5DQo+ICAgICAgIA0KPiBodHRwczov
L2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZnaXQua2VybmVsLm9yZyUyRmtyemslMkZsaW51eC1tZW0tY3RybCUyRmMlMkYxZjFlNDZiODNi
N2RiMDhjOGRiMzE4MTZjODU3ZTI3ZGE4NGQ0Y2EzJmFtcDtkYXRhPTA1JTdDMDElN0NiZW5lZGlr
dC5uaWVkZXJtYXlyJTQwc2llbWVucy5jb20lN0NhNzdiMGE3YWUwOWI0OGEzZDg3YzA4ZGFiY2Ri
MTQzNCU3QzM4YWUzYmNkOTU3OTRmZDRhZGRhYjQyZTE0OTVkNTVhJTdDMSU3QzAlN0M2MzgwMjk5
NDYzNzA4MjUzNjglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlM
Q0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3
QyU3QyZhbXA7c2RhdGE9UGFPcGpvTTZhVlQ0cnB4WVpDdndJTThjJTJCenNmeWw4ZFRaOXN4R2R0
R2VZJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQpUaGFuayB5b3UhDQoN
CkNoZWVycywgDQpCZW5lZGlrdA0KDQo=
