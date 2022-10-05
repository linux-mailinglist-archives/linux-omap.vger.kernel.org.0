Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81B05F5251
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 12:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJEKN0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 06:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJEKNY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 06:13:24 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A121558157;
        Wed,  5 Oct 2022 03:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld6R+br0l4KikghpP7aHsPPyR18zOUf0omeOz56P9rv8EekZ2IXMrt9/nk8EnVtlvifc6e0maCmaDJO0GKTV85aZphq9BaPaWW72/KuOIgtIsAgDQRPEgqKG7kwpmzoDwXLUsVoiD0jMqG4h2+vkF8jVpfAUKxtETyhxoaiB6zmDT0LCAYK88yKZN68LczWkcY5jTD9SV4A/BB5LKewUT0wUNup+D3726pTte4iyufyua78kUUJIKnip3ag4prcHrWMzDsgialeCMyi3VIqG8CGFsKJmDjBYmAQGheUHLZPvyTTyvlovUM7/e+CoFpMp1nZsU9s/Hx9PEVhlDaCVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNpRIKsTy3JED1GoNvbZG6C9KOWXrnYNZTbVveiLCvY=;
 b=HFqwcb5DmSNNGL9A9xUB8TPqI8x1YUuHbkTqpqsqiEQVRj1e9OcsENqAxxnvQ69kNZprbdBUVAkRXkpGyqoUvEIHPnQymAqnT8jKDkvKf0a5hVo11roaTf7tk3e2fe3E34zV3D1ioWF0DlYAOtFipYvcG0Gs4SmB6IJ2lJsJkN0dQVfyf6AAEZ8csk4LIRD2NZwdYQ20PaZZx5ouDbSHD6FbOh/NPz7azdS6pvi15+hqbP/n+MfJ9SMhvgHkR97Dim0w23pmW4/4AoyLja6Nej/CJF53dKCmNVLAqOBPQYl+S2mWJEjl9R+3JDjOo4kwUXAF39QhOwtqlhra3wh4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNpRIKsTy3JED1GoNvbZG6C9KOWXrnYNZTbVveiLCvY=;
 b=BZHZdHB9ozYGx6tYqCYtsBdFh1WefMh/kd62WVwQsixpiYtB8yOrTUuEMVlZo3t1PvIrbxFh125s4wEBIKXfnjaUinbBkyvQR7AXMA8U3BNvzrNaYTJdvIGSoh6ZjJGoQeeA13wUhmyyuW8V7lbVeLjp5Qdxj8scjX9JGlOP8Uua4Oyl6Tq/2y6MuCAfZOaM8/sjwH8AHWopsemiZpydirZ+cp/E9leskUJ9SCG1tB3s0ZSXm1lhppwdXDKfvI9rsKGTbAD0MaQ324pLU/j6sRv8d8eSvohloSwPa02u112eJjDL1ZIYD+coh2fKUaPTUpvVwDuBWfPOQE0Vw3aDNQ==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM0PR10MB3698.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 10:13:21 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce%3]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 10:13:21 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Topic: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Index: AQHY1QTZpZGRCiyIRE+rIrpzgAqZhq3/nCeA
Date:   Wed, 5 Oct 2022 10:13:21 +0000
Message-ID: <fc1d354d307487de2dc8e715c202affd76f96866.camel@siemens.com>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
         <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
         <20220930194257.GA756240-robh@kernel.org>
