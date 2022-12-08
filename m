Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1EF64739E
	for <lists+linux-omap@lfdr.de>; Thu,  8 Dec 2022 16:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiLHPzI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Dec 2022 10:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiLHPzG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Dec 2022 10:55:06 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3459A54344;
        Thu,  8 Dec 2022 07:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC8GwiRkXgm3jwahRQEQs3GCZbsIOdtWUw80jgpbJVmTTnBy5VKzScTG6azsdDlMUWl9qDFJGTYSC6g7NCLEDK4NSPpBk8SL2jrm4K++j1awmeUJx3K/w8LZ8cgR0KCXu8vXJ6hRuW9ZlfEFj0nEGnSn/ShO9fLRqNeF6nKBSmR3uhNzya8bRYQ34mE6hhfwmhT6fsHnwYgPG1+bUDjdsW8H4hDH1HXhzPY26+SXi83ZWeOA96SV4BSvDjBxlAj6bMvMGHPgyFjfCn5VRXNu+HvySvtXG9+JIvBHafW9cqX+Kds/jRg4Pqp5T2pAUCIHBtZUS+5667AJYYfHuZKqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/2fbKxziLPrILFTafgppXQGhy4+eFDMY3cI/TKPV5Y=;
 b=dNUJGhvqMBvxGfiU/pFdQnMY3pv+pK9fhlf7/zAe2HQis2LXMKXGyLkCB/ZdZrGJ5bKs6XxIgvBtGpMnUSZxmgKDvYcZZLKW/SENA31x0BXy8gF8qTX4J8rbf2Bc/lhD4RHdgOitifxy5zpGQvTkuyGJqgfdybz3ZjJYJjxaMybboemFCFUqIdzWi/XWcGv7KBwjzoFnKIdokvZeWAfV3gQ9RLVT0yr3wW2Xb/CEft1Boh28yP5IdySWHnUbC0xXBbj9YZ6MzDQVGxkiC2Pui48g3PpHBu6koX0GstvqUTCwxFBj6In32J4nryMNdptg96ey8cJUwe94ukQNlTPTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/2fbKxziLPrILFTafgppXQGhy4+eFDMY3cI/TKPV5Y=;
 b=q+WwisoIlAjoUIIFXdXR+s1GY8YEZUkfLh1X59LkX7qrB6tagrxa3yQMdUH9ynHPBY9pZgPNHexTQgdHfSpb1JO1Pb1SPjiZWUKEylOTp0P7Gx577P4Obi6ahsucsOwHVENegds3Ongotb/tKgkZnq2fHwEAXLj1Llikt6FlmdP/WmMaw4K1MMNfl+6WX3GcnuPYW6nNHT4br5scLBxFFE7SpWHSS5MepGvaJbyoEXFj6Zbqs29DdGYaSC9NnlqGdquGthcXLOsnTJijYrdQFlifhJUahKnS50fRBKy/ZvHXHUa41a4NCd8Q8wglKnmu4Fq5kQjVdV+VGsEEWg9zYw==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by PAXPR10MB5591.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 15:55:02 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:55:02 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "tony@atomide.com" <tony@atomide.com>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Topic: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Thread-Index: AQHZCkMWzmVLjxOYAU2QxNHfyRTG2q5igpUAgAAD+YCAACeIgIAAzyGAgABHi4A=
Date:   Thu, 8 Dec 2022 15:55:01 +0000
Message-ID: <b72c7b7aa5978100c2e925cf7386e2ecdb39aa5c.camel@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
         <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
         <Y5CafQpZnjSSCMoj@atomide.com>
         <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
         <Y5CsDefg12Bbg24p@atomide.com>
         <cf36d335dc6a85ebafc765a4d806745cca62362a.camel@siemens.com>
         <Y5F69xtIPM87iklg@atomide.com>
