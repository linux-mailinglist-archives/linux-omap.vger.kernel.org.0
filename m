Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC675F522F
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 12:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJEKFQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 06:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiJEKFM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 06:05:12 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0241902F;
        Wed,  5 Oct 2022 03:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLivwWu3xwDxx3xCdKNyAVOjjzVMTuJx9beiiUrKAfcgSOdifxjdwOktfuHnBCk2SGZ5xNSEWDt7/e2M44/82zuE/sLY0j8jb2xptDwFu72jd2O/HaGt+RjFGP9moQvgvcYimop2ItLwr1KdMqb5KBQxjmMYTgS16Lelibs86N2ZvC5Dn+/pELEAA1qkq9AkMijfpdEk5hhsBCB0Sf0+dMOtXRlDOcnczPmiOFWXcpS7SkWodco+1e/e4y+Oi0JJEBeTnmT29JJaRBFlUiXQkklWF921kkSSug98/Vd2e7WiN1Qo4pisqUqpSPvSikEULnbIpp93x0oJdcIyEMRvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WunfD6aRFQaAZht/ZWkgbGFfGiw5XnnabystxeYPQkQ=;
 b=Ct4n32Ob6Ro6bOg1oFbSfYuIUXV9uwQjyiwxEKdM5qBq+iswB6xPjAQEpDRdDlFRThcsJZwaGNFDwWfTrkpx/GSjR3d/at0FBFT1REq2MteNx6LryA7+mkpXRrf6+xGgV1doZ9z/5KcSdZSyctWjYNs0pTZxwrPrb0rJejAkL+fO5KsYUEPawXaUf8jinq0lCj3U1HKiQinzQH7CtjXmiQWG1g09q4kQtY39+6Dtm73oDtdbOdwbAJ9G1mGRGe31425qVSbb6M7xnX2IfT0zXE59EnX6Zr9F0bV7VWNyTx/IyXkPmQi6sp26f2PRlud3Ms8GuuyzeEwSUrqc0m830Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WunfD6aRFQaAZht/ZWkgbGFfGiw5XnnabystxeYPQkQ=;
 b=sfG4VxTcu5cvku7haBH5CuzMQ6ag6mb4aD5S7dISq/fp89nHrOTwcsOEB7n1Gyokexfaw+WwO8zm+WGy00fdksNZsKW1RJfKo4J4XZCNF1vdfXmIHP3ZBXedRceRdj6uTs6HoDVr50SHLvMa3zbxjYD5eqld5A4IlgStUH6hzlg+Lqj1q9HPYskLxJS0qBUSKEYYSMlRGd1b5ENJ+B+Oy+t8JF/cCp/EXn2hR1gbsH47bBti8ArhkoMIVDEt9jxZ6TpBh6OSVr0+OOF0H+i/NYmJLkYMFkTRFMI0tPJHAfGk5MoCaWjr5GFDwv8NcU1iUP8g4dGCnZTBCTWSROP/Ng==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS4PR10MB5645.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 10:05:08 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cea7:d418:9b91:70ce%3]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 10:05:08 +0000
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
Thread-Index: AQHY1QTZpZGRCiyIRE+rIrpzgAqZhq34ZOYAgAc09IA=
Date:   Wed, 5 Oct 2022 10:05:08 +0000
Message-ID: <bb0a16e0c2b4e7b93dce58c030264cd2c0cc6230.camel@siemens.com>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
         <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
         <20220930194257.GA756240-robh@kernel.org>
         <1c14b73b-46fb-29e8-0fd6-1fd4d8706cbd@linaro.org>
