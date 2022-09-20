Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7931B5BE588
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 14:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbiITMR5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 08:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiITMRy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 08:17:54 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B5274CC9;
        Tue, 20 Sep 2022 05:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXXQdthaemy7CWNxSghjNdBPgiqVN2arKPNOLGbcassxUNeHxOR7eOVY7SjYs8+cNWeq/sLJyFJlt4pEJjJsl3Up55aO9Qf65dqRAunyaAwHSGq4krnbjgiSMAkA/UGK5a7uQQSqbOI6uLlMFfXgdYion8z7wMDR9AhmVPYTO2CJd0M1tA78oTcZDauv6Db07pXFjp9kee8y8LnQ6hPOdtl1+48BfpTxwTT3bKJc4zgQzYj3yujCs5cI/Er/JA47+adUA/eWhH2MZ/fQqqLSMYvmqZKjfhdZM5Aqd8v4NWvUXR08BpBXafs7VGr2WdAqeQzKNm+HZTAcEmQyMSeSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTresS+aBqdXx70chXw7aeL8narUF3jWJsszmIe0/IE=;
 b=kAoLxA305/reWSv0RdeWZW/yNPyILfDZGW6OcUAaT4qYWlFfIC4VIXnBT+x52w3M0hulbOGlFzkWzNVeEVaRh1vDYhOhGLmSz91OhfcDgeAMKx9/WD5/NL/jqwrORNPvFdXliEyZCC0xzRgMidSPBTaPJ3sTWqPVxIwIrnAepIDkm2LvksMBkBDgkbFLwkS/yxenRvxmNu8ArtAnVMQrOqsGePPAUqlhjku2ylnSOTL3f4P8FQypYIgwhEwT0dhxZYHWZPzh4xbptLeDSkbZpGAyGSBnRmdu0eo4sbVpS+cAmmd2/6h1mcgVYZTkqAAh3VkmBT382g7ZnPeZxoeKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTresS+aBqdXx70chXw7aeL8narUF3jWJsszmIe0/IE=;
 b=GuT4qUnNxrVZTK4kc7GmOOjFwMSVfpnMtsYUSnrQzBV1r+Urj4YtKX3XKjvihRaPHAftvKGFIAEQqrk4u0ucPgMIouWDR6uZ9Mm4Ai71B3cj0b3l9odRbwPSr8xbXTDtq0d6dzmcQ6hW+PW5hXREyh2vHzX2kdZykW62H4rLSS5UIVSRwVod9b1HnNZdVSNenufTHvU9grnjRxu4uGe0y+V4n8+qq8B/F7VvwOC/D3aRzb5u46c7C4NxnB4cGbiAqdwnq2kZZePvlkLWCpJVj7ym+0F5kHMUnvYe6VxhvYRD9MdY7GWYSvXKXejGD67nu9ztNXBzTJRpRKU7L9XQUA==
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::15)
 by AM0PR10MB3473.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 12:17:51 +0000
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79]) by AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79%7]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 12:17:51 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Topic: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Index: AQHYzAuajWmeLYXeQ0i8d4Z1OtIEx63mvdaAgAEyVgCAABorAIAACbIAgAAG1ACAABP+gIAADw4A
Date:   Tue, 20 Sep 2022 12:17:51 +0000
Message-ID: <d7b86ccf4c66e590c247ad24f84944ccdc3b1902.camel@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
         <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
         <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
         <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
         <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
         <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
         <0afa173f-9f7f-b2c8-7abc-2384ee46429d@linaro.org>
         <df05bbf214c92fcda6d7b003b49f20fd8755b97c.camel@siemens.com>
         <8d45ba5e-4d69-899f-94f3-af4374a870b2@linaro.org>
