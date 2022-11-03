Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A53617876
	for <lists+linux-omap@lfdr.de>; Thu,  3 Nov 2022 09:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKCINS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Nov 2022 04:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiKCINR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Nov 2022 04:13:17 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27A0E48;
        Thu,  3 Nov 2022 01:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBNbKXOP6lzNBtMizf9zqne2dHfiX75lnurywx+F1xLSJ7pNVXjcrLpZGjadv1+aUCVuZDSRsSrGo7mCdBJSXIVV1RserXrHkLMsQUY3YM1vYWP8LQTdz23HJD9IUBcGeJXoDAXVrNDCXuYssFS0eMxNWCtnzDJxxZOuS9np74qmhvXYRFIJc/Ofzzrrkacz4jiExIVD2wrGwqOmdalFl9qg20NnLOved6Cz4tew+AsW5igHQB1QzGrK1sqs2ILg7DaKLVylsRMNC9TmShhrh6DsWF+QwCODUtVbe24rK6gwfTJaBliZnkHcbItpLV7LrLjyMQ+M3XTAfPGkz7DrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sFdCQfKpTvw7r5XcYb8DIAAuAx5jQvmslD0aV5HELQ=;
 b=BO0BrhKdujgBZnDE+BDh9Sia2TfCRcZfXQ76XskVNmqD+Et0OTyTXbnqrrtBbtrXo1Qm6ah+k+UdxnGEPN9o7TMka1SPscUFbecJ0djPc/PtWiwguzM+Z0XSgY9KlnbYA/tsgDc13X4sFlJBscoyWMka8w+4fyKIykLNHHH9wlU7i7g52OzeYH2c8zyx1soBiwjM2thO/GU8By5r5C1PMHXoK4xQw0k7WQCRtIbP/q99gGV+kPUtEZ6af7cADkj++onyjjPDIKk8GW9k7lHg/Zl1sKVbsNRA2plLnPNZgBiA0uxsYYq/YSB1T57WJnmodxGpzCq/8wI9Tvgh7NBIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sFdCQfKpTvw7r5XcYb8DIAAuAx5jQvmslD0aV5HELQ=;
 b=DEqWfDKSuRR5sLQ/+cQ8pkTceKalDlaES7pKkbb55bna696M4RhKkQESaRfm6p5GHBfUniczTmOmyKmrDi2FXXA5ifIOskqdQtjjna4aAnoqGUiRD5HFkCndqH8MSp6o1zD52Pbd8BEmnA5+E5MfakCyeg0cVazhNtkb0YC8bHtUoComI+OKsAMMzGHL3RNOXECfffyAhi8BG5csNQGze67pqaKHurrY3blj2KdddPwlz0ms2Y0Q/wKiyUDnr5C0vkLHF4xRC8uX+p8jv5Ji0gTREs9iw0T0h3rz/oDXRP0u3wOxG4Z2jnEJMv+kDB6KlyVSzkQ8vB6uol1+G76K+A==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM7PR10MB3720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:13:12 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695%5]) with mapi id 15.20.5769.016; Thu, 3 Nov 2022
 08:13:12 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 0/2] gpmc wait pin additions
Thread-Topic: [PATCH v9 0/2] gpmc wait pin additions
Thread-Index: AQHY7sOyzBIsS/5XbEupQ0kCeZvdXq4s2rMA
Date:   Thu, 3 Nov 2022 08:13:12 +0000
Message-ID: <3d067d7ce32abd6a78ee9a914e81393f48f46a37.camel@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
         <4582c561-bcdf-a880-cfe5-6813e1c66555@linaro.org>
