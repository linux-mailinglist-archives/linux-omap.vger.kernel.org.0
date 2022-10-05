Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8E45F5336
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 13:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJELPN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 07:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJELPL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 07:15:11 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F4D1E705;
        Wed,  5 Oct 2022 04:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvVzNFF3KjQykLMnBZ8dx5vwXhm6IFgeLPW8wq8+Lwm/d8RuuRW+77SJucwtI4H7t05KKRYx6KWTUCW5BQ4SyRJS3XPQKHkwh4bqnn11ag7j8lFjXZsz5qMP5LSx77akqAv0HFGD4uKaqSM/JgV10Pji/RX8nbM/wX+U11ETcTVGKOIdUrCim24Vg2Lbf4uf4lN4Z+jGkU6OR+0S5grufuuCgEF3Wf1doV9CY2jINTGx04pezqFkA1XwzYLprzJOEnsx6fhv3BC6sIlAssO96vTs5mils8rozqISQH59xlJ7XGOmagwnNifanIXWeZWlL7EvYhzcqMmb1uYafilXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVRraUyF1wQsPfQ8TioC1GZblK2AS69v/ow1EDirMlE=;
 b=YTN3qUyKZxKiH5KhhWlPZqDiqTSX/f/qx19/QeCIgIwyA4dPs0ie/5Jpu6mE1TUYzUgLf6aJHG2XHjTvFgRQQJdLEzUuELbMFy5QRT4CeHeBJmiO84MJi2qH8sBsWldFEZDRCHXSiYXmaoLosl7+3LBcV/owcX/liChD/RnI0fWMG75KK6qUATUeOvTiAE0LWGW9tP65pf8vT3/O5qd+uL2uv4Ryap/tFReOxb7slPGhja0fuQ7lZgBqO664oRtjW/uLj5rdYMK6E/6XyQpHi0NClUU95JLnz3bdVhQj7ZTBzCxoJaS2WeaAqwlHqpHMxGMU644iSBnLQ6FJgoShJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVRraUyF1wQsPfQ8TioC1GZblK2AS69v/ow1EDirMlE=;
 b=Y6bSG8Jklle29DyVp+m2SQ5HCpVQERaDG1V5Qk7OMJDEcp8gyiKqgNpPbIQVJq8QqYteea5H1h3+yIQLIhChKjXv5sg6bT40XhctyqLkw3IlSQMDS+HEsAQ7cnMR2mmHOHFywR5EL65LoYaJ54oiDOSi/td1fV0uBzJ5OcWpm5xb37C+vNILJn8FLzcJ1pun+IUqzTWG4jkwy0AzYg7NnINDMj2PAqVm4ipjKCTeC1Kt2ox4osY8e+F70dOOIP3eC9yLKPVQwJOKxXaAdwqvh7G5Mb150w1xbyuY3oAXBs2WEsoiTHOzspeXjY38DET1HyuSp1tJ8pQkHiQRDhgQ1g==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by VI1PR10MB3518.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:140::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 11:15:06 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce%3]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 11:15:06 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "robh@kernel.org" <robh@kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Topic: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Thread-Index: AQHY1QTZpZGRCiyIRE+rIrpzgAqZhq3/nCeAgAANOwCAAAQGAA==
Date:   Wed, 5 Oct 2022 11:15:06 +0000
Message-ID: <e027fca3934232f9f6f569fcccdad0f9a07f0c3a.camel@siemens.com>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
         <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
         <20220930194257.GA756240-robh@kernel.org>
         <fc1d354d307487de2dc8e715c202affd76f96866.camel@siemens.com>
         <c97db3d3-ccb2-fef5-070c-901053e6e353@linaro.org>