In-Reply-To: <Y5F69xtIPM87iklg@atomide.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|PAXPR10MB5591:EE_
x-ms-office365-filtering-correlation-id: 2d7acc73-5414-4eb7-0f17-08dad93490ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWZarf1hAAUhoO5vJUOUmcmCiFUgihaHBdNc3gpcBhh+sVSNf4dVgdVfj31ch24Q0haQ0mzpWWaRguh79Vcg0h07JDei6/W8Cf6D0SIHCQrdcF1D+NNhlUsm+XaeRrgQkfFKJUbubSQm2Bbj9fRTo3YRtAshOkOwvZU96HpX07cVelM5YBIoYbBYJa6032XTPqKYDbrQ+9jBzpVW+2tJF2vUSf3B7HBR5FweICC56uoUGrz1/RayetwLPxAPHmAcs5d5Du2mVqIOpqVf8icSDa+ICIzjg0GlJ7PUjSSjuhkmIbdiHdDyqdZeH1nvzQYh5MySCgmhprGxF0G+EvTalrQNFkLKjkYKnKa75FOiHQWFe3iet14OYuWBlYkC04XYbe70ylH3rGsXZ0e4f7yBuE+V/DAcPNDYlw6r0HTq018/nYOJgzgeUPlxumB9xRUixQNTfVBsHGLUm+wZVbSbsXQQJRz+UsF9rhqbkNHfMl9KEIgm/kv+ZLQEJncb6amyN15bZztwM6IJZZR6x45ii5mrUSUJeYoNjMNFRre140LHLB3iyyE63CA0D4gkx+u1iBJL+FIUu+F8K6lhwR3yBQoZPcOpOoKfEBrqPyeyiVVi/L1uIWjiyHeve1Wzbmp8tArRA3UwNA1otPbkk822r6lLKcFH1w7EirUOrBPVwJPHQIY3BPzKIV6eNb2ECCQZFOJHxjwrzXhJW4VohzsglQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(2906002)(3450700001)(36756003)(66446008)(4326008)(66946007)(82960400001)(5660300002)(64756008)(8676002)(66476007)(8936002)(6916009)(4744005)(91956017)(316002)(54906003)(76116006)(41300700001)(86362001)(66556008)(6486002)(71200400001)(38070700005)(6506007)(478600001)(6512007)(26005)(38100700002)(2616005)(186003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVQ1aGtWd1FzVXlncGcwYjF6VkZIUXRoRTVKaEpIdnZZK2JSUVJ6S0hjd2pn?=
 =?utf-8?B?KzFia1lzL0s2bUg3bm9EbHphS080SDhaZWhBMUl0V3NsWU9UQWt3WjZCU2Zr?=
 =?utf-8?B?UVdRRlNCY01IdGhZUEcreWlxcFM0eEpqd3M4bk5YMVVQQlRTaHFBOTVrV1NL?=
 =?utf-8?B?L1BoVWtLNVZzRVlkN1l0eTdYd0M3R0VpTnEvTWJqaXBIVVFYanpGcWx6WmRD?=
 =?utf-8?B?d1hoRW5QYVZuWHVnQ3BtMm9jeitlSlFQalVYNjlVWEk2a2dqQ3BnaTl3bWxP?=
 =?utf-8?B?ZnBha0MzbUlRcmJYWTlORWx5d0xKcmo2a1JlL1R2LzlyTlUxVDkyQVo4ZGJT?=
 =?utf-8?B?aHpidnFpM3dFR0RKejVQOGFHRXNxVW54ZDZuUm5KVC9mZDlOZ3puOFY0d2p2?=
 =?utf-8?B?VE82UVhURGNQZXdRTkhnQVFsZXJ1SEdib0grOEJqcTlTZjRyOU03WEg2WGFE?=
 =?utf-8?B?dUg3V1lUcHdIUkI3VExBWlhLYTUzWXlNV0dVYTFtZGdySHZUM1J2QXdTR29W?=
 =?utf-8?B?R1FKQ3hZWUxuOVFUSHFWaTlVY0N3c28zaEtBdUtUVURDS25OQUF6Z0gyencw?=
 =?utf-8?B?d0lLZkxyR2tyWW1vb0R5Z0YwekhjMG9UcndFTTl0K2Y4dTVGeEk3RzFLc0s2?=
 =?utf-8?B?Z3psQk56Y09ReFdQay8rdUJzeHBTcU9KUE1FaEo5UzJjcmoxM09hYmZFVjBt?=
 =?utf-8?B?dHVvT29TcUI0R3NjZEN6dGR4YU1WU1d5ZHBOanZGZnh6aHJuY2FuWDNvME1Y?=
 =?utf-8?B?UmtXSjJNa2c4MnMvYTZ3ZUcwdHV4ZWFQVkpOZURISk5iZmhpV2oyK01TSmp5?=
 =?utf-8?B?THg5QmgyK3FNcXUxaTRHeG84NkNoQXhaVjVlNWdDWTlGZGxmcDNhSS90bmRt?=
 =?utf-8?B?YmhocUtsd2hBTVZlU2R3RHhtbVpUek9Oa2JnRG1IVXZqMTM3UkxnMzZKMmRS?=
 =?utf-8?B?US9uWTdLdjlwVlk0dDRUR3cvVGJ0eWFrWnNHU1ZjQTV1L1dXQ3BRazFWRUQz?=
 =?utf-8?B?d2hMNlNvZ3Uwc1hMNmI1N3VVMlFxWWVHUlNxRWFNU1JnVHFtL0RhcnNiZGRG?=
 =?utf-8?B?KzJsNDg1NkxqVnEzRWxXYlJuWFFPRDc1Z1dXWVZ4MnQyamdvM3RDVURjbDVw?=
 =?utf-8?B?UU13dFREUXp1TVRPUVJKQlZUalRZWjkxNDBnL3o5cURNK3Z3RFB4Z0lMRjdW?=
 =?utf-8?B?Nk0xaVVQcCtWSkU4bGx1MEdNa2tXdHl1WjFpZDlvaHlMU0YvSDk4ZE1PTFRV?=
 =?utf-8?B?Tm53cE02ZzJlaldFNjJxS1FBZHNZWDdzTkRucXBSZUxZdzFJaVp1RUFHbUEw?=
 =?utf-8?B?cUxFRG1tL0JOTmpLa28yM2I0QTEyZ1h4ZENzSmxPL2tud0hVcE1JK0RFV2d4?=
 =?utf-8?B?UXpkU1BZYzF4cStaTkRqOXZPQkdISVRXcW1sMjdyNjlSMHN0RWRNUzVRVXh3?=
 =?utf-8?B?VVJiUnNRd1hacjEycjJETE9sMXYrV0NNQk5RdmJFcTBYMG1kTzVaanZ6aXQ2?=
 =?utf-8?B?NkIrZVhIZFR3VG85eWJXRE9XSmtOZHFqWlFTczdLM2o3azFTK1BOZlpFSm8y?=
 =?utf-8?B?dUpZZ2lGUHpiV0VvVjloN1RHaE93dE1ncEpkTHp3T29XZWREMG05Q1hHSENX?=
 =?utf-8?B?QUtzYmVKN3ZDMStTT3pYR3gyUUwyakgyM2YxNHhrK1N4TmVjQ3h2UklHL1dy?=
 =?utf-8?B?UFp2cHd0MnlSR2dZNll3eXJGS1c5WFd4dG8xMS9sN1JyVFJhZ21DcWtzV2tp?=
 =?utf-8?B?TmxpNCs0cVdqcXAySmg3UVE0dm51ODhWTFB4bEpPNzluUzFOYTBtQ3NjNW1Q?=
 =?utf-8?B?aHJqMU9YSVNhNmVXMlZnR0ZyaEQ1ZThQbkNuNVkrd1ErcGFWV3dBYnJRWm5C?=
 =?utf-8?B?THB2SkwxejNib3VxeVZYZ3hPVjBlZ2YxNnM0d3hoU1F1RmNPb2xwNzhLbXBt?=
 =?utf-8?B?NndaTElRcmwySmo2L0FpNXlhL1VPT3d3UktZa0xNVGN6NVByZFZkV013SXRn?=
 =?utf-8?B?c2FEdHR1eFVWUVhPTTFubVZISys1N3BxSU9yY2NTK3lMeEp6ME54d21kalJv?=
 =?utf-8?B?MFVFUHNDc1VhLzB3a3IrYW45MXdhWUpXYlJVMGlMWEhQMFozZEVXVjl3Rm05?=
 =?utf-8?B?MnJ3RjZaaVVDMDQrZE9nSXc2T0Z3RldzTlZ5ZnNCSHJXa2hvM3NyL1B2Smdk?=
 =?utf-8?Q?Z9XR5tQDqwwY6xxTXcvqNv0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43BCDC5C88B6AC49AFE0FAE032F72BF5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7acc73-5414-4eb7-0f17-08dad93490ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 15:55:01.9081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQ2wvJPX6qiORJUso132sLvCyo998Vl+TF2SrVcEFNn4DKUy4SgrVammRAZLTt8Sbx+CGbxYyOHKCoDIWCEmoMzMz2JOaT6DisZXpfxpd7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5591
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgVG9ueSwNCg0KT24gVGh1LCAyMDIyLTEyLTA4IGF0IDA3OjQ5ICswMjAwLCBUb255IExpbmRn
cmVuIHdyb3RlOg0KPiAqIE5pZWRlcm1heXIsIEJFTkVESUtUIDxiZW5lZGlrdC5uaWVkZXJtYXly
QHNpZW1lbnMuY29tPiBbMjIxMjA3IDE3OjI5XToNCj4gPiBJIGZvdW5kIHRoZSBjYXVzZSBvZiB0
aGlzIGJ1Zy4NCj4gPiBBdCBsZWFzdCB3aGVuICJncG1jX2NzX3Byb2dyYW1fc2V0dGluZ3M6IGlu
dmFsaWQgd2FpdC1waW4gKC0xKSIgaXMNCj4gPiBwcmludGVkIGluIHRoZSBrZXJuZWwgbG9nLg0K
PiANCj4gT0sNCj4gDQo+ID4gTm93IEknbSBub3Qgc3VyZSB3aGVyZSB0byBzZW5kIHRoZSBidWdm
aXggcGF0Y2ggKGxpbnV4LW5leHQsIGxpbnV4LW9tYXAsIA0KPiA+IGJvdGg/KS4gDQo+IA0KPiBQ
bGVhc2Ugc2VuZCBhIGZpeCBhcyBhZ2FpbnN0IGN1cnJlbnQgTGludXggbmV4dCBhcyBhIHNlcGFy
YXRlIHBhdGNoIGFzDQo+IHlvdXIgZWFybGllciBwYXRjaGVzIGhhdmUgYmVlbiBhbHJlYWR5IGFw
cGxpZWQgZm9yIHRoZSBtZXJnZSB3aW5kb3cuDQoNCk9LLiBUaGFua3MhDQoNCj4gSWYgZHRzIGNo
YW5nZXMgYXJlIGFsc28gbmVlZGVkLCBsZXQncyBmaXJzdCB0cnkgdG8gZml4IHRoZSBkcml2ZXIg
dG8NCj4gaGFuZGxlDQo+IHRoZSBpbnZhbGlkIHdhaXQtcGluIGNhc2UuIFRoZW4gd2UgY2FuIHBh
dGNoIHRoZSBkdHMgZmlsZXMgc2VwYXJhdGVseSBhcw0KPiBuZWVkZWQuDQpObyBuZWVkIGZvciBk
dHMgY2hhbmdlcy4gT25lIGNvbmNlcm4gZm9yIHRoZSB3YWl0LXBpbiBpbXBsZW1lbnRhdGlvbiB3
YXMgdG8NCm5vdCBicmVhayBleGlzdGluZyBkdHMncyB3aGVyZSB0aGUgd2FpdC1waW4gaXMgbm90
IHVzZWQuICAgDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBUb255DQoNCmNoZWVycywNCkJlbmVk
aWt0DQo=