In-Reply-To: <8d45ba5e-4d69-899f-94f3-af4374a870b2@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5507:EE_|AM0PR10MB3473:EE_
x-ms-office365-filtering-correlation-id: 8e4d85bc-f7f7-480e-2c63-08da9b022355
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QYl0rCE3qS5Rud1hRiirFYaIgwOv4KGZ42uXhyAW5YNSXb/tYPcUNK3SilqtQITU92XsP1Q8o4G9l5Tf9bKPYNnrBsLEkJNu/c5YIWcPY3dWuLaq5FV0FGSEXTS6OfsMy8RSQHCLhxKPHZ7r6ua5Ak6Pd2E6oIuFqwTepQlweQWl2u8hpzCKP8WUeq2bNyLtpqil2cyqbA3S1jRJSl3UNmk0mwDyOvHWG4SzZrhmqXoK10YLlTpJPtxCTe9QMp6VOPea3FohU4jRbpQaiSoGZkeomW7KrqX/0009eeVX1LHb1MFV1dqMNsMrDm5pjWrtAO8JiJimPZ8rY5KTWlI7/fFFvktET4CDP+q/7Xbgo7sYE7GPQVHtuOzbNrve9yFpsK4UVJoeYgEQ8x5hBBHi9hRespPapVlOMlLa8iZfSddgb3DSZT09MQLzhiD7RxauiKGu8Nuq9+M9/mg8oet0I8Klm9lhH5G1v8S9dkYrOOI5OwmDtLAgnX/kIf8xgjJ7n1/yjEhwGuGZhYlpg5iIFwrNYulJwJFuwR1/86ehlRPIEhkP5mxLIVlqT/G1DpIBZaZJiV1xX3EwN3s/fe7GfG9fXmEYrBBjuQ0IQrPssQXrC3CH80FDT9Cb+X2wUm3npmCZP1vDpz+Qwk2IWaGTZQEjX8l8tWlbXmQwCbHzZGJTu1PxugNaBnLhKm6UccEj6gRjmBjsUs8T7Z5n6sydVQwf5bXz1kskAQoOhu0RYE25jXxDCTJGNCk99GSVkdD7LhGv7iHLYs0Sh8nS/viaqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(54906003)(2906002)(2616005)(41300700001)(53546011)(6506007)(64756008)(91956017)(4326008)(3450700001)(8676002)(76116006)(66446008)(83380400001)(66476007)(110136005)(316002)(6486002)(38070700005)(71200400001)(5660300002)(186003)(36756003)(8936002)(66556008)(478600001)(66946007)(38100700002)(6512007)(86362001)(82960400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG1XM052REpkVDdKeHI3ZlAwOWxKUEwyM3FVWU96dm80ZWRGUThneWZINDNj?=
 =?utf-8?B?TnJiRkhidWk5Z2hpVDJSb2ppZG4xVE5HaWNWUDlkKzN2amxhOFBwanFWRXVm?=
 =?utf-8?B?WXdrdXpBSXU1REdZaFI3dUhWQXRlYlk5M3FwSHl4ekFKUVNISTl5bnBOYUVr?=
 =?utf-8?B?Qzg5T3p4Vk9ra05TWUt1aUluamRkNHJPbUpHZEd3aUFLQXJ3VTRnZ0czaVNM?=
 =?utf-8?B?dlM4M2JaYzFRdXJJRGZkalZQSWErbWdJa01FSEtLRWVuT2ZKRTlvLzIyYmtU?=
 =?utf-8?B?bmx1SWx4ejRHQ2tFRGxIVExXTmFXSlAzRlRqN3k4N2tEQ3dmd01JZG53YzNz?=
 =?utf-8?B?TVFZTGU2bkdYS0JtTW1mMkVhcGhuTnU2TEkxbTRTNEhQQWUvYmZSakpZREZ2?=
 =?utf-8?B?VDVvS2pvSkd0WHJuenBtajB3SXlUaG9yVmdQdU5UVVRqZTB0SEhQSkcwSjVp?=
 =?utf-8?B?SmMxQU44NU9Nb20wemx0VGg0VmVmdWZpbnpkYkExbzhudmZuVDR5VzAvZ202?=
 =?utf-8?B?ckJpTFlpTW1Ed2xMbG5kTkdKQ0tLOEVJYTVZZTkwOEtnY2prN2wrTXBaNzhO?=
 =?utf-8?B?Y0RGSks0YVM2QVI3SElXY1N0T2FIcDlhNnNPOEpNaGMzK0JvOWMvV2hFdmtq?=
 =?utf-8?B?Q2tQaTExaGhIZzVrZFhmQlNuenhyY2NTRS96bDJ4WXNqdmpNS0UzenIyWWw2?=
 =?utf-8?B?RDZvVGhOWTg4NjYxcGt4OVNhcHNOWTlwS2RNSmsrTitZYjZsZkpEMmc0bVly?=
 =?utf-8?B?MHB5ZVlVSjRkdjhXcVl1QVJBbkJBaUJNNExYL0VGaUN0bVptQnFDN2tJSG0w?=
 =?utf-8?B?ZFZkcFdwRUNQUFlmY1hKcEJqSHFpRno5OW04aUloR0FaRzBYL3BsVmdMTlBi?=
 =?utf-8?B?QzhMS21qbC91c3pEdGlOM2NLMm1WV1VETkx1SXF5VnA2Ty9UWkx6M1FLbWtK?=
 =?utf-8?B?a0NIcXplTnVDZ0J2a3BVdHZtcURjWmtUaGFpY1p0ZUVWYTRFTjBZcGJXSE1s?=
 =?utf-8?B?SXlIbTdweXpsa053dUdGYmhucThCdFNhbFRXS05JSHo1MGl4OG9waVdSajh4?=
 =?utf-8?B?TERWeGlOUUZXL3plMXdoT2FFZlFuWElsbjczSkJldjBYL0NaczB3YXo3c3k5?=
 =?utf-8?B?dnpSb2Rhck5WenVoVElDRVdCcVhlS2J4V0xWUGlST3Z6V1RUUHJJM1dCQ2NZ?=
 =?utf-8?B?ajRlV2pkbVZoMFg1VGxqRFdaRitORDVUb3BJcE16bUdmTi9yempBd1Y5QmNl?=
 =?utf-8?B?V3YyTko2TTBqWXpVbmZIS0IrRFg3ejduOXMxejF4MEZTRDVTVW40Nzc4VWl3?=
 =?utf-8?B?WFljdmJQcTJGQ3M2WWxBSHhhRHdZOGhzTnhQekllNCszbHloVzFGZFdDaXQ5?=
 =?utf-8?B?am5zbm8vaWRQZDZucFNCTlJEUGVZWVlYamtxZDJ0TXAwWm9id3laTFBYSTZ0?=
 =?utf-8?B?dEQrN04yNE1vSFhOY29WancrMHRoZlByd3pGZ2NCODBXeHpCOUUvYUEzL0N2?=
 =?utf-8?B?U1RCa2RCZnFiREo1M3ZDa0Y2MnVEaGpCYXVQYlllVWNPSEJ6cUFScGZYZ1ZO?=
 =?utf-8?B?V2VUSWowVlNnQkpNc3dMNk52dk02SVRQWUZxSTJrNENmMVEyZ1RBNzNNZXRy?=
 =?utf-8?B?RHVOblZ1UWxaYTVrVm0vU1h5RkNrN3owR2dCaVBxbUd6STlXaWI0LzVmb3d6?=
 =?utf-8?B?T2hNSEpKYjM4R1RYWkI0dGUySlp0UGwyV3BPd083Umc4WHN6eEsxdk51N1dp?=
 =?utf-8?B?cmJzK3VmcHcwWTNqQVVwenNJTyt2U1JDUGZnK3BiN3hldGFPRDkySjE0Z04z?=
 =?utf-8?B?T3pxUU4yMW9DcEcvVENieFRVdVIzUGZvQjV5YXlmOWdHZ3I0MWdIcFR1dUho?=
 =?utf-8?B?ZDk3ak9aZzJ4UHRtVHpITnFMU0ZaSEhTVDVBRVJEQzdiTHhhbThDbWhvOHEx?=
 =?utf-8?B?V1pteWJmMk5ObDVCejlMLytsZUJ6c1lMQ0tjaUV5d2Mvc2xWRGlUYzdEQnh2?=
 =?utf-8?B?bG4rOGJ4UEdDd0FEZzdOVU5PdmRaSHVXV1J0VXZSNXBJak8wLzhsck9MbTIr?=
 =?utf-8?B?WjQ5ZzgxcXk4WlN6WDJ2eFVFZTloWE9uTGFnWWNaanRSNTU0WkpRakFySHFa?=
 =?utf-8?B?OGkyZzRHTGRSaVR0cC8rU1YwV1R4UUZxTXNXSXgwTGxGQkJ4SkxxYkxCc3dE?=
 =?utf-8?B?RnQrUFRKWHNMOFNVR2FUdnVyaFltUW16amZjZkxFQ1VDc1ZLWnZkNERhTkhV?=
 =?utf-8?Q?3ul3v+eAhc2sI+xuDBWWiFRdi4jqoqgJjS43qFI7Oo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17EF1626F950D74485F9CD6B7E2728E4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4d85bc-f7f7-480e-2c63-08da9b022355
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 12:17:51.1058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aN4aVs4r/0tgXq9fjcxuFWT14vF1I1AtLsruPgGs14Y2ZBp+xNKzOYBtUnEjYbAGaFQH/2cgWS6R4DLinRPWnWf+2ZAIybFp3gmE24UUSqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3473
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjItMDktMjAgYXQgMTM6MjMgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDIwLzA5LzIwMjIgMTI6MTIsIE5pZWRlcm1heXIs
IEJFTkVESUtUIHdyb3RlOg0KPiA+ID4gSSBjb21tZW50ZWQgZXhhY3RseSBiZWxvdyB0aGUgbGlu
ZSB3aGljaCBJIHF1ZXN0aW9uLiBJIGRvbid0IHF1ZXN0aW9uDQo+ID4gPiBvdGhlciBsaW5lcy4g
U28gbGV0IG1lIGJlIGEgYml0IG1vcmUgc3BlY2lmaWM6DQo+ID4gPiANCj4gPiA+IFdoeSBkbyB5
b3UgbmVlZA0KPiA+ID4gInAtPndhaXRfcGluX3BvbGFyaXR5ICE9IFdBSVRQSU5QT0xBUklUWV9E
RUZBVUxUIg0KPiA+ID4gPyBDYW4geW91IHdyaXRlIGEgc2NlbmFyaW8gd2hlcmUgdGhpcyBpcyB1
c2VmdWw/DQo+ID4gPiANCj4gPiBPay4gSSB0aGluayBJIGdvdCB5b3Ugbm93LiBTb3JyeSBJJ20g
cmVsYXRpdmVseSBuZXcgdG8gT1NTIGNvbnRyaWJ1dGlvbnMsIHNvIHBsZWFzZSBiZSBwYXRpZW50
IHdpdGggbWUuLi4NCj4gPiANCj4gPiBJZiBJIHJlbW92ZSB0aGF0IHBhcnQgb2YgdGhlIGlmIGNs
YXVzZSwgdGhlbiBhbiBlcnJvciBtZXNzYWdlIHdvdWxkIGJlIHByaW50ZWQgaW4gY2FzZSAicC0+
d2FpdF9waW5fcG9sYXJpdHkgPT0gV0FJVFBJTlBPTEFSSVRZX0RFRkFVTFQiLg0KPiANCj4gRXhh
Y3RseSB0aGlzIHdpbGwgaGFwcGVuLiBBcyBleHBlY3RlZC4gVGhpcyB2YWx1ZSBjYW5ub3QgYXBw
ZWFyIGluIERUUywNCj4gdGhlcmVmb3JlIEkgd291bGQgZXhwZWN0IGVycm9yIG1lc3NhZ2UuDQo+
IA0KPiBOb3cgeW91IGFsbG93IHN1Y2ggdmFsdWUgaW4gRFRTIHdoaWNoIGlzIG5vdCB0aGUgc2Ft
ZSBhcyB5b3VyIGJpbmRpbmdzLg0KPiANCkFuZCBub3cgSSBjb21wbGV0ZWx5IGdvdCBpdC4uLg0K
V2l0aCB0aGlzIGltcGxlbWVudGF0aW9uIGl0J3MgZXZlbiBwb3NzaWJsZSB0byBzZXQgV0FJVFBJ
TlBPTEFSSVRZX0RFRkFVTFQgaW4gdGhlIERULi4uDQoNCk9rLCBjaGFuZ2luZyB0aGlzIHdpbGwg
bGVhZCB0byBhbiBlcnJvciBtZXNzYWdlIGlmIHRoZSAiZ3BtYyx3YWl0LXBpbi1wb2xhcml0eSIg
aXMgbm90IHNldCBpbiBEVC4gTWVhbnMgdGhlIERUIHByb3BlcnR5IGlzIG1vcmUgb3JsZXNzIG5v
dCBhbiBvcHRpb25hbA0KcHJvcGVydHkgYW55bW9yZS4NCklmIG9uZSBkZWZpbmVzIHRoZSB3YWl0
LXBpbiB3aXRob3V0IGRlZmluaW5nIHRoZSBwb2xhcml0eSB0aGUgZHJpdmVyIHByb2JlcyBzdWNj
ZXNzZnVsbHkgYnV0IGFuZCBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQuDQpJcyB0aGlzIGFuIGFj
Y2VwdGFibGUgc29sdXRpb24gZm9yIHlvdT8NCg0KDQo+IA0KPiA+IEJ1dCB0aGlzIGlzIGEgbm90
IGFuIGVycm9yIGNhc2UuIFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUIGlzIGEgdmFsaWQgdmFsdWUs
IGlzIGFzc2lnbmVkIHJpZ2h0IGJlZm9yZSB0aGUgaWYgY2xhdXNlIGFzIGFuIGluaXQgdmFsdWUo
bm90IGV4dHJhY3RlZCBmcm9tDQo+ID4gRFQpLA0KPiA+IGFuZCBsZWFkcyB0byBub3QgdG91Y2hp
bmcgdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIGluIGdwbWNfY3NfcHJvZ3JhbV9zZXR0aW5ncygp
Lg0KPiA+IFNvIGluIGdwbWNfY3NfcHJvZ3JhbV9zZXR0aW5ncygpIGlmOg0KPiA+ICAgICBwLT53
YWl0X3Bpbl9wb2xhcml0eSAhPSBXQUlUUElOUE9MQVJJVFlfQUNUSVZFX0hJR0ggLT4gSXNzdWUg
YSB3cml0ZSB0byB0aGUgR1BNQ19DT05GSUcgcmVnaXN0ZXINCj4gPiAgICAgcC0+d2FpdF9waW5f
cG9sYXJpdHkgIT0gV0FJVFBJTlBPTEFSSVRZX0FDVElWRV9MT1cgIC0+IElzc3VhIGEgd3JpdGUg
dG8gdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyDQo+ID4gICAgIHAtPndhaXRfcGluX3BvbGFyaXR5
ICE9IFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUICAgICAtPiBEbyBub3QgdG91Y2ggdGhlIEdQTUNf
Q09ORklHIHJlZ2lzdGVyDQo+ID4gDQo+ID4gV2Ugd2FudCB0byBwcmVzZXJ2ZSB0aGUgcmVzZXQg
dmFsdWUgb2YgdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIGluIGNhc2UgdGhlIERUIGRvZXMgbm90
IHVzZSB0aGUgImdwbWMsd2FpdC1waW4tcG9sYXJpdHkiIHByb3BlcnR5LiBPdGhlcndpc2UNCj4g
PiB3ZSBtaWdodCBicmVhayBwbGF0Zm9ybXMgd2hpY2ggcmVseSBvbiB0aGVzZSByZXNldCB2YWx1
ZXMuIA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCkNoZWVycywNCmJlbmVkaWt0
DQoNCg==