In-Reply-To: <c97db3d3-ccb2-fef5-070c-901053e6e353@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|VI1PR10MB3518:EE_
x-ms-office365-filtering-correlation-id: 69437917-eb9b-4a93-da7e-08daa6c2dbb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jkr4RouwrvJXbtBK7HM43wwjEw1BjbCWA2MP3mfQ9uHFg23tP7MbNmebzT/ItWFasSQFhoy9c0GrZooMeXpInd06dkV2dFIuvhyuMjAQ+UGtiYNQIEoP5Kdjw1+1KsgJgzbbNQLt1sgyoc4pQnHYMtcHeAntEpJ50CfFVjBGRVgRYRxgsDXR/L/sZdKZ3NtcP5q4ieIKUjzce/+1Giknz090RC7nBc9N6XHNaaCK+R6huvfQ1JvD7mmfjJpaRPFjcOKXuytC/QwV+AoTCBJ6beHwClCDqdoQ/tyzb3vRmmehkKEX397SyyqBk0Ruif8odJ1L/LPrRzpmw/WkMPYmfGBAwGG+6PZmCsOnkJLJT2+rDeP7ZSNNZJm4qwKLrdzGQiwvSfNSZweBtl/TVPukBZ0nMrMTBDpAY+on47pT2cGaKfRtHwdyJyVTlpVcW+WcY4fdWi2ylC2Kt0d5XZ7ksrcjcoILTYBpHpOeE2CqNCGFejb3UHwx6pMMNNbieonAnG3DPsSKxw98mLZnwYHDCHUqaM1CzF+FcpxqWFT8xWpf+KRRRzfojFqexhPKtVX/kAxVauuSA1zp+7EDRLT+ZskMeSEeoJn6Qh9Rrv8qi7SFqIXmAwiGNnsaoKQAsa6yhtwpBKe8M/B/zNyr8oWt+gEGkCTLG8H6i1/aDDzV06W4xImta8Cp5Pd6l/oAZvUPPMTVrxZRjaqH0dusftuabvh6/moHqNIHY1Smf8OtnOstWBsjO8q3YR/XP5rXbp8Cytyls7Z/2NIoBcoOVKFLXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(71200400001)(41300700001)(82960400001)(83380400001)(2906002)(5660300002)(6506007)(26005)(6512007)(316002)(110136005)(54906003)(38070700005)(53546011)(91956017)(64756008)(36756003)(66946007)(2616005)(76116006)(8676002)(66556008)(4326008)(66446008)(66476007)(186003)(86362001)(3450700001)(478600001)(38100700002)(6486002)(122000001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWpXMmtoNEI2L3N4bWg5bmFpYTd0T0VkUU12N1RDTkRxTzBBcE0wWVBLRWlR?=
 =?utf-8?B?MUZYR3pKT0pzb1lrbDJCTytaMlJzYzUzM213MkNaUzhFclJUc05odE9TSnUy?=
 =?utf-8?B?M1Y4UE9FUmhzeFpUMFdjMHhLQ3BMdnM3bW9WQ012L0JQU1RsRjdXMUR4UDd6?=
 =?utf-8?B?cW1EMG5kS3dsRnAwZVlHQ2hGbGg4T0RLdyt1VFVUOFFHTExxUUlZMXZVdDF3?=
 =?utf-8?B?NWNNaGZQd01XZzFkSlhYSnFSRHdQa2R2YkxpYjgzZCtDKzJSYUhXZWlXK1NM?=
 =?utf-8?B?SEtqTUk5Z0E5WFBld2FJOEx1UUVCQ241SkhaVFlBUmVDSlp4cHowQ0Rab0FQ?=
 =?utf-8?B?UTZmdys3VXh5TnR1VWY3RHZ3RmNjWXdyQWo0ZDd4SmEwVEJISUlYblBjWHlC?=
 =?utf-8?B?djZ3YlBzcWxKb0xWcWxYTlgvV2g0ZFlqSlNpems4TWxkT3A2blcwRGcvTUdi?=
 =?utf-8?B?em8wWXNaZVQzekRpeFRSMmpGck1SL0FBNU9USmd3N1RPZjVjQlV3amtUOVNZ?=
 =?utf-8?B?N3BVU0lmR1YzQ2FISkxjWGFvWkxnNTh6SHFCWjE5NnBVZG1jOTdyeUhaMms3?=
 =?utf-8?B?MUNZRTBuWGVZVDQ4ZjExRHgxNkl0aUxUb25XdmhtajBSYXVvTjFSTHl5NGNk?=
 =?utf-8?B?M1ZWRGhVR2txQkZEVEVzNjRUWXl4WCtMYmdmNTE0MXNSektkOVhKYnhJMlJN?=
 =?utf-8?B?bktYVnMyVVJJSzdVRmc2KzNoOGs0eWJSWVVxTklsWVZDWkFvSFFGQ2lORVMr?=
 =?utf-8?B?aEQ4QlNmMUJwMVFycHM5a2ZZRm1xaTJ0aGFkK2oxNXdkRWdiMHZ6UzdWelN5?=
 =?utf-8?B?aWozUzZVa0FWRVdibDZ5YTN2dmVWWXhVMnQvMkVWeWFjUitESmN3Q015YnlF?=
 =?utf-8?B?bURIQmFNOVRZVks2Q0xCQVI5VUNRYTd6TDZRSVR6d3pUZWdhOExMblVIbmkx?=
 =?utf-8?B?ckFrMFBrL1JOOHNscnpTd0xoNTIwWUpqUkU3WnI1OVY3MHk4dmsraWdxbXZ1?=
 =?utf-8?B?STRrS2Nrb0lGMU1nNjZLTUhaNTBodmU0N2tYRVlGd2dqVWR3V3JnM2tXZzB6?=
 =?utf-8?B?MEZqK0NmbncwTS9HMXMvV005WUp4N0tldXhSYWlsR1pUa2NNQ1ZXaHdUS2pK?=
 =?utf-8?B?ZTNVVTI4dUNVbkJBaGVXdCtmRDdEVlJhOUhONS9JY1p4YUQvZEZRempBajBY?=
 =?utf-8?B?NkFWdWlnenpqWEkvRnlKMElTbzQxSmVCOVBPSFBEOUIzNzNUU2dEMXZHUzdk?=
 =?utf-8?B?Z0dEQW44LzRSME52OE5kOXA5YU9jTEZuanl2WUM3L3NrU3Aya3RkVjZHT1hj?=
 =?utf-8?B?KzZIS2NwWVJQMmpNTTJOcTA2VG1rYlFUUnQ1YVdKM2NtaXBBY0MrQXF4SlFo?=
 =?utf-8?B?MVdZNEFXcjUvWmNXdTNxZGJMc3pPZWtXVU1XRVRIRTNxM2Y5QXFwN1p2QjVp?=
 =?utf-8?B?enJ6RVdyVHkyZlpoVmVHcDBmZnBmT1dVSGZTSFlrZ1RpZ3VWOWw0RG5FWUE5?=
 =?utf-8?B?VmxqUEVHT09Ub1ovaVU4WTdMeHhpYTVYWjgvMlkvbTlvNVhMNE1OcUpra3h2?=
 =?utf-8?B?ajhrN3pySkplNjh2ZjNCRk4veGZvSS9uZ2pSRW1vRXJMMm1NY3oydnIwUjF0?=
 =?utf-8?B?Nk0rdUMvMGxRSjR3TllTZWtKdEZFNjl3R0JFR2ZDMUJWZHplT3lIWjVzNmxv?=
 =?utf-8?B?L3Q0bHlDemFNSXNDRzFPVWtnQVlqSHRXMzJ6OUdJV0pUQkJUclE3anhzOWZI?=
 =?utf-8?B?ZmI5OHR3NmNaVmRMK29GRk9WWE4ydlhKeGR6NjFpU1NSZFFYREFETEpuSGpM?=
 =?utf-8?B?RGZXa1pEeFpYM24xQ1VBSDVZVkFCZjluQUZZUjE0MVpBeUgyUzRJVWsxdkF3?=
 =?utf-8?B?MHE4SGRDKzZ4WHgwem54WkNzYkpLM3hwTGxlWkpnVklVbXNWT2loQzVTdVl5?=
 =?utf-8?B?RkpoeU9jam5nUDZ3a09FMUdmL1hOWXdaL0p1VXZZdmdVK3ZITkoyQlpZeDFW?=
 =?utf-8?B?U0t5NmNWRlFBTjEzTm9DYjZRWXVXWTlWWkJBaUdnRUZFZlV3clVSN2l0ajhB?=
 =?utf-8?B?SnFMY09GMTdKOGlNL0R2WjBUNUE2WndmQmpJZ09qaVRQTTJhQVVhei9RQkRk?=
 =?utf-8?B?R3VXa09wY1hGbHNJWEw2cW5zRnBXemdQbXlDY3UwcjVPYmRDazBIQys0emxv?=
 =?utf-8?Q?oN4OJ3pulRvQ+PJb07sI8tQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D6A3EFC5B322048B9BAAE5588BA3B15@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69437917-eb9b-4a93-da7e-08daa6c2dbb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 11:15:06.5922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcAoKrbtFwgO37DBNV924atBiS6o1/DfIu26StyS94vG9FiBDK+50LsjmFZpjIcnB0xyVw+flhrtYmhtU/IA/VsMstUjbVmCpKV6POmpSMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3518
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gV2VkLCAyMDIyLTEwLTA1IGF0IDEzOjAwICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwNS8xMC8yMDIyIDEyOjEzLCBOaWVkZXJtYXlyLCBCRU5FRElLVCB3cm90ZToN
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLQ0KPiA+ID4gPiBjaGls
ZC55YW1sDQo+ID4gPiA+IGluZGV4IDZlMzk5NWJiMTYzMC4uNDc3MTg5OTczMzM0IDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFt
bA0KPiA+ID4gPiBAQCAtMjMwLDYgKzIzMCwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICAg
ICAgV2FpdC1waW4gdXNlZCBieSBjbGllbnQuIE11c3QgYmUgbGVzcyB0aGFuICJncG1jLG51bS13
YWl0cGlucyIuDQo+ID4gPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyDQo+ID4gPiA+ICANCj4gPiA+ID4gKyAgZ3BtYyx3YWl0LXBpbi1wb2xhcml0
eToNCj4gPiA+IA0KPiA+ID4gJ2dwbWMnIGlzIG5vdCBhIHZlbmRvci4gRG9uJ3QgY29udGludWUg
dGhpcyBiYWQgcGF0dGVybiwgdXNlICd0aScuDQo+ID4gDQo+ID4gWW91IGFyZSByaWdodC4gQnV0
IG5ldmVydGhlbGVzcyBJIGNhbid0IGFncmVlIHdpdGggdGhhdCBpbiB0aGlzIHBhdGNoIHNlcmll
cy4NCj4gPiBJIGRvbid0IHdhbnQgdG8gYnJlYWsgY29uc2lzdGVuY3ksIHNpbmNlIGFsbCBiaW5k
aW5ncyBjdXJyZW50bHkgdXNlICdncG1jJy4gQXQgbGVhc3QgdGhpcyBhcHBsaWVzDQo+ID4gdG8g
dGhlICJ0aSxncG1jLWNoaWxkLnlhbWwiLg0KPiA+IA0KPiA+IEkgdGhpbmsgaXQgbWFrZXMgbW9y
ZSBzZW5zZSB0byBjcmVhdGUgYSBjb21wbGV0ZSBuZXcgcGF0Y2ggc2VyaWVzIGZvciB0aGF0IHNw
ZWNpZmljIGNoYW5nZT8gVGhpcyBjaGFuZ2UNCj4gPiB3b3VsZG4ndCBmaXQgdGhlbWF0aWNhbGx5
IHRoZSBjdXJyZW50IHBhdGNoIHNlcmllcy4gDQo+ID4gDQo+IA0KPiBTbyB5b3Ugd2FudCB0byBh
ZGQgbmV3IHByb3BlcnR5IGluY29ycmVjdGx5IG5hbWVkIGFuZCBpbW1lZGlhdGVseSBuZXcNCj4g
cGF0Y2ggd2hpY2ggZml4ZXMgdGhlIG5hbWU/IE5vLCBwbGVhc2Ugc3F1YXNoIHRoaXMgbmV3IHBh
dGNoIGludG8gdGhpcy4NCj4gDQpObyB0aGF0J3Mgbm90IHdoYXQgSSBtZWFudC4gQ3VycmVudGx5
IGFsbCBiaW5kaW5ncyBpbiAidGksZ3BtYy1jaGlsZC55YW1sIiBzdGFydCB3aXRoICJncG1jLCIg
YW5kIGludHJvZHVjaW5nIA0KYSBzaW5nbGUgYmluZGluZyBpbiB0aGlzIGZpbGUgd2l0aCAidGks
IiBmZWVscyBsaWtlIGJyZWFraW5nIGNvbnNpc3RlbmN5Lg0KDQpUaGUgIm5ldyIgcGF0Y2ggc2Vy
aWVzIHNob3VsZCBhZGRyZXNzICoqYWxsKiogYmluZGluZ3MgaW4gdGhpcyBmaWxlIGFuZCBhbGwg
ZGV2aWNlIHRyZWVzIGN1cnJlbnRseSB1c2luZyAiZ3BtYywiDQpiaW5kaW5ncy4gU28gZmluYWxs
eSB3ZSBoYXZlIHRoZSBjdXJyZW50IHBhdGNoIHNlcmllcyBpbnRyb2R1Y2luZyB0aGUgd2FpdCBw
aW4gaGFuZGxpbmcgaW4gYSBjb25zaXN0ZW4gd2F5IGFuZCB0aGVuIGFub3RoZXIgDQpwYXRjaCBz
ZXJpZXMgd2hpY2ggY2hhbmdlcyBhbGwgImdwbWMsIiB0byAidGksIi4gDQoNCklmIGl0IG1ha2Vz
IG1vcmUgc2Vuc2UgdG8gZGlyZWN0bHkgaW50cm9kdWNlIHRoZSAidGksd2FpdC1waW4tcG9sYXJp
dHkiIGluc3RlYWQgb2YgImdwbWMsd2FpdC1waW4tcG9sYXJpdHkiIHRoZW4gSSB3aWxsIGRvLiBK
dXN0DQpnaXZlIG1lIGEgc2hvcnQgZmVlZGJhY2suDQogIA0KDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQo+IA0KDQpDaGVlcnMsDQpCZW5lZGlrdA0KDQo=
