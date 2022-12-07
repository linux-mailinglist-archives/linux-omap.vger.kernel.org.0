Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79EB764603D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Dec 2022 18:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLGR3V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Dec 2022 12:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiLGR3B (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Dec 2022 12:29:01 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D6E3FBAD;
        Wed,  7 Dec 2022 09:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irCqsWChxCM9TKqKn4jmu4NP9fzsNLPPfTYIc/1HVO9Y6y2ty1XYSiNKo/BqxeRouGGWnakcryycgqHMRG3ciZqzPrFBm5MwXcOQZAnZm/f66PIedJ2pkrK4Bm5e49zDETbXPYjcH05OzDahjXKmDUCg107KAoAJxDItBFF2VyNkv9LnGFvzmeNCk+pAREk2it69rN/nrgMUzQNqmYqefmU1JaTa599h+6GPbHOWngs+o0u1Tl76Tz5P8wmfmo3Uv7x/7PK6OxDkqldwx3Z7jnKTOE5PH/luV8vquz2UBZ2qWnFp9LT0s9BNvYS484D8vtrEkAh0PcTfNyhkwTfeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqT4TTeg3E6/vUuCZ2uQAu317QHtEwr4sQUVCcwfCHk=;
 b=FZaKTiGZ251X5IpHVeDvnL421RIbcztX9UH2C9Enai95mrLrHT7SoEyvce77pc5zOmwKkcZrutFdkLaPWom5+nbvvxRLnho8Ik8Udsfls/BXcqm/LdLF65dWBSwGgj0jmyGJa/p7WDMo9TKHPN4fTIaloElksULU/0jQ59LKkWs/ApvMDMUw8+wQI+MZFpwQ9dLgYSMTXo40oEDRKFDOBVKBWQ3hS3NUGZuiqmXMrLXbSZoI4JWTEBawghRZ64uachM2SnbnCdGwpkKPssEmrnd5B557TgaC0x3O7HmyZt1SaO/tqMYhEO1HjQ/kZc68RPEHQyeeXwwFdhOtvsQ0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqT4TTeg3E6/vUuCZ2uQAu317QHtEwr4sQUVCcwfCHk=;
 b=UOXLCWFB62ZponkXKG71RbydnEbOIX8kLCros5VrguO6NZf5GepVLWAwbufkTs29TZ/wo7mqW3JMtfkBlKGuDWIQ2JRa6Ndm/lAAIK3t3iLrye8vE1G6g1OVvrpJEKTwNB4UYJTjc+HvQEXqJBvqfp2CwKMt9ta3h5+kMbT569am59vcZGDbnkyF1XAa8Z+iXUXxgAmCNTjj3bMASrK+fQDli44k9uBjyO2pi9jrc0PihNNOqOS+GMjhljb4UHT6HaDb6CvW/fxzxs8M3bbenpB0v52RybmU5+mtVUHwVw/8aBLRjhiurBYBDGKKlRsLzHkpDoncXRwJ0ATxi14moA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by DU0PR10MB5410.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:329::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 17:28:57 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 17:28:57 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "tony@atomide.com" <tony@atomide.com>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Topic: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Index: AQHZCkMWzmVLjxOYAU2QxNHfyRTG2q5igpUAgAAD+YCAACeIgA==
Date:   Wed, 7 Dec 2022 17:28:57 +0000
Message-ID: <cf36d335dc6a85ebafc765a4d806745cca62362a.camel@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
         <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
         <Y5CafQpZnjSSCMoj@atomide.com>
         <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
         <Y5CsDefg12Bbg24p@atomide.com>
In-Reply-To: <Y5CsDefg12Bbg24p@atomide.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|DU0PR10MB5410:EE_
x-ms-office365-filtering-correlation-id: 6def837f-11d4-458b-3168-08dad878859f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gQkpmp1066xNZAf2kfWsJzj3K7JG/JF9QUcdtJNS2H0xsKPvTbxSsTXUvladqLTofTVHrwXdvF/SG2aY2+YEYOlkI/rYyNdIs35/VIRSA4srvFIldhCxo+A+yeiQBKefMYCHJ3E2OR9Y8ZPp0m8Elczww0Qp59NrrFkmr2IYWialBA24oNzNCMw3THyCZLfUrgibbYSTH/rTS3LJ6d58PY5ZXjK3K/12pKAcmqXXQFnSEdYMr05Zo9s8m2KAzaBWo+r3fvAy/PaNfGRZAcMkoiSgL9FrW4IW8QpuTNPpbl9uaMZQUkUrcg5KT95t3QUVCiHfoyTkTKymw3g6QQDGuflvgkzE96mW0k/2rrXKrHo8/cUOw0ITg0rIDhIYutqIFWFFa5hTMzD5A6Q8qs3U5ZE7J4/3sxd6SHh9R0jJ2EnfUbZFrQCacYJqOCkY3r795jbgPpNL8pO22jxSXkqpOBoStbqrP2eiMLUCkhsNHhiGVW9VrQJKpyOMA2V59aBglkAKoh4Wi4EAvdGcgFYz7DCT/Okg5rre83YLmyA3A1yAghjjt6xNVlGJ5ddqh+TOhY1U7yI5ERC3Pl3lmEFF75ohPc65rngZksfNn9/PqWKGpAkltWn6oCuDwA2tAWnydHoFJhCg8XoBIx7Z5Qi3mCPYeSOyKi/1rskwt7NwXO1PuZ/tgwbrQmsuRKn3B1N9OXuuV87mEne1EkZBaz4OHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(6506007)(86362001)(41300700001)(71200400001)(478600001)(6486002)(38070700005)(36756003)(186003)(38100700002)(82960400001)(8676002)(122000001)(2616005)(6512007)(5660300002)(66946007)(6916009)(66556008)(66476007)(54906003)(4326008)(8936002)(64756008)(66446008)(76116006)(3450700001)(2906002)(316002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU9wUW1yVXpPd1NwcWw2TEU2UENGNFZBSFR2WFVrV29UMnBTTUtJRWNWVW1z?=
 =?utf-8?B?Q3BKYXdxMjlVOGtnTnZwQUNYaC94Z0liNmhkbk11YXQ1QUNwdnppZzdzTm5q?=
 =?utf-8?B?ZWRUeU4zWnFIc3RrWldDZUFhSDY5cGY4bXpVd0xvMTJJdjB1S3JiVDRjQWR2?=
 =?utf-8?B?a2Zla1BMOFNyeVBVbGlXK2paTEo2OHRtSEZyN3B3aTU5a2ZqV3JwcWJ5Wita?=
 =?utf-8?B?eVl3Y2JyVmZPUVAxM29sZ2p5OTlBVEJoU2lTa1FGK2NSTEE4UEhGaVgycjA5?=
 =?utf-8?B?OWRNenNYdklFVWlBR0txUHo1SVdFSVJKWS9zeGNHVzJDc3ZrYU1kNFdIRjFv?=
 =?utf-8?B?VEl2eUNRaWxuN2dzRFlDM3FEb2IxZ2tYT04wSWx1QlJSRUV0WU5xNUJUbmtw?=
 =?utf-8?B?bklBUnFtQVh0Y1VmZDV3Mk92azdVM2s3M040TUxCRyt0blVKcGhWckNpTmd2?=
 =?utf-8?B?M0VJQjdCcFY5VloxYzc1NS9lcmZnZklMdzV2N3FCQVhCN1N4MkRzbndILzZE?=
 =?utf-8?B?TW4rVVkxeE5DK2d2Z1k0VlJCblNpaldOOC9KWWxJamQrWHNGMFlNamxFRWND?=
 =?utf-8?B?TWJaN0QvaU9vTUtjZ0JrMEJLd2V4eTM4UHY2R2Q3NHFjZUFISXd0clNvb3RU?=
 =?utf-8?B?WWl3YTZGRFArSEhlZSswZHFyV3pZbEc0Rk83NnY5c0xMVlhNSzRRa1BpaW1D?=
 =?utf-8?B?WVR3aWt3bDZQNjlDTlRFOEE4MndJMzY1ZDlQdlIxQjZ1N1Frblg1SFBPMEdH?=
 =?utf-8?B?TDY0R2lCTXZuYlBxSEk1R3orbDhZbUJ0YXdLQkVncWsxa3ZvN2RkWm5xemdW?=
 =?utf-8?B?S0JrT3VadStWRFl3MDFVTTZVakpEQk9MNS84Y0JMUjN5ZHhoMTRYWkdoVWRi?=
 =?utf-8?B?Umtsd092L1hhcnl4SzBNQUw2bnp0UmRXblNUYnZyLzBiU3hMNHNZbVRJUnBX?=
 =?utf-8?B?VHI2dVdRWU1ha04vL1JQOEZaUHFHUHZkME82QTBabFgxajlFK2JzVlpxU0h1?=
 =?utf-8?B?dS9NOTU5MzBNRG1jb0VNWHNGNzJ1S3dzdFA5Z3U5aEhPSG5RazQyV0NqRlJu?=
 =?utf-8?B?YTljM1c2VW82aDFpWEc5elRhT1hLNzJvaVcvd2FUVVF3V0pjbW9CbFBVUlpO?=
 =?utf-8?B?OEtaRWxYMTJSV3lqRmhXWllMRUNncHVvQmYvcUVnZm8rQXhRbjMzRXpLaEV0?=
 =?utf-8?B?L043bDE4aDhFMmJBazJDZjZjNm9sdnJaNFhweXlLZ3h4SXM5UExseFhCMG1F?=
 =?utf-8?B?cWJORytiMXNpQ0tUTXBzQytNcjM3S2VXQjhyME5hMUlDaGpmSG5KUjdhMXIr?=
 =?utf-8?B?WjR5VjRHaEk5c2tpc0ZKM083RkhZb1c2NUZWUWdWS0NGclQ5SEFFREJmUWZ0?=
 =?utf-8?B?WUhOaXA5MEJ4ZnExd216K3pXVnBFRy9RRTZIazROaTcvcmZEdVdGV3pYaEFE?=
 =?utf-8?B?VWNVUWdPL2ZTZVZkU3ViT3BwWHQ4aGwybUN0Sk5nbThsRkhBblFEK3Q5OEZ0?=
 =?utf-8?B?MG55U05mZDVpaHpET2hmaEpDVVNvZndYQ3JabzdXd3NMZHMzUS80TFFISnpq?=
 =?utf-8?B?UlVWL294bHRoTCtFZVFZYVFGTFc0ZkVRTEUzSHpkcDRBV0VIK01SZ1pzVFll?=
 =?utf-8?B?cC9YSldGb1RnaFQzY085SGdQdGpza0lNcHkvQXM2SU9QS1RsOHlLeXFMNjk2?=
 =?utf-8?B?ZTUwVmtZUFVUd0ljVGpKdWpCSjJGQ3BZR0xucHBwS3FGUnlZTlhLRTlsdXpz?=
 =?utf-8?B?bFdNNTNCbnNKbC9MQ2N3NXRJM25tMkZzOVBVNE5TQjRRUHg3eU1sQ2g4OVor?=
 =?utf-8?B?b3ZFMjU2ekpGbVVzdE5IcUtaV0NqQzZDQThIM0EyakRxZHdJQWVwZG1GR25W?=
 =?utf-8?B?b0IvSkpqa1UxamNQTGxhVzRuV29ibUs2d3ZlYjJsYlJtVnUrWW5HVWlLV3Ji?=
 =?utf-8?B?eFpEOEtGK3g2MER2cFQrZ1hZaHNBUEVJalFxQjkyeUZXNTkxSWh2TkZBaWcr?=
 =?utf-8?B?RXEvY2VvWW1zc240VXFIU3d2a0JBN2x5QnZSR0M4VGI0QlZQZTBYZ3NiNnVp?=
 =?utf-8?B?YWZINVdpYU1tNjlkQ096M2ZzMUFPV01LVkJ2Qnk0b0JnL3JMakF2Sm1GNlRq?=
 =?utf-8?B?T0VUQ2lTcXZMMWlTY0VSQmNIS0pkU3p0MmJDTnFacUVjMU5iMHVrN2NNbVhr?=
 =?utf-8?B?cExaUzNaUDUwMjd6YzJ6K0dxN3Nzdm1LUmMyWHZ5OG53WDVMVHhVR2NmYitR?=
 =?utf-8?Q?wBItJltyRg6/siHB6chHhbfKvxX5ZCQrUXXok4gdHg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <545EAC8891D9CD459009A59518D00FD6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6def837f-11d4-458b-3168-08dad878859f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 17:28:57.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDKPCPMgjRp7QhPdEcDFarthMs7TVKNT1eMGGvniP+/+R8USpHE2rS+LKGSL26DBPx32oJee3TVAcUBUrhuF9fck/XfMP+j4x03Nt08rtco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5410
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgVG9ueSwNCk9uIFdlZCwgMjAyMi0xMi0wNyBhdCAxNzowNiArMDIwMCwgVG9ueSBMaW5kZ3Jl
biB3cm90ZToNCj4gKiBOaWVkZXJtYXlyLCBCRU5FRElLVCA8YmVuZWRpa3QubmllZGVybWF5ckBz
aWVtZW5zLmNvbT4gWzIyMTIwNyAxNDo1Ml06DQo+ID4gSGkgVG9ueSwNCj4gPiANCj4gPiBPbiBX
ZWQsIDIwMjItMTItMDcgYXQgMTU6NTEgKzAyMDAsIFRvbnkgTGluZGdyZW4gd3JvdGU6DQo+ID4g
PiBIaSwNCj4gPiA+IA0KPiA+ID4gKiBCLiBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXly
QHNpZW1lbnMuY29tPiBbMjIxMTAyIDEzOjIxXToNCj4gPiA+ID4gRnJvbTogQmVuZWRpa3QgTmll
ZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbT4NCj4gPiA+ID4gDQo+ID4g
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBzdXBwb3J0IGZvciBzZXR0aW5nIHRoZSB3YWl0LXBp
biBwb2xhcml0eSBhcyB3ZWxsDQo+ID4gPiA+IGFzIHVzaW5nIHRoZSBzYW1lIHdhaXQtcGluIGZv
ciBkaWZmZXJlbnQgQ1MgcmVnaW9ucy4NCj4gPiA+IA0KPiA+ID4gTG9va3MgbGlrZSBMaW51eCBu
ZXh0IGNvbW1pdCA4OWFlZDNjZDVjYjkgKCJtZW1vcnk6IG9tYXAtZ3BtYzogd2FpdCBwaW4NCj4g
PiA+IGFkZGl0aW9ucyIpIGJyZWFrcyB0aGUgb2xkIHNtc2M5MTF4IHVzaW5nIGRldmljZXMgc29t
ZWhvdyBmb3IgbmZzcm9vdC4NCj4gPiA+IA0KPiA+IENhbiB5b3UgZXhwbGFpbiBob3cgdGhpcyBi
cmVha2luZyBjaGFuZ2UgbG9va3MgbGlrZSwgaW4gYml0IG1vcmUgZGV0YWlsPw0KPiA+IEknbSBh
IGJpdCBjb25mdXNlZCBzaW5jZSB0aGUgY2hhbmdlcyBvbiBvbWFwLWdwbWMgaGF2ZSBub3RoaW5n
IGluIGNvbW1vbiB3aXRoDQo+ID4gc21zYzkxMXguIA0KPiANCj4gVGhlIHNtc2M5MTF4IGRldmlj
ZSBpcyBvbiBncG1jLiBJdCdzIG5vdCBmb3VuZCB3aXRoIHRoaXMgY2hhbmdlLg0KPiBTZWUgYXJj
aC9hcm0vYm9vdC9kdHMvb21hcC1ncG1jLXNtc2M5MTF4LmR0c2kgZm9yIHRoZSBjb25maWd1cmF0
aW9uLg0KVGhhbmtzIGZvciB0aGUgY29uZmlndXJhdGlvbiBleGFtcGxlLiANCg0KSSBmb3VuZCB0
aGUgY2F1c2Ugb2YgdGhpcyBidWcuDQpBdCBsZWFzdCB3aGVuICJncG1jX2NzX3Byb2dyYW1fc2V0
dGluZ3M6IGludmFsaWQgd2FpdC1waW4gKC0xKSIgaXMgcHJpbnRlZCBpbiB0aGUga2VybmVsIGxv
Zy4NCg0KTm93IEknbSBub3Qgc3VyZSB3aGVyZSB0byBzZW5kIHRoZSBidWdmaXggcGF0Y2ggKGxp
bnV4LW5leHQsIGxpbnV4LW9tYXAsIGJvdGg/KS4gDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBU
b255DQoNCmNoZWVycywNCmJlbmVkaWt0DQoNCg==
