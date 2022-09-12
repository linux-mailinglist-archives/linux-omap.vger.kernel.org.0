Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE41D5B557A
	for <lists+linux-omap@lfdr.de>; Mon, 12 Sep 2022 09:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiILHnx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Sep 2022 03:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiILHns (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Sep 2022 03:43:48 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F79924F1D;
        Mon, 12 Sep 2022 00:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f90njbGzNnzsv6F6OscFrRlaF2on6D9qCbnfpooETLQaqT+28f3W8yLIUVxri7etZ72YSFDvscOHneoFI0H5UydE6mJBWTFGt/2gkaSyVNGP7HWPtgb2bleXUXhUOWVx1lzz/BhSVypKwkU39drk6+Z2mt7qQrB8iIzenmjTi6MjMzOBisPg8DTE8HjUGc8Dx8XjwQX3FniB6gDdxoFxmea4wA8se7gW53xi7VPAo+v+9BIQYXUwKQp9/5LqjZnN2Ypr9dfg5GNT6yD8jtpsqH1jvmLwhT5cFJ2YmhCgbGDsy7K+ogdhEQAJVk3XEoD/L8X7AsjEDgnf2zi7KP+9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uN9H3IJJguBzaUEb+7JZgb41NJgQFMcWpZ7OAmtsyw=;
 b=bwavL6S+xEvs98AfO3ZuBqmX3VcsQEOVKFPd5vmzS9Zx8EBfR8OKh42erivwttRuG75lef3IjOV+wfEVD3LonHAen5MMvfQ9fjciToQ1kMgYmK+tpJQ2YJfI/xRKvxHsEjUs3Y35TeLg7QJHVRF3ae8KbviFGK4n7p7eUGhynOOQhjh+AyXIhF95QaxVhz05b5qsfWEaNDEooxcP2meRVB0mDDkQL4pohRtEETG4CBbNqsbsMa4vePlOQPvS+850OEdDpZrIhAwU7zbzS28u+fNh3V649mmVetGHAN5GJShp9o+KHwoF6Nlh4BsQlLYyljrfj4Os10x02bZS00Tn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uN9H3IJJguBzaUEb+7JZgb41NJgQFMcWpZ7OAmtsyw=;
 b=odK//xBqvfcpQNYegjcOXHKiGppuAGdcPPWc4GGc8AEMIoE5fPzUXsoWF3+jULwJ7SldO0v8RXBT/tse19RQ5IZGtNTnQvemb+O8bCWaI7w8BpaFXkdwl27US+dq8Bxrne32dASCsitVoasCRvJj6wjb7ejUuJxz7IFARjQc9mGxpKb8PPFbnApxUO+HVWbMZesGqV5/+EA9mjqKv5fP4y031h6c68dQrLUAqZOKk4VdsvUBdJi7YW1aCpLsJblgUzDsR5XHBGfcgQcbQhdY3EvK7QM6xbGevP5Y6rpwGM5Rd4tslnA0RkuOr1a951sjN/oeA3jRVFNXLi+IuJXWiw==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS2PR10MB6685.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 07:43:44 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::82e:2625:1aca:610d]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::82e:2625:1aca:610d%4]) with mapi id 15.20.5612.020; Mon, 12 Sep 2022
 07:43:44 +0000
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
Thread-Index: AQHYw3vS4gPjEC/lYk+8/tN5HBvt7q3bb7kA
Date:   Mon, 12 Sep 2022 07:43:44 +0000
Message-ID: <125ea34a12928fcdd8ef118eced8b2c59039d2ab.camel@siemens.com>
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
         <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
         <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
In-Reply-To: <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS2PR10MB6685:EE_
x-ms-office365-filtering-correlation-id: fa560465-b881-42ba-3df9-08da949284f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s6yY7idEnVJwuH10H8oo7Dw47LqNMEUcnPaMmrjWiVY3ltE4o2RiTPbjCdmsIJBuKSZTUYTp0n04EKJWinD+9c43d91hlCR97yTtTbhhjlrU+ouczGxXuNKoJBbxpj9x73AEOZrVImrQBMkIEQLplBGAcTrovV5r/FiR0TnEp1vSSH5saRDJsQ1dXv2M1EPRC7kFWwJ1fXpWNj/JAD2P4/fzl5NmZzy4eajk6WaxUAICwUVz17ujOW5aHqEVySFVsUYhxFskvqH2cW8BMhx+9wQmCf3I6HBCK0NkJqcrGG1+zctwBgnWjfYQ1kIuGuL7kHnhNMsW/cn4fQrEEYK253GC6aadNyKf6g+TdR+hbh9sKhqPi1szmbwrEU8bWY2KPerd+7804n1YBzAbxF5ODNiOvR7JZCc718kWAASkPUOlXm+8mDOCYZSp9zuhNqxQ05OTaO6SjSFyADLLomwqh+6IDgtW75xMBhhIQ0vPN9sG7Rp5Sk/wSSNP7aJcpJv1WaN0GiSf0xQk+vOFH2fzYS1jJm4ZlR9KHSGrPgRIV99xzkgp4vPaDKXK8OvHMMK/o7uLuQISdpS6241VntuqoEnEG1oNt7xqNSC1ZkrfW03TQuJVBcZP2WyV0rroxxModH9OtJ66gEPS+772GHdZaC5QtY+eDckDJpuD9bS16shT+3M0tjzMrfuWGKwMNUgZMr6TOP+vwC61ruRo/o+YK5T5MkAQ/uX9dCUNTiGRGeQSOuGpm+K9qlW7/ImJSMHEZ/joVpoZGXJGNfbMWQSh4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(122000001)(8676002)(38100700002)(82960400001)(8936002)(66446008)(64756008)(91956017)(4326008)(76116006)(66946007)(66556008)(66476007)(36756003)(86362001)(38070700005)(2616005)(53546011)(41300700001)(26005)(71200400001)(6512007)(6506007)(478600001)(54906003)(110136005)(316002)(2906002)(3450700001)(186003)(6486002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm1rYitMdDB4eEtTMmRTaGg0ejhvUmhkd1R1ZWxad1JGZDJZK1NOblFMR29K?=
 =?utf-8?B?YlRrdXIvZ0kvOVFGRDlPRUV2UjZYVytpbGZQSEt6KzlzMXJjdFMwTmo5SUF1?=
 =?utf-8?B?VThvTVVBaTVBVGQ5VHFRa2w3UkpuMktLMlhJbVZDQzlxVUt3NFA4UDBTZFN3?=
 =?utf-8?B?T1NPUlRVSEZ1NCt1YjNSN1ZZUHZjcFpPV2hEUktIUTRCb21qOHNQR3Q0QmdJ?=
 =?utf-8?B?Vyt1a0RRSkMyZGlIVHJDY0lLTW9IUGlFSjlrYTVsSE1seFp6dVdTZkN1K3Jp?=
 =?utf-8?B?Y3JVa0F0d1VDWndjb2QvOXFMV2pibzNnY1crSmdEY2U2cDd2SWk2cmlLTCtz?=
 =?utf-8?B?TDhGd3pkZUI2Vm5EQVE0TFdHbDRJK0xwazc1TU1JbVlBV1JtanpiRkk1S3hS?=
 =?utf-8?B?U1hwKzA0NGFRWkZSbUVxbElFR29zWTdIRWswb0NtaGY0ZzZwckJwaCtRU2ow?=
 =?utf-8?B?WWpqaVZGNE1mMXk5N2tJai9GVXdJY1Q1ZzFRcVprNEt3ZU9aRWxVTm9oSnp2?=
 =?utf-8?B?c3p1QkVNa1BsekNTRkVGVGRmYnJUM2t5cWtoOFczSzVvRnRpbTVFck9ERWJ4?=
 =?utf-8?B?TGQ2SHJIQjlNNXhZemh1WXhHNmJFOENEZDlyWXhEUVRNU3puSnFZS1Z4bUVO?=
 =?utf-8?B?dC9YNUZBSmJ1SU1oWDFBUkJTZFFxRVNpRllpSVJWQXl3ekNrU0xRSnUrb2RR?=
 =?utf-8?B?Q0YrTmQySTYzQ0Zsek1TTVlYTmFMNHZpVGkyamw3VnRUTGZCYnkxQ3hDanVZ?=
 =?utf-8?B?LzJyZmRESy9TM0V2VHFIZ1dodytmcWk1Z2FZRkR4TlFlVUpvOG5nY1FXTFkr?=
 =?utf-8?B?VWIwdUNON29OZmFYSDI3cHFiVlNrOUptZmhsMDhJdjFUZ1pXUm5tTUViS3l5?=
 =?utf-8?B?ZDZ1QkNScS92MjljeG5BS0tIUStrYnhncTJQSDZteWM1cXNtZFdJMEZ2Wm43?=
 =?utf-8?B?M25ab240YXNNYVNqR1h5RW0vNUExTnJ5ZjFweVJlYXRheHdBeDBNd05jNnEz?=
 =?utf-8?B?R1BaaE9QZUUxRG56L25XN0l2cU1HRWZCQ3o1c05kSDVIZ3RFdjRsRGRyM1NQ?=
 =?utf-8?B?Y1o1VEtLc2VJNGNWak03dzJJMUw5a1Y1aWxRWTIweTZHeDF4bGlFR2RGK2xC?=
 =?utf-8?B?cm44dTdkNUVUQUllTVFHUmlmTHVCNG43SWZrQ2pMTHFhQ3pKbnVYdERFeFFK?=
 =?utf-8?B?SlFNbHBZSnRtUi8zOXoybHpYTXpIMDRacnRVVnZCT2lZdE5MN0xobFBKMDBM?=
 =?utf-8?B?WVJQd01BUjZxNTg4R1FPQk5kS3dvZW0xbWNZbTFtbE5FUXlRNC82MFFtdzly?=
 =?utf-8?B?T2p3czdRTjZjNE8xcng2ZEF5aDNiUC9GZDZ6bUZlc1NxU3dQK1VvZlM5U05j?=
 =?utf-8?B?ZzY1a25HTDZhcnBHQjZZRTJ1eS96RzEvVW5jMm9ZVDl4VWxXZmNacG9ncUNz?=
 =?utf-8?B?aHFzNUtnZjUzaXBkWTJVaHRnK3JLSXk3TUR5SW96K1V4S1pSbkFlL0Zpd1c1?=
 =?utf-8?B?bjNtK25PcGJTNndScGw5K0crd3hlKzFuc05RaHdCSi92SnpNblZUZkk1blBN?=
 =?utf-8?B?bHlmcGJqU3hJZXFQc2pJVGpWM0xHbzZ0bUE1cHU3cEQ1bGhhb1JPWnE1cUdX?=
 =?utf-8?B?WTJpM01yMUlWZFFqVTJESDA4SEJ1RGxjZmN3eVpTNHdYeUNjbmNRQ0JCWnFq?=
 =?utf-8?B?UzYrMm9qNUpSV0FIcjVDQXhHY0UxUUcxMjZ3SWFMM1BoOHVvZS8zWjh6ODAr?=
 =?utf-8?B?all5MWh0RXAyT0UzOEdncGErNWJ0MHppbVlrWVdabk1jQTg1dm5ha1Mwb3hP?=
 =?utf-8?B?eS82c3BmNEtVTVNmUmZIK2t4cWNsdG9KWDFHdk5za2VRUVZ4Q1BkSW9tR2cw?=
 =?utf-8?B?K28rd0Y0emxuckhiNWs5akc2UnVtd1k4cmtpMGJMeFZ4NUFsVzJPMmpUSGZa?=
 =?utf-8?B?b1VoYUdQeTVnakNYKzZmT1c5b3lSWFU4Mk01TlBJdjh0azJzMkVuckxrbnlH?=
 =?utf-8?B?RUpjc0J4c3FhMVFZV1Z2UEx1TUtyY004UjliRUlmNHFITEx6MVJvOC9zb1Nv?=
 =?utf-8?B?VUw4cVAySFhxcThDQWlBdVRCSFVja2J0SE9sUDZpK1R1andCdWxCYW04emdX?=
 =?utf-8?B?SnRHRVBTMHR4d1Y4bEpXMzA3cDNTU2RUc2ppSmdubWxlYnc0dTJaalNGQjhJ?=
 =?utf-8?Q?BXZBdBpijNThCFe/J949lYo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0BEE4ECCDEAA74B8635294648029C6F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa560465-b881-42ba-3df9-08da949284f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 07:43:44.2941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPOI6B9EG1tdgOE7z/U7G0/pxR0SF3Qi6JloW5QGneZq1zX6hrSrScVqWG+oIcNVDvcy2uIhIRhrJk1ZtNyja8v5kV9n5LAbE5WLHPwdfpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6685
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gVGh1LCAyMDIyLTA5LTA4IGF0IDE1OjA5ICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0K
PiBCZW5lZGlrdCwNCj4gDQo+IA0KPiBPbiAwNi8wOS8yMDIyIDE1OjQ3LCBCLiBOaWVkZXJtYXly
IHdyb3RlOg0KPiA+IEZyb206IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1h
eXJAc2llbWVucy5jb20+DQo+ID4gDQo+ID4gVGhlIEdQTUMgY29udHJvbGxlciBoYXMgdGhlIGFi
aWxpdHkgdG8gY29uZmlndXJlIHRoZSBwb2xhcml0eSBmb3INCj4gPiB0aGUNCj4gPiB3YWl0IHBp
bi4gVGhlIGN1cnJlbnQgcHJvcGVydGllcyBkbyBub3QgYWxsb3cgdGhpcyBjb25maWd1cmF0aW9u
Lg0KPiA+IFRoaXMgYmluZGluZyBkaXJlY3RseSBjb25maWd1cmVzIHRoZSBXQUlUUElOPFg+UE9M
QVJJVFkgYml0DQo+ID4gaW4gdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2ll
bWVucy5jb20NCj4gPiA+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sICAgICAgICAgIHwgNg0KPiA+ICsrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMv
dGksZ3BtYy1jaGlsZC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMtDQo+ID4gY2hpbGQueWFtbA0KPiA+IGluZGV4
IDZlMzk5NWJiMTYzMC4uYTExNWI1NDRhNDA3IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiBj
aGlsZC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy90aSxncG1jLQ0KPiA+IGNoaWxkLnlhbWwNCj4gPiBAQCAtMjMwLDYg
KzIzMCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICBXYWl0LXBpbiB1c2VkIGJ5IGNsaWVu
dC4gTXVzdCBiZSBsZXNzIHRoYW4gImdwbWMsbnVtLQ0KPiA+IHdhaXRwaW5zIi4NCj4gPiAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICANCj4g
PiArICBncG1jLHdhaXQtcGluLWFjdGl2ZS1sb3c6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+ICsgICAgICBTZXQgdGhlIHBvbGFyaXR5IGZvciB0aGUgc2VsZWN0ZWQgd2FpdCBwaW4gdG8g
YWN0aXZlIGxvdy4NCj4gPiArICAgICAgRGVmYXVsdHMgdG8gYWN0aXZlIGhpZ2ggaWYgdGhpcyBp
cyBub3Qgc2V0Lg0KPiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+ICsNCj4gDQo+IEkganVzdCBj
aGVja2VkIHRoYXQgdGhlIGRlZmF1bHQgYmVoYXZpb3VyIGlzIGFjdGl2ZSBsb3cuDQo+IFJlc2V0
IHZhbHVlIG9mIHRoZSBwb2xhcml0eSByZWdpc3RlciBmaWVsZCBpcyAwLCB3aGljaCBtZWFucyBh
Y3RpdmUNCj4gbG93Lg0KPiANCj4gV2Ugd2lsbCBuZWVkIHRvIHVzZSB0aGUgcHJvcGVydHkgImdw
bWMsd2FpdC1waW4tYWN0aXZlLWhpZ2giIGluc3RlYWQuDQo+IA0KPiBTb3JyeSBmb3Igbm90IGNh
dGNoaW5nIHRoaXMgZWFybGllci4NCg0KSXQncyBvay4gTm8gd29ycmllcy4NCg0KV2VsbCwgdGhl
IERhdGFzaGVldHMgYXJlIHRlbGxpbmcgbWUgZGlmZmVyZW50IHJlc2V0IHZhbHVlcyBoZXJlLiAN
ClRoZSBhbTMzNXggVFJNIChSZXYuIFEpIGRlZmluZXMgdGhlIHJlc2V0IHZhbHVlIG9mIFdBSVQx
UElOUE9MQVJJVFkgYXMNCjB4MCwgd2hlcmVhcyB0aGUgYW02NHggVFJNIChSZXYuIEMpIGRlZmlu
ZXMgdGhlIHJlc2V0IHZhbHVlIG9mIFdBSVQxUElODQpQT0xBUklUWSBhcyAweDEuIFRoZSBhbTY0
eCBUUk0gYWxzbyBkZWZpbmVzIGRpZmZlcmVudCByZXNldCB2YWx1ZXMgZm9yIA0KV0FJVDBQSU5Q
T0xBUklUWSBhbmQgV0FJVDFQSU5QT0xBUklUWS4NCg0KVGhlIGludGVyZXN0aW5nIHRoaW5nIGlz
IHRoYXQgSSdtIGN1cnJlbnRseSB3b3JraW5nIG9uIGFuIGFtMzM1eA0KcGxhdGZvcm0gYW5kIEkg
ZHVtcGVkIHRoZSBHUE1DX0NPTkZJRyByZWdpc3RlciBhbmQgZ290IDB4MDAwMDBhMDANCihXQUlU
MVBJTlBPTEFSSVRZID09IDB4MSkuIFNvIEl0IGRvZXNuJ3QgYmVoYXZlIGxpa2UgdGhlIFRSTSBz
cGVjaWZpZXMuDQoNCg0KTmV2ZXJ0aGVsZXNzLCBJJ20gc2V0dGluZyB0aGUgV0FJVFhQSU5QT0xB
UklUWSBiaXRzIGluIGJvdGggY2FzZXMNCmFjY29yZGluZ2x5LiAgDQoweDAgaW4gY2FzZSAiZ3Bt
Yyx3YWl0LXBpbi1hY3RpdmUtbG93IiBpcyBzZXQgYW5kIDB4MSBpbiBjYXNlDQoiZ3BtYyx3YWl0
LXBpbi1hY3RpdmUtbG93IiBpcyBub3Qgc2V0LiBTbyB0aGUgcmVzZXQgdmFsdWUgaXMgYWx3YXlz
DQpvdmVyd3JpdHRlbi4NCg0KDQpVc2luZyAiZ3BtYyx3YWl0LXBpbi1hY3RpdmUtaGlnaCIgcmF0
aGVyIHRoYW4gImdwbWMsd2FpdC1waW4tYWN0aXZlLWxvdw0KIiBpcyBhbHNvIG9rIGZvciBtZSwg
YnV0IGl0IGZlZWxzIG1vcmUgbGlrZSBhIGNvc21ldGljIHRoaW5nIGF0IHRoaXMNCnBvaW50LiAN
Cg0KDQoNCj4gDQo+ID4gICAgZ3BtYyx3YWl0LW9uLXJlYWQ6DQo+ID4gICAgICBkZXNjcmlwdGlv
bjogRW5hYmxlcyB3YWl0IG1vbml0b3Jpbmcgb24gcmVhZHMuDQo+ID4gICAgICB0eXBlOiBib29s
ZWFuDQo+IA0KPiBjaGVlcnMsDQo+IC1yb2dlcg0KDQpjaGVlcnMsDQpiZW5lZGlrdA0K
