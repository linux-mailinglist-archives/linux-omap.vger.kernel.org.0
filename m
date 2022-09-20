Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD025BE1B1
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 11:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiITJPs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 05:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbiITJPY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 05:15:24 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8CF6C13D;
        Tue, 20 Sep 2022 02:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivjuyFS92Teqy0/R2IVKtP8Rz2U1ETWGLOKjLgn06+60pxHy+SRLRnHB5FJMv84xw5A/dQSnz162Ht33qiXodj8USS88zajgykMkCR8tGyJsyyn3D8aZrfB+75NfDhyYrwbZas4ss0R4NwrpM5osMc+8Fpk6f3kW9EfEwK+z0tBYREShOP5Mhkc5MaZOK3MAw1IuPn+sV+UNHcqlnchLqyA4JVUHmLEhCZ3hGlRvlxgLJPmcyg6Fz+DRPx5zMvVAStfYYuS9Zqu0YLfB5lVgMI4QfPhhZePlXWXAtAQxiPPlvx9pauVPTYDWoQddDfhFBQKnjk1nuZPMtv8X7YSYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60sUx5+foqKMflOqmBFyAApgLZAHB4Htg0iZHS0H5+U=;
 b=DTcAR1ccqbu2JWChmDldQCE3zVemrjVER6EgjaCuaWvwKdOUSXJjQ4EGBQsJs9edk6rfVtssUZ3zIrgvy27Y0UITXFYzr7dvSa5kGU5JiSq8uCRx2q59iO/+OL/PRzQ9ghYiHBnMluvBXZIwyicp/CXSTISS5o/aWiAOwERTAMcAB2CO1c8/MGVuRJetZdxLQKgH2Sdd37P3Q5HTUvcZVMPvpOorwIOKed3MQKXCmIrbQDdx04w6a35vUAMMTCToyTToT/InicOEJEbOtkqDHJ1GGGli1wR8kJ5Yxe/v7eeg4xHjif9d/+W+psCK4//wknZ3dEtwbnFKHOQc9DsVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60sUx5+foqKMflOqmBFyAApgLZAHB4Htg0iZHS0H5+U=;
 b=Fc2FSVpRbGIQ9O50YmBPsxlKbvFUuSGJFiQ7R4xkIW336waZHBSf8aNPWjo2FGwkhf1O25DdxPvMv2vPjUT5xNbeOFAQaBaDVsB3CsqixT/arP4CFTXx0tUAD2aPcXwrW/t0d7XXhct5XdaFBXmZH3ly/PqKrCtXC45K3bhD4OZfQ3n3TrorbSncYAklyMQXLk1BhHWZoYjEQH06x4uDEZyaVXVHCQMD4Xt3cl2VE+xcjxzsFIbxOZx2jH4CYqapB7M00zonHSAs1aZtARhonaEDTyHoY+1MQFmeEJx9rvC87FervcMFc2gh0E1BH3zkS0rjegei2CYUfnYwxQVs8w==
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::15)
 by GVXPR10MB6323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:16::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Tue, 20 Sep
 2022 09:13:17 +0000
Received: from AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79]) by AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5da0:3f4f:28d7:dd79%7]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 09:13:17 +0000
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
Thread-Index: AQHYzAuajWmeLYXeQ0i8d4Z1OtIEx63mvdaAgAEyVgCAABorAA==
Date:   Tue, 20 Sep 2022 09:13:17 +0000
Message-ID: <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
         <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
         <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
         <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
         <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
