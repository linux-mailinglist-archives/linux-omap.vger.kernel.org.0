Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA95A981C
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 15:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbiIANKF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 09:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbiIANJp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 09:09:45 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2067.outbound.protection.outlook.com [40.107.105.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFE197D67;
        Thu,  1 Sep 2022 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKsM3IPM3FO0w4T4YdqFzWyVgEfdAFJjISbqNqTCqrEGQGxQibrGJDiM1oQ6J1j5r2zAXJ7rkWrJ4RCCE8wNh6jiPWf64z3ulFVmp+T7Q7xePhcxUBhJeoA+ejOv/SX903oFXamCwwsR5qOZ17l4qAS+Zw42a+M938g/+MjFbAV/mPH9NvETBbwItG1IokzhGvdgp5bcpG9Kk1AVfGt1a/E1zsKi9E6dlD903kO0hti3J+pmt4LYlI4HvO3KdQnE3g8L3mdpRHf0cds2uQthx/Ma8JMv/4GEiLCM1s0uDMYjM5wA8RbDL9t6y7JWtXv79+IeK98Nfa1IbJl/oIW5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri77GmvxCqd4U9CEeUqn4zwAkAbj7kWzPkrcbwlmo4g=;
 b=C2naZk12laRjPGKaGFeELokwkgAGkA/IT5HGb8szhzBCw1/VBL33cPWULHheSSYqnf2lyBPOCkJ6ujH0TRvfmRy5fezvjlfxFPgRH57s/6WnK/1WGRHzanLWAyNIxH7rKMGVVwStTeBQduzVLsHA6TXPfnyi6Q61ewjUBrU03VSriLWScv+CBubEIFljUggoOgS1WFe8AZPuDnX+87lWCMUQq4tNnEUKV3HiA0vJbaMhnyXh/8Wged+QXsv39juMmh7eEkANAWjOCS0Qn/xWxHbOOpLKeK9DvbO40iyu8ISl4EdH2HquZfKvd0n27vUJVCegN8WdX/hJWznjUNqrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri77GmvxCqd4U9CEeUqn4zwAkAbj7kWzPkrcbwlmo4g=;
 b=n0J4lmyy2rHjwwubx69wvuBNA9qr36Gca45xNPNNEUpTSCABXrN8KktBYTFxvZI0nngbuaF+08rKYEf6+PUDKkUEUduayFtqPGbkxIPStWKoZU77iwOCtAiD6uB55NJmYKyHX6GstzjgQGe1ypRrHH5vO7ikYzIznQUuRQ5Uvjt5orb9H80UvQNK/ihgqYJC9VbciM2xVe8NzLwHVdW9qNrhv82jN6/2/eAFUXFXS1JxfJBHlHsBp54giS378T1VLusnC+n0ik3jS5YsWQXxh16BkFbWXujJN0/LkmdLUsF1Yv3A6yCxlWn/zhV2zpQK11xVxzqjhZIJofdBtN/NHA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PAVPR10MB6909.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:328::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 13:02:33 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::695d:d7f:8ddc:a2d9]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::695d:d7f:8ddc:a2d9%6]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 13:02:33 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH 0/3] omap-gpmc wait pin additions
Thread-Topic: [PATCH 0/3] omap-gpmc wait pin additions
Thread-Index: AQHYvgI/hpjh72GEa0+lb+9os+SZYK3Kii6A
Date:   Thu, 1 Sep 2022 13:02:33 +0000
Message-ID: <3ff40d3634db34e0e58762029e5e6bc950a29f43.camel@siemens.com>
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
         <8b166d0d-2b09-55f6-8078-c791653f3349@kernel.org>
