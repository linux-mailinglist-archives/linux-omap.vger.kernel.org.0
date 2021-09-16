Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE0640D5ED
	for <lists+linux-omap@lfdr.de>; Thu, 16 Sep 2021 11:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbhIPJR3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 05:17:29 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:46118
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236194AbhIPJQn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Sep 2021 05:16:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZb1+qoMf/FvHaZ5TDiIRpyRptsNFe+8/GVDWOFmSQdrNHSQSvCTaCSkGOyJm69BZwDAlUaHRKIVBJcwG3d/dMarQUs8bT2EyMol57XXrF/D5+D9FMkRwZXMYbqCaS2eJgM+vxeIIkrp/jFlGn3JdezZ467FPNnFueX/q5d4nfbN3TxFB3UrZ40/+ogqSGbuknQVJgEhZDhMf2uXuNPtK4oJjaF4+c5S39wJE/hU9g2TjgM65JkpW2EEVIE52gfQkFlL7zpKnxHcSaZtfkC+5/Z77wqfHeXiYPiGZtsB0Pci6XOzuey9TrQvTvl7MuXPIymKw3c05Ga9kmIYRo4xXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SSxvClLv1x++FnH6kDxpIVs659cLjuKkIDVoWMJxG5Q=;
 b=mMMtPrDs85dpJo2KOIqEQYFvEzc8bHASwipnBPlZmDZivj72x5UCUrRRMBBkA77vOvQ0WdkR5xdRO6Y9hKpzQa1KQpJ5PIA7O9mZMytMZErXCws8JdUoZ6ZC9ZDyvQlKnxbmo0D927aXvisKNQkQgmERfTwj2bQMI3bFMfe/Az4SgbUAA2VS4/ruL6HN/4lc2p7qmEApuFFDt5mPqMBqFxecsr5Q9HbPtpnKzTvWSbRue/jhIBtAyX7RM9Zuzcht3ITsOkG41wLzmNBw4abROS5o3NwCZIiZFYmX3JnEGaqSEeFiJml36TvrMuvMKuOKb8C1oaDr5ScNzjMLZ7VOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSxvClLv1x++FnH6kDxpIVs659cLjuKkIDVoWMJxG5Q=;
 b=f4MkxsoOmREo0+4JByA0ZbwYrdPxFGA7VGwsb3G5wxZ57dTdic867pVInFfDdhWoRmTIE43MWaven2cjG6ghNh/ofQyDyLOefYvvnhkezbFzcE4NTrDRL8QPUWCZcwyDCJlCwGwNfzOD6BEnoUrEP3XC0O2tQNwYTXyCkTLuIvg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2315.eurprd03.prod.outlook.com (2603:10a6:3:23::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Thu, 16 Sep 2021 09:15:19 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415%7]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 09:15:18 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     Tony Lindgren <tony@atomide.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Suman Anna <s-anna@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: beaglebone black boot failure Linux v5.15.rc1
