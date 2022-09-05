Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6455AD1CF
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 13:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238215AbiIELsq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 07:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbiIELsp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 07:48:45 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF5427B28;
        Mon,  5 Sep 2022 04:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdnZ+MigyyJWqetlTZQVIlex8Y2dQUncduwvVrhC+ixXqHccJPdN3Kg0HDV6kGVLP4BRrBFYS+Om6xGpQSFH9rCTdehNVXmbFunyHUCZ/LIqiUEF9iTbrCc+fIVRPP4ZMdZssUmlf7Pqs7u//FD39prNzcbRO14uceWbu0FnPA1SBeCtGfi15iGpAmFG3d8vKf4w7sFGxruF5eEFud10yokGUtOiyVn4FAhnO9dYFrc+/Gz4XyCT/TcVRgQLN/RxPQHf2V4CUaiObG2QZJoITioGi6o1LTbcf41pI97FNTicYhcb69G7sLgQ6lqEfFvUpBRVGRA+iqpTgOLpV2Y62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8YE2txWFcizDSxNv7jY2Kbuh/94U3G2JKW4CJYLC24=;
 b=J3h+WXCiR1GzIZJexVL9iJgtj+LNCWyArjbgnTQMrDgtL9IYwdXRXTGf9HDdL9s4j8hC/Z0ehxKlGjTfTOYNpfACKwDShgDRAOwqqjpvXHdT7abVSoS42d7Jwcg/hGwXrSXGPNx8tdqF0Fd31xmolEZr0xKxAUmpYWuaOJQamyo7q7msB7Ws7DWIIF3j8DCh5fAImDDkBLzjnSx45zwqytYT061q/RY0xHCJ0m5IKgOO+odm/7S9TOxeNMbZNO3kiXIdKjOpeuUvmJnipqIXXctQ9meviH+pJj2aFG6iq1bFOsyUSAuyhXJrJ4ERhpF+zoF5iTBjvjxbW4NVXB3uPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8YE2txWFcizDSxNv7jY2Kbuh/94U3G2JKW4CJYLC24=;
 b=Lri3qgv9xAApQsYqSClProHQLoEFBgP0dw4Z5UNT2NvoN0wDgrxrkkzD757pM3zt5qdTFZZF6dWKWiM9T1bXrr4OuQ0Nni2uAI7U0km4btGEIg+UceqkLvmoPCgK/L2UcGa3OLCvfOVcGhZncA6xbEpRcIfQd6BM6sYuzHSSj6WAqwqwz1ZTSoyl8+nDelH9xd/i5Kd0Nu2DUHdearkmAiQ1cMiJ/cUTLtqqXHZ6H42Oqm22GIfKMhzX6uWcJCuXOdQBqoD+J+/SVoZ8Kx3hvXAxVYngDWDZUqpqhreR+XzBT+TGvw+PakFHHYwmSdETxmi4PiTP0wCPXKjVNYZ2yQ==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS2PR10MB6664.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 11:48:42 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf%7]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 11:48:42 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Topic: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Index: AQHYwQVr/FYdP5u1PkWzXBuYLjmi3q3QjdaAgAABwoCAAAlEgIAAH/yA
Date:   Mon, 5 Sep 2022 11:48:42 +0000
Message-ID: <6397b5d11c786ee6194776e096380103976049dd.camel@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
         <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
         <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
         <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
         <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
         <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