In-Reply-To: <20220930194257.GA756240-robh@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM0PR10MB3698:EE_
x-ms-office365-filtering-correlation-id: 8e9dfd9c-1670-4b13-4b50-08daa6ba3b78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: otfYICAmdFGPbvHxm13d+VcUOmKMRrYWDvtVcuPUVYkJnmWvqiDMsqQBUSQDh93Hot0Jgh0X86vzUnAHnbF2NzG81eaEi4Z/nu+q3o3EsAxsMMFJZml3P81xff8P/Mg92Hvd/WD17KkxOhMklOGbGIzrXp4YPAc4Mh6RzXZQlQbr6jmGyHjacpf3gxxQBlJM+qNpF7KTHbKNfsDHLiBO5+yK7MogEaaXyth27yHOWKYbcKyc5mfdkJcCgsgryK6PtAjsc6fkBVduooJZN22e8ZPinsaQu7kPOnQjTXf0IqNhuPUgsHqqTeZjhhqWpsCCtBZr9anWgRtaNS36sja8HiZOGJwAW/2Ct1q6xgtQf56m/wx5x8WHCfd2ZwVAY5v6S+C5avaiSWsnpiOCdV9DQueaOspGMNBYc/BLMvHiQZiZsGYWPQX7ZfF9qxEg/jNhZirWM0Knux0ci49Zw1jpup/Nd09uWKArWkOv4VLf6VSgDdFBI8qxA9VbpxDYQD5atzXPjFbFkkokqWMlpFI3kJ7moSw1jNqcmwJSZRW6n110awUgNEPOMxVqqlLh/TDcjKaJP0Pn1DAkBbaYxHvbejmQO4vFaPdAxy1sfthR2jJ8g5Gvtm5DEK+yheRGdaujZFs3y2KlSAD0+n65PNsu/E3x/X7PqyxDt0Xm0TBfqLzrtFDja/w7nGn36uAyTSrd5mKHL7QbosFwNi3TQTQuCwP6jQI+RmRPy+RVJjl2BYaoWGQAkaqRGnf91IzzjuRaDOXjrkiTJswDx87ZSVWsBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(5660300002)(86362001)(8936002)(2906002)(3450700001)(41300700001)(82960400001)(66946007)(38100700002)(186003)(316002)(76116006)(54906003)(122000001)(66476007)(38070700005)(4326008)(91956017)(66556008)(8676002)(64756008)(6916009)(66446008)(6486002)(478600001)(6506007)(71200400001)(6512007)(2616005)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW85SE5WVlJ2Zy8zZ2JxcGdWcDhqdFRpaUVXalM3MitoQWR5eGoydjR0WWZB?=
 =?utf-8?B?MFdkUTk1NHROczkrY2JFKzJKa1puK2NOYlBYRVJoczQ5bitHWi9KMi94NTE3?=
 =?utf-8?B?T0JwcjUvWjFodlBmTmdSK0lQM0N0SFpWVFh6Yk9PaVJzMGxWU3F4dkpDSVJK?=
 =?utf-8?B?bEx1STN2VlJjYXRZNGhkdkRQNUxDR2JYamVzbmM2VERoS3pwTDZ6ZjFBSGRw?=
 =?utf-8?B?L2dWcWJQb3ZvRVhiL0tmT25sb2lycnlaeGtHMGpLUGkvVjlnNGl6MExPQmlZ?=
 =?utf-8?B?eWFoZEkrV0MwTW1HUnhQM0dnU3o5MVNDZyt2UEtUakJDMnN1c0hNcjE3OXpm?=
 =?utf-8?B?RFFEdVpYT2s3S0FjWWVwNmVGSTlXV2RrcjRySkVTRkUva25POENGMUYxS2tB?=
 =?utf-8?B?Z2VGbzJkNUE3V2VjMm8xZnZzbFUrY1NGTjJ3QmFOZXF2UzZzUEtvdzllRkd2?=
 =?utf-8?B?Q3VhZ3l5Mm5ObW1rVzkyck9LaWp5a0Vza2N6blFOcEYxL0UwQTVCNnJyOXk0?=
 =?utf-8?B?eUoxQVBnSktlOUk0TWtYNGNlcmZoWExjNUdYbkVvVTlqSXQ2RU5PQ3ZTV3JJ?=
 =?utf-8?B?ZUptM0EySGtobFA1TW9vZzBES21wUkI5a2xBV0lYbkdWSUl4UlpYM2tHcEdC?=
 =?utf-8?B?ZWxQTmhoT3Y3eGN5cW1meHp0RDIvYWtqZS9udzRRUnV5NmFmeGFvNFBkcFlO?=
 =?utf-8?B?S1E3U2d5YzlXSFZpWUNhSDYyOEZGTzd0RFJBUW9CdnZiYzFSOVBnYmYxUlZH?=
 =?utf-8?B?UTNBeTdUS2RQOWphQ3pLaDNqVWZJYkFremZNZlQ2TFJNMXIyMTZPYTVIaHdt?=
 =?utf-8?B?WDJXWjRnNzQ3Q1cwemJ0eEo5bGUwKzJuM2IyR09ZbnNzSnBUSkdHS2t3V2dZ?=
 =?utf-8?B?M2N3MWdjWlZzUkdVNkVVT0lpdEFGMXVKNzdHNzVpWGtsN0laa1ZaUjQyNGhI?=
 =?utf-8?B?N004Umkrai9SbVJSTXAraVJoekE3bC9BenhIeDlHYWlUTWIvU0VzditzK0Jx?=
 =?utf-8?B?cU1EVU5idURQSm9tQ3duU1NzMUh4bXhYcGlEb2F3Y0JpSkQycE5vbnBxM2Zq?=
 =?utf-8?B?VlFCQ1dmRHFQZm9CbG5HemNMZGgyS3hsd245Q1E3eVkxNjdhcmZIT0s1bGFD?=
 =?utf-8?B?WFAvMFRQMWoybVRyVG85N296OHZDVGN1b2hxL1VWQlEzK0R5dFFPUjg3UVlS?=
 =?utf-8?B?bG1xOEpBalNUVWxRNEVreVhHSkV0eVBZNCtwLzYxazZnLzhCaWMwdlhza1I3?=
 =?utf-8?B?Y2N4UVRlalk3SW9YbTFEcXE5U0M3bWFNUU9kdGdSZlluUWpYK3VWenZoVFhx?=
 =?utf-8?B?UHh3dlVpdFA3N0tUN2dkQzNVcThSUldxMGdFNGY3RThkKzdnSkowS2xMOVdy?=
 =?utf-8?B?SnVrTXdzMHNPdVp2UHVEUVdsNmNSUWk4UnJIRlA0VWR5TU10cS9USWZMZzRX?=
 =?utf-8?B?dThyazNDNE1uUk5NNHV4Qmh5UitFcEZiV08yN0F2WkpaU1F1V2J0NUQ1V0to?=
 =?utf-8?B?M3NtVEZCMFgzRit5V0FWSU1NQjdSbTBQeStwRlhkTkRiSlFNMllLbFN4azVS?=
 =?utf-8?B?azNMRVNkYk9YazMyVGpwUlExMFJmZ0dJQzBCN3ZPR09mSk5iQ2tGQnhuUFNk?=
 =?utf-8?B?ekNIVU9XaXJjbjBPcG5rZzF0MTFubWhwelVDZE5uV0FSVFdWU2E1TTd4Yk5q?=
 =?utf-8?B?STRFRkxBdUd6Z1FJcGE0YW9heHVjdityVHBXQTVQc0IxNmxsL0hkeWZ2REIz?=
 =?utf-8?B?RVZ1RXZvbXNmSWczd0lCYTZMOVo4OEVYaG1MUWFEaUpRRnc4aTFhcnhTN2tr?=
 =?utf-8?B?eTE3eXVtMUJTdWhRelZZc1R4UEIydUk0cHVtOStLRVRIM3gvWUZacG00WFha?=
 =?utf-8?B?UUpiUnBIbGp6b0cwSjU1OGk5YUlkM0tEbUhqaWVpd2RYRW5CalFhM25DbHhP?=
 =?utf-8?B?SGFaUmpHVk5aRkJHNFdNNkc0QkszVUNib1lqVlRwbWpwRmtxL3J3UWxESzUy?=
 =?utf-8?B?QXM3VGJOcFpiZFJIaU1Rc3NPUUd4UHVQU2pDbVhNZ05aN0RJR1BuTEQ5SWVx?=
 =?utf-8?B?Y1Vnb2UxVjVlSFUraktTT1M0cjVQWXR5aWdYbGhObHpJY0xiTDlrZ2hBOGtM?=
 =?utf-8?B?N3JGbDZwaDllQUtJSlhyTWJ4ZUpGZFJaS1VkNkZSMmN6enF6TFVUREJ4NG9G?=
 =?utf-8?B?czBhcERURVRIYWRDM2E0a3V6NGI5ZkI2UXlZTkFPeGk1Ync1WEJ3NHBQY1o5?=
 =?utf-8?Q?fZydQVdnSwczLqZDwv+pW7GA9Qb8CWe9yZkHmZ7Q1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0740AEB8BD4CA64DB122C3AAAC29D5E4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9dfd9c-1670-4b13-4b50-08daa6ba3b78
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 10:13:21.7900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOxL+ntgrKohLciIfMjS/lZ2fOcBEzpSMZaNVUhzB6pMXeNQfUB3QnBtWH2w+Fk3vspNEr+ZtciPEoS+LjqsnENwNuaoJlnIlUwwKA5srgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3698
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gRnJpLCAyMDIyLTA5LTMwIGF0IDE0OjQyIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBTZXAgMjksIDIwMjIgYXQgMDI6NTY6MzlQTSArMDIwMCwgQi4gTmllZGVybWF5ciB3
cm90ZToNCj4gPiBGcm9tOiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlrdC5uaWVkZXJtYXly
QHNpZW1lbnMuY29tPg0KPiA+IA0KPiA+IFRoZSBHUE1DIGNvbnRyb2xsZXIgaGFzIHRoZSBhYmls
aXR5IHRvIGNvbmZpZ3VyZSB0aGUgcG9sYXJpdHkgZm9yIHRoZQ0KPiA+IHdhaXQgcGluLiBUaGUg
Y3VycmVudCBwcm9wZXJ0aWVzIGRvIG5vdCBhbGxvdyB0aGlzIGNvbmZpZ3VyYXRpb24uDQo+ID4g
VGhpcyBiaW5kaW5nIGRpcmVjdGx5IGNvbmZpZ3VyZXMgdGhlIFdBSVRQSU48WD5QT0xBUklUWSBi
aXQNCj4gPiBpbiB0aGUgR1BNQ19DT05GSUcgcmVnaXN0ZXIgYnkgc2V0dGluZyB0aGUgZ3BtYyx3
YWl0LXBpbi1wb2xhcml0eQ0KPiA+IGR0LXByb3BlcnR5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy1j
aGlsZC55YW1sICAgICAgICAgfCA3ICsrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy0N
Cj4gPiBjaGlsZC55YW1sDQo+ID4gaW5kZXggNmUzOTk1YmIxNjMwLi40NzcxODk5NzMzMzQgMTAw
NjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy90aSxncG1jLWNoaWxkLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0K
PiA+IEBAIC0yMzAsNiArMjMwLDEzIEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgIFdhaXQtcGlu
IHVzZWQgYnkgY2xpZW50LiBNdXN0IGJlIGxlc3MgdGhhbiAiZ3BtYyxudW0td2FpdHBpbnMiLg0K
PiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+
ID4gIA0KPiA+ICsgIGdwbWMsd2FpdC1waW4tcG9sYXJpdHk6DQo+IA0KPiAnZ3BtYycgaXMgbm90
IGEgdmVuZG9yLiBEb24ndCBjb250aW51ZSB0aGlzIGJhZCBwYXR0ZXJuLCB1c2UgJ3RpJy4NCg0K
WW91IGFyZSByaWdodC4gQnV0IG5ldmVydGhlbGVzcyBJIGNhbid0IGFncmVlIHdpdGggdGhhdCBp
biB0aGlzIHBhdGNoIHNlcmllcy4NCkkgZG9uJ3Qgd2FudCB0byBicmVhayBjb25zaXN0ZW5jeSwg
c2luY2UgYWxsIGJpbmRpbmdzIGN1cnJlbnRseSB1c2UgJ2dwbWMnLiBBdCBsZWFzdCB0aGlzIGFw
cGxpZXMNCnRvIHRoZSAidGksZ3BtYy1jaGlsZC55YW1sIi4NCg0KSSB0aGluayBpdCBtYWtlcyBt
b3JlIHNlbnNlIHRvIGNyZWF0ZSBhIGNvbXBsZXRlIG5ldyBwYXRjaCBzZXJpZXMgZm9yIHRoYXQg
c3BlY2lmaWMgY2hhbmdlPyBUaGlzIGNoYW5nZQ0Kd291bGRuJ3QgZml0IHRoZW1hdGljYWxseSB0
aGUgY3VycmVudCBwYXRjaCBzZXJpZXMuIA0KDQoNCj4gDQo+ID4gKyAgICBkZXNjcmlwdGlvbjog
fA0KPiA+ICsgICAgICBTZXQgdGhlIGRlc2lyZWQgcG9sYXJpdHkgZm9yIHRoZSBzZWxlY3RlZCB3
YWl0IHBpbi4NCj4gPiArICAgICAgMSBmb3IgYWN0aXZlIGxvdywgMCBmb3IgYWN0aXZlIGhpZ2gu
DQo+IA0KPiBXZWxsIHRoYXQgbG9va3MgYmFja3dhcmRzLiBJIGFzc3VtZSBmcm9tIHRoZSBjb21t
aXQgbXNnIGFib3ZlLCBpdCdzIHRoZSANCj4gcmVnaXN0ZXIgdmFsdWUsIGJ1dCB0aGF0J3Mgbm90
IHdoYXQgdGhlIGRlc2NyaXB0aW9uIHNheXMuIFBsZWFzZSBnbyB3aXRoIA0KPiB0aGUgbG9naWNh
bCBzdGF0ZSBoZXJlIGFuZCBkbyB0aGUgaW52ZXJzaW9uIGluIHRoZSBkcml2ZXIuDQo+IA0KPiA+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4g
KyAgICBlbnVtOiBbMCwgMV0NCj4gPiArDQo+ID4gICAgZ3BtYyx3YWl0LW9uLXJlYWQ6DQo+ID4g
ICAgICBkZXNjcmlwdGlvbjogRW5hYmxlcyB3YWl0IG1vbml0b3Jpbmcgb24gcmVhZHMuDQo+ID4g
ICAgICB0eXBlOiBib29sZWFuDQo+ID4gLS0gDQo+ID4gMi4yNS4xDQo+ID4gDQo+ID4gDQpDaGVl
cnMsDQpCZW5lZGlrdA0KDQo=