Thread-Topic: beaglebone black boot failure Linux v5.15.rc1
Thread-Index: AQHXqtte0LDyC49C8Eq6XS7e5X9lNA==
Date:   Thu, 16 Sep 2021 09:15:18 +0000
Message-ID: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 009f02f9-ab33-4ca7-d0cf-08d978f280d2
x-ms-traffictypediagnostic: HE1PR0301MB2315:
x-microsoft-antispam-prvs: <HE1PR0301MB23154C76E868A15D391DABD6ADDC9@HE1PR0301MB2315.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:343;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrJAnOsSh46qPzETkoQZ3bKK7uKKVw9rh3dPARoEFUlpjOia4TpkzE9vYv129BwVqjx+g757i9BqAfc2KaVMOLqVlDkI2YSyXMPwIjqfNlqIM1WNWZiCbRRuYLAueRDGWR/Sk5tlIBY72OAorUKmZ8Qmps1niNeLMQeroVLSI+0IyWJopx8VQj7TmMy7s6Jb9qnoFXdd1lPlDzgnWaoAJC1I80JyFFFUQ9LzdPrIuPMvRhhXWRyyh9NfJcR6VG0aGiAaZxB5xQ+obLJLrae0VKAnkY15xahoXivcB001wXAl7OUXOQw161cboHtgm0s2yXe4EEo7aVAp8I1eQic+TK3degUalR/rTdi1sA1YgT8Trsd8CebVpQNapld4gPFufq4iej2He6AkrSfnSF1IO+0MdaqctGHH9ePNDKOD6xT7uhQM3iWBOSRzUB9WEOl+FLC0IDg70p2F/Y1nxh7G+SLsjrKlOnEAciwuv+qoCpNvnzMc98ptdRK1m8Tg9UE2CLZTRM3GbYMLIoXX71ek8DoikC6NtfFB3JDiu7Z3t8P37rSZFekrwy31lCve9BkrBaNhc0wIiMTv8nhK6EjsMhaTOOZ+0XfuBEaWbLsafTCx9APqtfHAtCPD1ylJJJOorUiqZXO78sIDfAk5Rw82unZsQlecFx5SMsdKtOT97QPZvZZCsbPWkPtLNYkvHeSRhMqwUuNS3oXJz7XQsGVqkWxTGreH4Fgs5zXYNS+YPTP9L0ebin0chEHq/0Xo4Li53+tnoNrbJeHEtOt1XctUIBw3T+ocnLRbun0BHbtKP4K7hdu2jrJJx77q0vd5oHO6JzbJQq6GQgFuQbZ6+jrETY9FMEv9S0J5oIdmcQPtFbw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(6512007)(186003)(6486002)(83380400001)(4326008)(26005)(966005)(38100700002)(54906003)(66556008)(76116006)(66476007)(122000001)(2906002)(478600001)(38070700005)(5660300002)(2616005)(31696002)(8936002)(109986005)(71200400001)(86362001)(6506007)(66946007)(64756008)(66446008)(31686004)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk5mTU5hQ2pRSnRBSlFZMzFLUkYrU0lNcmluNXF5WHRmMG80QnI1VVY4ZFkr?=
 =?utf-8?B?ODlzam90MFhEbTNYaUppa09nLytsRnphRjNBWHkxVlg1NWJpRGY0RTI4T2k1?=
 =?utf-8?B?azVzMDBsMXlFSDgyenVBNnhHMy96UVFCOFNwL0pubVFYbUcyaG5EWThoL0pz?=
 =?utf-8?B?cmVqb0c0QnEyMmlza3FOZWxPRDkyK2RuellPVXI0RFdhRFJVQWw2K3J5VE9r?=
 =?utf-8?B?akZDdnhvbHRqczRhTlNxMmZjbVhreGJreVhibHVUdjRtaDJobFNFN3laSDEw?=
 =?utf-8?B?Z0VYMkRGcmFNQURrSDhVczJpdUlTeDl5eFhnWnlwNHFhWldpRjlibjRHL29I?=
 =?utf-8?B?c0JiT2pIY3ZZcmFoSXRVTzBoVkhLb2RRbDY5SEs0eUk5Ym1iZnJqTldlcXU0?=
 =?utf-8?B?b2grNzBYWktOSDVQRFVNWmVRY29wbkMvd2FlOGVwbFVDVkhPekdSNmlzUmtw?=
 =?utf-8?B?ZnJmWCtDTFdkWEhrL2FGeWFzbytkL2UzNFhWa1lsbCt2aFRENnM4MjVOTDBa?=
 =?utf-8?B?Sm1rczcvT2RGek1BR05USkVPRENiUDNON2JjTFVGMERYWTIwSWp0VzJ0THVV?=
 =?utf-8?B?MEpkNG9xZlVVRThVdHRRa2pmaDBLZkZzY2ExclozVXJoa2xZUXp2dis2ZTVR?=
 =?utf-8?B?dmVUSkpZUkEyb1lKSnFsWHBBbWhmK0J0TTJjZ28wbWl1c09CSkVPbytNSkV1?=
 =?utf-8?B?cFZXUXpVaDlCN2U2TWRxRUl2TnBydnV3cW5kbWR2bU5XM0FuZnFyTG9MZ0Ir?=
 =?utf-8?B?bHlxYzRFek9xMTA1WksxMjVCVnBXR3ZGWTRHK1ZwTzdtRUNSY0pCN3g5YTZ3?=
 =?utf-8?B?YVNIWjVsblk5eC9tcVdmWTBWWVR5SDZPcC8xRFRIRDBjVlBmNTk2Y1o4a3pN?=
 =?utf-8?B?WkRMK3ZzaC9ZR1MrUFVkQ09VanRITzJmQzNlTmkrUGtlaUtsZmZjQ3BhUjRK?=
 =?utf-8?B?aHMvQUtvMmVEeitCRjRuM0N4bW5SVUNQbnlZVnVaZVNjbWc4UGtPMldIMml2?=
 =?utf-8?B?WFp4dWVVdEF5OGMzeHZEYTllY2g2NDdrNit2NUUrUmdldlJEU1RkY090N0lP?=
 =?utf-8?B?OGtxWUVvenhWSWF1RmdSMS91a0ozVTVhMWJXZ0FoTHVvamdOWnd6aVNiUFZr?=
 =?utf-8?B?UzVsUWhrSTNuVi9KYnBMSFNMbWVod24vUXEzTnVhRWJiUnNOREpZYzJXMWdy?=
 =?utf-8?B?bzM0cVZCOFlWdHF0WkM3RE1wbGZSeHNmektVNUxKVW9KQUErdGxuU0lvdGtT?=
 =?utf-8?B?U2tiUU9wUHlmNFNvSUtzejI5Zzg0Lzh6RmZmdEpOY1FqTHV2bC9ja09oamlX?=
 =?utf-8?B?ME5wQXRxVW5OZ2NRUGxFQjA4dHNzTU8remVkVU9sS0VMVGphQzJPTXpPS1VC?=
 =?utf-8?B?VEhmakFQOFlCUDZsZDR5UXZCVEFOaFJQd1o1M0U0YVJYVUl2ZnQ4aVlmcFIr?=
 =?utf-8?B?SUs4QjlZQ05aYUtiT1Bua3pOYStUcWN6aHRBMUlLQlhpMEIvZHB4elBmVEs1?=
 =?utf-8?B?TWV4YzNVNEsxU0kra21qV3BLNnppV2NvOERjVUFsNHJidjFnd1B3UUZJYTFX?=
 =?utf-8?B?Wi9hc3dHOWhJSWk2b0FiZm5mb3hHUExtUnVDekdHSWRYZDVmbTJUWlhIaVJD?=
 =?utf-8?B?Mk1peE5BMi9ZMExHL2NOQ3RGZy9nUmZ2RE01eWd1ZUZVNFJLeE5iYzdqVjMv?=
 =?utf-8?B?bEdCVWlaYzJQLzYwY3hERnZvSndTSVgvbkxQZFFJNDc3TVVYdGRFNllXdVJW?=
 =?utf-8?Q?EHjlU6oOHNti+sJ66h4t5rB7egXxeKLcG8i6gyc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8461A3DEA4928D438C075B2D111B2D59@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009f02f9-ab33-4ca7-d0cf-08d978f280d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 09:15:18.7284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GSElI2jsbRTjpqMqtSgHgRkSnwZlBOQgoJkya/0gLdpTfLCESl55NcXrbIRlye+pLCR9ySLOSLzilsE6265WOL3UQiB/tyk+tgTG76nVFFf0UB9sSBh8lmCfs6ltxtRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2315
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzLA0KDQpZZXN0ZXJkYXkgSSBhc2tlZCBhYm91dCB0aGlzIGF0ICNhcm1s
aW51eCBzbyBpZiBzb21lb25lIHNhdyBteSBtZXNzYWdlIA0KdGhlcmUgLSB0aGlzIGlzIHRoZSBz
YW1lIHRvcGljLg0KDQpNeSBiZWFnbGVib25lIGJsYWNrIChyZXYgYykgYmFzZWQgdGVzdCBlbnZp
cm9ubWVudCBmYWlscyB0byBib290IHdpdGggDQp2NS4xNS1yYzEuIEJvb3Qgc3VjY2VlZHMgd2l0
aCB0aGUgdjUuMTQuDQoNCkkgdXNlIHByZXR0eSBvbGQgdUJvb3QsIFRGVFAgdG8gbG9hZCBrZXJu
ZWwgYW5kIGRldmljZS10cmVlLCBhbmQgaGF2ZSANCmhvc3RlZCB0aGUgcm9vdGZzIG9uIE5GUyBz
ZXJ2ZXIuDQoNClRoZSB2NS4xNS1yYzEgZmFpbHMgdG8gYm9vdCB3aXRoIG5vIHByaW50cyBmcm9t
IGtlcm5lbCB2aXNpYmxlIGluIHNlcmlhbCANCmNvbnNvbGUuIFBsZWFzZSBzZWUgdGhlIHNlcmlh
bCBsb2cgYXQgdGhlIGVuZCBvZiB0aGlzIG1lc3NhZ2UuDQoNCkJpc2VjdGluZyB0aGUgTGludXMn
IHRyZWUgcG9pbnRlZCBvdXQgdGhlIGNvbW1pdDoNClsxYzdiYTU2NWU3MDM2NTc2M2VhNzgwNjY2
YTNlZWU2NzkzNDRiOTYyXSBBUk06IGR0czogYW0zMzV4LWJhbHRvczogDQpzd2l0Y2ggdG8gbmV3
IGNwc3cgc3dpdGNoIGRydg0KDQpJIGRvbid0IHNlZSB0aGlzIGV4YWN0IGNvbW1pdCB0b3VjaGlu
ZyB0aGUgQkJCIGRldmljZS10cmVlLiBJbiBMaW51cycgDQp0cmVlIGl0IGlzIGEgcGFydCBvZiBh
IG1lcmdlIGNvbW1pdC4gUmV2ZXJ0aW5nIHRoZSB3aG9sZSBtZXJnZSBvbiB0b3Agb2YgDQp0aGUg
djUuMTUtcmMxDQoNClRoaXMgcmV2ZXJ0cyBjb21taXQgODFiNmEyODU3Mzc3MDBjMmUwNGVmMDg5
MzYxN2I4MDQ4MWI2YjRiNywgcmV2ZXJzaW5nDQpjaGFuZ2VzIG1hZGUgdG8gZjczOTc5MTA5YmMx
MWEwZWQyNmI2ZGVlYjQwM2ZiNWQwNTY3NmZmYy4NCg0KbWFrZXMgbXkgYmVhZ2xlYm9uZSBibGFj
ayB0byBib290IGFnYWluLg0KDQpZZXN0ZXJkYXkgSSB0cmllZCBhZGRpbmcgdGhpcyBwYXRjaDoN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW9tYXAvMjAyMTA5MTUwNjUwMzIuNDUwMTMt
MS10b255QGF0b21pZGUuY29tL1QvI3UNCnBvaW50ZWQgYnkgVG9tIG9uIHRvcCBvZiB0aGUgdjUu
MTUtcmMxIC0gbm8gYXZhaWwuIEkgYWxzbyBkaWQgI2RlZmluZSANCkRFQlVHIGF0IHRpLXN5cy5j
IGFzIHdhcyBzdWdnZXN0ZWQgYnkgVG9tIC0gYnV0IEkgZG9uJ3Qgc2VlIGFueSBtb3JlIG91dHB1
dC4NCg0KDQpBbnkgc3VnZ2VzdGlvbnMgd2hhdCB0byBjaGVjayBuZXh0Pw0KDQpCZXN0IFJlZ2Fy
ZHMNCglNYXR0aSBWYWl0dGluZW4NCg0KDQpTZXJpYWwgbG9nIGJlbG93Og0KDQpSZXNldCBTb3Vy
Y2U6IEdsb2JhbCBleHRlcm5hbCB3YXJtIHJlc2V0IGhhcyBvY2N1cnJlZC4NClJlc2V0IFNvdXJj
ZTogUG93ZXItb24gcmVzZXQgaGFzIG9jY3VycmVkLg0KTU1DOiAgIE9NQVAgU0QvTU1DOiAwLCBP
TUFQIFNEL01NQzogMQ0KVXNpbmcgZGVmYXVsdCBlbnZpcm9ubWVudA0KDQpOZXQ6ICAgPGV0aGFk
ZHI+IG5vdCBzZXQuIFZhbGlkYXRpbmcgZmlyc3QgRS1mdXNlIE1BQw0KY3BzdywgdXNiX2V0aGVy
DQpQcmVzcyBTUEFDRSB0byBhYm9ydCBhdXRvYm9vdCBpbiAyIHNlY29uZHMNCnN3aXRjaCB0byBw
YXJ0aXRpb25zICMwLCBPSw0KbW1jMCBpcyBjdXJyZW50IGRldmljZQ0KU2Nhbm5pbmcgbW1jIDA6
MS4uLg0KZ3BpbzogcGluIDU2IChncGlvIDU2KSB2YWx1ZSBpcyAwDQpncGlvOiBwaW4gNTUgKGdw
aW8gNTUpIHZhbHVlIGlzIDANCmdwaW86IHBpbiA1NCAoZ3BpbyA1NCkgdmFsdWUgaXMgMA0KZ3Bp
bzogcGluIDUzIChncGlvIDUzKSB2YWx1ZSBpcyAxDQpzd2l0Y2ggdG8gcGFydGl0aW9ucyAjMCwg
T0sNCm1tYzAgaXMgY3VycmVudCBkZXZpY2UNCmdwaW86IHBpbiA1NCAoZ3BpbyA1NCkgdmFsdWUg
aXMgMQ0KQ2hlY2tpbmcgZm9yOiAvdUVudi50eHQgLi4uDQpyZWFkaW5nIHVFbnYudHh0DQo1NjEg
Ynl0ZXMgcmVhZCBpbiA0IG1zICgxMzYuNyBLaUIvcykNCmdwaW86IHBpbiA1NSAoZ3BpbyA1NSkg
dmFsdWUgaXMgMQ0KTG9hZGVkIGVudmlyb25tZW50IGZyb20gdUVudi50eHQNCkltcG9ydGluZyBl
bnZpcm9ubWVudCBmcm9tIG1tYyAuLi4NCkNoZWNraW5nIGlmIHVlbnZjbWQgaXMgc2V0IC4uLg0K
Z3BpbzogcGluIDU2IChncGlvIDU2KSB2YWx1ZSBpcyAxDQpSdW5uaW5nIHVlbnZjbWQgLi4uDQps
aW5rIHVwIG9uIHBvcnQgMCwgc3BlZWQgMTAwLCBmdWxsIGR1cGxleA0KVXNpbmcgY3BzdyBkZXZp
Y2UNClRGVFAgZnJvbSBzZXJ2ZXIgMTkyLjE2OC4yNTUuMTI2OyBvdXIgSVAgYWRkcmVzcyBpcyAx
OTIuMTY4LjI1NS4xDQpGaWxlbmFtZSAnekltYWdlJy4NCkxvYWQgYWRkcmVzczogMHg4MTAwMDAw
MA0KTG9hZGluZzogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjDQogICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjDQogICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAgICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIw0KICAgICAgICAgIDQuNSBNaUIvcw0KZG9uZQ0KQnl0ZXMgdHJhbnNmZXJyZWQgPSA5
ODc1OTY4ICg5NmIyMDAgaGV4KQ0KbGluayB1cCBvbiBwb3J0IDAsIHNwZWVkIDEwMCwgZnVsbCBk
dXBsZXgNClVzaW5nIGNwc3cgZGV2aWNlDQpURlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMjU1LjEy
Njsgb3VyIElQIGFkZHJlc3MgaXMgMTkyLjE2OC4yNTUuMQ0KRmlsZW5hbWUgJ2FtMzM1eC1ib25l
YmxhY2suZHRiJy4NCkxvYWQgYWRkcmVzczogMHg4MjAwMDAwMA0KTG9hZGluZzogIyMjIyMNCiAg
ICAgICAgICAzLjIgTWlCL3MNCmRvbmUNCkJ5dGVzIHRyYW5zZmVycmVkID0gNjcxNTEgKDEwNjRm
IGhleCkNCktlcm5lbCBpbWFnZSBAIDB4ODEwMDAwMDAgWyAweDAwMDAwMCAtIDB4OTZiMjAwIF0N
CiMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0IDgyMDAwMDAwDQogICAgQm9vdGluZyB1
c2luZyB0aGUgZmR0IGJsb2IgYXQgMHg4MjAwMDAwMA0KICAgIExvYWRpbmcgRGV2aWNlIFRyZWUg
dG8gOGZmZWMwMDAsIGVuZCA4ZmZmZjY0ZSAuLi4gT0sNCg0KU3RhcnRpbmcga2VybmVsIC4uLg0K
DQoNCg0KDQo=
