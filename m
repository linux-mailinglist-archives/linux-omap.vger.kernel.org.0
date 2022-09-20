Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759815BE522
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 14:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiITMB5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 08:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiITMBy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 08:01:54 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140045.outbound.protection.outlook.com [40.107.14.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB1422B18;
        Tue, 20 Sep 2022 05:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv3x+FbDLv5iUOwEbdaIGM7poB6j82wN8E6NiMlFAHewHK8QU4pOZiqpp5BHdWtvwmjMA+O8a57vZOp/3Cl/Q7xnGbj2zrDhhtWrZGSLwGVIdxLYoVVKxxjRZvxJcoguy2KM1OZha0C+AXY4s0Op+nEJgu3KY+UhTV5Ty1M7dMmupM+E4Lk5fHqdM7giwFgdm+VtBUBAY80Fc1rywayhW6CjusnrMmJ4depDqT5i8rpahdcZn/q4B38EdRAVwcoZDeM5DEcvPE98gZZKlKt3WQwKmK42+xQmuQKragQKsc3/aIdTOWmqq2xdto6c5gcMTeFUZsQbC39AKetskc5cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDFQZ8R/yQKX+uffQkhm+ye2QEwzg8SGxkH/ymUNBw8=;
 b=LxYjtRtsfJXO8XI9eA7vCGENTtd+SEkhKUrcMMvStr5DmZ/ndZXS8Q6CHRQQA9ab+51FOTuNQ92b5HzrAL3kTAPQwAioJ3QC6imsIMXn9T3Uj8e7cAGARilDcjrszqZCcG5bjGJB1jlfkGaOoFPcqbS3mHvGsoj8qjaa+JCwkpFS0SO2NcJ7zeFMRKW1q/WVCYzBGY0XqqfgCuUwM0dJ7/+dKGIvdDH6FFEFFcmFK9VL7Mx86TJp4phzLTmwYUqYx+y6vWKWcnAV+Z/0bsWthZbF2trmln9e8Tln49zfGpNhkgKSV/wAmtj+sx5P2sitI1J7iiyqYnhkLjviL6qUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDFQZ8R/yQKX+uffQkhm+ye2QEwzg8SGxkH/ymUNBw8=;
 b=i0OP9rGsUL2AEp+SYzIDEaLo7RIMSe8UseFoPcYndE5gU4fLpxKNU3N875FleukxsGm4za9zXhc3td45Yci9aW8Bi4wGyqACsk4JvbYMpe1SgY/2cPUOBOS5vLPS7jxe7ivTfv85I7N28nfbws4I2jUXfo4OS9viWaOkSd71qV8JopJiJDc3dMNgo2megy8BPm0G4mEWcJEHDSrvRWyGILJdWNMjqUMjZxPaWClFKWmbDEltM50worwDWbTjWCTTP31vXYMzKZ+n9Komskg0MtQgxuJMg9YhCOodQFJGQgIT/7ktJez6oIW75ybQbooit4MvB4qT89dJ57UEDYsWog==
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::15)
 by GV2PR10MB6623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 12:01:50 +0000
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79]) by AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79%7]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 12:01:50 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Topic: [PATCH v5 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Index: AQHYzOMhRzSqkDnQLEemID7XNdK1bK3oN8CA
Date:   Tue, 20 Sep 2022 12:01:50 +0000
Message-ID: <f82939a1adec0c1b7278081c2576bbbfee8a5510.camel@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
         <20220916120749.2517727-4-benedikt.niedermayr@siemens.com>
         <d17d2eb3-2030-935d-728b-60d9e1c66cea@linaro.org>
In-Reply-To: <d17d2eb3-2030-935d-728b-60d9e1c66cea@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5507:EE_|GV2PR10MB6623:EE_
x-ms-office365-filtering-correlation-id: 942580aa-d89d-4a17-50d4-08da9affe694
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Knp8ZKZz0rcQkBNjN/fimCh34/P6lF4E4Eol/Hz7suThogTzHgim9gB+gCePfpV28rFRJAzz9wX+Elg7rzRvKCPaGkyvWNGVTSVnd2va9JRiG0TKuIGgVJZBfjosGFwDd5woxl0vtbn4/snEvODomzHSMc+fIFt5TXCw7XnFMGKdnFdhnYBBx65qIImRagdfblrkl12XubO3KlOQ27Tu0SMooqItiT13yGhACCa32a9JT78iLhQaNebnzqixqdtE8ZvwdYKo8pdXC35tCY1hF4bHQvwydQeXHEhmNKT2u6AyYkgEfyBADptzUrrytPHRKSK9KFBRIz7QUVEa5NBH+YO5jWUKxg1dsM3E3WqUBfM/Np2L7hirmrECojLVkoG5nZB8HGBWNZtSV0eDbPSTdnx9vurB21QOkEQ2t3Nvc2NReVUCuPOR4Y+99aeXM4ZEGVHEpWTZvb6bpWnJ7aCmZSIoofv5NA73Opxj0DZzvnjvJCQ54wpZnjU/+pIWhH7APcQVMvDvtihe4U2gWk12f2m0e1V86lZoSefz1Mk/1hwBSimU5gu4jt5bXfrLv0fbA7z58RmZJiFdDntkgbJNegbHgzAOYJoRCin4STRcqw7dtKX52MUysuppRzdTZQHjVy8e8IpihPbLP8BuULw99hUipi8dOV4duKUduao2Ude/BGZqhqDWnNMruNLCS5HLqOA75xKvtjUaPBX/5jryC6X3eWdH4FCw2E9nY3ctzoW2nDYPJKjC6YI201gM9JUBsqJnjiXripkbqs4EBj43wQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(71200400001)(41300700001)(110136005)(478600001)(6486002)(5660300002)(36756003)(8936002)(54906003)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(91956017)(86362001)(38070700005)(82960400001)(122000001)(38100700002)(2616005)(186003)(6512007)(6506007)(53546011)(3450700001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0lIYW1jSlA2VkRkTml4YXQ3SUFPNi9JTmQ0eG05RHdXRnRUOHFmalNVRzha?=
 =?utf-8?B?VWdOdkw5N3NKZTdFcFhoc3NkZExFTjc1NmdZdzlHUFZrQndoUzduWkYxTVZa?=
 =?utf-8?B?ZytNdFF1OE5IcEVPakV5czhJeVVQT0doSm5DOVFjZFF3MHpHLy9VbXhBVFk4?=
 =?utf-8?B?L01iZnA4U25XQnhiRG43MHliWkhpb1NtbFlxWUZYTFlWUWF0amRqa0VrSTMz?=
 =?utf-8?B?ZjlCNzdoOUY3eVdyM0x5S21FbTRtblFOQ29rbGNBZU1hckc2UzAra1hhcUpi?=
 =?utf-8?B?NTJNTmZtenFHOXgyMWx2ejdETjBnTG5nYmxzbStjN2ViTnlxakdIRGVERVdQ?=
 =?utf-8?B?dE5lZkUySk0zVGZ6SnBudC9XZlRJaVoya2x0VUtWakYzNm1ndkgzRmZ6Sy9U?=
 =?utf-8?B?MzN0TGtMWnU1MXo5RmRVQkRCNUxHS3dlME1SNkkwQUYyMVF0akQ1blUxck5Y?=
 =?utf-8?B?b2xldEJycXVqd285N0Y5KzEveXg0WWVSbjd3MUlwYUpXTFh0OHRlbDVWK0Nh?=
 =?utf-8?B?eTgxclZBUnJaM201c2EvWE9XNXVPODd2SldGUCtodUtDUUJEcXRCbmZwUHlP?=
 =?utf-8?B?eGlDUHMwVHVkdmVHV2pCSjFDaS9id2pUc1h5VloyeGd1bHAxdjl1L0xHRFRL?=
 =?utf-8?B?NE9vTWNnNUNLQ1QrdTFKUEwyT1c5MVIwaEVMaXhOTyt6emdUalFkNG5oU21F?=
 =?utf-8?B?dVdiZC8wdDBWSVNKMU9WeW0vZzRQajFXQzVsQ2lpZWpsNG9veCtRRXMyYlc1?=
 =?utf-8?B?Mk5vRDVhQmx0a0hkaFN1NXVhODMreVhlbG84Q2tVM000ZXlRWFYrcXkvQTZG?=
 =?utf-8?B?Qys5b1RmTi80WlkxY1IwbHN5dUlBMGhqaWVTQW1VeUR1a25WOExmWGRDSGIy?=
 =?utf-8?B?cXNIbmVBZWxjRWwySmQ1Z3JRVVFBN0tTNkNnVnhuVW80OEJVYUpWSTNqQlB6?=
 =?utf-8?B?WkRsYVBoclpkSWNoOWErT20xVHV1Q2R1VnpUczRhYTNnaUhzZ2lqMmdzNng3?=
 =?utf-8?B?aFJ3NEJsWkVsTEQ3SkNiV0ltdERMdm5TRGRldnIrd0N2TWd1MDlLb1hjRTVM?=
 =?utf-8?B?ZHRMbE9aYWR4RFEzazZ0SXRpYmF6eXpCdjRiNHhCdk5kZEpnRWxlNHhYSnQr?=
 =?utf-8?B?RVVXT1FMc3dYZVF4alRBc3FaSWg1NUx4aTR0OUdoZXU2YXNSamJRR2ZFZHpw?=
 =?utf-8?B?YWh0QUxyR0wwZlBHSTM5anNmWEdwMmNad2h0cXpUMnNFOGdIeDhWYTBIK3dM?=
 =?utf-8?B?NnZKQXIrZ2NXQ0NEemNNVEZJSlRBN1dEZHNXdytqQkxkUGFsTURTYk1KZTdE?=
 =?utf-8?B?K3FXblROKzgxVmpNQmVKTE41Y3pWL3k5WUVJYXh3V1VSUHVDcUg0aS9ySkwz?=
 =?utf-8?B?N3hFcWJEbEJTOGVvdUYvUU9VN2xKczFDdGhCSSsxN25ySWQ0NHJRTUdDdGM4?=
 =?utf-8?B?R0M2TXJJL0VrTmJXa1hIdVlUZm84bE1XU3hLMk9iWmgxYXBtWjU5NmdBL1cx?=
 =?utf-8?B?S1BUby9YOUxFT1ZMNGR4clVFQUQ1WkRMWktzM204YnVTRzZSbTVHdklvTnVP?=
 =?utf-8?B?SXkveEZUbHU4Q2ZnNy9uVHBpVW9tS3dvRHlEWUFxK3pNTHNhcnYyUnJDMEQw?=
 =?utf-8?B?dzRsVXdvL2Y3cDhuMUZ3S0wvR3FQRnkrdG9vaFdoU1czT3B0UU0zeG80VFM1?=
 =?utf-8?B?eEJITE9wL2pKRDdvcVRXZmMvd0NqYW5ONkRiUEUrM3NmRUVUMjdLaXZUVFJu?=
 =?utf-8?B?ajkzMm01NithVVRqMkJTTUY5K0pBdkp2WDQ5SGd5U0tkRUR1QXJvTitUQm1n?=
 =?utf-8?B?S3RHUlU1dEQyTWM3bGJyajVyNWdqTVcvV2E3RjVmKzhxdkVmRWUrVDJjYlFi?=
 =?utf-8?B?MkkrZzRkUWthd25oNkxQSHBZMngyY2M4T0FlTEtXMUE0MndGYnU1cEs4Z1ZX?=
 =?utf-8?B?QkFkajNBaGFMcVFiVk5jbGlNeFdsT3lPRHA2S3Z3eTVqVjBSNm5TY25OQ0Zk?=
 =?utf-8?B?UG5XUldseDhoWDhMOTVzTFNvUFlTSkpHeUZjTksrMVJVd25JRFhORFJaM2tx?=
 =?utf-8?B?cmZhb1RPTjZIYTlUUTJ1V0lMU1pGeUVJRnNybXZ2c3ovQ3c2ejF5Zzc2b3ZY?=
 =?utf-8?B?bGp1bUdmL1JHYWU0TW91WEFGZ2pidVB2UDVlY1piRjlvem1kRXdhV1lwODNJ?=
 =?utf-8?B?ZWdzdkg1Snp3R2cwaG44aXExQmg1V1FLMGx0bExvd0E2QWxWbE95aHdpODFi?=
 =?utf-8?Q?E3VhUzAleIXzin6oEGHbitJTfJ6Eq3PlC/4MuxeFNw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAA5E0D7FBD2E9428E571623613D4F2A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 942580aa-d89d-4a17-50d4-08da9affe694
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 12:01:50.1851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DdbEfSd/8gBAct/kOlV26LoliM7U52b0EnJwjk0ftCrgquOdlAHRnbP7Ii/ksXtFhWSyWfOTkw5rqRSROyv4mtpGykVQRlI6bodzC/KEEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6623
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjItMDktMjAgYXQgMTM6MjEgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE2LzA5LzIwMjIgMTQ6MDcsIEIuIE5pZWRlcm1h
eXIgd3JvdGU6DQo+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVy
bWF5ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBUaGUgR1BNQyBjb250cm9sbGVyIGhhcyB0aGUg
YWJpbGl0eSB0byBjb25maWd1cmUgdGhlIHBvbGFyaXR5IGZvciB0aGUNCj4gPiB3YWl0IHBpbi4g
VGhlIGN1cnJlbnQgcHJvcGVydGllcyBkbyBub3QgYWxsb3cgdGhpcyBjb25maWd1cmF0aW9uLg0K
PiA+IFRoaXMgYmluZGluZyBkaXJlY3RseSBjb25maWd1cmVzIHRoZSBXQUlUUElOPFg+UE9MQVJJ
VFkgYml0DQo+ID4gaW4gdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIGJ5IHNldHRpbmcgdGhlIGdw
bWMsd2FpdC1waW4tcG9sYXJpdHkNCj4gPiBkdC1wcm9wZXJ0eS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdw
bWMtY2hpbGQueWFtbCAgICAgICAgIHwgNyArKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLWNoaWxkLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdw
bWMtDQo+ID4gY2hpbGQueWFtbA0KPiA+IGluZGV4IDZlMzk5NWJiMTYzMC4uOGU1NDFhY2RiMWZm
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLWNoaWxkLnlh
bWwNCj4gPiBAQCAtMjMwLDYgKzIzMCwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICBXYWl0
LXBpbiB1c2VkIGJ5IGNsaWVudC4gTXVzdCBiZSBsZXNzIHRoYW4gImdwbWMsbnVtLXdhaXRwaW5z
Ii4NCj4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mg0KPiA+ICANCj4gPiArICBncG1jLHdhaXQtcGluLXBvbGFyaXR5Og0KPiA+ICsgICAgZGVzY3Jp
cHRpb246IHwNCj4gPiArICAgICAgU2V0IHRoZSBkZXNpcmVkIHBvbGFyaXR5IGZvciB0aGUgc2Vs
ZWN0ZWQgd2FpdCBwaW4uDQo+ID4gKyAgICAgIDAgZm9yIGFjdGl2ZSBsb3csIDEgZm9yIGFjdGl2
ZSBoaWdoLg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyDQo+ID4gKyAgICBlbnVtOiBbMCwgMV0NCj4gDQo+IEkgcHJvcG9zZSB0byBrZWVwIHRo
ZSBzYW1lIHZhbHVlIGFzIEdQSU8gZmxhZ3MuIE5vdCB0aGF0IGl0IG1hdHRlcnMsIGJ1dA0KPiBt
YXliZSBvbmUgZGF5IHlvdSB3aWxsIHVuaWZ5IGl0Lg0KQWggeWVzLiBNYWtlcyBzZW5zZSENCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KQ2hlZXJzLA0KYmVuZWRpa3QgDQo=