In-Reply-To: <8b166d0d-2b09-55f6-8078-c791653f3349@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07218e23-890a-4fa1-6f38-08da8c1a3c6b
x-ms-traffictypediagnostic: PAVPR10MB6909:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: evGke5CdTq3ySljLWx67sSBzNUjivaC8vSC/G1lUsb/qwomWYHGJj7ozW7/iR31WhnS9Mry8Gf5BwAUbk3LnaREpTV2r0TVJs42tdMUYJ7K3nTaueCWsQgNbGYA3iRrllC3Vd/ltfid0nnqwkTlEbPxOw8fC+iIeZgf/zfK+O6vxDuWasvcjWsnYwb3ST/G0U4RB+Q37VUayJJ+gZ15mVJ4HR7K3IGlHGeWIs5GS+XRcQWXJe/sG4/O9R/uPA9XnxU08KxVOxio88buxKJbOL3Jju014H8slryZoPLWYDjs0UOWXoD70Bj2+v9ucPXYe5JpcRwXTc0oKqEz8d/vliTLmh4ylXVWFvIFCYXVIMK8lVLr14cfUD03Jp/ILkdUC/+7PJsFSruEZpwYHsOzdqDHGsBFmd5iYlo4T9c8qL7URNU9i0c0rGTwLIFuLeuhdM9P4cC2yeRMeqfKmSCCZoqiOUbvzaoj2F770C/DlARFPs6CIZOFHlr8Uk9LT4KZbSa6JcEqK+wt5H7kB1dBuAdovZ7V76OjQHLM6zEugfDSrVIIt4GGYBYURW11gClABRs/6XRqvvMkdn3Xzkfoiu4OlGVDCJqHBDyGiC5/PQ4BIOYXFBAZwOWjDLfxNSnWPnXzKPSww08g+gEzAj+YfQKbi/aiV5twHhZ+/A8MMRgtHGs8IG4yY822SIncL99iBVUeatMPgopT4Zy1aybTTiI46QoryHss+wPPer8LyoXVwYuQtt8d5q8cJTFw9fB+V
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(478600001)(91956017)(26005)(316002)(54906003)(8676002)(4326008)(86362001)(110136005)(76116006)(66476007)(66556008)(6486002)(64756008)(66446008)(66946007)(71200400001)(38070700005)(82960400001)(41300700001)(8936002)(5660300002)(36756003)(2616005)(38100700002)(6506007)(3450700001)(53546011)(2906002)(122000001)(186003)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVdMMFRRYzN1ZjhPUmVnenZkQm92blFHZTZTMHIrUXlLb1htTFdremw2SnFR?=
 =?utf-8?B?UFBmK0ZFWXIyVFpOTHFYOEh0ZTBoWkJUdTg0Y3dzYWVsZmtwaHRMbGhSZWdH?=
 =?utf-8?B?SmNHUUFPNFZ4SjMrWTgwZTRpUldJWkw1UW1DdkRNSFJXMjNaOGxOR1hJN2M0?=
 =?utf-8?B?Ry9NNmFGS0piNS9zbTc0TEhTM1NXUVF0N1JSSmRiZTJXbVlUMWZGRFJET24r?=
 =?utf-8?B?cGZ3dlY1N0tsWTJDb21iZkxiR3didDRreVAwWkZvcHM0Y1NRNEc5OUt4QlYx?=
 =?utf-8?B?bTk0N2xRbnJUcUYyeTBDR2RRZDVzL2pveVBQY1VYQWxQYkJ0U0FZSDlwVkdw?=
 =?utf-8?B?QlFveElVQ0xpS2xXRnZKRTBKQjJodFpnZUZRc094cjJmb1RSNitBYzJVVU1h?=
 =?utf-8?B?SDR4UGJCQzd0cW9Ra08zS251Z1ZWb1Fab2lKVmtGUkZ6cjEraWxaT1pQejZn?=
 =?utf-8?B?TGU5cWVzYVBBQm1QdE1MdDJEV2crOUN4Zzg2UEZhSHg3VmYzcXpPa3ZMY1R5?=
 =?utf-8?B?a3JoWGRJWSs2ZWhmVVpLeTY1dDNZN0h0azkrc3FOQjBNL1NoQkovdlZhbWpX?=
 =?utf-8?B?UWNmMWlWYndzSXZFaC9wSElHL2xEUDY4cGFYczBpdis1Vmw5NVRXM2FHRDEr?=
 =?utf-8?B?TnplSFo2TjJJeVQySTM3d3JUTWg1aStCejFVK3puV3JQOTBSdGVnYmh5MThO?=
 =?utf-8?B?VVc0UEMwYW1yTDQ2Mm5pWENoNWhzeEU1SURaR1lzS0I2M1lQaHBHWVBSc1hG?=
 =?utf-8?B?eUJqb0kya3gxYk9Kd1BhTjVXcFZiMEY0UjRGaGExR0hVVHlYSUduL1RmUnRh?=
 =?utf-8?B?NmNPTjRLMnFnYUtsSWtxVGV1RytnZVZRb1JHQUhQY0I2d3ZVcHZPbFIxQUtC?=
 =?utf-8?B?d3hEMGFzSjhEVjhRemd5dUVMOEh3UHR5MFdRSWpQdDgrK0xVb01NL0d4dXhM?=
 =?utf-8?B?Z2hTZnRoNFFaV2FEOTRFYkJYczBodUxwWE5QbVdZK2I3Y0psSUdVMmlCRFhC?=
 =?utf-8?B?YlZ3T055dXFORWErRFVCbUZTYUlIdTBZNjR5clRiRUpYRlEyVlBOVnJDM3h5?=
 =?utf-8?B?RytDaExyU0h0VlVUQkV0OXNyQTFuYkd3dkJzNnF5REV5dm56dkhEM3RZdnBR?=
 =?utf-8?B?ZjBmVnBVSEd5MXNKWncvZGdxT3M1QmFhb3M3ejlidzNPZWF5RkFFQ2lMUjcx?=
 =?utf-8?B?MGliYjloT2wxSXJLaWhTQTdHaXdYMEtVK3NDdFpzcEJoS0p5ejNvZkFKMjJi?=
 =?utf-8?B?TzhOSERaVUFaZWRxZW9yMmtQS1FsTlRqaXVwQkhlYlJ3NkJlVTJ2R2JVYTVV?=
 =?utf-8?B?MXJpTnRxdDczMnNWV3NCVzBYcG5OUnJrZkpGK2NXYkxmRnBBUlpCZkFIcmJB?=
 =?utf-8?B?OG1jcFFkWVl3OSsxUlljMTNqT0NSNTVBU2xDWGsrTldMdWNPbWxtVmxKckVm?=
 =?utf-8?B?bXk0SERJYmpEOEN3dmxqVnk4djJiRW5IQjl3Ulc1NkJJOGt6eWVSdEFWc1ZF?=
 =?utf-8?B?WHhBU3Urc1R0RTZlekEwcll3RUl6b3dlSHF1NHZuT2h4bGt1c3YzMlA2VVNw?=
 =?utf-8?B?K21xbllGTFpnd2pJQndYMTVOTVJRYXd2bEp0b1RuMkYzMS9DRDdqaFNkTlNW?=
 =?utf-8?B?eDhrMGxMMVV5S1JUZjRJSW1kY3ozZ0piOHl6Y3NvRFdrUDdJandxYkFRcVJY?=
 =?utf-8?B?SllUVmRYbkpYbGE5NWJEbGx6d1c5WU5GT2pyTHpnbU9nVFlPbVg2Mmllend1?=
 =?utf-8?B?ZmV4QU5Xais5Ulg0aWFlSUhIUCtTcHVPOGJQRUlSdmxxbmhHdm5FTHowNllk?=
 =?utf-8?B?MUtWRnBNRTk4OWUrOFZTTUZ1aTI4eENoWkZONUxRbitsTmNUVlQrL2JLZVV0?=
 =?utf-8?B?NE01NkZ6REZ2WWZBNmh3cUVPNGl6QTFySnBSMS9CM1M4MmFsRExZQ0pCTmdO?=
 =?utf-8?B?K2dpa0FaQVcvOHNGQ0NKZW8xc3lXb28vUGlsakEzWGllKzhGb0l5a1BKc081?=
 =?utf-8?B?alVaTHo1dEFEWkxobXorMHhKbERpWG5WSVdvYzJqejF5Q0dRY3IwaGplT3VT?=
 =?utf-8?B?UllrZ2RRTzIwck1Mdi82a01YUm9WQlN3RlNlb2pQYU1wQTlWUGRlSGdneXg1?=
 =?utf-8?B?TTdDWVlJa3QzU1FrTXM3QlRaQWdVZ0Q4dFlBTjVMOC9WcTFzWklUbzh5cStO?=
 =?utf-8?Q?m6blIitr+e/G5eYUKtbzGoE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD5D5A9BFACAEC4BB29FEF251BA8358C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07218e23-890a-4fa1-6f38-08da8c1a3c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 13:02:33.6746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7Dzkogd2tvU50yij6eE5ZKtHzh93SCZduMHwZ9phBR5dIhXcyivnaVfqk1EiOXs9LoVjRj82x2vGFWAyA1MzVQ2cyJzwyEZYC2b8kBqKDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6909
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gVGh1LCAyMDIyLTA5LTAxIGF0IDE1OjU2ICswMzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwMS8wOS8yMDIyIDE1OjQxLCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+IEZy
b206IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+
DQo+ID4gDQo+ID4gVGhlcmUgaXMgY3VycmVudGx5IG5vIHBvc3NpYmlsaXR5IGZvciB0aGUgZ3Bt
YyB0byBzZXQgZWl0aGVyIHRoZQ0KPiA+IHdhaXRwLXBpbiBwb2xhcml0eSBvciB1c2UgdGhlIHNh
bWUgd2FpdC1waW4gZm9yIGRpZmZlcmVudCBjcy0NCj4gPiByZWdpb25zLg0KPiA+IA0KPiA+IFdo
aWxlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG1heSBmdWxsZmlsbCBtb3N0IHVzZWNhc2Vz
LCBpdCBtYXkNCj4gPiBub3QNCj4gPiBiZSBzdWZmaWNpZW50IGZvciBtb3JlIGNvbXBsZXggc2V0
dXBzIChlLmcuIEZQR0EvQVNJQyBpbnRlcmZhY2VzKSwNCj4gPiB3aGVyZSANCj4gPiBtb3JlIGNv
bXBsZXggaW50ZXJmYWNpbmcgb3B0aW9ucyB3aGVyZSBwb3NzaWJsZS4NCj4gPiANCj4gPiBGb3Ig
ZXhhbXBsZSBpbnRlcmZhY2luZyBhbiBBU0lDIHdoaWNoIG9mZmVycyBtdWx0aXBsZSBjcy1yZWdp
b25zDQo+ID4gYnV0DQo+ID4gb25seSBvbmUgd2FpdHBpbiB0aGUgY3VycmVudCBkcml2ZXIgYW5k
IGR0LWJpbmRpbmdzIGFyZSBub3QNCj4gPiBzdWZmaWNpZW50Lg0KPiA+IA0KPiA+IFdoaWxlIHVz
aW5nIHRoZSBzYW1lIHdhaXRwaW4gZm9yIGRpZmZlcmVudCBjcy1yZWdpb25zIHdvcmtlZCBmb3IN
Cj4gPiBvbGRlcg0KPiA+IGtlcm5lbHMgKDQuMTQpIHRoZSBvbWFwLWdwbWMuYyBkcml2ZXIgcmVm
dXNlZCB0byBwcm9iZSAoLUVCVVNZKQ0KPiA+IHdpdGgNCj4gPiBuZXdlciBrZXJuZWxzICg+NS4x
MCkuIA0KPiANCj4gUGxlYXNlIGJhc2UgeW91ciBwYXRjaGVzIG9uIGEgcmVjZW50IExpbnV4IGtl
cm5lbCAoanVkZ2luZyBieSBDQyBsaXN0DQo+IHRoaXMgaXMgc29tZXRoaW5nIG9sZCkgLSBlaXRo
ZXIgY3VycmVudCBSQyBvciBsaW51eC1uZXh0Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KDQouLi4gYW5kIGNyZWF0ZSBhIHYyIHBhdGNoIHNlcmllcyB0aGVuPw0KDQpCZXN0
IHJlZ2FyZHMsDQoNCkJlbmVkaWt0DQoNCg==