In-Reply-To: <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b0bbe67-d025-44e0-7bc7-08da8f3494c7
x-ms-traffictypediagnostic: AS2PR10MB6664:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: prCOlP/VocIehrfXRVOTOCzdbwY/N8QQl8OjPBOJE+HvoW8ND2BZ3OdSKftT1xBL7ai238yKdY0yOiOMOqM4/PsYX90OhAVbD0HKc8OHsGGYWCGrAqzPPOUp8lop00OOgO4NqVlKM4vbYFjoiveIWawQ7vy+ET0ztIZ7iQBz3lkj/xU4RrHhQnrzBjtcZlWJ2j9VVUFITVMbaS6UCCy/4qTQjsdxg/j6pvzKWcMbRejGniriTGhCoog9Wy20LkHIqalVMHMfrtqKgkWwVOrBfVimKU+Fls3dzOVQgsAV3H5TPQlOajiQ6TSWOUF1dmrboMNEwgJRxKKmkt94cWYOf1Pq7lKFsXrWmNRwNcYnSq33nU+uAXSVvsGr3NMUQsG55AsJe3uXYaxQOtT0UynYt2WHYv9VCJ/LUMyBJDw6g0PEtuVO/4lKFlbpDGVY2RTh09U0SGSNzxyOR7O2T1cOGqtyj9Hck+GvP8Y4rGKlI4kbOyfMvSf+vsbtwYZMPJ8luTOK8jC5t0+iuBxPQtN2GY8RvOouXBpyWuPzfBobx/GBmCJkCQufJNpYHX5Os5dsS8CgiObhPqgpWVmFRfl2pnYZYFZ7ho8ZCux1A7upWNqUeniyWfIVmbrcL2wWSLAwI96NNTt77BTAaGq2fzDrUhU4F1rdujhO92zJb6u4zpdmJgFpsiiRvDeV9kiaMGBvbpXmxm/OOh/3M1szcvcVTr+xrixkdcakTtmo288YU+sBxI8XSkwZvWWp2/5SvByN9mm+pOE8najes8PwBnTpGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2616005)(83380400001)(186003)(38100700002)(91956017)(8676002)(66556008)(122000001)(76116006)(66946007)(66476007)(64756008)(66446008)(316002)(4326008)(54906003)(110136005)(6506007)(71200400001)(53546011)(26005)(41300700001)(6486002)(6512007)(3450700001)(82960400001)(478600001)(2906002)(86362001)(38070700005)(5660300002)(36756003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG9pcmRiaGwreDhMUXd5QjNaR2dDM3B1L3RNbFdUN1lNbjFPY0FKNmNGUGFJ?=
 =?utf-8?B?eFd5NTRsMXRoWSs1NTZGTnF4MzI0enIyRWErcjlrNWpSWS9qZ3lBT281elJY?=
 =?utf-8?B?VXJNRFdUbVJxY3gvcDdaQWpDYUN6cHExeXphMFJkRU9wOHRaN3ZZeVlMTi83?=
 =?utf-8?B?ZGZoNmtLdGhIKzJWNHlmb3VDQkdCQXFvbGREdSsrRG9vV0txZjI0NWpwWlJ3?=
 =?utf-8?B?TkxDRkdIK1BvWnlXNjZtTWVjKzdkS0wyZUFMMUQvbkJUUGVYVllDUmRlR2xy?=
 =?utf-8?B?WXRnM2tuWjZ2VWpxS1ZUV2g2UVFtMnk1UWF2K1crZGxOV2ZKWFhCNFE4a20z?=
 =?utf-8?B?L0pzalArUmowYkdUSGduT0NzQ281Mkd3ZS9KU3B6WG9PUTdqTG0zNGF0VGRx?=
 =?utf-8?B?TTEzR2x0S2tadzQ3TlcxODh6VWNyb0FLVDI2WWx3dmV3aEhvTGtQWURGQk1Y?=
 =?utf-8?B?UG4vRitnbDkyWTY3NlJ2cUlWMytSbU1YMlczU1hhN1h5UGh3bEhKNlJBQmZq?=
 =?utf-8?B?QTQwbVh0cDRlV1l3bmI0Y05CVUtZL0pnZnRicmRoOWFPSzZFVWVWY0FiRXV3?=
 =?utf-8?B?UHRvZU4wTXpaVzRubUUrV3ErMGlieXFkb2s2dDBMbUsrSGF0QklFT2pOaUd2?=
 =?utf-8?B?a0FnV0dMaGh3UFBEbkJRZHBIRjF4K09wV3RucUVseTk1c0xwV2FyZjV2YnN4?=
 =?utf-8?B?bVZvZHcyUnIxWEFFdVRwSCtjSzFOaVZXUU56ZGJJNkxqTXhpSFVHdGNBUlRa?=
 =?utf-8?B?U3VhWUhZTlpZb0V0KytrWDhiaEZhYlphV1Y1RC92a2F1VDdtVTdQemMrbkN6?=
 =?utf-8?B?ejlVYkIzZUxBRzZQR1MxZHQ4ZkhTMm1zUWM3MEE5YVRjZzZxbC9XRTZ3WFJh?=
 =?utf-8?B?WDFzck9VM3pBRkJmNTNUTU50WFJWYXFLaDVQcTJ0d0YrQnZvUlhXbnJhcjVU?=
 =?utf-8?B?VTQvVUxtUGFYOWMrenBGeGN1M1pMOEgvMkoxVG1GVzZrNVFTTkg3RnJtbHp0?=
 =?utf-8?B?NXNnS2hYNFNCamNSTTkzUy9SWG9wQ0VCaDE5WHNJY05xYmcwckhBODJ6azZY?=
 =?utf-8?B?QmRoeGhmaXVrOG5MMy9aOEhkUHBrMU5jSzM0c2Y1cVVDS2xYWFhLZW4zeXBT?=
 =?utf-8?B?WmNFaTIydjJjUmhUUXRIdCtGZGw3WTNLTGxqbENneklnUkpJRVI1OWJEWTZL?=
 =?utf-8?B?d1pPV2NSTVJGZHRicDA1L2xHWitIQWhtMDFFL25STFVBKzAvTW1yOVhqVyty?=
 =?utf-8?B?Y0dpYnVmWHl1NlZxMXpwRHBFTmxJZndNN29DK0x6Nk5WWmlCcEVJMkJjOVpv?=
 =?utf-8?B?NzIySUpBSTlDN2l0QmdxckhxOEJYUXRDTWJKYkFRZVZocnBsZllFNlB5Q2pN?=
 =?utf-8?B?RVZjdUYrU0lrcWxMM25XdnUrVVdITUpwemkxYm5UNVFJSE1OeDU1MWozREpP?=
 =?utf-8?B?UEdYNVFpLzNxK1FCdy95aDMrNGZUdmFxcG8wSHo0aWRCU2IrR1NIVTRPcnBE?=
 =?utf-8?B?dDdtZGh4ZWRKcHJybFh3VXd1R3Z3MEZ4b1FJVEpmckZHUFhMR0xTSFBQK0VG?=
 =?utf-8?B?ODhtZkJ6S3dZU3pwRUF2OUMxZUh2d3FqT1oxWTA1SThHRHBnaDVpT1JLZEFC?=
 =?utf-8?B?dndENlFFQjViMlpob1VkRHlTSXF3eEUrS2Z5aU5ZT3lTZnAvaEUvYkg0SUFE?=
 =?utf-8?B?YmJxQTUyandibC93cTVRQnBiYlNpZGNEakowcWJIK1kwaGRsWFRoTDZ3SW1F?=
 =?utf-8?B?bWhpUi95NlQvaG9IejMydnNOUzRmMUpKUXlDTGpmYy9MdCtxbzE2VVk1U1R0?=
 =?utf-8?B?T1I2TEhjL1NzYkFIZFdWcW54bG9NU2lPNmlPTXMvS3Z2Z0lLM3dvSUtBcVNp?=
 =?utf-8?B?bVBoT1hJM0d3UmFFMUZXN2pFeWlTOVNKaWEyWExLZkxiQXBKV3UxSlNobW1a?=
 =?utf-8?B?WkF0bDFFdUUyaGxRSm9ZSnFMU2d3OFMzNlJYbi81R3Avbkk1SUN3OW5iYlZP?=
 =?utf-8?B?N3o4UTByWGo2blN5WVlhSXRTQnJTTk5mblBSdVMzZEo0WGN2M0l0Z1llaEQ5?=
 =?utf-8?B?Z3Z0NkR4eFl5cFltNGN1ZC9hZmxFZFZmYXBOeGhxRjdIZkxsaDY4QS9vUG41?=
 =?utf-8?B?bFZUR0N2OWZ2QnNUTWxVSFNtMEs2eEgyZ01nVzlpblV3dFQrSnJwcklra2Nr?=
 =?utf-8?Q?41MqZNTo9MCz3BZ80NRb59k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA1219C350DDB542AC12D026D4CD16BA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0bbe67-d025-44e0-7bc7-08da8f3494c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 11:48:42.2894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egj6hJnQqmn3j6YFh2oiJdbUdgJ5Mk+tTSagjanDx8QXBnk4ZwM7JcIi6+16V0ksQuQkr29OC8qjb8tRbzPEkgKWwSc5+IV2iRfXWwhQtUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6664
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTA1IGF0IDExOjU0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwNS8wOS8yMDIyIDExOjIxLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+IA0K
PiA+IE9uIDA1LzA5LzIwMjIgMTI6MTQsIE5pZWRlcm1heXIsIEJFTkVESUtUIHdyb3RlOg0KPiA+
ID4gT24gTW9uLCAyMDIyLTA5LTA1IGF0IDExOjU2ICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3Rl
Og0KPiA+ID4gPiBIaSBCZW5lZGlrdCwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIDA1LzA5LzIwMjIg
MTA6MTcsIEIuIE5pZWRlcm1heXIgd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogQmVuZWRpa3QgTmll
ZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbT4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBBZGQgYSBuZXcgZHQtYmluZGluZyBmb3IgdGhlIHdhaXQtcGluLXBvbGFyaXR5IHBy
b3BlcnR5DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuZWRpa3QgTmll
ZGVybWF5ciA8DQo+ID4gPiA+ID4gYmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbQ0KPiA+
ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3Rp
LGdwbWMtY2hpbGQueWFtbCAgICAgICAgIHwgDQo+ID4gPiA+ID4gNw0KPiA+ID4gPiA+ICsrKysr
KysNCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LQ0KPiA+ID4gPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0KPiA+
ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiA+
ID4gPiBjb250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiA+IGNoaWxkLnlhbWwNCj4gPiA+ID4g
PiBpbmRleCA2ZTM5OTViYjE2MzAuLjdjNzIxMjA2ZjEwYiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiA+ID4gPiA+IGNv
bnRyb2xsZXJzL3RpLGdwbWMtDQo+ID4gPiA+ID4gY2hpbGQueWFtbA0KPiA+ID4gPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gPiA+ID4gY29u
dHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+ID4gPiBjaGlsZC55YW1sDQo+ID4gPiA+ID4gQEAgLTIz
MCw2ICsyMzAsMTMgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gPiAgICAgICAgV2FpdC1waW4gdXNl
ZCBieSBjbGllbnQuIE11c3QgYmUgbGVzcyB0aGFuICJncG1jLG51bS0NCj4gPiA+ID4gPiB3YWl0
cGlucyIuDQo+ID4gPiA+ID4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzINCj4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gKyAgZ3BtYyx3YWl0LXBpbi1wb2xh
cml0eToNCj4gPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ID4gKyAgICAgIFdh
aXQtcGluIHBvbGFyaXR5IHVzZWQgYnkgdGhlIGNsaWVuLiBJdCByZWxhdGVzIHRvIHRoZQ0KPiA+
ID4gPiA+IHBpbg0KPiA+ID4gPiA+IGRlZmluZWQNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZCB5b3Ug
bWVhbiAiY2xpZW50PyINCj4gPiA+ID4gQ2FuIHlvdSBwbGVhc2Ugc3BlY2lmeSB3aGF0IHZhbHVl
IGlzIGZvciBBY3RpdmUgTG93IHZzIEFjdGl2ZQ0KPiA+ID4gPiBIaWdoPw0KPiA+ID4gDQo+ID4g
PiBZZXMsIHRoYXQgbWFrZXMgc2Vuc2UuIEFuZCB5ZXMgSSBtZWFudCAiY2xpZW50Ii4gTXkgdHlw
by4uLi4uDQo+ID4gPiA+ID4gKyAgICAgIHdpdGggImdwbWMsd2FpdC1waW4iLg0KPiA+ID4gPiA+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4g
PiA+IA0KPiA+ID4gPiBXaHkgY2FuJ3QgdHlwZSBiZSBib29sZWFuPw0KPiA+ID4gDQo+ID4gPiBP
ZiBjb3Vyc2Ugd2UgY2FuIHVzZSB0aGUgYm9vbGVhbiB0aGVyZS4gSW4gdGhhdCBjYXNlIEkgc2hv
dWxkDQo+ID4gPiBnaXZlIHRoZQ0KPiA+ID4gcHJvcGVydHkgYSBtb3JlIG1lYW5pbmdmdWwgbmFt
ZSBlLmcuIHdhaXQtcGluLWFjdGl2ZS1oaWdoIG9yDQo+ID4gPiB3YWl0LXBpbi0NCj4gPiA+IGFj
dGl2ZS1sb3cuIA0KPiA+ID4gU2luY2UgdGhlIGRlZmF1bHQgYmVoYXZvdXIgb2YgdGhpcyBwaW4g
aXMgQWN0aXZlIEhpZ2gsDQo+ID4gPiBhIGJvb2wgcHJvcGVydHkgImdwbWMsd2FpdC1waW4tYWN0
aXZlLWxvdyIgd291bGQgbWFrZSBtb3JlIHNlbnNlDQo+ID4gPiBmb3INCj4gPiA+IGJhY2t3YXJk
cyBjb21wYXRpYmlsaXR5LiANCj4gPiA+IElmIHRoZSBwcm9wZXJ0eSBpcyBtaXNzaW5nLCB0aGFu
IHRoZSBwb2xhcml0eSBzdGF5cyBvbiBBY3RpdmUNCj4gPiA+IEhpZ2ggbGlrZQ0KPiA+ID4gYmVm
b3JlLg0KPiA+ID4gDQo+ID4gDQo+ID4gT0ssIGluIHRoYXQgY2FzZSB5b3UgZG9uJ3QgaGF2ZSB0
byBjbGFyaWZ5IHRoZSBwb2xhcml0eSBpbg0KPiA+IGRlc2NyaXB0aW9uLg0KPiANCj4gSSBkb24n
dCB1bmRlcnN0YW5kIChhbmQgaXQgaXMgbm90IGV4cGxhaW5lZCBpbiBjb21taXQgbXNnKSwgd2h5
IGRvDQo+IHlvdQ0KPiBuZWVkIHN1Y2ggcHJvcGVydHkgaW5zdGVhZCBvZiB1c2luZyBzdGFuZGFy
ZCBHUElPIGZsYWdzLg0KPiANCj4gVGhlIGRyaXZlciBzaG91bGQgdXNlIHN0YW5kYXJkIEdQSU8g
ZGVzY3JpcHRvciBhbmQgc3RhbmRhcmQgYmluZGluZ3MuDQo+IElmDQo+IGl0IGNhbm5vdCwgdGhp
cyBoYXMgdG8gYmUgZXhwbGFpbmVkLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KSSB0aGluayB0aGlzIGlzIGJlYWNhdXNlIHRoZSBHUE1DIGNvbnRyb2xsZXIgaXRzZWxmIGlz
IG5vdCByZXNwZWN0aW5nDQp0aGUgR1BJTyBmbGFncy4gSW5zdGVhZCB0aGUgR1BNQyBpcyByZWFk
aW5nIHRoZSBMaW5lIExldmVsIGRpcmVjdGx5DQooaGlnaCxsb3cpIGFuZCB0aGVuIGV2YWx1YXRl
cyB0aGUgbG9naWMgZGVwZW5kaW5nIGhvdw0KdGhlIFdBSVQ8eD5QSU5QT0xBUklUWSBiaXQgaXMg
c2V0IGluIHRoZSBHUE1QQ19DT05GSUcgcmVnaXN0ZXIuDQoNClVudGlsIG5vdyBncGlvY2hpcF9y
ZXF1ZXN0X293bl9kZXNjKCkgd2FzIGhhcmRjb3JkZWQNCnRvIEdQSU9fQUNUSVZFX0hJR0guIEFu
IHRoZSBHUE1DX0NPTkZJRyByZWdpc3RlciBjb25maWd1cmF0aW9uIGhhcyBubw0KcmVsYXRpb24g
dG8gdGhlIEdQSU8gc2V0dGluZyAoaW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24pLg0KTXkg
Zmlyc3QgYXBwcm9hY2ggd2FzIHRvIG1ha2UgdGhpcyBwYXJ0IGNvbmZpZ3VyYWJsZSB2aWEgYSBu
ZXcgZGV2aWNlDQp0cmVlIHByb3BlcnR5ICh3YWl0LXBpbi1wb2xhcml0eSkuDQoNCklNSE8gKGNv
cnJlY3QgbWUgaWYgSSdtIHdyb25nKSB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBhbHNvIGRv
ZXMgbm90DQptYWtlIHVlcyBvZiBzdGFuZGFydCBHUElPIGJpbmRpbmdzIGFuZCBkZWZpbmVzIHRo
ZSB3YWl0IHBpbiB2aWEgYQ0Kc2VwYXJhdGUgImdwbWMsd2FpdHBpbiIgYmluZGluZy4NCg0KRS5n
LiBncG1jLHdhdGlwaW4gPSA8MD4gb3IgZ3BtYyx3YWl0cGluPTwxPg0KDQpUaGUgYmVzdCBzb2x1
dGlvbiB3b3VsZCBzaG91bGQgYmUgd2hlbiBzZXR0aW5nIHRoZSBiaW5kaW5nIHRoaXMgd2F5IGZv
cg0KZXhhbXBsZTogZ3BtYyx3YWl0LXBpbiA9IDwmZ3Bpb3ggeSBBQ1RJVkVfWD4NCg0KQnV0IEkg
dGhpbmsgdGhlIGN1cnJlbnQgb21hcC1ncG1jLmMgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgb2Zm
ZXIgc3VjaA0KYSB1c2VjYXNlIGFuZCBhcyByb2dlciBhbHJlYWR5IG1lbnRpb25lZDogDQoiR1BN
QyB3YWl0X3BpbiBwb2xhcml0eSBsb2dpYyBpcyBoYXJkLXdpcmVkIGFuZCBkb2Vzbid0IGRlcGVu
ZCBvbiBHUElPDQpzdWJzeXN0ZW0gZm9yIGl0cyBwb2xhcml0eSINCg0KY2hlZXJzLA0KYmVuZWRp
a3QNCg0KDQo=
