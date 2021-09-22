Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3F5414518
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 11:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbhIVJ2p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 05:28:45 -0400
Received: from mail-eopbgr00049.outbound.protection.outlook.com ([40.107.0.49]:50909
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234376AbhIVJ2m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Sep 2021 05:28:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzdFr1CZRTfC8pCnlUhpsNK0EMO7fm6XwfzJEaCOWBbQXZJ+Fh40YQnIe90FbU6ZZ5F2AxSngyyca0PjcqHhnMeHeXoycmvV2h4s0l9unirO2MkkVUXNLZ4nLd+VYfIzRQd8j0JuTMZcCfgixoOwEy35zFn4CbAvana6SI7bgMs+VIjIiOJRDzzUgdl7TTdaM+yOty/2OmC7McqAPovh341G3gVD5Lz8mz9h45F39QdSGt3cOAA2WWWfBYLhhVQ1ohiq7IA5KTLsAW5zProOa5JscSvaB0a5VGPoS7+sSif5aHrQK5UsweffbkOSc7boRv+eGGvHafvDXKAo7kOK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rNZA4qFgshLaNxr1J5AGKhBu2FF0OrAZQClrxbsU9YQ=;
 b=Qzn3BgdQKSBOLKlV/ETfibz5QtMwL3sTGotr0DBBK+w5UR4I3e2SkkLWxucocNG/KcufYimukdupvD6OBz7gC8GtsGpm9KMHUNjzYY3Zm7M1VNcCqlyI6uj7UwnFhkRgdBTCCT2Bms3WYVPQKGg0V/LCPrYok7f1kdFqsbdTARL5qQGArs6Fyy+5nTg2QYwXDIgMGSmXkjg9gkishnQd/bRpoPQoCdCV8ut4iRqR1X+I9gOsstre2FOkrX6RYPTK4GUfn+PpuDc+xMZmC2umrSVvzTr3T+DsARVyNvtV8qMBfV9p56tGOAJzk33efenVa2zO39qBzgmO7Rk4/hHnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNZA4qFgshLaNxr1J5AGKhBu2FF0OrAZQClrxbsU9YQ=;
 b=IjSHK3hxIioc7vLukJZlSVjd+mTw5z6DGibg5Bc0LLieyeHbvfBffKSCrRLn37cJlrIcu1iXHmpQH56PwXIGpDnODpKA9HCdPvd4a6iuGZiczzHAL83kHUbWp4+Ew2wgHKPFDZ5V/TkhHNeK/WsKgXkR+OtMAM4q6hL02MnX478=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2251.eurprd03.prod.outlook.com (2603:10a6:3:24::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.18; Wed, 22 Sep 2021 09:27:09 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415%7]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 09:27:09 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Thread-Topic: beaglebone black boot failure Linux v5.15.rc1
Thread-Index: AQHXqtte0LDyC49C8Eq6XS7e5X9lNKunwNEAgABs14D//+JeAIAAASKAgAAtVQD//+0NgIAEjN4AgAFrxACAAIuUAIAACS2AgAEZZIA=
Date:   Wed, 22 Sep 2021 09:27:09 +0000
Message-ID: <9c80c7af-daf5-c521-fe59-1f0c222a23e1@fi.rohmeurope.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com> <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
 <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
In-Reply-To: <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: goldelico.com; dkim=none (message not signed)
 header.d=none;goldelico.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e55ecac1-0e42-4e8b-6632-08d97dab2723
x-ms-traffictypediagnostic: HE1PR0301MB2251:
x-microsoft-antispam-prvs: <HE1PR0301MB225160D21F0BD3E49A1A5396ADA29@HE1PR0301MB2251.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lw6hjpr+V2665KaCVO13XiDvVVCA4Lf/tgyPunvMRW46hLasJMazubhWnJHwoP2odyuesXf1YcJlzBZgg7vv00Ljmrc0A+XDbxipim5XLnhhn9PEG1Hb9FL0yvrU3KOd/rtevu6Bgr4gtwJiQLODwiHiKYuL5QIyWg+fkc0Yq2hV0bKAJWfdIZhUX1dFCRPm5obEQjDnzjz0L66ZH17/4duhQCFwadt7AHapqxS+wibCyIMFKz/zMptoScdYU55BsZ6xMeoTGNkgijScoM3CgLh1RugUNVyP0whcsoA2piiZS8g6UgluBTEbccq4sJhJYLiY8kvcnc3rHlPOCT8IihD+m6nCcnR6oOXqeKcjKMrnbjCjnm+ARhFfN8wuRGGGT7fcfqE42TXTdwkQUvRpGZA4kkObzpIQn9JGrOq3jFiTxAlJgQItEWaTvUVgZdBs0vVUsdcVGwHTFIvTyJI8SKXJWw8CPC4t8YFIYD0LBu7y+2INjO3PNeOAuEUsKz7N50A6T6AyNHsRxVw5z3jGHqBHl6T9yTWvuwPj+x1OYjzghzS2j6X9eaFAzt52JXCD8e9GI+QFrCoX34AXDaqAkJzER7z6qzfUCZF7wcgd7APpEQDDTA3i/lCozeWWMkHryIIXCf7WmDPFl3vWgZSgWwGjQI/YV+PpZtXCxA7iIhhfUNZlcvIIWCioR30W+04WZKPR4l5bBoEFjygximJ3V9GrHVdiKRxh438WkcSLetIe6EUwEdgdVAPQ2n+3KTVLaqAJPi5HUPeUyhJbHPT25A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(316002)(186003)(86362001)(31696002)(5660300002)(6486002)(6512007)(6506007)(508600001)(110136005)(66446008)(2906002)(2616005)(64756008)(66556008)(66476007)(8676002)(31686004)(8936002)(71200400001)(122000001)(53546011)(66946007)(7416002)(4326008)(38100700002)(83380400001)(76116006)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzhJT0txKzdaWkJDUlRLaTFJdXN4RlgwanpEYWJzZ2VkTU50bEczQlpuQytM?=
 =?utf-8?B?NlBRZ25rQjZ0ZUM5cGtYNzZSc0tVZUh2bURNNEpFY3krcndhUXN6ZmlVT1VJ?=
 =?utf-8?B?M2RCUWZJVzNtUnRSZWJEakVOVlVzM3hQRDZtVUIweDNGem8zOUFHZ01HWDdh?=
 =?utf-8?B?d2xnNlYybllsb1ljUmJuTVltUHVBVEpLTlpEZkpseDJydkJYQUZzSit1c295?=
 =?utf-8?B?VEd3TGVoSmxrSHZvNU5EcHV2STg5aW9HTXpYam5tbnhPYlBvMmtJSmFOaTNz?=
 =?utf-8?B?ejdFZlFPek9ic1lQQlB4Wmp4b0FUYXN5SG5LcmU1b0tpdWlPVEEvdStHRm0r?=
 =?utf-8?B?OGo2UnBjQjY0RVgzbzIxeG5ycElTSWdmcHZjVWVyQnhiRHhnaFErM25yQ0Zl?=
 =?utf-8?B?U2svM0JhQ0RZT0xVWksveWZsaDk5RDkxdktCQXAxMXFpdG8rcGdEOGVlWHpB?=
 =?utf-8?B?ZGM0dGdvWnhvcnZ0clEraTY1SVhsWml2MTJQUmRuOTlMbnErMi96Z3Boc3VJ?=
 =?utf-8?B?b2RJQjdLOUVWTlBscVBETlhJWlJzVkFTSXpCYktCUm11Sy9VNzlLdmV1SzVn?=
 =?utf-8?B?RWhjYkN5RlNxZ0tFTW9USDJMWFBYMm1TaHJlZnJ5Mi9LWFVSd2d5TFIvcldJ?=
 =?utf-8?B?SlpUUEh1L1YvWjVIMlJLeEpEcHUyb2xleTZ0S2dKNnNxNXJGUVZzVjRyTEJV?=
 =?utf-8?B?bDJyeTUybFV4UkYvRkMyQW84a3pqTlB2Q01TWGpFT2tTWUJ1L3MxQWQwV05E?=
 =?utf-8?B?cnlZL2dUcmVyekRQWDdicGZZSThkUndSMFZMYm13c3pia2JHUmQzOXFBVUk2?=
 =?utf-8?B?ZTZYWS9xSk9xbk8ydm9QVkdnbGU2Z1hPaG91NTBSTzZlTFFxZWFYQm9yeHNv?=
 =?utf-8?B?akI5MGFNMzhxVVowVi9FeEpYSEY5S3hUMUl6TGdkSERiWUF0QUhUUFlHRmhX?=
 =?utf-8?B?SldWWWtpNk5KY2RyRjdyZnp2MXpldGI0cE5Ga0ljQzVObDZ5WjJNWnhxVDEz?=
 =?utf-8?B?UE1saTd3aDFyVW9yWjBCdVBZOVVVd3NlSHBYZEVicHNaeUEvVzVPSGhVbUNj?=
 =?utf-8?B?L0dWTk5Zc3o3NHRNUjFGZWlQZkgvVUdRNzZsMWpYVXIzNmNzTVBraWNyQmR1?=
 =?utf-8?B?UW5XTzlXN1ZXSTJ1SFNHS1NZNGtrYUZmVnNCczdjZ1gwR2drOGo1Qm9xdmV1?=
 =?utf-8?B?VEtZZzI0a0pHVTBWdGFSM2tFcUhzZlI0NjMvWFV4amJ2U2xYSWg4Q1h4clEz?=
 =?utf-8?B?cGtWZWR3d3lzVUI5WGtLNXZXSzRJSVdncm5BVHRoVW14cDhmaDZEVlIybU5Z?=
 =?utf-8?B?ZnZhUVhLYkdwRGsveUY4R0Y1dnJTWEI3VGQyUTNTQ3NEelFSRkFlcXQycnV0?=
 =?utf-8?B?RkZnelMzOEFUM3dTS0dXaGI2dFhpRU1LR2JubGd1eTI4TVVwZ2lENjhhV1Nk?=
 =?utf-8?B?dFV1R2JCeFpmSHltUXdLWnVmdURXbXR5N2tuNlRvOE0wZHRRR0owUGU0NVE4?=
 =?utf-8?B?eVhWZm5xTWtQYnA2VHFLYTMvS29OS1FpMVRwTitNbURSdXdFNE5OM3Bzc3pa?=
 =?utf-8?B?R2IyVFlLbXluTGVidVdtaFVHZkQ0VHh3b0psc2NZYjF6bXJCa2xCZFFrWU41?=
 =?utf-8?B?NlBzSWdhUzRwM2xrcWRJRzhkcytEdForZ2VqK3QrMmJicW5zcXNwV2hhWmNL?=
 =?utf-8?B?VjhOWjNwQWFrK25ST2xlNlhlVG41TlIvMjVzQVBWbWI3cTlhTFBOejZsSDZ5?=
 =?utf-8?B?UzF5N3Bpd3duUVh4eDVHUVhsNzdOTHE4V05WQ0dXOEZxekF1NmhoNnR3NTJY?=
 =?utf-8?B?d0lmL3EvU2pKdlZsVnYrZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A85DD9BAA3BA248A239593441C97790@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55ecac1-0e42-4e8b-6632-08d97dab2723
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 09:27:09.8167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LCv1wB4QWtJw/+dq+N0WbeEofbY6ppHiU8FN0TBnTJv1yPAb90ki2CK6SGvvphsn2ym4LtYdlMR182DFTVJC6qyaOHF2emR3+9b2DbJQgTC/8MQmckuraCCMd20KZij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2251
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gOS8yMS8yMSAxOTo0MCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgd3JvdGU6DQo+IEhpIE1hdHRp
LCBUb255LA0KPiANCj4+IEFtIDIxLjA5LjIwMjEgdW0gMTg6MDcgc2NocmllYiBTdW1hbiBBbm5h
IDxzLWFubmFAdGkuY29tPjoNCj4+DQo+PiBIaSBNYXR0aSwgVG9ueSwNCj4+DQo+PiBPbiA5LzIx
LzIxIDI6NDcgQU0sIFRvbnkgTGluZGdyZW4gd3JvdGU6DQo+Pj4gKiBNYXR0aSBWYWl0dGluZW4g
PG1henppZXNhY2NvdW50QGdtYWlsLmNvbT4gWzIxMDkyMCAwODoyM106DQo+Pj4+IEZpbmFsbHks
IGFkZGluZyB0aGUgdWRlbGF5KDEwMCk7IChhcyBUb255IHN1Z2dlc3RlZCkgYXQgdGhlIGVuZCBv
ZiB0aGUNCj4+Pj4gb21hcF9yZXNldF9kZWFzc2VydCgpIGRpZCBtYWtlIHRoZSBvb3BzIGdvIGF3
YXkgZXZlbiB3aGVuIHBydXNzX3RtIHdhcw0KPj4+PiBlbmFibGVkLiBJIGRvbid0IGtub3cgd2hh
dCB3b3VsZCBiZSBhIHByb3BlciBmaXggdGhvdWdoLg0KPj4NCj4+IEkgaGF2ZSBiZWVuIGFibGUg
dG8gYm9vdCB2NS4xNS1yYzEganVzdCBmaW5lIG9uIG15IEJCQiB3aXRob3V0IGFueSBhZGRpdGlv
bmFsDQo+PiBjaGFuZ2VzIFsxXS4NCj4gDQo+IFNhbWUgZm9yIG1lIHdpdGggYSB2NS4xNS1yYzEg
YmFzZWQga2VybmVsLg0KPiANCj4+IE1heSBJIGFzayB3aGF0IGlzIHlvdXIgQkJCIGJvYXJkIHZl
cnNpb24/IE15IGJvYXJkIGlzIHJldi5BNUMuDQo+IA0KPiBJIGhhdmUgYW4gUmV2IEI2IHdpdGgg
RVhQNDEgZGlzcGxheSBhdHRhY2hlZC4gSSB0aGluayBNYXR0aSByZXBvcnRlZCBhIFJldiBDIGJv
YXJkPw0KDQpPb3BzLiBZZXMgSSBkaWQuIEkgX3Rob3VnaHRfIEkgaGF2ZSBSZXYtQyAoMz8pIGJv
YXJkcy4gTm90IGV4YWN0bHkgc3VyZSANCndoeSBJIHRoaW5rIHNvIC0gcGVyaGFwcyB0aGF0IHdh
cyB3aGF0IEkgb3JkZXJlZC4uLiBBbmQgSSByZWFsbHkgdGhpbmsgDQp0aGUgb25lcyBjb25uZWN0
ZWQgdG8gYXV0b21hdGVkIHRlc3Qgc2V0dXAgYXQgdGhlIG9mZmljZSBhcmUgUmV2LUMuDQoNCk5v
dyB0aGF0IEkgdHJpZWQgdG8gdmVyaWZ5IHRoaXMgLSBUaGUgb25lIHdoaWNoIEkgdXNlZCB0byBy
ZXByb2R1Y2UgdGhpcyANCmlzc3VlIChhbmQgbm93IHZlcmlmeSB0aGUgcGF0Y2ggZnJvbSBUb255
KSBhdCBob21lLCBzZWVtcyB0byBoYXZlIHNheSANCiJQQ0IgUmV2NkIiIG9uIFBDQi4gSG93ZXZl
ciB0aGUgdS1ib290IHNheXM6DQoNCj0+ICBwcmludGVudiBib2FyZF9yZXYNCmJvYXJkX3Jldj0w
MEMwDQo9Pg0KDQpidXQgSSBoYXZlIG5vIGlkZWEgd2hlcmUgdGhlIGVudmlyb25tZW50IHZhcmlh
YmxlIGNvbWVzIGZyb20uLi4NCg0KTWF5YmUgYSBzdHVwaWQgcXVlc3Rpb24gLSBob3cgdG8gZmlu
ZCBvdXQgdGhlIGV4YWN0IHJldmlzaW9uPw0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