In-Reply-To: <4582c561-bcdf-a880-cfe5-6813e1c66555@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM7PR10MB3720:EE_
x-ms-office365-filtering-correlation-id: bb6a2490-a5da-43f3-b752-08dabd734057
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmN871sLGfx5ZMOs+DKTjI9DzUxjZpN4Xt3UabkBNYqQS/tYgAE9WkdW/7EPyFkbIO/5T7xO8VchS50PlGUY519jcGNJlrdZd/fGRDZzfOwXUCkVAdUi/Uk1+pkPYGMQ6j2+mxvPz7yZq8HWSZMS4ToMA1sUDO4OA65UtO0kNI8HRyJFJ+BbDSHJJhQmzoHmWzeKIrlZTADFapO+1VMiVcXts/1usIZaMzcMtLNMOu325veXplIu6I1wXKUy5KUVNzS19950RYL3pvVByZG84eDoISn9MVjadnSK3K+/hgToIOH6P8VwqDHCg5w8trDutEkODIVC8ar0k8GIXq+HXFeVuyw7XGwtYE/69qVDyl4iexG5fpoJXBDPBCsqdoIzJN8H37UpgNThdkFC9pah2lYRTWB58vaoSsEG6OKE0vg+ih3aKLUuth5tdBiv6dhV9VdvxFG4Kc9khzi0lV+0vd2hyBfwFktyUgWl2WTRTPCrP74nNlF2g196Jpamc9L1V/5nge/R/dxbjkAUr8Bjp6KExh5vUceMb3Fais0rFPz3O4LFFknaSph/Uyn0gUGER9w5hlf5Ff+jt7KluNWDZJ5zSucgJTQ+D153DytYlrBdAx+CHwSGUF8eHMYxuZHN3mS6e7vaT9cnIdfiplatf3z2O909BJ1NMbkuT1mFoJNH9e/heMhwpqUUNOPYMXJWklduglaFbD+xgDX7gkOf53lTN7ox4gSM6RNAxrMM2/FZKPRQ98YWOYQI9LRDzWevAwFtJf1oqzaJrUz5/DEAUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(6486002)(66899015)(71200400001)(478600001)(82960400001)(38100700002)(54906003)(110136005)(5660300002)(36756003)(86362001)(83380400001)(122000001)(316002)(6512007)(41300700001)(4326008)(8676002)(38070700005)(186003)(2616005)(2906002)(66556008)(3450700001)(76116006)(66946007)(53546011)(64756008)(91956017)(66446008)(8936002)(6506007)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjhWMmVZazVqU3lqZ3UvblJMbkxNY1dQcFFsaGJoRDIrM1VzS3VQNG1pYmM4?=
 =?utf-8?B?WHRuOEZtN3NoSDlXK254NERuNkdpQzhUdk42aS9mZThmcWpzV1lzd09ZSDli?=
 =?utf-8?B?MUFuNklPRXM5SjZxL2p2dElqV3JWV0RkOWowaFB2TlBTMzV3UTA3OEhkTXdz?=
 =?utf-8?B?L0JsVmxVV21aV1gwQnNHSWlqSzJjQyt6ZzJTOFdOblc4SDlTNnFsMm0rTnRP?=
 =?utf-8?B?azVoSFBMWXZaenE3dnl1REdZWEk2V2ZWaDBTb3EzZkpIV05OM0gzSDQ3aDZw?=
 =?utf-8?B?Vjdmd1RBclZkMng3VzlMcW1yZFRxODl0OStXYU8yUmFDSmFKZDZwQmUxNDB6?=
 =?utf-8?B?VXRUMDlJTmEyZFF0R1BGdTFiV0g5aTRQZVB0RnhMV0E1K1JKYzdUM2dSUFN0?=
 =?utf-8?B?TjQ5VFZscEI1ZVArY0RMMUwyT0VUT0dVTitYaXc4S0NUMlBpNDAycCtmbkN6?=
 =?utf-8?B?bE1DV0d1UHRxMVd4cU5JbnVFUWFPM0pGTzBFQjloSTBjaU55V2xRNlVmeXp5?=
 =?utf-8?B?Z3Nab1VlYmFpM0ZxSUpDUDZQcFVzMTBKWUFvSnIvZDljeXlmemZ2U2MzZUlv?=
 =?utf-8?B?cmloaFpMRkppQzRKWVNKL3drc2RIemJjZHlYSUgxV1dFTkpHbEh0dEdoUFVy?=
 =?utf-8?B?VElRYmpCdFYxeW5IMmpwaDAwRm10UUJicjU2Y1d4UkM5QnNDMlRadnl0U0Zu?=
 =?utf-8?B?RVM1dXNjTkZKYXk0dDdacTV4MzlpT3A3VVcyVzdaTjE4QzBZT2h0NUQxU3d5?=
 =?utf-8?B?R2JtcDBQd0FpK3FzQmtjR25QNE5PeDkxU2dnS05aVGx4bUllWGxzMDZraGVH?=
 =?utf-8?B?dCt4UWU2aGJIeklqOStIZXlZTVhJWkxyNWtNVGlBRGcyWUNFZFVyQkE3V1NG?=
 =?utf-8?B?MWhHTzJlM0tiR25ETlNkOFlPVGI3d2R5aXBpU2NHNzlpTlR0bXVDbTI4N04w?=
 =?utf-8?B?cDJlcXNEc3c2UHVnMkNlbDFmWUNvSjJ6Z3g3V05ZU3ZjRnI1RXRxVllyOW1M?=
 =?utf-8?B?WUNnZHh4SmMzRnpFdDhvMmEyRmIzZ28rek9iWjJ0UkFmZ0U4M081WDBSN2Ry?=
 =?utf-8?B?WlY2bXNYYjdIRnpKN3lncWJUeWUvVm5vMmtLNVpvemFlRW9EbFJ6MHFnOXdq?=
 =?utf-8?B?dFJOQXlMbmdSN0Q2QjY0VHMyVytvWnZBUGIxNWZWdXF2NTVYQ1A1REJDYyt0?=
 =?utf-8?B?Sml4NVV1Y2dySGtUb0YxWHdGZ1duSCsrMlZLYWJhZnozd1E5Skh4UHVGWis2?=
 =?utf-8?B?MzRVMHUydm1CTVdUbGh2QWJtVmg1Q2xZMWVNdFllTnFCZHE2UURKUU9WMHVj?=
 =?utf-8?B?T3lvSW5VS1hRNnRMc21aKytWcUNqQ3I5aEhRWE53RmRXcWVrNWt0cTZCQWZY?=
 =?utf-8?B?OGZla1kxQjNtVkQyanFXcjAveFhNNHFTMVRvOFFSeDJlc2hFbkMzMHI4UzZQ?=
 =?utf-8?B?SnM4cUliMUIyOHRDT1IxY3RnZkgyczlDKzVqRmdXOWlqSjM5eUVWZE1iQ0dx?=
 =?utf-8?B?U0NFRTFNenI4TmZtcWh6cm9sNGljK0ZGWlBRMWc4MEYxTFo5WkhWUDhYS24x?=
 =?utf-8?B?L3ZPTEZ2VWZwdVB2elV0MU1HK3hROFNMVlhyTElDTmhZcGFGeWc3a3Ftd2Vl?=
 =?utf-8?B?L09KbHR1ekVOT25WUFVMaHg4OWlUN1p1aGNnUFpBOU9JK3BObWZicHNkQjZL?=
 =?utf-8?B?bUluTEVtT0txT01uT05IWWNUWGVBQlBtOE94ZHdxZ2poZWxTYUcwWm8weEdZ?=
 =?utf-8?B?MFJQQnZxRGp6ODIvZWQ1TldmRjV4NnZSU0hGMncrSnZPLzAzVUZDMGd5S3M0?=
 =?utf-8?B?dStnR3ZTNXpKMnJUYk42WVFVTndlS1dWK3c0VCtJb1hDWWg2eFE0dVUvd3Vr?=
 =?utf-8?B?OVFRRlMrSUJ1WDNxQXRZaTRZd0tHa2RvY2lNNFhvT0lGQ2p0SDl1dzE3MUVF?=
 =?utf-8?B?eE5JQWJCSTEzdjh6RUlrS3pYUVBwenpZdzVXYzgremJBQXYxZjRRR1lKT1Uv?=
 =?utf-8?B?dE1Eb0x0ZktNSFo4cUlEUkFuQ3lCYkJ5akFxRU9KeHVraHdxVm9iUTZuZjVv?=
 =?utf-8?B?RmV2Y0VnQlJyVUV3dzNYUUZzWlBxSkFsTXFNenJ1V3RZWDNXUzJ1UWIxeW9v?=
 =?utf-8?B?YXhlcHloZnpWSDJnWWY0Q1loNDlwRlpVNzF1QjVGQWJCbitPT1NNNlV3MHEr?=
 =?utf-8?B?NlU3cVNBK2VBNmtOU1FZZ0R4RzY5TWFFV0JDSG52WThMbXZmSjZaemlhQVFP?=
 =?utf-8?Q?LwoCAS8tbc2LissMva6CfeN5fVgQlw/59ePKNcvByI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54F1C66282098F4AA1D584CB622799C5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6a2490-a5da-43f3-b752-08dabd734057
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:13:12.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azjjtZMQu3Up9xeUtLubR2kG5LlP5bCtx5gs/t6ZSW4+azgzr0INaRwHH1NERWroyYN/opLHozooW0v1BS+HMc5Hs/CNhdzw+t7CpZFq3+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3720
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gV2VkLCAyMDIyLTExLTAyIGF0IDEwOjAyIC0wNDAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwMi8xMS8yMDIyIDA5OjMwLCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+IEZy
b206IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+
DQo+ID4gDQo+ID4gQ3VycmVudGx5IGl0IGlzIG5vdCBwb3NzaWJsZSB0byBjb25maWd1cmUgdGhl
IFdBSVQwUElOUE9MQVJJVFkgYW5kDQo+ID4gV0FJVDFQSU5QT0xBUklUWSBiaXRzIG9mIHRoZSBH
UE1DX0NPTkZJRyByZWdpc3RlciBkaXJlY3RseSB2aWENCj4gPiBkZXZpY2UgdHJlZSBwcm9wZXJ0
aWVzLg0KPiA+IA0KPiA+IEl0IGlzIGFsc28gbm90IHBvc3NpYmxlIHRvIHVzZSB0aGUgc2FtZSB3
YWl0LXBpbiBmb3IgZGlmZmVyZW50DQo+ID4gY3MtcmVnaW9ucy4NCj4gPiANCj4gPiBXaGlsZSB0
aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBtYXkgZnVsbGZpbGwgbW9zdCB1c2VjYXNlcywgaXQg
bWF5IG5vdA0KPiA+IGJlIHN1ZmZpY2llbnQgZm9yIG1vcmUgY29tcGxleCBzZXR1cHMgKGUuZy4g
RlBHQS9BU0lDIGludGVyZmFjZXMpLCB3aGVyZQ0KPiA+IG1vcmUgY29tcGxleCBpbnRlcmZhY2lu
ZyBvcHRpb25zIHdoZXJlIHBvc3NpYmxlLg0KPiA+IA0KPiA+IEZvciBleGFtcGxlIGludGVyZmFj
aW5nIGFuIEFTSUMgd2hpY2ggb2ZmZXJzIG11bHRpcGxlIGNzLXJlZ2lvbnMgYnV0DQo+ID4gb25s
eSBvbmUgd2FpdHBpbiB0aGUgY3VycmVudCBkcml2ZXIgYW5kIGR0LWJpbmRpbmdzIGFyZSBub3Qg
c3VmZmljaWVudC4NCj4gPiANCj4gPiBXaGlsZSB1c2luZyB0aGUgc2FtZSB3YWl0cGluIGZvciBk
aWZmZXJlbnQgY3MtcmVnaW9ucyB3b3JrZWQgZm9yIG9sZGVyDQo+ID4ga2VybmVscyAoNC4xNCkg
dGhlIG9tYXAtZ3BtYy5jIGRyaXZlciByZWZ1c2VkIHRvIHByb2JlICgtRUJVU1kpIHdpdGgNCj4g
PiBuZXdlciBrZXJuZWxzICg+NS4xMCkuDQo+IA0KPiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5k
ZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgeW91IHJl
Y2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0Lg0KDQpUaGFua3MgZm9yIHRoZSBoaW50
Lg0KDQpXYXMgZXZlcnl0aGluZyBPSyB3aXRoIHY5IChleGNlcHQgdGhhdCBJIHJlc2VuZGV0IHRo
ZSB0YWdnZWQgcGF0Y2gpPyBVbnRpbCB2OCBJIHdhc24ndCBhd2FyZSBvZiB0aGF0LiBJIHRob3Vn
aHQgSSBhZGRlZCB0aGUgdGFnIGZvciB2OS4gDQoNCkNoZWVycywNCkJlbmVkaWt0DQo=
