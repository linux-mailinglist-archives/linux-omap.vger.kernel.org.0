Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBADC5B6971
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 10:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIMIXn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 04:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiIMIXl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 04:23:41 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7434211A14;
        Tue, 13 Sep 2022 01:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4w65bDjXR8D+NYW6hqYlDS3cFaeik68BuuM23QjTAkoRpuskfn1ENHoJ+njRFhDuJHNmNp8ZAKv3uj0EmD2Dv9k9Ew6zUrdzNjnFUz0buYrNrX71Maf8PCcEJHiXRjismHLUvmD07MrUEu46XDLrw/PfwUyJNj47I1p+nCM2kKzYpcV/GLP+AlWcXt0xW6YncyEg52FnWxzQKj34vIz4wlf6H+MKH159m18p3eZgdcRdUvQD9C6ay7IgIsYHsafOy0zgyki+Ju9zYhdCi1iuykljMqB/+H9sw3beFm24gnYRm/HEJOzqI6lQFYqDqPOscu0e4hsoAHoG/Oh0WAs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq2YAMYS4Hlskhdl90O9Sq86cg0IG1Oa1MkyFl2MFR0=;
 b=Dfs/QPsFX2w/JX8UWriSfTcohztTC49gnotYe4CIG6NABQ3eKx7dIZu8DH6gzjRGb3evvioRrQYt8oYKXFb0Frr3F0xZv9eyVjTogY28w0BG2NRzql+PThszTK5MB1GHRr9mVxAz9A9lEwf8Va6wgN6Y3NM+Vxj2bOTaJTwDoT3rDHyNmNKKiJ+/87H7GeJFqVxSNJNT3bzxTlWuvTpYRbW1uv6rK6gZQKDo09FXRLH9iywA+xADiKKpeHc1YSSRvQrCCxp4bqz1VONgTkqYwOgC40bDHfXqwdFajc7aXG+Y2tq+ZMwEmkjbowRhETLUNf1iLwMv3Qh7wBsYoWB0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq2YAMYS4Hlskhdl90O9Sq86cg0IG1Oa1MkyFl2MFR0=;
 b=TtwA3xTUyWHpsMQf1o2BQBDjuSci99LztfOdNcBS+iHhJzq44CFcbJRdtrQGHOo1SgRBb4tcCi590toyweeekq8M9x597sCWF55rDoNQR78SEcrweW9Yohy8zYsitv3GZG5fupVcCs5cf+8hz7ZFLjNCPZxsJHPMA+/nAnATpzIicnGtboAdunjWQ+04X6DZN0tIsRwc6Mc5zScoj0nU2Yp9Oj/bYJP4AEjsYlucdOFuCceLeMo/57Nh/qHbNwHccmaUY8PLDPprvPvyn8OIMtMEMt3r6fvanp05FDB1TshwovtZ1GPGmdrXIbdw9a9LZr+p7ClFaLGxQAB3n2MoBw==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by DB9PR10MB5884.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:398::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 08:23:37 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c90b:ed40:6276:18]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c90b:ed40:6276:18%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 08:23:37 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Topic: [PATCH v3 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Index: AQHYw3vS4gPjEC/lYk+8/tN5HBvt7q3bb7kAgAA4FACAAWV4AA==
Date:   Tue, 13 Sep 2022 08:23:37 +0000
Message-ID: <ca4f7a8f6f48b02e9dacb1dae27e90edaab2fcc3.camel@siemens.com>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
         <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
         <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
         <125ea34a12928fcdd8ef118eced8b2c59039d2ab.camel@siemens.com>
         <8326572f-8a88-6e8b-edda-7730a0a3597d@kernel.org>
In-Reply-To: <8326572f-8a88-6e8b-edda-7730a0a3597d@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|DB9PR10MB5884:EE_
x-ms-office365-filtering-correlation-id: e66ea87d-645a-4bcc-b044-08da956141c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jcv/HjdEX/J+PN17K1jNnKYR64g7br0GO9/qCXSuT3PMvX2mlS9OWm5xRtELVRjhdwH6eVRMbEqYtbU20Z9TkErnJT1IBi4javDcw6otYdlQOv7wyCRd1bDOfM5OBzz14dSJgbdrT/jHqEd/G0H5zko6ygpck+X8MiAkNKhWYToQabWoj15TLRoUxl+e5zJc0MotI8OzuUKGOqkxwGdvW+e0uCn0+n4sQjr24riv/eBd6TSJznBpqIumAjJlbcKoOquoPD6u3kupQqu/BcYXM8msgNlv9bcsKvTeIA/eX31DO7WzOtgmx5X+xuTxA2d7zbV0MupDPG8rRQHeyUFfGigdr/GKryaxzxsoA/xsHQ3NdPloBj53rG2BX0WdK5PFemj7YWUcOVVDLN9UPrbg6C2G3012v/CyBWUiuampliDsytglv9X/b2MO7uAeFT/AGIm1GtLxC22ybfEErZgPvY67U+E3nU7hMZog0QqVKQGn7nl/MpLfdWZs4XsAEimfwxQd8scQM4LN9ZUxfIpGWmJrHrUFSlM6yX3mt5lZJggTS7fAD7fcMuNqyKLgphlxVahcyd+dwDvBPk1FO7bG/1qJzxDsMOgrhbL/ILKmuDEj6cOYfKnDUmNSYyR40rzU7wvjvV6Xsc/ZDukrxjElubVAek/BqjzIbBR8x/Vp8gotkRUZrKsXs0fn9FML0WWqKItINiJM53bJ5vHJxwsPLPsKFtwhqK7EJJSX7rUUukMqTQWg53ZJGRTYHg7iFihDvEi52degrZXUZbyK9SJwqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(8676002)(83380400001)(66946007)(53546011)(6506007)(54906003)(478600001)(2906002)(6486002)(66446008)(66556008)(86362001)(6512007)(122000001)(2616005)(41300700001)(110136005)(91956017)(316002)(38070700005)(66476007)(4326008)(3450700001)(36756003)(71200400001)(64756008)(76116006)(5660300002)(186003)(38100700002)(8936002)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXN2VVFyOU1odzhNNlcwUzhqdWIycDduNEtRZEp6ZE1pUGhhamlVQ1BVU2JU?=
 =?utf-8?B?bUZQb1h1ZXFraFZ1Y3FNck1HUys0M1c2WUlHWXpOWjNpdjFiS0dReWdKd3dI?=
 =?utf-8?B?eXA4VEFwZk1kbmRhaXdIYmFlcDNvMG91VkttQW9QNTJiSXBVK1VVeVN2M0tT?=
 =?utf-8?B?TUNYSXA0MWJsNWQ3Smk2OEJnUDl5ZEpQMm1RV09tK3NqKzU3MWM2L0pjaWdL?=
 =?utf-8?B?c1VhaUtVcWZuSDJZT0hkWitQeEU3T0xQOFdJMTVXUmlIZGc5RFJxYmhlVTlU?=
 =?utf-8?B?bEthaWE2WUM3SjFlbkxPbkxDcGJIL2xtbU1pL29hdTRQUlIvb1crRDNCTUpy?=
 =?utf-8?B?QTZpSVJQNWFuc0pyZFpFTzRLQjZYajd2Yld1b0w3d1B6ZzVTd25HeVAvZGxV?=
 =?utf-8?B?NWNHQ1A3SUJONUY4QVB1aFByYVg2QWhGeERzVVhrN2lNdHZBLzROY1EvakFV?=
 =?utf-8?B?M2F2SGVwUkVXaGZUak5lenFHTnUwUDJ6ejZLYmNzQVBseXVFdkZ3MktwKzFT?=
 =?utf-8?B?eWVOTlVPWXE5MDlEMUhwL2dIeURhZXBTK0NXNHBjeVhwU25iYkp4SzlrclVY?=
 =?utf-8?B?SXpvRTdTUndVcHRsWDRycVd0VzV6bG8zWWlPckN4dDFpOE5TQ2VwWWRiOWVC?=
 =?utf-8?B?M2tDdkhmYmFpK2F5Vk1GQ3lOT2xMeHlvV3cxdjlHditmVlc5MWZQZkQ3R3lt?=
 =?utf-8?B?MHhEV3I2L1NybTVjVGNMRjhBKzduVlBkd0dveFFhUG5PcnRhbjBwSGwzVHNU?=
 =?utf-8?B?QUo2YlVoazFrTUhheE5pL1BTMkNxNzkrbHpaSXJqTlpaZmR6US95MHdaeTlx?=
 =?utf-8?B?VVFhUnRuVmRwdSt6OUF1UzBLRzhPazU4N2ErSmw0alArc0s5R2JiM2pOU20v?=
 =?utf-8?B?NDhoWHIwMW9XSVRwRHZpdVdvUnlMUEJ1Z1hTRnVqengxN3Y5Zmsxb0VzRjVQ?=
 =?utf-8?B?UVVrWHZNMk1wNG5ucWxBSXUzUUI5YUVYWUhiY0xteFZST1JsSHVtaUU5SjVl?=
 =?utf-8?B?VXZ4d3pOcm9ma2VLa1NuRngwdVA4V0NDTHBQTnQ1MkxjWDdHRkx6RVBKdG01?=
 =?utf-8?B?YW5yKzBaVnNLbkFJcEJKNFprZVhkcVFuaVFrR29sWGtGMG5tWS9SU2Y2cVpV?=
 =?utf-8?B?dmx2NG8wRDNQS3NpNVhaTktNc1RRcTlHNTFqNmtMNktBTHhzN0drREFPYUNC?=
 =?utf-8?B?alZNTXdwMFV3ODdkR1A0OFlVRDVQQTdGWkdQc1d3aFQzVkZuWGd2RnJ6djFI?=
 =?utf-8?B?b2F3cWxDQ3Z1aDlPN1BkNVR6TmdDbUhNZTRrOE9KNGZYeTVsWWJmc083UHlJ?=
 =?utf-8?B?bUE5cDN5Y2JubVNjSnBWd1lWWW8yTERELzNxRjVqV09QTGN4VnNGVjdxWU9I?=
 =?utf-8?B?Z2Y4SUhReFZBRDlYTnAvNUgwQi9TM2VnR3RvUXFoREJiYlhaajFMdW04Tnp5?=
 =?utf-8?B?VzJ2UkVPOXBkVG9rczZUcnRlZmprUENtMjFoZEk2alpPeVZQR2Z5dmY5Tkxq?=
 =?utf-8?B?RkxsY1hNeHhOWjJMM0lORzFBVkdpWmpxTml3a0VNWGV6QWc2UkkyTktGQTZj?=
 =?utf-8?B?VjZMaFhZMGVGYU9CRXI5dENTd3R4YTRQNTkxVjdLZXM4KzZ1cnVGbzg4cDdM?=
 =?utf-8?B?WGJ6c3lkTG9VMGF2SUpkQTRZRDgwaWtWRWdrRTRSNmxsS1Z6cEJzYnl6Qnhp?=
 =?utf-8?B?WXp5YnJVZk1BdUVBMmg0ZTBkY2pESWtIVTlLeTUwSVBXVFRMbGpacDZhMmJX?=
 =?utf-8?B?SGMzU216dzBSTkl5NkhSSVlQYVZheEtHYVZCOXAwT2hReU14OXZWWm5FMEhZ?=
 =?utf-8?B?WmNWVlZNb0NCRjBEK2pGSEpyZzQzVCtUM3FDTk9XYXUzUkpGZTB3dmVoWFBB?=
 =?utf-8?B?QW1yNVBMV2NqZHdUYmZhNWhHNHJSaXdXUjBxN05YSUd3amx2eWVQRzZJWWxD?=
 =?utf-8?B?dHN0NlFCekRFK2I1UXBxaGtBWmM5Rm85ZkZobTJWckF5aGYyR25ORmtna0FR?=
 =?utf-8?B?cVNwT2lwVDNnKzZkU21ZTnNkc1RJZDVMMS92QjE5M2ErcE1FNUFIdXk5T2lJ?=
 =?utf-8?B?cXQ3TWs4K081ZEcyQjRlMm14Q0F3OWR3emRFQWluVzRQbUFrTzZiYmVHU3Jx?=
 =?utf-8?B?Rm1yTEdNaVd5aC9RUTFmWjZ4SkFLYzNxeXEyMEk3SzdSdm9YNnJwQVFNa0w2?=
 =?utf-8?B?aEo2M2diYlJCeUdvN29xSU5LRTRHSHc5MnZrdnJudlVXNWQwem9BSE5BbFRv?=
 =?utf-8?Q?grdakm1mG0yTXOC5bf4STTUMbAl6WWPZA2wsNJnqFI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC2AFA3801486B4492F2E51B7800B30B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e66ea87d-645a-4bcc-b044-08da956141c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 08:23:37.4031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sO6CzMYhYbNKBdxQG6efRmvQwhPV94Li9SSH63F+I+ZK9Ksjq/P+Pg41roXMIJGFi8NRu7c/3vqQDLHg77kAtfQqYEZXoBKUttX9uDTpV2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5884
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Um9nZXIsDQoNCk9uIE1vbiwgMjAyMi0wOS0xMiBhdCAxNDowNCArMDMwMCwgUm9nZXIgUXVhZHJv
cyB3cm90ZToNCj4gQmVuZWRpa3QsDQo+IA0KPiBPbiAxMi8wOS8yMDIyIDEwOjQzLCBOaWVkZXJt
YXlyLCBCRU5FRElLVCB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjItMDktMDggYXQgMTU6MDkgKzAz
MDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6DQo+ID4gPiBCZW5lZGlrdCwNCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiAwNi8wOS8yMDIyIDE1OjQ3LCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+ID4g
PiBGcm9tOiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMu
Y29tPg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIEdQTUMgY29udHJvbGxlciBoYXMgdGhlIGFiaWxp
dHkgdG8gY29uZmlndXJlIHRoZSBwb2xhcml0eQ0KPiA+ID4gPiBmb3INCj4gPiA+ID4gdGhlDQo+
ID4gPiA+IHdhaXQgcGluLiBUaGUgY3VycmVudCBwcm9wZXJ0aWVzIGRvIG5vdCBhbGxvdyB0aGlz
DQo+ID4gPiA+IGNvbmZpZ3VyYXRpb24uDQo+ID4gPiA+IFRoaXMgYmluZGluZyBkaXJlY3RseSBj
b25maWd1cmVzIHRoZSBXQUlUUElOPFg+UE9MQVJJVFkgYml0DQo+ID4gPiA+IGluIHRoZSBHUE1D
X0NPTkZJRyByZWdpc3Rlci4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmVk
aWt0IE5pZWRlcm1heXIgPA0KPiA+ID4gPiBiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29t
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90
aSxncG1jLWNoaWxkLnlhbWwgICAgICAgICAgfA0KPiA+ID4gPiA2DQo+ID4gPiA+ICsrKysrKw0K
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
DQo+ID4gPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0KPiA+ID4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy0N
Cj4gPiA+ID4gY2hpbGQueWFtbA0KPiA+ID4gPiBpbmRleCA2ZTM5OTViYjE2MzAuLmExMTViNTQ0
YTQwNyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS0NCj4gPiA+ID4gY29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+ID4gY2hpbGQu
eWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LQ0KPiA+ID4gPiBjb250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiBjaGlsZC55YW1sDQo+
ID4gPiA+IEBAIC0yMzAsNiArMjMwLDEyIEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgICBX
YWl0LXBpbiB1c2VkIGJ5IGNsaWVudC4gTXVzdCBiZSBsZXNzIHRoYW4gImdwbWMsbnVtLQ0KPiA+
ID4gPiB3YWl0cGlucyIuDQo+ID4gPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gPiA+ICANCj4gPiA+ID4gKyAgZ3BtYyx3YWl0LXBpbi1h
Y3RpdmUtbG93Og0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgICAgICBT
ZXQgdGhlIHBvbGFyaXR5IGZvciB0aGUgc2VsZWN0ZWQgd2FpdCBwaW4gdG8gYWN0aXZlDQo+ID4g
PiA+IGxvdy4NCj4gPiA+ID4gKyAgICAgIERlZmF1bHRzIHRvIGFjdGl2ZSBoaWdoIGlmIHRoaXMg
aXMgbm90IHNldC4NCj4gPiA+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gPiA+ICsNCj4gPiA+
IA0KPiA+ID4gSSBqdXN0IGNoZWNrZWQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlvdXIgaXMgYWN0
aXZlIGxvdy4NCj4gPiA+IFJlc2V0IHZhbHVlIG9mIHRoZSBwb2xhcml0eSByZWdpc3RlciBmaWVs
ZCBpcyAwLCB3aGljaCBtZWFucw0KPiA+ID4gYWN0aXZlDQo+ID4gPiBsb3cuDQo+ID4gPiANCj4g
PiA+IFdlIHdpbGwgbmVlZCB0byB1c2UgdGhlIHByb3BlcnR5ICJncG1jLHdhaXQtcGluLWFjdGl2
ZS1oaWdoIg0KPiA+ID4gaW5zdGVhZC4NCj4gPiA+IA0KPiA+ID4gU29ycnkgZm9yIG5vdCBjYXRj
aGluZyB0aGlzIGVhcmxpZXIuDQo+ID4gDQo+ID4gSXQncyBvay4gTm8gd29ycmllcy4NCj4gPiAN
Cj4gPiBXZWxsLCB0aGUgRGF0YXNoZWV0cyBhcmUgdGVsbGluZyBtZSBkaWZmZXJlbnQgcmVzZXQg
dmFsdWVzIGhlcmUuIA0KPiA+IFRoZSBhbTMzNXggVFJNIChSZXYuIFEpIGRlZmluZXMgdGhlIHJl
c2V0IHZhbHVlIG9mIFdBSVQxUElOUE9MQVJJVFkNCj4gPiBhcw0KPiA+IDB4MCwgd2hlcmVhcyB0
aGUgYW02NHggVFJNIChSZXYuIEMpIGRlZmluZXMgdGhlIHJlc2V0IHZhbHVlIG9mDQo+ID4gV0FJ
VDFQSU4NCj4gPiBQT0xBUklUWSBhcyAweDEuIFRoZSBhbTY0eCBUUk0gYWxzbyBkZWZpbmVzIGRp
ZmZlcmVudCByZXNldCB2YWx1ZXMNCj4gPiBmb3IgDQo+ID4gV0FJVDBQSU5QT0xBUklUWSBhbmQg
V0FJVDFQSU5QT0xBUklUWS4NCj4gPiANCj4gPiBUaGUgaW50ZXJlc3RpbmcgdGhpbmcgaXMgdGhh
dCBJJ20gY3VycmVudGx5IHdvcmtpbmcgb24gYW4gYW0zMzV4DQo+ID4gcGxhdGZvcm0gYW5kIEkg
ZHVtcGVkIHRoZSBHUE1DX0NPTkZJRyByZWdpc3RlciBhbmQgZ290IDB4MDAwMDBhMDANCj4gPiAo
V0FJVDFQSU5QT0xBUklUWSA9PSAweDEpLiBTbyBJdCBkb2Vzbid0IGJlaGF2ZSBsaWtlIHRoZSBU
Uk0NCj4gPiBzcGVjaWZpZXMuDQo+IA0KPiBJIGNhbiBjb25maXJtIHRoZSBzYW1lIGJlaGF2aW91
ciBvbiBhbTY0MiBFVk0gYXMgd2VsbC4NCj4gSSBnZXQgMHhhMDAgb24gcmVhZGluZyBHUE1DX0NP
TkZJRy4NCj4gDQo+ID4gDQo+ID4gTmV2ZXJ0aGVsZXNzLCBJJ20gc2V0dGluZyB0aGUgV0FJVFhQ
SU5QT0xBUklUWSBiaXRzIGluIGJvdGggY2FzZXMNCj4gPiBhY2NvcmRpbmdseS4gIA0KPiA+IDB4
MCBpbiBjYXNlICJncG1jLHdhaXQtcGluLWFjdGl2ZS1sb3ciIGlzIHNldCBhbmQgMHgxIGluIGNh
c2UNCj4gPiAiZ3BtYyx3YWl0LXBpbi1hY3RpdmUtbG93IiBpcyBub3Qgc2V0LiBTbyB0aGUgcmVz
ZXQgdmFsdWUgaXMgYWx3YXlzDQo+ID4gb3ZlcndyaXR0ZW4uDQo+ID4gDQo+ID4gDQo+ID4gVXNp
bmcgImdwbWMsd2FpdC1waW4tYWN0aXZlLWhpZ2giIHJhdGhlciB0aGFuICJncG1jLHdhaXQtcGlu
LQ0KPiA+IGFjdGl2ZS1sb3cNCj4gPiAiIGlzIGFsc28gb2sgZm9yIG1lLCBidXQgaXQgZmVlbHMg
bW9yZSBsaWtlIGEgY29zbWV0aWMgdGhpbmcgYXQNCj4gPiB0aGlzDQo+ID4gcG9pbnQuIA0KPiAN
Cj4gTXkgbWFpbiBjb25jZXJuIGlzIGZvciBsZWdhY3kgcGxhdGZvcm1zIG5vdCBzcGVjaWZ5aW5n
IHRoZSBwcm9wZXJ0eQ0KPiBpbiBEVC4NCj4gRWFybGllciB3ZSB3ZXJlIG5vdCB0b3VjaGluZyB0
aGUgV0FJVFBJTlBPTEFSSVRZIGNvbmZpZyBhbmQgbm93IHdlDQo+IGFyZQ0KPiBzbyB3ZSBtaWdo
dCBicmVhayBzb21lIGxlZ2FjeSBwbGF0Zm9ybXMgdGhhdCBkb24ndCBzcGVjaWZ5DQo+IHRoZSBw
b2xhcml0eSBhbmQgd2UgZmxpcCBpdCBoZXJlLg0KPiANCj4gRm9ydHVuYXRlbHksIHRoZXJlIGFy
ZSBvbmx5IGZldyBib2FyZHMgdXNpbmcgZ3BtYyB3YWl0LXBpbiBhbmQgbW9zdGx5DQo+IHdhaXQt
cGluIDANCj4gZm9yIHdoaWNoIHRoZXJlIGlzIG5vIGRpc2NyZXBhbmN5IGFzIGZhciBhcyB3YWl0
LXBpbiByZXNldCB2YWx1ZSBpcw0KPiBjb25jZXJuZWQuDQo+IA0KPiBsb2dpY3BkLXRvcnBlZG8t
YmFzZWJvYXJkLmR0c2k6CQlncG1jLHdhaXQtcGluID0gPDA+Ow0KPiBvbWFwMy1kZXZraXQ4MDAw
LWNvbW1vbi5kdHNpOgkJZ3BtYyx3YWl0LXBpbiA9IDwwPjsNCj4gQmluYXJ5IGZpbGUgb21hcDMt
ZGV2a2l0ODAwMC5kdGIgbWF0Y2hlcw0KPiBCaW5hcnkgZmlsZSBvbWFwMy1kZXZraXQ4MDAwLWxj
ZDQzLmR0YiBtYXRjaGVzDQo+IEJpbmFyeSBmaWxlIG9tYXAzLWRldmtpdDgwMDAtbGNkNzAuZHRi
IG1hdGNoZXMNCj4gb21hcDMtbGlsbHktYTgzeC5kdHNpOgkJZ3BtYyx3YWl0LXBpbiA9IDwwPjsN
Cj4gQmluYXJ5IGZpbGUgb21hcDMtbGlsbHktZGJiMDU2LmR0YiBtYXRjaGVzDQo+IEJpbmFyeSBm
aWxlIG9tYXAzLXpvb20zLmR0YiBtYXRjaGVzDQo+IA0KPiBPbmx5IDEgYm9hcmQgaXMgdXNpbmcg
d2FpdC1waW4gMQ0KPiBvbWFwLXpvb20tY29tbW9uLmR0c2k6CQlncG1jLHdhaXQtcGluID0gPDE+
Ow0KPiANCj4gZnJvbSBPTVAzNnh4IFRSTSwgaGVyZSBhcmUgdGhlIHJlc2V0IHZhbHVlcw0KPiBX
QUlUM1BJTlBPTEFSSVRZIDB4MQ0KPiBXQUlUMlBJTlBPTEFSSVRZIDB4MA0KPiBXQUlUMVBJTlBP
TEFSSVRZIDB4MQ0KPiBXQUlUMFBJTlBPTEFSSVRZIDB4MA0KDQpBaCBvay4gVGhlIHBpY3R1cmUg
aXMgZ2V0dGluZyBjbGVhcmVyLg0KDQpEb2VzIGl0IG1ha2Ugc2Vuc2UgdGhlbiBub3QgdG8gdXNl
IGEgYm9vbGVhbiBwcm9wZXJ0eSBpbiB0aGF0IGNhc2U/DQpXaXRoIGEgYm9vbGVhbiBwcm9wZXJ0
eSB3ZSBhcmUgb25seSBhYmxlIHRvIGNoYW5nZSB0aGUgcG9sYXJpdHkgYml0cw0KaW50byBvbmUg
ZGlyZWN0aW9uICgwIC0+IDEgb3IgMSAtPiAwKSBidXQgd2UgaGF2ZSBkaWZmZXJlbnQgcmVzZXQN
CnZhbHVlcyBmb3IgZWFjaCBiaXQuDQoNClRoaXMgcGFydCBvZiBteSBwYXRjaCBtYXkgdGhlbiBi
cmVhayB0aGUgbWVudGlvbmVkIGxlZ2FjeSBwbGF0Zm9ybXMNCmJlY2F1c2UgaXQgZXZlbiBvdmVy
d3JpdGVzIHRoZSByZWdpc3RlciBpbiBjYXNlIHRoZSBwcm9wZXJ0eSBpcyBub3QNCnNldDoNCg0K
DQorCWlmIChwLT53YWl0X3Bpbl9hY3RpdmVfbG93KQ0KKwkJY29uZmlnMSAmPSB+R1BNQ19DT05G
SUdfV0FJVFBJTlBPTEFSSVRZKHAtPndhaXRfcGluKTsNCisJZWxzZQ0KKwkJY29uZmlnMSB8PSBH
UE1DX0NPTkZJR19XQUlUUElOUE9MQVJJVFkocC0+d2FpdF9waW4pOw0KKw0KKwlncG1jX3dyaXRl
X3JlZyhHUE1DX0NPTkZJRywgY29uZmlnMSk7DQoNCg0KU28gaW4gb3JkZXIgdG8gcHJlc2VydmUg
Y29tcGF0aWJpbGl0eSBhcyB3ZWxsIGFzIHRoZSBwb3NzaWJpbGl0eSB0bw0KY2hhbmdlIHRoZSBw
b2xhcml0eSBiaXRzIGludG8gdGhlIGRlc2lyZWQgdmFsdWUgSSB3b3VsZCBwcm9wb3NlIHRvIHVz
ZQ0KYW4gdWludDMyIHZhbHVlIGZvciB0aGUgZGVzaXJlZCB2YWx1ZSBhbmQgaW4gY2FzZSB0aGUg
ZHQtcHJvcGVydHkgaXMNCm5vdCBzZXQgd2Ugc2hvdWxkIG5vdCB0b3VjaCB0aGUgcmVnaXN0ZXIg
YXQgYWxsLg0KDQoNCj4gDQo+IGNoZWVycywNCj4gLXJvZ2VyDQoNCmNoZWVycywNCmJlbmVkaWt0
DQoNCg==
