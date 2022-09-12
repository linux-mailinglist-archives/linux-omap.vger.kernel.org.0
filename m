Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5F05B5507
	for <lists+linux-omap@lfdr.de>; Mon, 12 Sep 2022 09:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiILHHp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Sep 2022 03:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiILHHo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Sep 2022 03:07:44 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DBC2AC48;
        Mon, 12 Sep 2022 00:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMOeCChXIp8l3vh0QhOPrLMB4YAMABfDx66TWcoSovxo7quGKKDhWFun0A/z1dLKD2YLtiG76EOGqmwimqUiRG0XvkAro7SzstLwe/uDkPDBqH7CLpI8JqxrU90AC4y3FgnjhFiGonFYj28pOQ+Qs7RlkDIE3EJihuc+ptqHzWM//BBbNIvH84eL2bQLnf71Mqkh7/0bJRSnC7cKvmjpW/x5axjY13VyzAFRr3gxitKhULX3W9MwGJuYdVLz1DTaGvudxDJ4nYawfq6V5tLvO6X5en80S90LA0+92n84C0l//k5IF50D1pTv/diYYIIUH7TfJxD+/0tDVUTcNzDItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz6TuSmBX3BQ2Kmebv7Coznp7HyPP13wZf2NXbzM21I=;
 b=idi1sjjpmC1pDKqfezo2VcPmNWNxtRE6iozICA3PTBfijoyHaPCSZkaxgCfHIc6q+gAAxVg13vAYBDETdHq5vnT+GhOdzssMXj8oNZ5hLafJBUywPtwURS+V8JlCjK/P9yGXBwye33xlyM8yfFlglsPraRIk5xCluq58jTS49as2gV2keQB1jdlh/caGfyFJWmibryA1LiHRFLwRNek28y4Bv4oCpPbPNTW5IbryT8kGfqhvPlmQCGXPTxDCkOiDOBttfQQdnes4Pjn9FtgndeMZQSjoEm0dYteAMEtjKY5prrmwoYXIKxaZEHg0yya+H+gQQrcKh28Rokwwv/hLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz6TuSmBX3BQ2Kmebv7Coznp7HyPP13wZf2NXbzM21I=;
 b=wwTJyEQk94RW3DnCILo4sJlS34cFHh0USanYmC4Xp2Qr3J15enY7H3SB3a23pr+gOjrG8Cxrq9f6DjpxzKrPAwJ2kTZ34h5f6oeWPrIRrOXdibzLwvCfYArDhGuVRE+aRRM86AE3ZXMh2oiUqm/S8ZnHVVQJZNNcJoMFvmvDk2rq7AoU1syDBMANF+wbc8517ZVPLvp5REPzv5eBF+eFldYyJK+kcVqieJ5GYmXIjWD4+nPtQnaqSp/nA0hOZ1Jy8k3LOvix4lQoyV4WeS4rfZFEZg8qlhaq3/mBz561v6HQuDnHNjxwt9TJdE5Rp03Xr9zMcmcPR+s4+H8cOWTt9g==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PAVPR10MB6963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 07:07:38 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::82e:2625:1aca:610d]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::82e:2625:1aca:610d%4]) with mapi id 15.20.5612.020; Mon, 12 Sep 2022
 07:07:38 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Topic: [PATCH 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Index: AQHYw3r8oPJEW7FpEk6Q2Grnhvrdna3bZbeA
Date:   Mon, 12 Sep 2022 07:07:38 +0000
Message-ID: <9b28714d0551571c73db5a47f8a853ce274708a4.camel@siemens.com>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
         <20220906124747.1767318-4-benedikt.niedermayr@siemens.com>
         <3f9ab380-4011-75f1-40df-f6c7759f69de@kernel.org>
In-Reply-To: <3f9ab380-4011-75f1-40df-f6c7759f69de@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|PAVPR10MB6963:EE_
x-ms-office365-filtering-correlation-id: df977794-39b1-45cb-5432-08da948d79d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qcFxLQWloKAQ0WfbFlHEal8gJXSchxw8Sd3a5swrzO4fONUb1Hg33u70/jjeDGbEuVGPIGnugc+zBghrA5RoBaIJHWb61Qoe75ySfKO9jWBNuOpeKG19ZeS4j4idO4NuNxNagQs6ye/SMvVGUke9nVFTMsk4HEKwXELgXX+YbRzFZ6xemvnnRvKQQRjWqbFiqK96vc+2HXhoRftqGwYtOUJtq+iOyJ4i3DAd3R0SCu6gaL99Pk787sTCLrrlHr02UsxrulT5m92b8ksqecdA5uV/gIQ9UPBrnStMEnhRp1vHlAFfss3R3U4d9F7WNSBbs28vk+H1VjNuSuBXBHH8arnA+jsqt0iyZlluhBxYfXV4LtLquoYyFI02f5dZ7bn6Zv7eInHSvHUjkqQgoDTdCP/KJjUenBSUiuk/f3eqilSJS5TM1QVi+cm+PZ3av64VZJs14I/szAEW1E3pvQ31mvygd7FJj/QaKYjRVaTRWzQwOGa6Z+rZ8S9f9fpwovb++gI2TcYQAEMcd02N5/gc4mqsvYMhGn2Ue22k2EQOeiVamH7hSi0wlKBoUsoBEulka5xjmRYJqApl0mZUf3+iiZXJCTWyIwss9Ug1BcFgY6Ga8kK5SFz9UrHeXiV5dSy2YRjyLvUipvUqk1gXPswrUWJgqyktJVtFiOHZnlnNVdEq61RZ3DdDwBamgsdJwkdN9JViSipJWcCfrtWD7sZFmmzt9KwoLilSxeqCAtJmZX10l5I7itgWvUjqap5STox4Ppg9XTz2sXuKmlrnzVif3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(53546011)(6506007)(71200400001)(6486002)(6512007)(478600001)(83380400001)(186003)(3450700001)(2906002)(2616005)(41300700001)(5660300002)(8936002)(110136005)(54906003)(316002)(36756003)(66556008)(66446008)(64756008)(76116006)(66946007)(66476007)(91956017)(38070700005)(8676002)(38100700002)(82960400001)(4326008)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjFpQTNSOEJ0eEw4dE54bVdsaVVSVFQ3cFRlL28veFAvdWlMNy9IYUdaZm13?=
 =?utf-8?B?SENqLzBVYWpYUGhJTzlNbS9EWFNpejlVRnh1dkN5ajAwNnVKOXZYU1BLTlNP?=
 =?utf-8?B?anMrdkNJRDR1eFZyWEgrbnZPVG0xZkl1WUhYOXFsK1FjL2Z6bXA2UDdsWEVr?=
 =?utf-8?B?WlF0NldDc0lsUVpzRjlJNGovYWMvdGJ0K1NteDcwdjVJd0RIRHM5ci9SamE0?=
 =?utf-8?B?eDRZbGduejlySW1WU0U4VitsTmtibEIzS3RXTzdvVW9LSmo2SlI0QXNnVDhV?=
 =?utf-8?B?Q2hkMDhjWWxTYTFLUDcxMGlFMEkyR1pnYmdIdnBtcUhyTkhRUFFETzVsOC9o?=
 =?utf-8?B?aUx2ZXpsbGZqWGZtWExqMG5kRWNaekFnbjNMZ1VuMy9sWmgrR3h4TTZnRStr?=
 =?utf-8?B?ZXY1RXRQZ1diRnVCeHhPczVOZkM2cmdHT2l0c1NSS0VJcFJ4V29ac3hNYzdG?=
 =?utf-8?B?ZEtWNU5odmNqbjFOYWhaRXk4WUF6YXE5WVBoZzczVVJ2cWNDTVRiSTlLdlBN?=
 =?utf-8?B?MHBFNHdpTnpwTThLOERWOUNxMEE0ZmkwaTh2WGxXS1dSSXplTGNOTjdHc0hk?=
 =?utf-8?B?eE5rMlBQWlZLcVk3Q2Q5SytvdEhFNElFL3ljWHJRMFZuM2VCMVhaMklBYkxa?=
 =?utf-8?B?Nk1MMnNQUTdnNnNWdUZJQ2QwOHNHRTRCUTVCNjJmbzR6U0FLNHdSaVl2YUZn?=
 =?utf-8?B?NWtyOE9nMEt6aUpnc1NvZE00NXI1U0gvSXM0TlBZVzJQaWRZRGhiOHpFaXB1?=
 =?utf-8?B?QUhlRXFTdjFMempFSHNVVlNaQUcvdXE3SWx6NzJPZ1FXZHFxYzc2eXNIcGZt?=
 =?utf-8?B?eHVVeHpHL2FUcFdNL01BQ2lIN1dKVHhtNEZjU05zaHVLelFCUXFmQzgxUk5C?=
 =?utf-8?B?ZWcvd2RvV1hhb0hCdll6Z2x4d2dIVHBFTDloblVXOHB5a0gweitEOU0zdi9o?=
 =?utf-8?B?MTJaNDkxV1duUnArWUttbWlzQWw1YzYvWkRycWlyUGtFNHY3SzZqVWs1ZzFJ?=
 =?utf-8?B?S0g4RUhSckdTbkN3aGM1ODI0RnFSU0hiRHJVSUZZR3hiSWtOK2tpR1Y5Mmxv?=
 =?utf-8?B?Rk5kTnAwVmRWTXFJZGRLd0ZLZktrdlh0NnJTUG9HeDVLT2FtUjFtZmtFNkFs?=
 =?utf-8?B?QXlCN0VZbTloNDE3QTVoc2oxYmNhYXNrSmMzYzUvSy9VMUg0ZGxoNmkydTAw?=
 =?utf-8?B?N005OFZOSjFveGh2S2dYYm5Hbi9Za250NmZDNUJmWm1KMjZBVDJkMXBBdW9E?=
 =?utf-8?B?b21rTUV5cjM1V3JoWUkySmY1dTh2ZDFzS2ljbk1xOTVQQUs2aE9GK3ZyWjdk?=
 =?utf-8?B?TCtSd2FZS3hDT3JieDdVcGlSbDFGaExmdjU2bEdlNEZZU0dmd2I2Qm5iUUwy?=
 =?utf-8?B?VXVDSlFFS0FEdklJRytvZmkwS3pWeWQ3eGQ1Y2haTVFvd0gxMnkxL3BSa2sr?=
 =?utf-8?B?c0owWll5YkJwdWsvMHZMR1h4NzZUcWpwMWw4c0g5MSt1Ry9DS1JMMk5BNTB6?=
 =?utf-8?B?WXhkQ2dzNnNsRTQzOFc0L2FGRExhSjBhZXhkR3IyQ1Z2ZU5DZXhjNlFYSldx?=
 =?utf-8?B?TFJxRlczTGNGcHRBMHNNU3NxTGp6R2hwYzF3S0RRY2RicEtqWFlBM1o1VTha?=
 =?utf-8?B?WkNJMEpNOWdUbFVLQWsza29GZjFjSE9qQXRnWGZiWFlmbUFobi9SMGdnamE2?=
 =?utf-8?B?UEJUanJWTzhQZ2NMRXJQL3c3V2FvNGkyYmNJNWFkWitBbHZic0NVT3JvTm9k?=
 =?utf-8?B?ejg1UE9WZ2tvVWh2M3pWTENHczVHM0R5NlgzMFBVTnBzSHBncmpyZlFLWDd6?=
 =?utf-8?B?S1VSUjd3NVY2YVZnaFVWSlFUSjhWQnlKWWc0ZzFZYWNibk9xTmJENDhqcXNJ?=
 =?utf-8?B?THUyZmJmZkZMZ1dQclZ5Unpkc0ZtTjloNFhuRTR1WEY4ejBnZ1doempIL0M2?=
 =?utf-8?B?Y2hqWDZYaTgvaHE3ZEFEQ0ZRT09rTmpVb2VBcjFhMkVUMGE1TTFxSHN1WUhS?=
 =?utf-8?B?eDZzczFTbzAxTkUrcWFEVFZJcVBrcEkycjllekk2djQzb25CWDFWaVUyM1Rt?=
 =?utf-8?B?eHUwVERPd1ptMmd1U0wxazlFOVdnL0VPWDMyODJNRGQwVmZRQ3ZtUzJ1eWcv?=
 =?utf-8?B?R3QvL3NKbzBiOWpLZmJINDJzUm9YT0duVW41VmZWeTh6WnVrdzZ1T3ZwM3Ru?=
 =?utf-8?B?bWVmREdsZjdJbmRtSGptSnZMQStINUJnVXlxaFJ0VlFxV0ZFZnpiSHFFblFi?=
 =?utf-8?Q?TWZVd9rVyAyT+GL8jY1YdPBf50l95hXS9iRHAJ/SE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEEE4D04942B0B4B9A371A77AB16B963@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df977794-39b1-45cb-5432-08da948d79d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 07:07:38.0848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iCuql31XLgSqbi2rO0/DmVMh0CzR/qM3PcR643ycMrYSCP6uFeJr+9jmVmyrC0dEZZlzazDcAwFI84Nf2W41nAwsHvaFtUzGypQr/SlHRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6963
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gVGh1LCAyMDIyLTA5LTA4IGF0IDE1OjAzICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0K
PiANCj4gT24gMDYvMDkvMjAyMiAxNTo0NywgQi4gTmllZGVybWF5ciB3cm90ZToNCj4gPiBGcm9t
OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tPg0K
PiA+IA0KPiA+IEFkZCBhIG5ldyBkdC1iaW5kaW5nIGZvciB0aGUgd2FpdC1waW4tcG9sYXJpdHkg
cHJvcGVydHkNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxi
ZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tDQo+ID4gPg0KPiA+IC0tLQ0KPiA+ICAuLi4v
YmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbCAgICAgICAgIHwg
Nw0KPiA+ICsrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LQ0KPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0KPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLQ0KPiA+
IGNoaWxkLnlhbWwNCj4gPiBpbmRleCA2ZTM5OTViYjE2MzAuLjdjNzIxMjA2ZjEwYiAxMDA2NDQN
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL3RpLGdwbWMtDQo+ID4gY2hpbGQueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiBjaGls
ZC55YW1sDQo+ID4gQEAgLTIzMCw2ICsyMzAsMTMgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAg
V2FpdC1waW4gdXNlZCBieSBjbGllbnQuIE11c3QgYmUgbGVzcyB0aGFuICJncG1jLG51bS0NCj4g
PiB3YWl0cGlucyIuDQo+ID4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzINCj4gPiAgDQo+ID4gKyAgZ3BtYyx3YWl0LXBpbi1wb2xhcml0eToNCj4gDQo+
IGdwbWMsd2FpdC1waW4tYWN0aXZlLWxvdyA/DQo+IA0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwN
Cj4gPiArICAgICAgV2FpdC1waW4gcG9sYXJpdHkgdXNlZCBieSB0aGUgY2xpZW4uIEl0IHJlbGF0
ZXMgdG8gdGhlIHBpbg0KPiA+IGRlZmluZWQNCj4gPiArICAgICAgd2l0aCAiZ3BtYyx3YWl0LXBp
biIuDQo+IA0KPiBQbGVhc2UgdXBkYXRlIGRlc2NyaXB0aW9uIGFjY29yZGluZ2x5Lg0KPiANCj4g
PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiAN
Cj4gYm9vbGVhbiB0eXBlDQo+IA0KPiA+ICsgICAgZGVmYXVsdDogMA0KPiA+ICsNCj4gPiAgICBn
cG1jLHdhaXQtb24tcmVhZDoNCj4gPiAgICAgIGRlc2NyaXB0aW9uOiBFbmFibGVzIHdhaXQgbW9u
aXRvcmluZyBvbiByZWFkcy4NCj4gPiAgICAgIHR5cGU6IGJvb2xlYW4NCj4gDQo+IGNoZWVycywN
Cj4gLXJvZ2VyDQpTb3JyeSwgDQoNCnRoaXMgcGF0Y2ggd2FzIGFuIGZyYWdtZW50IG9mIHRoZSBv
bGQgcGF0Y2ggc2VyaWVzLCBhbmQgY2FuIGJlIHNraXBwZWQuDQoNCg0KY2hlZXJzLA0KYmVuZWRp
a3QNCg==