In-Reply-To: <1c14b73b-46fb-29e8-0fd6-1fd4d8706cbd@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS4PR10MB5645:EE_
x-ms-office365-filtering-correlation-id: 171766a1-19e1-4262-d678-08daa6b91531
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fgq/3ht6I8O74+hch83Ghsxd5BCN/YNROLECIju4je2pZCOgv4CJd1rIBtRLD4LrS4tYI6152uZLaAjEbG0Gr8r2hSOXU1i5sfOzsIVAnNtOScjkN8Q1UVxJfTSnOGJLNxNBbDZep383k8Ubc5dhqUHf1UmC5rm9IbvZRCHHle181l+v+0b8PC2xxXU/Gzo97KSeWaBl+nIz9aL83weED/7/xafePztp3G8vrqxZ3TrCrYTz6TZHsjZF1z0TbSVdyvHEo8Jle2a5vozJm2qrZ7DubnwAn94EYJbOCn4cfIMkK7lzJwwKn20R0CYu8wnJ5/qRSxx4Enp7qi8Pb9LH6yTsRgf4Nm0PdaFXFEqWykdk0We8ujJrSDHH1LDrzE8V1bGtaSW9OSC0w4pdrtyhpM1WCPiyIdOC1s73O5UhCSA2J4t8XIvdnAxdUL0/uyArDs7Bs+mLGePy6WFbhxoCKMVB/ySfmztAXRIWxHzmhh9VkDyfEkrwdqtISlSYSKN0D10S/xwqFgqniCU8nQ3GkkPkQexpUi3IAoacxuY4l3jhmf5JTnsJosBreAgm8u7ZJ5qjtQ1pZEcSHAJ+H8AEfsiO4XQe0F6bPi0xcd/RB8L/tolInjePhbDwBpIVLYBnq62nNcR/aL0GTkWqy3q2My5cIndztAgTl65M1UjV9Da1x51GX4aJLVyc3C9Yt0qHkM5s5jWYRJCMyHqESCLsdt8shgtlPxQxYI883YKhlUiMRL4tWnuHzWpA5tgQ7VOzZJ4AC82IKkCuK9OPz5QyMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(41300700001)(3450700001)(2906002)(5660300002)(8936002)(4326008)(76116006)(71200400001)(478600001)(66556008)(38100700002)(82960400001)(86362001)(122000001)(66446008)(36756003)(66476007)(2616005)(53546011)(54906003)(64756008)(8676002)(66946007)(316002)(91956017)(6512007)(6506007)(6486002)(110136005)(186003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1RZY2Fqd1E4bFFLeTlSbVRBWGJOblpkRE9QUDJQQjROQlVlVjM2QnFkbDFJ?=
 =?utf-8?B?ckRzd212WDYvcnRyeWFQNkk5MjVwdXNvZ3RabkxoQncvazdXTDVZUDd5QWV2?=
 =?utf-8?B?NU9sMGlvbzJKeVRmeGxjRXRBUDhFTXhobGVFYUlDL1Z0VkJxMkZHQTUvR0Jo?=
 =?utf-8?B?ZnZHWUVXTXI1SVZFdTYrZEExQVJaMEhIcVZHRmlRYnp0QitzZW1LWThDbWsx?=
 =?utf-8?B?bkw5VzdBUnhsVURNckZsVEFjMGFYb3g5dkFBYTEvT0VIYXlhZGN6cUlLUG9L?=
 =?utf-8?B?VkQvVzZ4cTdtaDk1UVFtZThtUU5FUzBEc3NJZXVyeTBSWW81Zml1N2NrZGMw?=
 =?utf-8?B?SHNjZFEvVXRqcGV1cjUxT2c5N3Qxb3dENC9jNGRaMlhOOHo4SGJEUlRienEw?=
 =?utf-8?B?MnM2Z2FzZ0t6TmFxMVB4RFJFNWxCM0JKejIxbkQ2YVMwL3h5V0lGVmU4U3RV?=
 =?utf-8?B?UkFqRWtjcE9LYkxsU001Y0VibmF3QkF0Y0F2M3ZIb25kNG5TK0ZSeW53WDNm?=
 =?utf-8?B?a3lJK3lJbVUzMTJXajBYZERVc0JpSHZkcC90Yk4yclBPd3VObXIyNU12NVdY?=
 =?utf-8?B?Rk55M1hOdWVpTWFqaFVOL1RZTFBEeXNMczJtSER0aUVzcHViWlNwVWxkZ3M2?=
 =?utf-8?B?ZExLWUd0RVJpQ05WaXo1NCtLbjBuQVRpSlhXNXBxSlNFVW9mVENtcEU5ald5?=
 =?utf-8?B?UERTU1dLdUQrc0ZTSnlZMDUwRlVYUXRYaVRpaXlycnhLcWp3ZmljaWVRVndX?=
 =?utf-8?B?WFJnZjR1ZlhUOFlzbnh1N0JpTGlsSGpHcnJGZnNwZW1RSlh1emZnTEhmQ1lW?=
 =?utf-8?B?NHZRdUpqRTBWY0hoYnloL085Sm5FcVhqamc1QzFuV1JhOWZ0eUpoUmNueUQy?=
 =?utf-8?B?cVZ1Q0E5Y256czh2Z2tGVThhOWRxc3ByQmh1Wm1jenlOS0UzUVlpNzczN3Iy?=
 =?utf-8?B?NjJwQ2JDeFU5ZElXdjVvMEhxT2tsaldQQzduYzljbEpMKzN2bzVRRyszOHdY?=
 =?utf-8?B?YmtuNnhyVEF1T0pwUndxTXdMSmNBclZadGNYbjExcTFvT1hhNUVQbWYyTHY2?=
 =?utf-8?B?bmtjeXNVQVBsQXpEcnlXc2dUdDBGMXVXd2lpSU9STWdIejIvbUhIYlYrMjZm?=
 =?utf-8?B?cUFueTZFcGxCSzdRWXNDRmE1Z3RyZXl0dkQ1TGluUXVIelhFaTBEOXUrSkY1?=
 =?utf-8?B?WEdiQmFiN1F6MWI2OG1FT21BTmhKaG1FWm1ySVJtdWJZZkR4aFFFc3l6anBo?=
 =?utf-8?B?TVRrR05PeldEOU14b3VlU2tUSXlNUWRDTldEWXpua2hwQ3YwOXV2UXhRVURX?=
 =?utf-8?B?NFU0dmpVWHpKV2g2ODlXNlZ0L0xwZWIxc2hhNC91K0tkb3gwNDRRTDJ5ZGVO?=
 =?utf-8?B?eWZaYjZOWGkrNG9Ka3dFbGsxOXk5ekxnNENDSGo4Z1VCTmFGcjdmMzJLMHVh?=
 =?utf-8?B?c01FTlREK1F0S1g1ZmxUcWtZY1hOZWZRWDV5TEhKdURmRGpSdzZnNUFiVThE?=
 =?utf-8?B?MVROMUsxdzhLZENZaHdId0xpTFN4dkZnNitlK2wyRjhPa3RXaVNGSENvOUFD?=
 =?utf-8?B?MVBVSjJuQkxrSHBubzhYNTBzUnlFaFdzd1Y2YXZVbWptbE1BK2pjTWdHeEZh?=
 =?utf-8?B?bS9zekl1OUx3UngrbEVTVFNPWG5JY1ZodXNVWWo0V24rV2I5MmVGYXVwZjFm?=
 =?utf-8?B?bzlOTzVMSlZIbmRIaXNMbFA5SUttTXg4YWw0TGNSS0l3WTFBdyszZ1oreU9u?=
 =?utf-8?B?Q2dMV2VjMHczaTlKUjJoRVF3TWRYUTZTM3pKSXlRci9ZS2xLdlUwQS9HYkE1?=
 =?utf-8?B?enRnVjRwTVhndFMrUG54SFgrMlRTRS9lcjRhWnJpOWxidHpFMUovVnhoYUx2?=
 =?utf-8?B?TmRXcmx0alNucWsrNThyQmNNWkxZRUJBTUdCVlVVYXJQYVRrY2ZQU3hvckVM?=
 =?utf-8?B?Z0U0NmpxK1UvNjRFYmJTRCtLeGhiUDZwRCtRcW5Pd0ZmRlozNm15SGJuR3Mz?=
 =?utf-8?B?ejhpRkVOTVpaNDQ1VVRoZDYvdkpQNVFiM1VTYTgxenJQR2hwd09ZWVp0MU81?=
 =?utf-8?B?UzFCYzlqS0ZkNno4eEVGQkpZVVhzWm9rdnZFMjVDTHdrQVRjeENGOTV6djIv?=
 =?utf-8?B?cVd4TlFGOStaaERMUzAvalJ5emJnTlVYRndBR210amNEMGNZbW5vdEttb0xl?=
 =?utf-8?B?ZmcvbWJWeUNRdnBLdmI0RVFrcXdyRDAyTm5BbFU1N0VkZWkvd2RYNVJtOG1r?=
 =?utf-8?Q?ghT5us5HkipSkAMGkS1uenu1H5EnMJHIF3sBRxcXlg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D749E44ED772B646B9A97AA368D32B56@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 171766a1-19e1-4262-d678-08daa6b91531
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 10:05:08.0613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0oKot1b/02X15PxN+P4z2c/Ye9jqpeAEQn5q0fZ5+E/JeG8mCQTUYAQbybe6jIIf+XEVjQkyrOsTZwMWxT7qNWibYKhM+u6uvg2v9or9cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5645
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gRnJpLCAyMDIyLTA5LTMwIGF0IDIyOjAxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAzMC8wOS8yMDIyIDIxOjQyLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiBPbiBU
aHUsIFNlcCAyOSwgMjAyMiBhdCAwMjo1NjozOVBNICswMjAwLCBCLiBOaWVkZXJtYXlyIHdyb3Rl
Og0KPiA+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBz
aWVtZW5zLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhlIEdQTUMgY29udHJvbGxlciBoYXMgdGhlIGFi
aWxpdHkgdG8gY29uZmlndXJlIHRoZSBwb2xhcml0eSBmb3IgdGhlDQo+ID4gPiB3YWl0IHBpbi4g
VGhlIGN1cnJlbnQgcHJvcGVydGllcyBkbyBub3QgYWxsb3cgdGhpcyBjb25maWd1cmF0aW9uLg0K
PiA+ID4gVGhpcyBiaW5kaW5nIGRpcmVjdGx5IGNvbmZpZ3VyZXMgdGhlIFdBSVRQSU48WD5QT0xB
UklUWSBiaXQNCj4gPiA+IGluIHRoZSBHUE1DX0NPTkZJRyByZWdpc3RlciBieSBzZXR0aW5nIHRo
ZSBncG1jLHdhaXQtcGluLXBvbGFyaXR5DQo+ID4gPiBkdC1wcm9wZXJ0eS4NCj4gPiA+IA0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5
ckBzaWVtZW5zLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29u
dHJvbGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sICAgICAgICAgfCA3ICsrKysrKysNCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3Rp
LGdwbWMtY2hpbGQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+IGNoaWxkLnlhbWwNCj4gPiA+IGluZGV4IDZl
Mzk5NWJiMTYzMC4uNDc3MTg5OTczMzM0IDEwMDY0NA0KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLWNoaWxkLnlh
bWwNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvdGksZ3BtYy1jaGlsZC55YW1sDQo+ID4gPiBAQCAtMjMwLDYgKzIzMCwxMyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgIFdhaXQtcGluIHVzZWQgYnkgY2xpZW50LiBNdXN0
IGJlIGxlc3MgdGhhbiAiZ3BtYyxudW0td2FpdHBpbnMiLg0KPiA+ID4gICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiA+ICANCj4gPiA+ICsgIGdw
bWMsd2FpdC1waW4tcG9sYXJpdHk6DQo+ID4gDQo+ID4gJ2dwbWMnIGlzIG5vdCBhIHZlbmRvci4g
RG9uJ3QgY29udGludWUgdGhpcyBiYWQgcGF0dGVybiwgdXNlICd0aScuDQo+ID4gDQo+ID4gPiAr
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiArICAgICAgU2V0IHRoZSBkZXNpcmVkIHBvbGFyaXR5
IGZvciB0aGUgc2VsZWN0ZWQgd2FpdCBwaW4uDQo+ID4gPiArICAgICAgMSBmb3IgYWN0aXZlIGxv
dywgMCBmb3IgYWN0aXZlIGhpZ2guDQo+ID4gDQo+ID4gV2VsbCB0aGF0IGxvb2tzIGJhY2t3YXJk
cy4gSSBhc3N1bWUgZnJvbSB0aGUgY29tbWl0IG1zZyBhYm92ZSwgaXQncyB0aGUgDQo+ID4gcmVn
aXN0ZXIgdmFsdWUsIGJ1dCB0aGF0J3Mgbm90IHdoYXQgdGhlIGRlc2NyaXB0aW9uIHNheXMuIFBs
ZWFzZSBnbyB3aXRoIA0KPiA+IHRoZSBsb2dpY2FsIHN0YXRlIGhlcmUgYW5kIGRvIHRoZSBpbnZl
cnNpb24gaW4gdGhlIGRyaXZlci4NCj4gDQo+IFRoaXMgd2FzIGFjdHVhbGx5IG15IHN1Z2dlc3Rp
b24gdG8ga2VlcCB0aGUgc2FtZSB2YWx1ZSBhcw0KPiBBQ1RJVkVfSElHSC9MT1cgaW4gc3RhbmRh
cmQgR1BJTyBmbGFncy4gVGhlIERUUyBjb3VsZCByZXVzZSB0aGUgZGVmaW5lcy4NCj4gDQpPaywg
YnV0IGhvdyB0byBwcm9jZWVkIGtub3c/IElNSE8gaXQgbWFrZXMgbW9yZSBzZW5zZSB0byB1c2Ug
dGhlIHZhbHVlIHdoaWNoIGFjdHVhbGx5IGxhbmRzIGluIHRoZSByZWdpc3RlciBzaW5jZSBtb3N0
IA0KcGVvcGxlIHdpbGwgdXNlIHRoZSB2YWx1ZSBmb3VuZCBpbiB0aGUgRGF0YXNoZWV0LiANCg0K
V2UgYWxyZWFkeSBoYWQgYSBkaXNjdXNzaW9uIHdpdGggUm9nZXIgYWJvdXQgdGhlIEdQSU8gYmlu
ZGluZ3MgdnMuIHdhaXQtcGluIGJpbmRpbmcuIFRoZSBwb2ludCB3YXMgdGhhdCB3ZSBkbyBub3Qg
dXNlIEdQSU8gYmluZGluZ3MNCmluIHRoaXMgY2FzZSwgb3I/IA0KDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo+IA0KDQpDaGVlcnMsDQpCZW5lZGlrdA0K
