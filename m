Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810CC5B7C66
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 22:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiIMU4j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 16:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiIMU4W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 16:56:22 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312F874CEF;
        Tue, 13 Sep 2022 13:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPwI5So1/UZFi0bTG/Wjpi3lYV34hof3xaVJJtFm0Ts8WDOTJ6LEHf1A+sfQ1YVN1Vh8b1yrBz017eYKv4ljNy6fMTiUSm+yP6sut3KmFQmDmuG+/jJtGmj4HOFed4b/VtfMxmFuRSPEFZjWyFnHG1H3/nAlEW+da0PKeET8FfOioaMqYpH/ZbSHQLqCA//fNGVFtSh5C/VxQzqXmUFlyz7Z1yoAziD+GC0g3vlNp2jMm/hnE6aXAt0YoPJ6nzlic3j5Cdj5eAGPWUIvn7YKXYVcjcqCMavOJgPu+G7hpSCIAAIGqXn/3atVtX1p6C1IFMnLqr/22Ek34Fmk3UDybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/fTOLBVFqqOsdQ97GwaAV1wYFyLOvADL372m82hX/I=;
 b=LzfmqAsxAQ0I1mIBLOstSUQgSY6mcNho2SPkNatvKnZi8ypRXPypSJC9i7YZ1cbcmazKJxaTDfEbC1ABoyW/fUlzIEfqtRWDJtCSwqPSsCR9JjcxTTwkQV4jsJJa3BQ0gBAFrHR/FmNj3blWrdo3TuSZh2gbbYYA3VCil+wvnnvulWkY6jJ6f9YL0fInxvPfvo+BWON1H9IBqUC7v2yP5866bKs+Br84Y+Wfp9qEjoII+JQntoH4EmL0E5+ifCdWUwrvKEaxCucUQsA3WgxIJP3gzpZVa/rSRLtNtl/wuKBCzufsYucjlmM4ZpjhhgkmWvDnjA96L8XNwlmFjWYYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/fTOLBVFqqOsdQ97GwaAV1wYFyLOvADL372m82hX/I=;
 b=TYRDMq8ePrV5pVGE3J3Uoc1i4a4f8H74XOabqjrtN6k3YZSAVxl90b6/RRlWP7RNAyzREWp1n7UPmpykyQDW9NgsrE9cejPw2Kn07kliG3dq92fe/8FgzEY2mJ4nFuxusyRBuJY7qoJ4JvJm1SA8oTuAJYECmXrKF6NBFm2hFnJ+jdyY534x1fObeweFtjEeFxnBBpx+QvpbbobHTMBaepAVKFDvyj11I+YxLxWYYNxBk3GGCw1GmHCRpPpmSaOyEnqIO91+AuezOqJe4nKsN3vx4TgReNmR/Gbdx+24XIhXGIKYK/LN4ZBMtGm4vGuqoQJbUqrXyD/3B6shGmMTAQ==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PA4PR10MB5635.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 20:56:19 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c90b:ed40:6276:18]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c90b:ed40:6276:18%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 20:56:19 +0000
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
Thread-Index: AQHYw3vS4gPjEC/lYk+8/tN5HBvt7q3bb7kAgAA4FACAAWV4AIAAUkMAgAB/g4A=
Date:   Tue, 13 Sep 2022 20:56:18 +0000
Message-ID: <bcd410a47504eaaa46b4c2b61041b8802b9b3ff2.camel@siemens.com>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
         <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
         <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
         <125ea34a12928fcdd8ef118eced8b2c59039d2ab.camel@siemens.com>
         <8326572f-8a88-6e8b-edda-7730a0a3597d@kernel.org>
         <ca4f7a8f6f48b02e9dacb1dae27e90edaab2fcc3.camel@siemens.com>
         <4ffb1f04-ebd2-0d18-b909-5aeb3e0ded81@kernel.org>