In-Reply-To: <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5507:EE_|GVXPR10MB6323:EE_
x-ms-office365-filtering-correlation-id: 10c42b65-fab7-46da-8732-08da9ae85aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DHA5ElVIySqOXssY40DX8pF05XsJl2+YA0h3h5N1/Q4fMAjg/Oxvwb6Tc2RhQPitVOFrJnr79WUEWTBhWlTLe8HpvEPUf2O1+y8xUvtw5DVyLuG7g4WHT+Z5vZv2ricEM/X+AGzpdkOrUoxYqjqV/blUrNuA3rZHXpIb6J1LM7sHQD3+FhPrjp289E3L7CvCnkgrMnvPFlphuoq4HYyf8gaSbvXJblA0mW1AA7MTkr2pSoh3AHjGlUfGG+VM8hsCDcqb9iyuw2RbHMkYlLasxrwxumLcguvZQp77ab4mCM8jqxmkChcSesqwzGnrAR2aaRetekvbO4NEiJC1MdE2v7HNb1JmHdGRQ9xrpns6C8C/R5xghqn1V1620+wsAFCkYFLuPtIXPf4ZtmPAvW78GAFSLFiUOnKEQEaFm0ScH52Jc3x7ZduUOzpkJPtN6oIY76tTaK6vh93/03gTV3on1q+zm1IjT1KFvgfgwN31U+exG7pVzvlS4z1tFNtw6m7f3zN/zAbbc7wWpCvNlNwB0IFyr/T98nt/GTFu4IzN8PN4wPtnH3+XyKJY22fd0HFj3oM683QYT6SCGC1Js0OqUVAI/YyroK77Hw6afWzMwmMzluRLkdI8XOfD5Jw1ndJv7mW66VoTBYdi4e5Jf3dLn2hEJ4KBNcFwAp8Puwgowoinqusf7El/n4ZbLBUAwZt3PeJJNdrT6FhlRFD/snQZ7c0fYbHiDeW7aNgm9NHn6ec8xoB+J96L77CrGu6GnVpZIeRb4znAJqa5ZHDx9hMLuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(2906002)(122000001)(3450700001)(38070700005)(8936002)(5660300002)(316002)(8676002)(64756008)(41300700001)(4326008)(66446008)(66946007)(66556008)(66476007)(76116006)(83380400001)(6506007)(6512007)(110136005)(6486002)(2616005)(86362001)(54906003)(478600001)(38100700002)(186003)(71200400001)(82960400001)(36756003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmFZNHRSdVVaWktYdEliaGVkV2liMzBNODNxNThuOWFJWXRxQ1NQckVrWmM0?=
 =?utf-8?B?Q3NPTDZHRW9UR2w3b25wRGl4VTNIUkUrellvOGhiQmJQUlZsWTJRcmZYVkVJ?=
 =?utf-8?B?Z01Cd3hkenlYSEQva1BMUG03QUh5cXRsTWMzK21zRU54a3dkLytoaHpUMnlE?=
 =?utf-8?B?aDcwSDkrTVI0Zks5VWYwaitkQ2ZzTEsycEVnWjlzZmtZcGRrQmY1S1FNOS9E?=
 =?utf-8?B?Z1NtZ1hxQmxyQ0FBM0VLU0NRUFQ3RkVJVjdNMUlOUU0vUUNDUmd1Y1JNSUdV?=
 =?utf-8?B?TjJYeFZBcGZKbHdnR0RjRThwSzJwbU9rM0FoL0UxRjFWaERhUStDL2hXZXpH?=
 =?utf-8?B?NXZVWmRNNVpSYUVWQVRnYVdOMHlrQWE0RnFxRVF1NE1iVk5BNWZ6eE9KcGNo?=
 =?utf-8?B?WG9KL2FZdEZxdURvQmdQUTBia0lBeFFxZ3QzNWlldWpKbjZHWUNIN1ZVcXJG?=
 =?utf-8?B?ZHVpTlJQL0VqeHF4SGtCb0NiSGUyeDF6QVYzS0FKTlR2WE4vSTJlTkxKNFNY?=
 =?utf-8?B?MkNIbWpYR2QwVUR4TmN2Smcxb2I3TnZra3JZVUpkdkdWUmcwc2ZXczl2a2xY?=
 =?utf-8?B?YzAzQ2ZlRmVkT1NBeXpjNmhhRFkwd1lIMi9mTXRDaVZON2pPZXNEL3hHRFY0?=
 =?utf-8?B?SGtkc2hLeHc5SHRybnYyNWNLcjBCWEN1OFF1aVFJenE2c3ByWjJvNTNnNzVt?=
 =?utf-8?B?OGI1Yy9vUk9GTzgwYTlJR3B5TE1HYlJDQndQdDlEeVpEMWdNQ280bzBuNWRE?=
 =?utf-8?B?T091bXFQcWorZEtzQnF2VTlueHlkeXNaUkN5SDUvS2FNVmhvRUNneU5Dbzh0?=
 =?utf-8?B?VlpIR1BFTnRoSnZ1dUxiWWptajd1aGlaN2I2YWY1TUx2TmRISGY3MnR0S2wx?=
 =?utf-8?B?MGZ5MzJ3RFpDdGhTNEpBYlBGaGp5VUFLcWV0MWFlelFZY0UvV0hta1BudTJX?=
 =?utf-8?B?NHBlOWxtVjd6dWZ6bkJObkRlVHRUZ2I5Vk5UNitPSzczSEMvWjBRd25Ldnhz?=
 =?utf-8?B?TCs4VGY4cG5odlE1RkkyalVSWDczd0swd1NVRTExZzhrRFBBdlBFajd3bkor?=
 =?utf-8?B?bFV2eHZmUzk3MWQ4dWVjbFltK2tNUDYvQnljWjliL0ZDSjJtTXBRaTZMckdp?=
 =?utf-8?B?WktzUkJqbDhZR0dJbXdMS2dkOFp1VHI2clo1QitPTFNvdkNLUytGVzNudk51?=
 =?utf-8?B?WXh0YzMxdWZwSTFkT3ZNc0gxWTgyLzh6TFhVTTNyRFBvMUpHaEhKQzZJQ2Rx?=
 =?utf-8?B?ZlpKRHliaDdhN1JpZUdVVkx5UEc0YWVTc0wwWUx4ZDVLa2NyY1FteHE1VVZo?=
 =?utf-8?B?QmFiVU9Od3h1c244cHhBek04eFQ2L0xJQW9FTmFmVk9ybkNYMXd1Rjk4aTlv?=
 =?utf-8?B?bmY3aENZMGExdTFTdmZnMnAyWEJoWXp4MWtJZUpXKzJBRldXcE9NYXJQZldM?=
 =?utf-8?B?Yld6Zk8vMndkRTRHaXZmMXE1TXJWN211OEd5bVZzMUhMdlBhazBHeXZWWW9I?=
 =?utf-8?B?eXc3VTF1Y3lmQUlUVjA4bjRsU2UwbzdlaWZHK3FPblhKSU1ST3B6NzVETUN2?=
 =?utf-8?B?QWo5WVl0UmNZRWJsMll3TnNMTWhMRG9ndXNJWmxZSTVZQXFGRm40Y3RXL0VN?=
 =?utf-8?B?SENwdGh3VE1PZERhc3JzckoxcWxPaHBsZWVjN1d0ZVAydGNtc0VVVGFHeE5U?=
 =?utf-8?B?eE1GZ2Y2eUdSNXVZTzNqVVpBUU9paVVpdnNmb040VnQ1VHNFQllxZ1NTL3lG?=
 =?utf-8?B?VXRnYWpDT3N6OXMyL25oSzdPNjBaTkNHdmN6ekxEWWJkWGRxYTVBNWN4cm9L?=
 =?utf-8?B?Tjk2NWp6dHk2NlZyNmM5QzJsdEJrUU5wYXhSNUxtQlNybklTcXhZNDdJODNI?=
 =?utf-8?B?YS8wYnc0L3EvZExPNkxmdlJJZXdiam8zYXZ3K01URFRpZitOT01IaVNkaDFl?=
 =?utf-8?B?b0JBU2NUWnoreGtOTVhHbnczUkdSZnBYQUZiOUxPUDBWRjZPM2lBTXp2cCtv?=
 =?utf-8?B?bDY0eFE3N1BLd1VPZzhkSmQ0aVJuRnowOEVxRk96dGxIcW8zYmlwc1pCTm5T?=
 =?utf-8?B?VG9vTndyVlFGR014VkxucEhOMG0vcEtZK0ZsL1VwcGV6VDlYVnpyeGcrak9P?=
 =?utf-8?B?dFh1elNaRE9ZN0dXbUgwYzF3ZWZSdDlvRVFTU25uY0lvVi9RWk1ScS9uZUNL?=
 =?utf-8?B?anIzeTFuKzB4TnRMaFJsZmFMYUFvK3A3eU9RTndWcFY0NWlRV2JZdFE1Yzdr?=
 =?utf-8?Q?TEs0DpeHnw2HqRkauWB95A78Yz1ebk0bSKaKqdu+Y8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F4BA69F11343B4CB2353E0B12FB9BC7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5507.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c42b65-fab7-46da-8732-08da9ae85aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 09:13:17.0224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoTWZxKNbhz+h+Z5gNLA+4bxKRBgZnGk30M1LwSkMD5K1xfpLkBkvgcDepBq5x2qistmh67zm5eexfjmOYixQDWkii0VUBSHWjOPl2bWqk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB6323
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjItMDktMjAgYXQgMDk6MzkgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE5LzA5LzIwMjIgMTU6MjUsIE5pZWRlcm1heXIs
IEJFTkVESUtUIHdyb3RlOg0KPiA+IEhpIEtyenlzenRvZiwNCj4gPiANCj4gPiBPbiBNb24sIDIw
MjItMDktMTkgYXQgMTE6MzggKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4g
PiBPbiAxNi8wOS8yMDIyIDE0OjA3LCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+ID4gPiBGcm9t
OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tPg0K
PiA+ID4gPiANCj4gPiA+ID4gVGhlIHdhaXRwaW4gcG9sYXJpdHkgY2FuIGJlIGNvbmZpZ3VyZWQg
dmlhIHRoZSBXQUlUUElOPFg+UE9MQVJJVFkgYml0cw0KPiA+ID4gPiBpbiB0aGUgR1BNQ19DT05G
SUcgcmVnaXN0ZXIuIFRoaXMgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgYnkgdGhlDQo+ID4g
PiA+IGRyaXZlci4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHNldHRpbmcgdGhlIHJlcXVp
cmVkIHJlZ2lzdGVyIGJpdHMNCj4gPiA+ID4gd2l0aCB0aGUgImdwbWMsd2FpdC1waW4tcG9sYXJp
dHkiIGR0LXByb3BlcnR5Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuZWRp
a3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbT4NCj4gPiA+ID4g
LS0tDQo+ID4gPiA+ICBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyAgICAgICAgICAgICAgfCAy
NyArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RhdGEvZ3BtYy1vbWFwLmggfCAgNiArKysrKysNCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVtb3J5L29tYXAtZ3BtYy5jIGIvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMNCj4gPiA+
ID4gaW5kZXggZWE0OTVlOTM3NjZiLi4yODUzZmMyOGJjY2MgMTAwNjQ0DQo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVtb3J5
L29tYXAtZ3BtYy5jDQo+ID4gPiA+IEBAIC0xMzIsNiArMTMyLDcgQEANCj4gPiA+ID4gICNkZWZp
bmUgR1BNQ19DT05GSUdfREVWX1NJWkUJMHgwMDAwMDAwMg0KPiA+ID4gPiAgI2RlZmluZSBHUE1D
X0NPTkZJR19ERVZfVFlQRQkweDAwMDAwMDAzDQo+ID4gPiA+ICANCj4gPiA+ID4gKyNkZWZpbmUg
R1BNQ19DT05GSUdfV0FJVFBJTlBPTEFSSVRZKHBpbikJKEJJVChwaW4pIDw8IDgpDQo+ID4gPiA+
ICAjZGVmaW5lIEdQTUNfQ09ORklHMV9XUkFQQlVSU1RfU1VQUCAgICAgKDEgPDwgMzEpDQo+ID4g
PiA+ICAjZGVmaW5lIEdQTUNfQ09ORklHMV9SRUFETVVMVElQTEVfU1VQUCAgKDEgPDwgMzApDQo+
ID4gPiA+ICAjZGVmaW5lIEdQTUNfQ09ORklHMV9SRUFEVFlQRV9BU1lOQyAgICAgKDAgPDwgMjkp
DQo+ID4gPiA+IEBAIC0xODgyLDYgKzE4ODMsMTcgQEAgaW50IGdwbWNfY3NfcHJvZ3JhbV9zZXR0
aW5ncyhpbnQgY3MsIHN0cnVjdCBncG1jX3NldHRpbmdzICpwKQ0KPiA+ID4gPiAgDQo+ID4gPiA+
ICAJZ3BtY19jc193cml0ZV9yZWcoY3MsIEdQTUNfQ1NfQ09ORklHMSwgY29uZmlnMSk7DQo+ID4g
PiA+ICANCj4gPiA+ID4gKwlpZiAocC0+d2FpdF9waW5fcG9sYXJpdHkgIT0gV0FJVFBJTlBPTEFS
SVRZX0RFRkFVTFQpIHsNCj4gPiA+ID4gKwkJY29uZmlnMSA9IGdwbWNfcmVhZF9yZWcoR1BNQ19D
T05GSUcpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCWlmIChwLT53YWl0X3Bpbl9wb2xhcml0eSA9
PSBXQUlUUElOUE9MQVJJVFlfQUNUSVZFX0xPVykNCj4gPiA+ID4gKwkJCWNvbmZpZzEgJj0gfkdQ
TUNfQ09ORklHX1dBSVRQSU5QT0xBUklUWShwLT53YWl0X3Bpbik7DQo+ID4gPiA+ICsJCWVsc2Ug
aWYgKHAtPndhaXRfcGluX3BvbGFyaXR5ID09IFdBSVRQSU5QT0xBUklUWV9BQ1RJVkVfSElHSCkN
Cj4gPiA+ID4gKwkJCWNvbmZpZzEgfD0gR1BNQ19DT05GSUdfV0FJVFBJTlBPTEFSSVRZKHAtPndh
aXRfcGluKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQlncG1jX3dyaXRlX3JlZyhHUE1DX0NPTkZJ
RywgY29uZmlnMSk7DQo+ID4gPiANCj4gPiA+IFdoYXQgaGFwcGVucyBpZiB3YWl0IHBpbiBpcyBz
aGFyZWQgYW5kIHlvdSBoYXZlIGRpZmZlcmVudCBwb2xhcml0aWVzIGluDQo+ID4gPiBib3RoIG9m
IGRldmljZXM/DQo+ID4gSW4gdGhpcyBjYXNlIHRoZSBzZWNvbmQgb25lIHdpbnMgYW5kIHdpbGwg
b3ZlcndyaXRlIHRoZSBwb2xhcml0eSBvZiB0aGUgZmlyc3Qgb25lLg0KPiA+IEJ1dCB0aGF0IHdv
dWxkIGJlIHRoZSByZXN1bHQgb2YgYSBtaXNjb25maWd1cmF0aW9uIGluIHRoZSBEVC4NCj4gDQo+
IEluIG1hbnkgY2FzZXMgZHJpdmVycyBkbyBub3QgYWNjZXB0IGJsaW5kbHkgYSBEVCwgYnV0IHBl
cmZvcm0gc29tZSBiYXNpYw0KPiBzYW5pdHkgb24gaXQsIGVzcGVjaWFsbHkgaWYgbWlzdGFrZSBp
cyBlYXN5IHRvIG1ha2UgKGUuZy4gd2l0aA0KPiBvdmVybGF5cykuIFN1Y2ggZGVzaWduIG9mIERU
IGlzIGp1c3QgZnJhZ2lsZS4gU2NoZW1hIGNhbm5vdCB2YWxpZGF0ZSBpdCwNCj4gZHJpdmVyIGRv
ZXMgbm90IGNhcmUsIG1pc3Rha2UgaXMgcXVpdGUgcG9zc2libGUuDQoNCk9rLCB0aGF0IG1ha2Vz
IHNlbnNlLiBJJ20gZ29pbmcgdG8gaW1wbGVtZW50IHRoaXMgaW4gdjYuDQo+IA0KPiA+IEknbSBu
b3Qgc3VyZSBob3cgdG8gcHJvY2VlZCBoZXJlPyBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gYWRkIGEg
Y2hlY2sgZm9yIGRpZmZlcmVudCANCj4gPiB3YWl0cGluIHBvbGFyaXRpZXM/DQo+IA0KPiBJIGRv
bid0IGtub3cuIEkgd291bGQganVzdCBkaXNhbGxvdyBzdWNoIHNoYXJpbmcgZW50aXJlbHkgb3Ig
ZGlzYWxsb3cNCj4gc2hhcmluZyBpZiBEVCBpcyBtaXNjb25maWd1cmVkLg0KPiANCj4gDQo+ID4g
DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICAJcmV0dXJuIDA7DQo+ID4gPiA+ICB9
DQo+ID4gPiA+ICANCj4gPiA+ID4gQEAgLTE5ODEsNyArMTk5MywyMiBAQCB2b2lkIGdwbWNfcmVh
ZF9zZXR0aW5nc19kdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QgZ3BtY19zZXR0aW5n
cyAqcCkNCj4gPiA+ID4gIAkJCQlfX2Z1bmNfXyk7DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAgDQo+
ID4gPiA+ICsJcC0+d2FpdF9waW5fcG9sYXJpdHkgPSBXQUlUUElOUE9MQVJJVFlfREVGQVVMVDsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiAgCWlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJncG1j
LHdhaXQtcGluIiwgJnAtPndhaXRfcGluKSkgew0KPiA+ID4gPiArCQlpZiAoIW9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAiZ3BtYyx3YWl0LXBpbi1wb2xhcml0eSIsDQo+ID4gPiA+ICsJCQkJCSAg
JnAtPndhaXRfcGluX3BvbGFyaXR5KSkgew0KPiA+ID4gPiArCQkJaWYgKHAtPndhaXRfcGluX3Bv
bGFyaXR5ICE9IFdBSVRQSU5QT0xBUklUWV9BQ1RJVkVfSElHSCAmJg0KPiA+ID4gPiArCQkJICAg
IHAtPndhaXRfcGluX3BvbGFyaXR5ICE9IFdBSVRQSU5QT0xBUklUWV9BQ1RJVkVfTE9XICYmDQo+
ID4gPiA+ICsJCQkgICAgcC0+d2FpdF9waW5fcG9sYXJpdHkgIT0gV0FJVFBJTlBPTEFSSVRZX0RF
RkFVTFQpIHsNCj4gPiA+IA0KPiA+ID4gV0FJVFBJTlBPTEFSSVRZX0RFRkFVTFQgaXMgbm90IGFs
bG93ZWQgaW4gRFQsIHNvIHlvdSBjYW4gc2tpcCBpdC4NCj4gPiBUaGlzIHZhbHVlIGlzIG5vdCBh
c3NpZ25lZCBmcm9tIHRoZSBEVC4gSXQgaXMgb25seSBhc3NpZ25lZCB3aXRoaW4gdGhlIEdQTUMg
YW5kIHNlcnZlcyBhcyBhIGluaXQNCj4gPiB2YWx1ZSAocmlnaHQgYmVmb3JlIHRoZSBpZiBjbGF1
c2UpLiBUaGlzIGhlbHBzIGluIGNhc2Ugbm8gY29uZmlndXJhdGlvbiBmcm9tIERUIGlzIGRvbmUg
d2hlcmUgdGhlIA0KPiA+IEdQTUMgcmVnaXN0ZXJzIHNob3VsZCBzdGF5IHVudG91Y2hlZC4NCj4g
DQo+IEkgZG9uJ3Qgc2VlIGl0LiBZb3VyIGNvZGUgaXM6DQo+IA0KPiBwLT53YWl0X3Bpbl9wb2xh
cml0eSA9IFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUOw0KPiAjIGFuZCBEVCBoYXMgV0FJVFBJTlBP
TEFSSVRZX0RFRkFVTFQNCj4gaWYgKC4uLi4pIHsNCj4gICBwcl9lcnINCj4gICBwLT53YWl0X3Bp
bl9wb2xhcml0eSA9IFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUOw0KPiB9IGVsc2Ugew0KPiAgIHBy
X2Vycg0KPiB9DQo+IA0KTWF5YmUgSSBkb250J3QgZ2V0IHdoYXQgeW91IG1lYW4gd2l0aCBEVCBp
biB0aGlzIGNvbnRleHQuDQoNCldoYXQgSSBtZWFudCBpcyB0aGF0IHRoZSB2YWx1ZSBXQUlUUElO
UE9MQVJJVFlfREVGQVVMVCBpcyBub3QgZGlyZWN0bHkgZXh0cmFjdGVkIGZyb20gdGhlIERUIGJ1
dCBpcyBhc3NpZ25lZCBpbiBjYXNlDQoiZ3BtYyx3YWl0LXBpbi1wb2xhcml0eSIgaXMgbm90IHNl
dCBvciBoYXMgYW4gaW52YWxpZCB2YWx1ZS4gSW4gYW55IGNhc2UgdGhlIHAtPndhaXRfcGluX3Bv
bGFyaXR5IHNob3VsZCBoYXZlDQphdCBsZWFzdCB0aGUgaW5pdCB2YWx1ZSBhc3NpZ25lZCBzbyB3
ZSBjYW4gbWFrZSBwcm9wZXIgZGVjaXNpb25zIGluIGdwbWNfY3NfcHJvZ3JhbV9zZXR0aW5ncygp
Lg0KDQpNYXliZSBJIG5lZWQgc29tZSBjbGFyaWZpY2F0aW9uIHdoYXQgZXhhdGx5IGlzIGZvcmJp
ZGRlbiBoZXJlLg0KDQoNCj4gc28gaG93IHRoaXMgaGVscHMgaW4gY2FzZSBubyBjb25maWd1cmF0
aW9uIGZyb20gRFQgaXMgZG9uZT8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQpD
aGVlcnMsDQpiZW5lZGlrdA0KDQo=
