Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267E75BA934
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiIPJSQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 05:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiIPJRy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 05:17:54 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2078.outbound.protection.outlook.com [40.107.105.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AE9A1B7;
        Fri, 16 Sep 2022 02:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaH+PIW4tCix5najV0cyXnhmgHwG2DQpb7A4Y6cQC1VaFvUT+kF7WrFN1q0mWDJ3kkB/VrwEA0e5S/6mveyjitasyNogHd+eNmqlAOWjzlBtCzGGgUdGjBReoWoKahnvE/Ov7YfzgB+7OH1bWVJ3Rwp7rNO57+8NjvOzXZE8+5+bBxgXh3lUTguLjfSsy1pqwfpq5ytxToyRoaDvYPPoYuwRAVpooo6S8UBNtXJDWeKZmUsxM8Ym9N/ily5VIkA2c2Z+bDLGP7FZzdu2jWvxSCh/Ksg/gTDO6EPYLaKBmqhzrpWF4rAbW5QCD4C2nZxbWCkyCQn7ZeGw0qFdFKQ1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGGU5f7KUACfF7XfcTwcS4a5AVdfnPRxXS/mSjVREk8=;
 b=Y3oq5EbdZXafBcVmKhGN6nQZLqOB3mfdt4QxZ/KBdSicLzwZnXOrr6h0MX6HNoA1i5ekfTyr1WukEHXqXWmrq64k2l0vz3DIHsHDKGAMIc1TSxyXs5AsqhjquCJ0u2tvRjk+QPZvQV+C0w6W5zg6RIhd5mLJyqlTOV3kHhNVQj4FDUtAqx9JpeCCyVBSfDH1XithE6AJNhLVFL5cMx8PZPLFQOoQeJNlAyeHFJQVZLiiN/E+vB65f6vb6pvQ0aH0lWFtw3225dHWnhH3XDevM7lJBKDDXGI9UxKtKkLPOr7pj8546tLoC9p2MoUpzs9QanwD5a2j+NoJ4zJkr1hHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGGU5f7KUACfF7XfcTwcS4a5AVdfnPRxXS/mSjVREk8=;
 b=TMPAZvuiEePQuF6cjXV+9snQxtSLLAvgB9lSpp70BaRGvR7x2HHpkXdlS/r9bE3wn+ZidZnaPyd1Yw9JzyJMWV7ttau0hB/25uXbjJdbw6ylSOmwbJuldbklQIXyw4OmF1kpL/d1EaWuvLm8BJulFyiNzpnkqS5I3EIqeRU4JBJg45bao8ON3ksBFFvL2L50AUX4fvNpzjZ2T8Y/82Ac+5odDpYxqmVje68TwO6dC/0c/jk2dCZ2rdmpIH4qRiHl/9+oBYTS0mJtIofC1WQ0PnDn+Ff27DZuhDhYBPHI1EyFQynWauZQVnxuB1Wnilapw250YaqC+VxjI5pE+mC35Q==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PR3PR10MB4078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 09:17:32 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656%4]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 09:17:32 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Topic: [PATCH v4 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Index: AQHYyaoT8Myd1l8nr0Wz7OEj2IFd8q3hxvgA
Date:   Fri, 16 Sep 2022 09:17:32 +0000
Message-ID: <a35869490f41714a538cb58046c534c875df0e54.camel@siemens.com>
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
         <20220915091333.2425306-3-benedikt.niedermayr@siemens.com>
         <a48446ef-5298-4123-b6e1-acab73a616e5@kernel.org>
In-Reply-To: <a48446ef-5298-4123-b6e1-acab73a616e5@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|PR3PR10MB4078:EE_
x-ms-office365-filtering-correlation-id: e9fa47a8-b9c5-4f70-a0bc-08da97c44981
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnSTl0B/7/XFQMICgwPqEzwxSrO9LzbfqMdDHTV1/XJ60e0r8nYJzWGj0iyx80HtbT4ENhGv+suOPfCj/vX4kDJosHsXt/hl9B4i9LXU1fGXT8ZPkCJn4TLcb+W+7MzEIB+qWbrwupuPNzyGJufGE6oDY4XykQFy5sg5PCz9gthnYhRQr8zEEnoqiNY9/rf4bkDaz9iRnv6HZHeI5CNLAo/7k7s4haFEL0hpPCuU8261EWkcb7/bw8gPuYnCMenKOLdL6NyXLHP4KJBit8oL4LfkaC5prH/rzmRMxFFthePp3XTkv2z9Kjxl4mnbbQr3CwAzqIIgzJALf9+Y6O6Sp9byKa7elZAAVMokNCAKQdX/gW++vIix2BzQ3efUUdqa5HrDM1Cr7vyR1v9dl0guqUesmwSbBfuBo1Vdr6aKnBTwTqcuc2Vpw7kAtTD04I8W6FpSCVomKv6xSRAAVWn9+GL5Ab90HPvieU/TQ7omY+/ragvFIxcaYkkl7s+MetxU/nCGhBFLVZSdLRxknAAUEqz4G3wWRKPrhtJbuQFSciUblv5Ctq2G36zThB1EPuEkGnADpsxmNMuhB9RyxEbPyQHJaKhbj3Bpwzyu3ZDBDlYVhBVfDniiwXWZyPT7RKIrcodR19mJ0fCqKwMw+NAXEZQN5LYfT8gTiLIfH796wIeWcMJ0WxF2nFh85AHMvKgW9izLuW87LmGhSzjDnTFImtQcBsufRfNdrd9lyrqBdRIGciGNTS+0LADbIpB1z30nfEWnYBgXz3vCZFe9deNP2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(6506007)(53546011)(76116006)(41300700001)(4326008)(66556008)(64756008)(66446008)(66476007)(66946007)(38070700005)(91956017)(2616005)(2906002)(3450700001)(86362001)(6512007)(110136005)(316002)(54906003)(83380400001)(71200400001)(8936002)(122000001)(36756003)(186003)(5660300002)(38100700002)(8676002)(6486002)(478600001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkNCa2Qyb1gyd21wK2ZZZnh5U3p5OGZCdmVUQ2NDd21ZY3YyZmZuM3lOUHha?=
 =?utf-8?B?dU9HZVJnUzM2TnhJY285SG1qSFZocDVhbWE3YUVhUnRISTNiWjloeDZldnhL?=
 =?utf-8?B?Ynd6cUcwckxTMUxLUkl1YUVsaHIzeFdRRklwTDU4QmhNcm1EYjMyZXNHaGFI?=
 =?utf-8?B?ZllsMTFSWjBxSlNPUkxuRHhLSWpWd0RXRHBscmgrU3JEU3RTSk55Q1Bpb3dF?=
 =?utf-8?B?N1ArRnA2WmdiVVkwalJvRUU5K0pwekt0TDY2K1M1Mk92V2p6WktsZVRGa1Yr?=
 =?utf-8?B?aWN2aTRCa2tVazZsUXRlSlo2a053RUJYZ2dhY2hHY0xFNmxlU1FoRVZKTHBs?=
 =?utf-8?B?TERLWGJBVjBhUCtudFRRMUFXMGM2cXBaY29zNTNTM2Z1VWEranozQlFQNGZn?=
 =?utf-8?B?UitqR0NmWUtEUTkrRnBnbEtGaXd3TzltdXpBZEtIbjQwNnZGRjB6cjA5aklj?=
 =?utf-8?B?dU1weHh2RnRkRmh0a05HYi9KL2U5MHhwazhaREo1RzJOYW5iUVBuendoNmlJ?=
 =?utf-8?B?WmZyNm5Na0pZUzhtMmhRanFpSFNLTHFVRlF0TDVGZTRhc1FDR2VrZG05NHRm?=
 =?utf-8?B?V01ZNW1MVERmSGR3bk44c1FabndiQ2JQUHFFWS92ODhtTlFqY3V3dms5M1do?=
 =?utf-8?B?QnlsT1JmQTJCektKMWZnUjgwQjNEaENLQWNoSTUvOGg3N1VkNjgvNE5qZnBE?=
 =?utf-8?B?VDBwOVpPWUNKcVAzTEkzMTk3MWIzQjFMTmx6Ym90R1Y0NkFUNFVBR2NQN3NL?=
 =?utf-8?B?eG91YjRXYk5sajErNHo2c2JWQ1NNUExwR0hQKzdCZ1oyQVRueHMzY3dMemt5?=
 =?utf-8?B?LzdudmRlZThjVE45SlFpS2dkR3FseU0vRXJ5WEpha3psbUxJYmlzU3Rib0tJ?=
 =?utf-8?B?bXRqYWFBb0FDZ21ibGNPbEoyR2FwZWIweE9Lbk1nZzJxNUFYQlVoMG0xWFRr?=
 =?utf-8?B?dEVoVkFNcGVvVVFXWDNKRjRvOENJSVVZeHFxZzh6N0Z5MGUxSVVNaHdUTDhj?=
 =?utf-8?B?SytNY29XNFNtam5lR3h4Y0JmWlk0S2x5RE9QT3FwSHVLWllYR2U1dUFzU1d4?=
 =?utf-8?B?alRNSVdNaHUwaVA1c3pIcFBEWFZZOHNZQnJUYmdhR1VGa1pCV3pkMFc2SDhG?=
 =?utf-8?B?c2dlY3RGSm9mcFR2UTUvVG5Ka2hYYlNETzJmT1hqRlRMWEczMkltZ0RPUzhQ?=
 =?utf-8?B?MVVveUdDU0tUQXozNjAybFBHUVNsNnU0Mmg3ZDNTRzBxWXNsbUd4ZWIxUmQw?=
 =?utf-8?B?WjhSQ09wdDZzbmlRcGxFWlVPamlQcnhzVDR3SHFIQ2psRE5VclBqN1N3aXRS?=
 =?utf-8?B?OWllRFBvbmx3NkovdnFEYkFmQXFPMUJ2T203Tm5QN3E3UjgrUjlLdHZpTDhw?=
 =?utf-8?B?RHlBV3RibHZLM1FKcVFqQXIvK1FXN1ZGUkNVT1p4eTJSWmxMZDQ4bjF6c0Fw?=
 =?utf-8?B?bFBjNDBuZ1Z4MUNIVXpEaXFUM0k4aTlYbUovR0dXZ3kySVhReFdjSERyd3g0?=
 =?utf-8?B?WjJjYzBhODJRSjRXS0s4K2NyT3ZHK0g1NUVuTG1BT2V4cTRBdDVWWXdyR2Vm?=
 =?utf-8?B?MjBucGtjZElWV2lBOEdUaVFhNXBnS2hWM2RVQ0ZSalM5YVo2Y1JweEYvbEli?=
 =?utf-8?B?ZzdTWlBETno5ck96WFdNYzU0MHNNTko4djRUNFBJTW1zUTRrdkhOMGRxTlRJ?=
 =?utf-8?B?Sy80ZmpPTVp2YitCV2UzNTB5RFB1WEZqajBBZksvTS93RVN1VHBvTmhKdWVF?=
 =?utf-8?B?MjRQWFZZZ2tyQWxXTjhXcHJ2SVY2aCtubDdvOWQyMVN6RHhTS2FKdDZrMWJr?=
 =?utf-8?B?REdOanhraFFXMXg4UTFhV3ZTQVNIM1lxWUd6Z28xd2hQN2ZZNXFrS0xOdHNi?=
 =?utf-8?B?NDhVcmZndGVtUkZPYVgzSnhMdDdXTjRKZEtUQ0t5T1VHUEQ1amZnSmdPZXA4?=
 =?utf-8?B?ZWJob2pOWGxOM3ByTWROZ0E0eXBFYllwYzBWOW4yeWIxV2REdVNFSElqY3hE?=
 =?utf-8?B?YUFwbzZ6LzBRV3M0anZWbU1jYnhJMzZycFpNZEEwS2tiRm9HMFdpT1VuRGdN?=
 =?utf-8?B?L0h4L21sVFpyK2pqYm8rb0NiMGFUT2E0UjJ1N2QwY21LOG9PSjRVOXorc1o1?=
 =?utf-8?B?NzVDSkpiVVNuU3l3cjlNdlROM29zeDZOSnN0dk1SZll1dFJLem1UbzFSZHVx?=
 =?utf-8?B?M2JOVm9xczNJNW9uYU9Cd3lvclV3WmpMcHlWc21NRjUvaURjdmwyYUNjeTVC?=
 =?utf-8?Q?8OJoubyOp1UBuaUmbCxJJAoa8RFzgNw4nH//mUSHAg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A44294711BB3164C8ACE6CB77EC664E5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fa47a8-b9c5-4f70-a0bc-08da97c44981
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 09:17:32.8494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8vRJhde04mYA+V6gOVRyS6W6lXosW4zcdWPIgd++UdFBA7EGhHmgFRwZk1xizYJpnaXZoeem/OQ0aKrDEgtx9VnRGx+PJLgg3H0//buvFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4078
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gRnJpLCAyMDIyLTA5LTE2IGF0IDExOjU1ICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0K
PiANCj4gT24gMTUvMDkvMjAyMiAxMjoxMywgQi4gTmllZGVybWF5ciB3cm90ZToNCj4gPiBGcm9t
OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tPg0K
PiA+IA0KPiA+IFRoZSB3YWl0cGluIHBvbGFyaXR5IGNhbiBiZSBjb25maWd1cmVkIHZpYSB0aGUg
V0FJVFBJTjxYPlBPTEFSSVRZIGJpdHMNCj4gPiBpbiB0aGUgR1BNQ19DT05GSUcgcmVnaXN0ZXIu
IFRoaXMgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgYnkgdGhlDQo+ID4gZHJpdmVyLiBUaGlz
IHBhdGNoIGFkZHMgc3VwcG9ydCBmb3Igc2V0dGluZyB0aGUgcmVxdWlyZWQgcmVnaXN0ZXIgYml0
cw0KPiA+IHdpdGggdGhlICJncG1jLHdhaXQtcGluLXBvbGFyaXR5IiBkdC1wcm9wZXJ0eS4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVk
ZXJtYXlyQHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lbW9yeS9vbWFwLWdw
bWMuYyAgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1
ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncG1jLW9tYXAuaCB8ICA2ICsrKysrKw0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4gDQo+IC4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tc3RyaWN0DQpTb3JyeSwgSSB3YXNuJ3QgYXdhcmUgb2YgdGhhdCBvcHRpb24uDQpJdCdz
IG15IGZpcnN0IHBhdGNoc2VyaWVzIEkgdHJ5IHRvIGdldCB1cHN0cmVhbS4NCg0KQnV0IHRoYW5r
cyBmb3IgdGhlIHJldmlldyBhbmQgZmVlZGJhY2shDQoNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gMDAwMi1tZW1v
cnktb21hcC1ncG1jLWFkZC1zdXBwb3J0LWZvci13YWl0LXBpbi1wb2xhcml0eS5wYXRjaA0KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMNCj4g
IzQyOiBGSUxFOiBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYzoxODk5Og0KPiArCQkJcHJfZXJy
KCIlczogaW52YWxpZCB3YWl0LXBpbi1wb2xhcml0eSAocGluOiAlZCwgcG9sYXJpdHk6ICVkKVxu
IiwNCj4gKwkJCQlfX2Z1bmNfXywgcC0+d2FpdF9waW4sIHAtPndhaXRfcGluX3BvbGFyaXR5KTsN
Cj4gDQo+IENIRUNLOiBQbGVhc2UgZG9uJ3QgdXNlIG11bHRpcGxlIGJsYW5rIGxpbmVzDQo+ICM0
NzogRklMRTogZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmM6MTkwNDoNCj4gKw0KPiArDQo+IA0K
PiBDSEVDSzogQmxhbmsgbGluZXMgYXJlbid0IG5lY2Vzc2FyeSBhZnRlciBhbiBvcGVuIGJyYWNl
ICd7Jw0KPiAjNTU6IEZJTEU6IGRyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jOjE5OTU6DQo+ICAJ
aWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImdwbWMsd2FpdC1waW4iLCAmcC0+d2FpdF9w
aW4pKSB7DQo+ICsNCj4gDQo+IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFy
ZW50aGVzaXMNCj4gIzU4OiBGSUxFOiBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYzoxOTk4Og0K
PiArCQlvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwNCj4gKwkJCSJncG1jLHdhaXQtcGluLXBvbGFy
aXR5IiwNCj4gDQo+IHRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgNCBjaGVja3MsIDU4IGxp
bmVzIGNoZWNrZWQNCj4gDQo+IE5PVEU6IEZvciBzb21lIG9mIHRoZSByZXBvcnRlZCBkZWZlY3Rz
LCBjaGVja3BhdGNoIG1heSBiZSBhYmxlIHRvDQo+ICAgICAgIG1lY2hhbmljYWxseSBjb252ZXJ0
IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5nIC0tZml4IG9yIC0tZml4LWlucGxhY2UuDQo+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyBiL2RyaXZlcnMvbWVt
b3J5L29tYXAtZ3BtYy5jDQo+ID4gaW5kZXggZTM2NzRhMTViOTM0Li42NmRkN2RkODA2NTMgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMNCj4gPiArKysgYi9kcml2
ZXJzL21lbW9yeS9vbWFwLWdwbWMuYw0KPiA+IEBAIC0xMzIsNiArMTMyLDcgQEANCj4gPiAgI2Rl
ZmluZSBHUE1DX0NPTkZJR19ERVZfU0laRQkweDAwMDAwMDAyDQo+ID4gICNkZWZpbmUgR1BNQ19D
T05GSUdfREVWX1RZUEUJMHgwMDAwMDAwMw0KPiA+ICANCj4gPiArI2RlZmluZSBHUE1DX0NPTkZJ
R19XQUlUUElOUE9MQVJJVFkocGluKQkoQklUKHBpbikgPDwgOCkNCj4gPiAgI2RlZmluZSBHUE1D
X0NPTkZJRzFfV1JBUEJVUlNUX1NVUFAgICAgICgxIDw8IDMxKQ0KPiA+ICAjZGVmaW5lIEdQTUNf
Q09ORklHMV9SRUFETVVMVElQTEVfU1VQUCAgKDEgPDwgMzApDQo+ID4gICNkZWZpbmUgR1BNQ19D
T05GSUcxX1JFQURUWVBFX0FTWU5DICAgICAoMCA8PCAyOSkNCj4gPiBAQCAtMTg4MSw2ICsxODgy
LDIxIEBAIGludCBncG1jX2NzX3Byb2dyYW1fc2V0dGluZ3MoaW50IGNzLCBzdHJ1Y3QgZ3BtY19z
ZXR0aW5ncyAqcCkNCj4gPiAgDQo+ID4gIAlncG1jX2NzX3dyaXRlX3JlZyhjcywgR1BNQ19DU19D
T05GSUcxLCBjb25maWcxKTsNCj4gPiAgDQo+ID4gKwlpZiAocC0+d2FpdF9vbl9yZWFkIHx8IHAt
PndhaXRfb25fd3JpdGUpIHsNCj4gPiArCQljb25maWcxID0gZ3BtY19yZWFkX3JlZyhHUE1DX0NP
TkZJRyk7DQo+ID4gKw0KPiA+ICsJCWlmIChwLT53YWl0X3Bpbl9wb2xhcml0eSA9PSBXQUlUUElO
UE9MQVJJVFlfQUNUSVZFX0xPVykNCj4gPiArCQkJY29uZmlnMSAmPSB+R1BNQ19DT05GSUdfV0FJ
VFBJTlBPTEFSSVRZKHAtPndhaXRfcGluKTsNCj4gPiArCQllbHNlIGlmIChwLT53YWl0X3Bpbl9w
b2xhcml0eSA9PSBXQUlUUElOUE9MQVJJVFlfQUNUSVZFX0hJR0gpDQo+ID4gKwkJCWNvbmZpZzEg
fD0gR1BNQ19DT05GSUdfV0FJVFBJTlBPTEFSSVRZKHAtPndhaXRfcGluKTsNCj4gPiArCQllbHNl
IGlmIChwLT53YWl0X3Bpbl9wb2xhcml0eSAhPSBXQUlUUElOUE9MQVJJVFlfREVGQVVMVCkNCj4g
PiArCQkJcHJfZXJyKCIlczogaW52YWxpZCB3YWl0LXBpbi1wb2xhcml0eSAocGluOiAlZCwgcG9s
YXJpdHk6ICVkKVxuIiwNCj4gPiArCQkJCV9fZnVuY19fLCBwLT53YWl0X3BpbiwgcC0+d2FpdF9w
aW5fcG9sYXJpdHkpOw0KPiA+ICsNCj4gPiArCQlncG1jX3dyaXRlX3JlZyhHUE1DX0NPTkZJRywg
Y29uZmlnMSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9
DQo+ID4gIA0KPiA+IEBAIC0xOTgxLDYgKzE5OTcsMTIgQEAgdm9pZCBncG1jX3JlYWRfc2V0dGlu
Z3NfZHQoc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IGdwbWNfc2V0dGluZ3MgKnApDQo+
ID4gIAl9DQo+ID4gIA0KPiA+ICAJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImdwbWMs
d2FpdC1waW4iLCAmcC0+d2FpdF9waW4pKSB7DQo+ID4gKw0KPiA+ICsJCXAtPndhaXRfcGluX3Bv
bGFyaXR5ID0gV0FJVFBJTlBPTEFSSVRZX0RFRkFVTFQ7DQo+ID4gKwkJb2ZfcHJvcGVydHlfcmVh
ZF91MzIobnAsDQo+ID4gKwkJCSJncG1jLHdhaXQtcGluLXBvbGFyaXR5IiwNCj4gPiArCQkJJnAt
PndhaXRfcGluX3BvbGFyaXR5KTsNCj4gPiArDQo+ID4gIAkJcC0+d2FpdF9vbl9yZWFkID0gb2Zf
cHJvcGVydHlfcmVhZF9ib29sKG5wLA0KPiA+ICAJCQkJCQkJImdwbWMsd2FpdC1vbi1yZWFkIik7
DQo+ID4gIAkJcC0+d2FpdF9vbl93cml0ZSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwNCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwbWMtb21hcC5oIGIv
aW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwbWMtb21hcC5oDQo+ID4gaW5kZXggYzljYzRl
MzI0MzVkLi5jNDZjMjgwNjljMzEgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0
Zm9ybV9kYXRhL2dwbWMtb21hcC5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9k
YXRhL2dwbWMtb21hcC5oDQo+ID4gQEAgLTEzNiw2ICsxMzYsMTEgQEAgc3RydWN0IGdwbWNfZGV2
aWNlX3RpbWluZ3Mgew0KPiA+ICAjZGVmaW5lIEdQTUNfTVVYX0FBRAkJCTEJLyogQWRkci1BZGRy
LURhdGEgbXVsdGlwbGV4ICovDQo+ID4gICNkZWZpbmUgR1BNQ19NVVhfQUQJCQkyCS8qIEFkZHIt
RGF0YSBtdWx0aXBsZXggKi8NCj4gPiAgDQo+ID4gKy8qIFdhaXQgcGluIHBvbGFyaXR5IHZhbHVl
cyAqLw0KPiA+ICsjZGVmaW5lIFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUIC0xDQo+ID4gKyNkZWZp
bmUgV0FJVFBJTlBPTEFSSVRZX0FDVElWRV9MT1cgMA0KPiA+ICsjZGVmaW5lIFdBSVRQSU5QT0xB
UklUWV9BQ1RJVkVfSElHSCAxDQo+ID4gKw0KPiA+ICBzdHJ1Y3QgZ3BtY19zZXR0aW5ncyB7DQo+
ID4gIAlib29sIGJ1cnN0X3dyYXA7CS8qIGVuYWJsZXMgd3JhcCBidXJzdGluZyAqLw0KPiA+ICAJ
Ym9vbCBidXJzdF9yZWFkOwkvKiBlbmFibGVzIHJlYWQgcGFnZS9idXJzdCBtb2RlICovDQo+ID4g
QEAgLTE0OSw2ICsxNTQsNyBAQCBzdHJ1Y3QgZ3BtY19zZXR0aW5ncyB7DQo+ID4gIAl1MzIgZGV2
aWNlX3dpZHRoOwkvKiBkZXZpY2UgYnVzIHdpZHRoICg4IG9yIDE2IGJpdCkgKi8NCj4gPiAgCXUz
MiBtdXhfYWRkX2RhdGE7CS8qIG11bHRpcGxleCBhZGRyZXNzICYgZGF0YSAqLw0KPiA+ICAJdTMy
IHdhaXRfcGluOwkJLyogd2FpdC1waW4gdG8gYmUgdXNlZCAqLw0KPiA+ICsJdTMyIHdhaXRfcGlu
X3BvbGFyaXR5OwkvKiB3YWl0LXBpbiBwb2xhcml0eSAqLw0KPiA+ICB9Ow0KPiA+ICANCj4gPiAg
LyogRGF0YSBmb3IgZWFjaCBjaGlwIHNlbGVjdCAqLw0KPiANCj4gY2hlZXJzLA0KPiAtcm9nZXIN
Cg0KY2hlZXJzLA0KYmVuZWRpa3QNCg0K