In-Reply-To: <4ffb1f04-ebd2-0d18-b909-5aeb3e0ded81@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|PA4PR10MB5635:EE_
x-ms-office365-filtering-correlation-id: a1126e79-cdd0-4f05-55f9-08da95ca6820
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mHxyLTQPxaBayEOG+vjZfuPZmjH4UHNo8LXVVDjOArGaouJxqutUffowtBG3ujFUJ4G2pQbVtD2U/bua7Ob0R9EEK/Opz3cDbVlBQ2uPekC6NZGrW6RB6RLRHvwQji+00uHH+HY27UG3jlAzSvzdprW+5Ay+z1nnD9e8tkeTILTVaV/3uR/QBROxtj6NJp/WO1Mq+2F3fplfTY9yMg8P5RX4FftVzgC264EZbIlBlavG0IX9ORLp0yKI/2rfbbaHfK4UQeER+p6qz42etlstKvFKEJ5x9PQpte/SMZizb1NBx++elelowUFc6nAOT6+wmfxxLB3pGjcUCKGZQHuSk7tT2LFAaYI8NLeQoVLbB5IBpCBT1NKE0syndq6bMX2omciq2ZKG9/P/inICnx6US3tktIH4KPq29T4sb0mSlFFoOQIhjbuaiq6RhdXYjxR/6BTpcBg1rsNdku8TbYgx+0Pxm5Ojz7oa70XipoZFZD0W+qbLhM8RwNgrxGbaCHkiQXzrO+oUHRrCJzfgMXIFFoHChDQrHJH0FPDAxecTECo37h/Uc3XnBpeJgENsPuJ2XDIEZF8qmZ9RgKqlb1syYjRhEbnXdUqQZaZUlE8gk/0BhVrIk+gU2ZPh2LwLijeqYmaPQRgDB20HGmsCnctR7HK0umqcqE8EqnHNq/idIKfBSjgqHc+L2s7en2ttjVUJw66yYFuBpXSCOy/DllMfk2xaRKJj9WbLghqAN+YMYr5nyaA3HCApMhsidluEotzt/HWTOZQEgIXaErwPpHusEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199015)(53546011)(6512007)(6486002)(76116006)(36756003)(2906002)(66476007)(478600001)(64756008)(66446008)(91956017)(8676002)(110136005)(4326008)(83380400001)(186003)(71200400001)(41300700001)(2616005)(86362001)(38070700005)(3450700001)(66556008)(5660300002)(6506007)(82960400001)(8936002)(122000001)(38100700002)(316002)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDFGTEl5a0NqYXd1Z0lpa2x2Umc4bnRhTldMRkJPMXpWT0pzOW9XTXBUR0FY?=
 =?utf-8?B?SnlUOXAxSVNjNU1YVlkrSXRJM3hhV25PV2hCOUZrNXN3MjNUSGVqVEZNNnNC?=
 =?utf-8?B?cFg1Wk1RakpaME5iOEhaSjVGS29kL2lRbS8rMmtTY1g2R3RqMzVtZmZxMGJq?=
 =?utf-8?B?bytadUtGa2J6YzFMNzFXazBrblVsMXpVQjI2MnB0TFp2SUc0MU9KWnRmY3pQ?=
 =?utf-8?B?U0NuVkk4Vy9UejhDaS9ReUlaUDZlTlYveHVRMHdXLzBLMWY5UGQxbW5BQ2E1?=
 =?utf-8?B?S01ZUHNDVkh2UGR5ZFBFdVpjTCtyWm11WWIvZVRjOTdTWUtvUnRvOUpyMGp2?=
 =?utf-8?B?S0pVaDQ0b1Nka3JuTElRdFlEVWNzQzlWY1h4M1hhcFgwaHpsL05TYWRLbzNQ?=
 =?utf-8?B?OFh6bHEzZTJCVVp2d3lJYlJGUHRHd1lEcEhlcGlTdXZiZEQ2UG5VcU5CUWEx?=
 =?utf-8?B?ZFAyaHpuaEgvSmhCS3I0UTlDSkYzSVIrY1ZObzNxMjFXU2pkMCtMcS92bW1W?=
 =?utf-8?B?QzJIRkY3U3pCRnVDdUlIaVQ0alJ4S0pqcGQzZG4rdHRNZkIvY29IY2d2Tmhl?=
 =?utf-8?B?ZnZ6L25nOEhOZmFYWktibzZkem8wYjVueGxtcWQ0NzFIdWNXS001dTlNWTNY?=
 =?utf-8?B?aENQQ0t1ZjVJNy9UR0t0REpZUzNyNzRpVUIrZmVQWmczMW1icTRaeXZhREtS?=
 =?utf-8?B?ZnF5N1JlTHhZWlN6ckx5U2VhWmpCeGE1ZVpKWnpPd3dUNmVpUkVkOGVVNksw?=
 =?utf-8?B?aHA5NStCdGUxNU1GSXpWTWk0YnpPUUR5bGswYytKOS92aEpDVFNLZndvN3Vw?=
 =?utf-8?B?RjIyMC83YWNJQk9TRUhXbGM4NEl3M2hJZUtoRkxDSVF6b0M3WTRTaTN1VXBx?=
 =?utf-8?B?ZGN5cHIrTVJpQkRKMTFxREpDZ1FVOTA1WUlJL0NBSzlwODRNSDY4aWR3dWZ1?=
 =?utf-8?B?SytHQWRCVitSa3poZXo2Q21XRW1JLy82ZHlMVHVGMFBNYVZKUmM2d0VjTmRM?=
 =?utf-8?B?ZzBTNmgrampVM0pkOE5OY1UvVUhLbkhMZWY5RW5ybWJJeHdySFdaRHgvcVlt?=
 =?utf-8?B?dE5jWWFid29RUXpMVUFWL1RseUxCMmRWS21HQVVRWEpBekV0YW1CQk14ZHZo?=
 =?utf-8?B?bW5MVTl5K0pFT29mc3B2cVE0STlPR1UvVkR1SGtkS2V0TVZKbTZ3Y0o0cFFp?=
 =?utf-8?B?YVhTa2prUU5rUjkzRHI3WTZaN2hxNUZtTTRYQStYblQ3R0dFRUFEQitHVzAx?=
 =?utf-8?B?V2h1L2ZRaHhLRC9Bd3pEVjhRbEtCdmNya1hNV2Q5WmxmaE1UZi9uSHRYbmwv?=
 =?utf-8?B?c082SFZHSVdmQk5Dc3lzdTA5N3d1d0NhZnV2MzI5N0FMMmZxSWs0TkZENDRY?=
 =?utf-8?B?QmpOYUQ5L3RhQithdmVYR3VqNDhOdzhVRnZQM0NuSEJzV0lDczVPT1E2U3ZY?=
 =?utf-8?B?cUtoK2NVajFzUGQ4YTR0ZWJPeFRnV01OT1NyWTRUa3Z4RUVIT2xsM1lYczRa?=
 =?utf-8?B?bEVWRnd6WGRDWVRvT3hWWU13S3RrVFB4bWR1dlprNENCM25yUWNHenBSSit4?=
 =?utf-8?B?Njh1MFVJaFFPeW9IbEcwOFJlODlVOGY5RVkweHR5WjZBbFBCSkhGQWc0OGhx?=
 =?utf-8?B?U3cwSFMrUHZPdUkwNXc4RGhKVHFZd05XaWpGMFdST092K0hBQW9CL1NvZlVs?=
 =?utf-8?B?alE4aExBT2lJakVrSGZuQ1F2WDdpZnh2Q1YxaGNtYlp0SXppd3VUNWh1RVdM?=
 =?utf-8?B?dExZRWtkT1lvUHpHdndyQU03RU5yWTBuUnMzTHIyOEsrK3N1bUQxN0lGa0h1?=
 =?utf-8?B?MXNlVkJaUUFXbEZBSXNXajVVckRRbG1NYXZuRTlCTGNsUnhVTzlxYnZSREZ1?=
 =?utf-8?B?L2doT3BQVC8renVFUk1vRGJxRkR1V1BGQnVkZ1dnSDFsMlN5YXJLME82Zndx?=
 =?utf-8?B?VmN4Vkd5Z2FHdFFvcXh1elFqRTdIaHFDdFV0WGFBU2JyN3VGMDNlQ0hQeGFI?=
 =?utf-8?B?WFFSR25yL2trMWlRMUJIT0JYd2tOSC9xUGxSY3FoWk5TQjRHNlQ3c3kyU0JX?=
 =?utf-8?B?cjUwc0c4ZlhsbWVJdjVzOUlGTjJxVzRXK0g1QStnS1Jrc0NiZE9Vc2lZZ284?=
 =?utf-8?B?Y3piL1BUaUhLK2pNc2E0VlRHZ01ZMmdWWTJ1cTRUZ0owR3I5Y0N3UXpock9E?=
 =?utf-8?B?cFJicDJJaUlMSTVUSFdYRCtLM2IwRVhXendXTXBOS0JMcTl4bTR0MXdrVnVk?=
 =?utf-8?Q?Cjc5JCh1p7eF4smWLx8VGl9FMA6HD3PyQvL7wH9qEo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FA5A7EFB11FD548B03F551CA77B6B9E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1126e79-cdd0-4f05-55f9-08da95ca6820
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 20:56:18.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /gF4QO+fC4qBiCvCWkffolg2iOIh+NjH6nM27f3hfYiklkujRTriHJdMs9GLb4htc2h3YpgJTCWjXvmOZPJFrG6IfpqtgnUtJyE228DMyok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5635
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Um9nZXIsDQoNCk9uIFR1ZSwgMjAyMi0wOS0xMyBhdCAxNjoxOCArMDMwMCwgUm9nZXIgUXVhZHJv
cyB3cm90ZToNCj4gQmVuZWRpa3QsDQo+IA0KPiBPbiAxMy8wOS8yMDIyIDExOjIzLCBOaWVkZXJt
YXlyLCBCRU5FRElLVCB3cm90ZToNCj4gPiBSb2dlciwNCj4gPiANCj4gPiBPbiBNb24sIDIwMjIt
MDktMTIgYXQgMTQ6MDQgKzAzMDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6DQo+ID4gPiBCZW5lZGlr
dCwNCj4gPiA+IA0KPiA+ID4gT24gMTIvMDkvMjAyMiAxMDo0MywgTmllZGVybWF5ciwgQkVORURJ
S1Qgd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgMjAyMi0wOS0wOCBhdCAxNTowOSArMDMwMCwgUm9n
ZXIgUXVhZHJvcyB3cm90ZToNCj4gPiA+ID4gPiBCZW5lZGlrdCwNCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBPbiAwNi8wOS8yMDIyIDE1OjQ3LCBCLiBOaWVkZXJtYXlyIHdyb3Rl
Og0KPiA+ID4gPiA+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVy
bWF5ckBzaWVtZW5zLmNvbT4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlIEdQTUMgY29u
dHJvbGxlciBoYXMgdGhlIGFiaWxpdHkgdG8gY29uZmlndXJlIHRoZQ0KPiA+ID4gPiA+ID4gcG9s
YXJpdHkNCj4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiB3YWl0
IHBpbi4gVGhlIGN1cnJlbnQgcHJvcGVydGllcyBkbyBub3QgYWxsb3cgdGhpcw0KPiA+ID4gPiA+
ID4gY29uZmlndXJhdGlvbi4NCj4gPiA+ID4gPiA+IFRoaXMgYmluZGluZyBkaXJlY3RseSBjb25m
aWd1cmVzIHRoZSBXQUlUUElOPFg+UE9MQVJJVFkgYml0DQo+ID4gPiA+ID4gPiBpbiB0aGUgR1BN
Q19DT05GSUcgcmVnaXN0ZXIuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJlbmVkaWt0IE5pZWRlcm1heXIgPA0KPiA+ID4gPiA+ID4gYmVuZWRpa3QubmllZGVybWF5
ckBzaWVtZW5zLmNvbQ0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgLi4uL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiA+ID4gY2hpbGQueWFtbCAgICAg
ICAgICB8DQo+ID4gPiA+ID4gPiA2DQo+ID4gPiA+ID4gPiArKysrKysNCj4gPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0K
PiA+ID4gPiA+ID4gY29udHJvbGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sDQo+ID4gPiA+ID4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gPiA+ID4gPiBj
b250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiA+ID4gY2hpbGQueWFtbA0KPiA+ID4gPiA+ID4g
aW5kZXggNmUzOTk1YmIxNjMwLi5hMTE1YjU0NGE0MDcgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiA+ID4gPiA+ID4g
Y29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+ID4gPiA+IGNoaWxkLnlhbWwNCj4gPiA+ID4gPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gPiA+
ID4gPiBjb250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiA+ID4gY2hpbGQueWFtbA0KPiA+ID4g
PiA+ID4gQEAgLTIzMCw2ICsyMzAsMTIgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ICAgICAg
ICBXYWl0LXBpbiB1c2VkIGJ5IGNsaWVudC4gTXVzdCBiZSBsZXNzIHRoYW4NCj4gPiA+ID4gPiA+
ICJncG1jLG51bS0NCj4gPiA+ID4gPiA+IHdhaXRwaW5zIi4NCj4gPiA+ID4gPiA+ICAgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gPiA+ID4gPiAg
DQo+ID4gPiA+ID4gPiArICBncG1jLHdhaXQtcGluLWFjdGl2ZS1sb3c6DQo+ID4gPiA+ID4gPiAr
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ID4gPiArICAgICAgU2V0IHRoZSBwb2xhcml0eSBm
b3IgdGhlIHNlbGVjdGVkIHdhaXQgcGluIHRvIGFjdGl2ZQ0KPiA+ID4gPiA+ID4gbG93Lg0KPiA+
ID4gPiA+ID4gKyAgICAgIERlZmF1bHRzIHRvIGFjdGl2ZSBoaWdoIGlmIHRoaXMgaXMgbm90IHNl
dC4NCj4gPiA+ID4gPiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEkganVzdCBjaGVja2VkIHRoYXQgdGhlIGRlZmF1bHQgYmVoYXZpb3Vy
IGlzIGFjdGl2ZSBsb3cuDQo+ID4gPiA+ID4gUmVzZXQgdmFsdWUgb2YgdGhlIHBvbGFyaXR5IHJl
Z2lzdGVyIGZpZWxkIGlzIDAsIHdoaWNoIG1lYW5zDQo+ID4gPiA+ID4gYWN0aXZlDQo+ID4gPiA+
ID4gbG93Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdlIHdpbGwgbmVlZCB0byB1c2UgdGhlIHBy
b3BlcnR5ICJncG1jLHdhaXQtcGluLWFjdGl2ZS1oaWdoIg0KPiA+ID4gPiA+IGluc3RlYWQuDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gU29ycnkgZm9yIG5vdCBjYXRjaGluZyB0aGlzIGVhcmxpZXIu
DQo+ID4gPiA+IA0KPiA+ID4gPiBJdCdzIG9rLiBObyB3b3JyaWVzLg0KPiA+ID4gPiANCj4gPiA+
ID4gV2VsbCwgdGhlIERhdGFzaGVldHMgYXJlIHRlbGxpbmcgbWUgZGlmZmVyZW50IHJlc2V0IHZh
bHVlcw0KPiA+ID4gPiBoZXJlLiANCj4gPiA+ID4gVGhlIGFtMzM1eCBUUk0gKFJldi4gUSkgZGVm
aW5lcyB0aGUgcmVzZXQgdmFsdWUgb2YNCj4gPiA+ID4gV0FJVDFQSU5QT0xBUklUWQ0KPiA+ID4g
PiBhcw0KPiA+ID4gPiAweDAsIHdoZXJlYXMgdGhlIGFtNjR4IFRSTSAoUmV2LiBDKSBkZWZpbmVz
IHRoZSByZXNldCB2YWx1ZSBvZg0KPiA+ID4gPiBXQUlUMVBJTg0KPiA+ID4gPiBQT0xBUklUWSBh
cyAweDEuIFRoZSBhbTY0eCBUUk0gYWxzbyBkZWZpbmVzIGRpZmZlcmVudCByZXNldA0KPiA+ID4g
PiB2YWx1ZXMNCj4gPiA+ID4gZm9yIA0KPiA+ID4gPiBXQUlUMFBJTlBPTEFSSVRZIGFuZCBXQUlU
MVBJTlBPTEFSSVRZLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGludGVyZXN0aW5nIHRoaW5nIGlz
IHRoYXQgSSdtIGN1cnJlbnRseSB3b3JraW5nIG9uIGFuDQo+ID4gPiA+IGFtMzM1eA0KPiA+ID4g
PiBwbGF0Zm9ybSBhbmQgSSBkdW1wZWQgdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIGFuZCBnb3QN
Cj4gPiA+ID4gMHgwMDAwMGEwMA0KPiA+ID4gPiAoV0FJVDFQSU5QT0xBUklUWSA9PSAweDEpLiBT
byBJdCBkb2Vzbid0IGJlaGF2ZSBsaWtlIHRoZSBUUk0NCj4gPiA+ID4gc3BlY2lmaWVzLg0KPiA+
ID4gDQo+ID4gPiBJIGNhbiBjb25maXJtIHRoZSBzYW1lIGJlaGF2aW91ciBvbiBhbTY0MiBFVk0g
YXMgd2VsbC4NCj4gPiA+IEkgZ2V0IDB4YTAwIG9uIHJlYWRpbmcgR1BNQ19DT05GSUcuDQo+ID4g
PiANCj4gPiA+ID4gTmV2ZXJ0aGVsZXNzLCBJJ20gc2V0dGluZyB0aGUgV0FJVFhQSU5QT0xBUklU
WSBiaXRzIGluIGJvdGgNCj4gPiA+ID4gY2FzZXMNCj4gPiA+ID4gYWNjb3JkaW5nbHkuICANCj4g
PiA+ID4gMHgwIGluIGNhc2UgImdwbWMsd2FpdC1waW4tYWN0aXZlLWxvdyIgaXMgc2V0IGFuZCAw
eDEgaW4gY2FzZQ0KPiA+ID4gPiAiZ3BtYyx3YWl0LXBpbi1hY3RpdmUtbG93IiBpcyBub3Qgc2V0
LiBTbyB0aGUgcmVzZXQgdmFsdWUgaXMNCj4gPiA+ID4gYWx3YXlzDQo+ID4gPiA+IG92ZXJ3cml0
dGVuLg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFVzaW5nICJncG1jLHdhaXQtcGluLWFj
dGl2ZS1oaWdoIiByYXRoZXIgdGhhbiAiZ3BtYyx3YWl0LXBpbi0NCj4gPiA+ID4gYWN0aXZlLWxv
dw0KPiA+ID4gPiAiIGlzIGFsc28gb2sgZm9yIG1lLCBidXQgaXQgZmVlbHMgbW9yZSBsaWtlIGEg
Y29zbWV0aWMgdGhpbmcgYXQNCj4gPiA+ID4gdGhpcw0KPiA+ID4gPiBwb2ludC4gDQo+ID4gPiAN
Cj4gPiA+IE15IG1haW4gY29uY2VybiBpcyBmb3IgbGVnYWN5IHBsYXRmb3JtcyBub3Qgc3BlY2lm
eWluZyB0aGUNCj4gPiA+IHByb3BlcnR5DQo+ID4gPiBpbiBEVC4NCj4gPiA+IEVhcmxpZXIgd2Ug
d2VyZSBub3QgdG91Y2hpbmcgdGhlIFdBSVRQSU5QT0xBUklUWSBjb25maWcgYW5kIG5vdw0KPiA+
ID4gd2UNCj4gPiA+IGFyZQ0KPiA+ID4gc28gd2UgbWlnaHQgYnJlYWsgc29tZSBsZWdhY3kgcGxh
dGZvcm1zIHRoYXQgZG9uJ3Qgc3BlY2lmeQ0KPiA+ID4gdGhlIHBvbGFyaXR5IGFuZCB3ZSBmbGlw
IGl0IGhlcmUuDQo+ID4gPiANCj4gPiA+IEZvcnR1bmF0ZWx5LCB0aGVyZSBhcmUgb25seSBmZXcg
Ym9hcmRzIHVzaW5nIGdwbWMgd2FpdC1waW4gYW5kDQo+ID4gPiBtb3N0bHkNCj4gPiA+IHdhaXQt
cGluIDANCj4gPiA+IGZvciB3aGljaCB0aGVyZSBpcyBubyBkaXNjcmVwYW5jeSBhcyBmYXIgYXMg
d2FpdC1waW4gcmVzZXQgdmFsdWUNCj4gPiA+IGlzDQo+ID4gPiBjb25jZXJuZWQuDQo+ID4gPiAN
Cj4gPiA+IGxvZ2ljcGQtdG9ycGVkby1iYXNlYm9hcmQuZHRzaToJCWdwbWMsd2FpdC1waW4gPSA8
MD47DQo+ID4gPiBvbWFwMy1kZXZraXQ4MDAwLWNvbW1vbi5kdHNpOgkJZ3BtYyx3YWl0LXBpbiA9
IDwwPjsNCj4gPiA+IEJpbmFyeSBmaWxlIG9tYXAzLWRldmtpdDgwMDAuZHRiIG1hdGNoZXMNCj4g
PiA+IEJpbmFyeSBmaWxlIG9tYXAzLWRldmtpdDgwMDAtbGNkNDMuZHRiIG1hdGNoZXMNCj4gPiA+
IEJpbmFyeSBmaWxlIG9tYXAzLWRldmtpdDgwMDAtbGNkNzAuZHRiIG1hdGNoZXMNCj4gPiA+IG9t
YXAzLWxpbGx5LWE4M3guZHRzaToJCWdwbWMsd2FpdC1waW4gPSA8MD47DQo+ID4gPiBCaW5hcnkg
ZmlsZSBvbWFwMy1saWxseS1kYmIwNTYuZHRiIG1hdGNoZXMNCj4gPiA+IEJpbmFyeSBmaWxlIG9t
YXAzLXpvb20zLmR0YiBtYXRjaGVzDQo+ID4gPiANCj4gPiA+IE9ubHkgMSBib2FyZCBpcyB1c2lu
ZyB3YWl0LXBpbiAxDQo+ID4gPiBvbWFwLXpvb20tY29tbW9uLmR0c2k6CQlncG1jLHdhaXQtcGlu
ID0gPDE+Ow0KPiA+ID4gDQo+ID4gPiBmcm9tIE9NUDM2eHggVFJNLCBoZXJlIGFyZSB0aGUgcmVz
ZXQgdmFsdWVzDQo+ID4gPiBXQUlUM1BJTlBPTEFSSVRZIDB4MQ0KPiA+ID4gV0FJVDJQSU5QT0xB
UklUWSAweDANCj4gPiA+IFdBSVQxUElOUE9MQVJJVFkgMHgxDQo+ID4gPiBXQUlUMFBJTlBPTEFS
SVRZIDB4MA0KPiA+IA0KPiA+IEFoIG9rLiBUaGUgcGljdHVyZSBpcyBnZXR0aW5nIGNsZWFyZXIu
DQo+ID4gDQo+ID4gRG9lcyBpdCBtYWtlIHNlbnNlIHRoZW4gbm90IHRvIHVzZSBhIGJvb2xlYW4g
cHJvcGVydHkgaW4gdGhhdCBjYXNlPw0KPiA+IFdpdGggYSBib29sZWFuIHByb3BlcnR5IHdlIGFy
ZSBvbmx5IGFibGUgdG8gY2hhbmdlIHRoZSBwb2xhcml0eQ0KPiA+IGJpdHMNCj4gPiBpbnRvIG9u
ZSBkaXJlY3Rpb24gKDAgLT4gMSBvciAxIC0+IDApIGJ1dCB3ZSBoYXZlIGRpZmZlcmVudCByZXNl
dA0KPiA+IHZhbHVlcyBmb3IgZWFjaCBiaXQuDQo+ID4gDQo+ID4gVGhpcyBwYXJ0IG9mIG15IHBh
dGNoIG1heSB0aGVuIGJyZWFrIHRoZSBtZW50aW9uZWQgbGVnYWN5IHBsYXRmb3Jtcw0KPiA+IGJl
Y2F1c2UgaXQgZXZlbiBvdmVyd3JpdGVzIHRoZSByZWdpc3RlciBpbiBjYXNlIHRoZSBwcm9wZXJ0
eSBpcyBub3QNCj4gPiBzZXQ6DQo+ID4gDQo+ID4gDQo+ID4gKwlpZiAocC0+d2FpdF9waW5fYWN0
aXZlX2xvdykNCj4gPiArCQljb25maWcxICY9IH5HUE1DX0NPTkZJR19XQUlUUElOUE9MQVJJVFko
cC0+d2FpdF9waW4pOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWNvbmZpZzEgfD0gR1BNQ19DT05GSUdf
V0FJVFBJTlBPTEFSSVRZKHAtPndhaXRfcGluKTsNCj4gPiArDQo+ID4gKwlncG1jX3dyaXRlX3Jl
ZyhHUE1DX0NPTkZJRywgY29uZmlnMSk7DQo+ID4gDQo+ID4gDQo+ID4gU28gaW4gb3JkZXIgdG8g
cHJlc2VydmUgY29tcGF0aWJpbGl0eSBhcyB3ZWxsIGFzIHRoZSBwb3NzaWJpbGl0eSB0bw0KPiA+
IGNoYW5nZSB0aGUgcG9sYXJpdHkgYml0cyBpbnRvIHRoZSBkZXNpcmVkIHZhbHVlIEkgd291bGQg
cHJvcG9zZSB0bw0KPiA+IHVzZQ0KPiA+IGFuIHVpbnQzMiB2YWx1ZSBmb3IgdGhlIGRlc2lyZWQg
dmFsdWUgYW5kIGluIGNhc2UgdGhlIGR0LXByb3BlcnR5DQo+ID4gaXMNCj4gPiBub3Qgc2V0IHdl
IHNob3VsZCBub3QgdG91Y2ggdGhlIHJlZ2lzdGVyIGF0IGFsbC4NCj4gDQo+IEknbSBzb3JyeSBJ
IGRpZG4ndCB1bmRlcnN0YW5kIGhvdyB1aW50MzIgdmFsdWUgc29sdmVzIHRoaXMgaXNzdWUuDQo+
IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aXRoIGEgRFQgZXhhbXBsZT8NCg0KSSBtZWFudCBh
IHNpbWlsYXIgaW1wbGVtZW50YXRpb24gbGlrZSBpbiBteSBmaXJzdCBwYXRjaHNlcmllcy4NCg0K
SnVzdCBhIGV4YW1wbGU6DQoNCmR0czoNCg0KZ3BtYyB7DQoNCiAgICBmb28wQDAgew0KICAgICAg
ICBncG1jLHdhaXQtcGluID0gPDA+Ow0KICAgICAgICBncG1jLHdhaXQtcGluLXBvbGFyaXR5ID0g
PDA+OyAgLyogYWN0aXZlIGxvdyAqLw0KICAgIH07DQogICAgDQogICAgYmFyMEAxIHsNCiAgICAg
ICAgZ3BtYyx3YWl0LXBpbiA9IDwxPjsNCiAgICAgICAgZ3BtYyx3YWl0LXBpbi1wb2xhcml0eSA9
IDwxPjsgLyogYWN0aXZlIGhpZ2ggKi8NCiAgICB9Ow0KICAgIA0KICAgIGZvb2JhcjBAMiB7DQog
ICAgICAgIGdwbWMsd2FpdC1waW4gPSA8Mj47DQogICAgICAgIC8qIGRvbid0IHRvdWNoIHdhaXQg
cGluIHBvbGFyaXR5IGhlcmUgKi8NCiAgICB9Ow0KfTsNCg0Kb21hcC1ncG1jOg0KDQpncG1jX3Jl
YWRfc2V0dGluZ3NfZHQoKSANCnsNCiAgcC0+d2FpdC1waW5fcG9sYXJpdHkgPSAtMTsgIC8qIHNv
bWUgaW5pdCB2YWx1ZSByZXF1aXJlZCBoZXJlICovDQogIGlmICghb2ZfcHJvcGVydHlfcmVhZF91
MzIobnAsICJncG1jLHdhaXQtcGluLXBvbGFyaXR5IiwgJnAtPndhaXQtcGluX3BvbGFyaXR5KSB7
DQoNCiAgLi4uLg0KICB9IA0KfQ0KDQpncG1jX2NzX3Byb2dyYW1fc2V0dGluZ3MoKSANCnsNCiAg
IGlmIChwLT53YWl0X3Bpbl9wb2xhcml0eSA9PSAwKQ0KICAgICBjb25maWcxICY9IH5HUE1DX0NP
TkZJR19XQUlUUElOUE9MQVJJVFkocC0+d2FpdF9waW4pOw0KICAgaWYgKHAtPndhaXRfcGluX3Bv
bGFyaXR5ID09IDEpDQogICAgIGNvbmZpZzEgfD0gR1BNQ19DT05GSUdfV0FJVFBJTlBPTEFSSVRZ
KHAtPndhaXRfcGluKTsNCn0NCg0KVGhpcyBzaG91bGQgbWV0IGFsbCByZXF1aXJlbWVudHMuDQoN
CklmICJncG1jLHdhaXQtcGluLXBvbGFyaXR5IiBpcyBub3Qgc2V0IGluIHRoZSBkZXZpY2UgdHJl
ZSwgdGhlbiB0aGUNCnJlZ2lzdGVycyBzdGF5IHVudG91Y2hlZC4gDQoNCklmIGl0IGlzIHNldCwg
dGhlbiB0aGUgV0FJVDxYPlBJTlBPTEFSSVRZIGJpdCBpcyBzZXQgYWNjb3JkaW5nbHkuDQoNCg0K
T24gdGhlIE9NUDM2eHggcGxhdGZvcm0gZm9yIGV4YW1wbGUgd2UgaGF2ZSB3YW50IHRvIHNldCBh
bGwgd2FpdCBwaW4NCnBvbGFyaXRpZXMgdG8gYWN0aXZlIGxvdyAoMCkgYW5kIGhhdmUgZm9sbG93
aW5nIHJlZ2lzdGVyIHJlc2V0IHZhbHVlczoNCg0KV0FJVDNQSU5QT0xBUklUWSAweDENCldBSVQy
UElOUE9MQVJJVFkgMHgwDQpXQUlUMVBJTlBPTEFSSVRZIDB4MQ0KV0FJVDBQSU5QT0xBUklUWSAw
eDANCg0KV2l0aCBhbiBib29sZWFuICJncG1jLHdhaXQtcGluLWFjdGl2ZS1oaWdoIiBwcm9wZXJ0
eSB3ZSdyZSBub3QgYWJsZSB0bw0Kc2V0IFdBSVQzUElOUE9MQVJJVFkgYW5kIFdBSVQxUElOUE9M
QVJJVFkgdG8gMC4gDQpBbmQgdmljZSB2ZXJzYSB3aXRoIFdBSVQyUElOUE9MQVJJVFkgYW5kIFdB
SVQwUElOUE9MQVJJVFkgaWYgd2Ugd2FudA0KdG8gDQpzZXQgdGhlbSB0byBhY3RpdmUgaGlnaCAo
MSkgYW5kIG9ubHkgd291bGQgaGF2ZSBhICJncG1jLHdhaXQtcGluLQ0KYWN0aXZlLWxvdyIgcHJv
cGVydHkuDQoNCkkgaG9wZSB0aGlzIGNsYXJpZmllcyBteSBwcm9wb3NhbC4NCg0KPiANCmNoZWVy
cywNCi1yb2dlcg0KDQpjaGVlcnMsDQpiZW5lZGlrdA0KDQo=
