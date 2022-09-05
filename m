Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6EE5AD3F1
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237847AbiIENd0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 09:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbiIENdZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 09:33:25 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA874A82D;
        Mon,  5 Sep 2022 06:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V25bpti6zgON3hsFP36DHQXGGMFM7yveqXMaAsHnBuAEAAxzVTDuGmhNIuGhUTMMe9AVLNncEv0J1w8MNbxtbTXxWFuoTIFxZRZ6+5890TJITN9S/6LhMnu/WCYGIq6EGqBtftIwjDPaKWx2uzqe0SD5HVijaC9TOUpGUepicfNptle7Br6z+/R9EX3FSRx9XHLmpbIiyXyOWRUI+bDup3Poyg2sEqsFKRe7zHuNLMyQmLzxQcS4Zbf/QkSRKhr+9ENR0hSJc+lDEtLiRcwI3qDaeQjdhdHEAqwdIprX4f0YmSjdC8EBmDKOTLdMsQLxSsfjh8URzEmTUI2kXOpqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWRmzU7JFnb2Y4fUqYZ6FzaARIEy9Ku6n2Sr0BICPTU=;
 b=jujf5VfIylqiYbqFJLGBRE3CQlnxZH3aXPZTHxmAzYhcuAUAz6j4W74Vie2tw4rlHMKr5emI/TY4Up7EyH1u5s6255KkjwscrmKo8UOSEQCpVqtqWD7UJBupBZQSaTeYYoJ8mbsicgkWSXLOBaRJbdttTZeITAmiCEsWzP+BeMbaXcGFLiywNEjxzCOLaPuIGz1MlH33IjThGupgNyHJ0ObxBXWR0onIOTEmxSVUz924E//x8CSPR68kJDLjap5Iu4lQ1QwtXUyjBKaSlr4OZpV6TMQYXJfmXpYQAXMcpuC5FdBnxv3C+L6xSPGCJF/Uary4ihVlQwZr2+NjfuM6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWRmzU7JFnb2Y4fUqYZ6FzaARIEy9Ku6n2Sr0BICPTU=;
 b=ig0QLAP+kbhoD8dh1cm19YshggZrMDyJA4+YPkQETIRxFTPyOvea8TGgHSeeGAWwlKMETZVncKg/tXVkEujVroEI/m3f1v1H22GOmF9tDeaTytDj1iMib7BXA0mMziQcM+mJlwdMSzaCuhWLuNtS2/mNLrXW2NxXU+3zV8XF45POfPG1GZzadnKreyMlqK/IngQmSikL12AoQ86nXVS9cJ6idvvY5ncLznEOlhSbmt1yc45fmFPdPwV8HaMMmtP2a7VRVsAgTph/BfY30f7HZsvgKwJN3Dv5ugyOgCUcRZxXo9XVhXxZfeBvAn6p+WEFIUH7qw3s2Gir8ssxcQBZ/A==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by DU0PR10MB5584.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:318::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 13:33:19 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf%7]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 13:33:19 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Topic: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Thread-Index: AQHYwQVr/FYdP5u1PkWzXBuYLjmi3q3QjdaAgAABwoCAAAlEgIAAH/yAgAAFhACAABe4gA==
Date:   Mon, 5 Sep 2022 13:33:19 +0000
Message-ID: <cea66905a1f9ae09c9742b5040195c93759d5a1d.camel@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
         <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
         <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
         <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
         <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
         <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
         <6397b5d11c786ee6194776e096380103976049dd.camel@siemens.com>
         <7e7a1cf6-8a11-2179-8fe6-c40e7cd8be62@linaro.org>
In-Reply-To: <7e7a1cf6-8a11-2179-8fe6-c40e7cd8be62@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70cf6434-5d91-41b7-f473-08da8f433243
x-ms-traffictypediagnostic: DU0PR10MB5584:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y2H3UfZnxoeG++n/2nsh3g4g+7UyPrR724zKV3yGVKwfQ83KBnrqw8dpcnOvA6biBVmLlA8znZtaAjU5KU9aWzLnn+XWdiOGOTg+562ocvzmYnfGHWVAU0VNu7h/d8rFr/T27N5QQbAAa6hjGOVgBuYH7osENNgMlbCRVo/VQgvxb3nf3VOJ4DhzazqJC6vjPjIvVR5FCyE71pSRf8QLUpF83uFiWEvzM9fzMWT5epuYjxspkdz7EgNBwiNQgyyoVAzF6Grng2rsKC/MRK5s8r1nScWtzIB5+YgWhJLWPPKiaQWLmvGS3hHgGQrc5W10NhBwKe8b5Zf8pDR9SaOeoSWCaYkG8iBn3dy+dH9RzwioAKEahDVYAyXdJpKJdq8MMQG/uGG1WrZ3r0pYp5QIh1cy8SibkSQb2Pkb+qITrai8WOBVq7FBnJUh4Fh6Y4pqXfkRkA4YEMpBd8R3fFRzQk8HUgSqyk51FDe4QhXRR2kiAR21KmO6bwYUMUCiVNRo3PAPd5/1gXESVNyPbJ9lS5UDL/nP8VfE/Drrv+VD33W5sQQcjixWg948WA3KUWvUJmvOlmVCANgbgEueN/gstOKwzRaqXtm4rtqpMCFqH3FDCX++Od+65X/NNPzQyEfkfdQoQiB9Dcw9p3a2YFTsnWMJwDml9dqq0PH9tybATGMY39T0EH4xbHCPXe0XaPMwPHx27ADWX6dfeAk9Os5voB/zVsbS5EVkZg8CYw/kZB3U0uzn8zfnq2/j84CttQHn0QlX2sNrAWHlbDuagI64Dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(3450700001)(2616005)(86362001)(5660300002)(186003)(8936002)(41300700001)(6506007)(6512007)(53546011)(26005)(2906002)(76116006)(38070700005)(38100700002)(54906003)(122000001)(36756003)(478600001)(6486002)(66476007)(91956017)(66556008)(83380400001)(66946007)(82960400001)(4326008)(66446008)(71200400001)(8676002)(316002)(110136005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3puSkdxZk5oSUlDYnc3MEl4TURDSWtCVFp4R0g2UHBzR1hqK0NuL2c0WlRP?=
 =?utf-8?B?cWtTN1MyUDhpd1FKb2w5NFNNQk81R3UxWC92d2s4b0lWNVhIRHhiZFh5c2ZO?=
 =?utf-8?B?L3BpRzI0MS9WdDkwUlYrMkdKMGpIcW8rZ0hsRE1qS2EzcHVIbEp4aFdjU0d5?=
 =?utf-8?B?RUErczlib1RMK2NFMk1Jdm0rZnFNSlE1VjZKTTJHRG15dUxhMkw0b2xmMlIz?=
 =?utf-8?B?NTRPNkRXaEozSnpidm4yQmtQQWVRUFBoMXRaOVBIQ1dsTStUYXRZS1NuTjVI?=
 =?utf-8?B?L3hHOFFOVWNXZkRhUyt1RVNyTGVaU0laMkFtRlk1ZjdCRlF4NVBEc2FSelJV?=
 =?utf-8?B?clR0WnBMUlVUOUxVSStnVjlLcDFuYmtCb3UrSzFHTEZlT1FPczJyZXhUbmRW?=
 =?utf-8?B?RlZqa0RnK2xxSmJKYm9TMUNKZlRzTnozaHFyWlVCY0tJSnV0bG9lVElvejBO?=
 =?utf-8?B?NGl3QTI5S1pRMWM5VUUvZ1QxL0ZRS1VCa3Bxc1RtTGtQY3hpOFNkMjArSk5Z?=
 =?utf-8?B?ZlhML3F2empEQVlwRCtkZDJtWC9xWnhRMUF0ZWJRdDA4OVpmcks5R1JMaENF?=
 =?utf-8?B?NTJRU0FHWmRIdkFIb3FmeGpDWmVodk5TSGg0QmtqV2UwSVEwK2R4dk82MUpt?=
 =?utf-8?B?NDlJVFRFRlZneDNNMHBxZVVFc0VSczhBNGNOQ0J5VDNNRGlzTlMwb3p2ZlBs?=
 =?utf-8?B?VCtEM3VMWmEyMk9yeTVLMXo4ZEhqM21Na1NrRzJhUnFqODdpQWd3S2Q1N1h4?=
 =?utf-8?B?MGxvWVl1OUduZnpxKzk0WHgxL0l2V3ZuYzZTOEthbjg4QVdtVk5aL0wxZDJO?=
 =?utf-8?B?aDZiaURYbHRoaDZWeUVBNCtnZEUyQkhxR05ld1VyS2ZkSmZHUE5KUU83YytK?=
 =?utf-8?B?V3V1bi91SVhqWTc1bmtOdm9RdVZGUDFwMkY5bjFJVEdaUUxiMDF6RExKWVVH?=
 =?utf-8?B?YWRkSFRjZkwweHdpdlZJT1pEa2dlR1d6aGJoZURpMExOd1dsMFpiN2MzSmFz?=
 =?utf-8?B?YkxhN3B5RjE3RDRsRmQ2OFF0MXF3M3JhaGVRVzFPMUg4ZGY0R0pRQVM2aVhw?=
 =?utf-8?B?SHpKcUIzbFBoQ2NCSU9JR3pXTHJWUHVTNWZ0bnJSOTFZSUcvMEt1bUxXQWMw?=
 =?utf-8?B?eVc0bytKdHpnclY3cGpGWkJJdmxsQUk0bkZVR2RYZmw2Rmc1VU4va3VqWFBs?=
 =?utf-8?B?NGNKRXl4ZmVncTYveUNrM001aWxUSTVoOVR3OGROZHlzK0JtTGdGNDR1TE51?=
 =?utf-8?B?N2FjOGRHbzlwUTZybkdrZ0FnZlA3cFlDUkIxTXBvOXBEVlpBOFlTVFdTZEFu?=
 =?utf-8?B?cnJlZEtlVUNWR0tMbndCdUlkUVJvN3cxZWFXME1pbnNrbmJ6Y3ppemppVllm?=
 =?utf-8?B?dE81dFA2enQxRG4wY1kvRnZSU1dXcGxKQ1N5VitrZXI2K1Y0VWJjeWwxOTg1?=
 =?utf-8?B?dERtUGFnZUJRUkZacmZYeWNGbzZPSnRnZ0ZhTnY4OVpzVmVJNWtTRWFzVENI?=
 =?utf-8?B?S0VmR2c4SXJKMisyZTJ6eEdnY3BUUi9IWXR4eG9md2s4bCtNcWl0NmRTY3Rh?=
 =?utf-8?B?RVpwU3VGOWhQbUU3aGJxeE1jMi84amNNbk1uTlIrYW42MEZhczhORFYrUHBV?=
 =?utf-8?B?TC9tbjRGTGdKazlZQUlhK1NTcFRsbWJYeVlFMm9nOVNETnh3b2JQSDMrUEd6?=
 =?utf-8?B?M3BqRGM2TWllcUY1VHgxMjZialBaU2JibW5EYnJ6UWptYmRRNTBvcTRKcFpK?=
 =?utf-8?B?VEFWTWc5RUtNbVB6NGsrcE8wYUcyY2o1R0tocEFGRitxb1EzVkZSWWl5Ymk1?=
 =?utf-8?B?WXhVa2p2SmpXSVB6L3Q4c1gyYUFUM2dSWVpzaHI5cDNpbWFNUVBCTFhqL0JW?=
 =?utf-8?B?byt0UnZmV1RPL2RRRER1Q1NtMnpqTjRGQ0lldExBOVcxWVh5dzBWdXJ0MVNY?=
 =?utf-8?B?ZXZxcnIrNFdaRUZTV1ZrMmUva0d1K04zbDJSZXN6OTVDV3AwVVhzd1FSRDBO?=
 =?utf-8?B?QmxwSjJxWHE0ZWN0dkdxS2dMRVdpa3BPUmg4VXJnM1V2MHA1NTAzSUh5ai9q?=
 =?utf-8?B?Qmp2b0hBZGpMSUkzWlZLaVBxcUNYUVZsSHEzQ0ZaTmhuWU5QbVB6L1d6UFBH?=
 =?utf-8?B?bTFvb0JGMnFmZTBSUVVWbGNocTNWcVpYK3hHcWplRGNWQ0YyOHQwU2V6QWk3?=
 =?utf-8?Q?qP7ytMJsdEqjk0ieQFmvr+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34C72F7180B33343989292E0518B5158@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cf6434-5d91-41b7-f473-08da8f433243
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 13:33:19.4929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8A5LuUvUhXN5OlAhT+XTxkgRaG78vlKY0Bf5EipnQSysmNlP9lrCxaLcsMaZuS5zt9G++nubyI+7Sx5hT6KxnnIkiKxz31wABaCjOAbZVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5584
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTA1IGF0IDE0OjA4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwNS8wOS8yMDIyIDEzOjQ4LCBOaWVkZXJtYXlyLCBCRU5FRElLVCB3cm90ZToN
Cj4gPiBPbiBNb24sIDIwMjItMDktMDUgYXQgMTE6NTQgKzAyMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+ID4gPiBPbiAwNS8wOS8yMDIyIDExOjIxLCBSb2dlciBRdWFkcm9zIHdyb3Rl
Og0KPiA+ID4gPiBPbiAwNS8wOS8yMDIyIDEyOjE0LCBOaWVkZXJtYXlyLCBCRU5FRElLVCB3cm90
ZToNCj4gPiA+ID4gPiBPbiBNb24sIDIwMjItMDktMDUgYXQgMTE6NTYgKzAzMDAsIFJvZ2VyIFF1
YWRyb3Mgd3JvdGU6DQo+ID4gPiA+ID4gPiBIaSBCZW5lZGlrdCwNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gT24gMDUvMDkvMjAyMiAxMDoxNywgQi4gTmllZGVybWF5ciB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8DQo+ID4gPiA+ID4gPiA+IGJlbmVk
aWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiBBZGQgYSBuZXcgZHQtYmluZGluZyBmb3IgdGhlIHdhaXQtcGluLXBvbGFyaXR5IHByb3BlcnR5
DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBO
aWVkZXJtYXlyIDwNCj4gPiA+ID4gPiA+ID4gYmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNv
bQ0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+ID4gPiA+ID4gY2hpbGQueWFtbCAgICAgICAgIHwg
DQo+ID4gPiA+ID4gPiA+IDcNCj4gPiA+ID4gPiA+ID4gKysrKysrKw0KPiA+ID4gPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktDQo+ID4gPiA+ID4gPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtY2hpbGQueWFtbA0KPiA+ID4g
PiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4g
PiA+ID4gPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtDQo+ID4gPiA+ID4gPiA+IGNoaWxkLnlhbWwN
Cj4gPiA+ID4gPiA+ID4gaW5kZXggNmUzOTk1YmIxNjMwLi43YzcyMTIwNmYxMGIgMTAwNjQ0DQo+
ID4gPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktDQo+ID4gPiA+ID4gPiA+IGNvbnRyb2xsZXJzL3RpLGdwbWMtDQo+ID4gPiA+ID4gPiA+IGNo
aWxkLnlhbWwNCj4gPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS0NCj4gPiA+ID4gPiA+ID4gY29udHJvbGxlcnMvdGksZ3BtYy0NCj4gPiA+
ID4gPiA+ID4gY2hpbGQueWFtbA0KPiA+ID4gPiA+ID4gPiBAQCAtMjMwLDYgKzIzMCwxMyBAQCBw
cm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gPiAgICAgICAgV2FpdC1waW4gdXNlZCBieSBjbGllbnQu
IE11c3QgYmUgbGVzcyB0aGFuDQo+ID4gPiA+ID4gPiA+ICJncG1jLG51bS0NCj4gPiA+ID4gPiA+
ID4gd2FpdHBpbnMiLg0KPiA+ID4gPiA+ID4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiA+ICsg
IGdwbWMsd2FpdC1waW4tcG9sYXJpdHk6DQo+ID4gPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246
IHwNCj4gPiA+ID4gPiA+ID4gKyAgICAgIFdhaXQtcGluIHBvbGFyaXR5IHVzZWQgYnkgdGhlIGNs
aWVuLiBJdCByZWxhdGVzIHRvDQo+ID4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gPiBwaW4N
Cj4gPiA+ID4gPiA+ID4gZGVmaW5lZA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBkaWQgeW91
IG1lYW4gImNsaWVudD8iDQo+ID4gPiA+ID4gPiBDYW4geW91IHBsZWFzZSBzcGVjaWZ5IHdoYXQg
dmFsdWUgaXMgZm9yIEFjdGl2ZSBMb3cgdnMNCj4gPiA+ID4gPiA+IEFjdGl2ZQ0KPiA+ID4gPiA+
ID4gSGlnaD8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBZZXMsIHRoYXQgbWFrZXMgc2Vuc2UuIEFu
ZCB5ZXMgSSBtZWFudCAiY2xpZW50Ii4gTXkgdHlwby4uLi4uDQo+ID4gPiA+ID4gPiA+ICsgICAg
ICB3aXRoICJncG1jLHdhaXQtcGluIi4NCj4gPiA+ID4gPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gV2h5IGNhbid0IHR5cGUgYmUgYm9vbGVhbj8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPZiBj
b3Vyc2Ugd2UgY2FuIHVzZSB0aGUgYm9vbGVhbiB0aGVyZS4gSW4gdGhhdCBjYXNlIEkgc2hvdWxk
DQo+ID4gPiA+ID4gZ2l2ZSB0aGUNCj4gPiA+ID4gPiBwcm9wZXJ0eSBhIG1vcmUgbWVhbmluZ2Z1
bCBuYW1lIGUuZy4gd2FpdC1waW4tYWN0aXZlLWhpZ2ggb3INCj4gPiA+ID4gPiB3YWl0LXBpbi0N
Cj4gPiA+ID4gPiBhY3RpdmUtbG93LiANCj4gPiA+ID4gPiBTaW5jZSB0aGUgZGVmYXVsdCBiZWhh
dm91ciBvZiB0aGlzIHBpbiBpcyBBY3RpdmUgSGlnaCwNCj4gPiA+ID4gPiBhIGJvb2wgcHJvcGVy
dHkgImdwbWMsd2FpdC1waW4tYWN0aXZlLWxvdyIgd291bGQgbWFrZSBtb3JlDQo+ID4gPiA+ID4g
c2Vuc2UNCj4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4g
DQo+ID4gPiA+ID4gSWYgdGhlIHByb3BlcnR5IGlzIG1pc3NpbmcsIHRoYW4gdGhlIHBvbGFyaXR5
IHN0YXlzIG9uIEFjdGl2ZQ0KPiA+ID4gPiA+IEhpZ2ggbGlrZQ0KPiA+ID4gPiA+IGJlZm9yZS4N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9LLCBpbiB0aGF0IGNhc2UgeW91IGRvbid0
IGhhdmUgdG8gY2xhcmlmeSB0aGUgcG9sYXJpdHkgaW4NCj4gPiA+ID4gZGVzY3JpcHRpb24uDQo+
ID4gPiANCj4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCAoYW5kIGl0IGlzIG5vdCBleHBsYWluZWQg
aW4gY29tbWl0IG1zZyksIHdoeQ0KPiA+ID4gZG8NCj4gPiA+IHlvdQ0KPiA+ID4gbmVlZCBzdWNo
IHByb3BlcnR5IGluc3RlYWQgb2YgdXNpbmcgc3RhbmRhcmQgR1BJTyBmbGFncy4NCj4gPiA+IA0K
PiA+ID4gVGhlIGRyaXZlciBzaG91bGQgdXNlIHN0YW5kYXJkIEdQSU8gZGVzY3JpcHRvciBhbmQg
c3RhbmRhcmQNCj4gPiA+IGJpbmRpbmdzLg0KPiA+ID4gSWYNCj4gPiA+IGl0IGNhbm5vdCwgdGhp
cyBoYXMgdG8gYmUgZXhwbGFpbmVkLg0KPiA+ID4gDQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4g
PiBLcnp5c3p0b2YNCj4gPiANCj4gPiBJIHRoaW5rIHRoaXMgaXMgYmVhY2F1c2UgdGhlIEdQTUMg
Y29udHJvbGxlciBpdHNlbGYgaXMgbm90DQo+ID4gcmVzcGVjdGluZw0KPiA+IHRoZSBHUElPIGZs
YWdzLiBJbnN0ZWFkIHRoZSBHUE1DIGlzIHJlYWRpbmcgdGhlIExpbmUgTGV2ZWwgZGlyZWN0bHkN
Cj4gPiAoaGlnaCxsb3cpIGFuZCB0aGVuIGV2YWx1YXRlcyB0aGUgbG9naWMgZGVwZW5kaW5nIGhv
dw0KPiA+IHRoZSBXQUlUPHg+UElOUE9MQVJJVFkgYml0IGlzIHNldCBpbiB0aGUgR1BNUENfQ09O
RklHIHJlZ2lzdGVyLg0KPiA+IA0KPiA+IFVudGlsIG5vdyBncGlvY2hpcF9yZXF1ZXN0X293bl9k
ZXNjKCkgd2FzIGhhcmRjb3JkZWQNCj4gPiB0byBHUElPX0FDVElWRV9ISUdILiBBbiB0aGUgR1BN
Q19DT05GSUcgcmVnaXN0ZXIgY29uZmlndXJhdGlvbiBoYXMNCj4gPiBubw0KPiA+IHJlbGF0aW9u
IHRvIHRoZSBHUElPIHNldHRpbmcgKGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uKS4NCj4g
PiBNeSBmaXJzdCBhcHByb2FjaCB3YXMgdG8gbWFrZSB0aGlzIHBhcnQgY29uZmlndXJhYmxlIHZp
YSBhIG5ldw0KPiA+IGRldmljZQ0KPiA+IHRyZWUgcHJvcGVydHkgKHdhaXQtcGluLXBvbGFyaXR5
KS4NCj4gPiANCj4gPiBJTUhPIChjb3JyZWN0IG1lIGlmIEknbSB3cm9uZykgdGhlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24gYWxzbyBkb2VzDQo+ID4gbm90DQo+ID4gbWFrZSB1ZXMgb2Ygc3RhbmRh
cnQgR1BJTyBiaW5kaW5ncyBhbmQgZGVmaW5lcyB0aGUgd2FpdCBwaW4gdmlhIGENCj4gPiBzZXBh
cmF0ZSAiZ3BtYyx3YWl0cGluIiBiaW5kaW5nLg0KPiA+IA0KPiA+IEUuZy4gZ3BtYyx3YXRpcGlu
ID0gPDA+IG9yIGdwbWMsd2FpdHBpbj08MT4NCj4gPiANCj4gPiBUaGUgYmVzdCBzb2x1dGlvbiB3
b3VsZCBzaG91bGQgYmUgd2hlbiBzZXR0aW5nIHRoZSBiaW5kaW5nIHRoaXMgd2F5DQo+ID4gZm9y
DQo+ID4gZXhhbXBsZTogZ3BtYyx3YWl0LXBpbiA9IDwmZ3Bpb3ggeSBBQ1RJVkVfWD4NCj4gDQo+
IFllcyBhbmQgSSBhbSBhZnJhaWQgdGhpcyB3aWxsIGdyb3cgaW5zdGVhZCBvZiBhZGRpbmcgcHJv
cGVyIEdQSU8NCj4gdXNhZ2UuDQo+IEFueSByZWFzb24gd2h5IGl0IGNhbm5vdCBiZSBhIHN0YW5k
YXJkIEdQSU8gcGluIGRlc2M/DQoNClRoaXMgY2hhbmdlIChncG1jLHdhaXQtcGluID0gPCZncGlv
eCB5IEFDVElWRV9YPikgbWF5IGJyZWFrIGN1cnJlbnQNCmltcGxlbWVudGF0aW9ucyB3aGVuIHRo
ZSBHUE1DIGlzIHVzZWQgd2l0aCBOQU5EIGRldmljZXMuIEl0IGNvbWVzIHRvDQpzb21lIGNvbmZp
Z3VyYXRpb24gaW4gdGhlIEdQTUNfQ09ORklHIHJlZ2lzdGVyIHdoZW4gSVJRcyBhcmUgc2V0dXAN
CmluIE5hbmQgTW9kZS4gDQoNCkJ1dCB3aGVuIHVzaW5nIHRoZSBOYW5kIG1vZGUgdGhlIHJlZ2lz
dGVyIGNvbmZpZ3VyYXRpb24gaW4gcXVlc3Rpb24gaXMNCnByb3Blcmx5IGNvbmZpZ3VyZWQsIGJ1
dCBpbiBhIGNvbXBsZXRlIGRpZmZlcmVudCBjb250ZXh0Og0KDQpFLmcuIGluIGFtMzM1eC1iYWx0
b3MuZHRzaToNCg0KaW50ZXJydXB0cyA9IDwwIElSUV9UWVBFX05PTkU+LCAvKiBmaWZvZXZlbnQg
Ki8NCiAgICAgICAgICAgICA8MQ0KSVJRX1RZUEVfTk9ORT47IC8qIHRlcm1jb3VudCAqLw0KcmIt
Z3Bpb3MgPSA8JmdwbWMgMCBHUElPX0FDVElWRV9ISUdIPjsNCi8qIGdwbWNfd2FpdDAgKi8NCg0K
VGhlICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSB3aWxsIGNvbmZpZ3VyZSB0aGUgR1BNQ19DT05GSUcg
cmVnaXN0ZXIgYml0cw0KZm9yIHRoZSB3YWl0cGlucy4gDQoNCkJ1dCBpbiBhIG5vbi1OQU5EIGNh
c2UsIHRoZSAiaW50ZXJydXB0IiBjb25maWd1cmF0aW9uIHdvdWxkbid0IG1ha2UgYW55DQpzZW5z
ZSwgc2luY2UgaW50ZXJydXB0cyBhcmUgbm90IHVzZWQgYXQgYWxsLg0KDQpUaGUgInJiLWdwaW9z
IiBpcyAqbm90KiBoYW5kbGVkIGJ5IHRoZSBvbWFwLWdwbWMobWF5YmUgc29tZXdoZXJlIGluIHRo
ZQ0KTkFORCBzdWJzeXN0ZW0/KS4gDQoNCkNoYW5naW5nIHRoZSB3YWl0LXBpbiBwcm9wZXJ0eSB0
byAiZ3BtYyx3YWl0LXBpbiA9IDwmZ3BtYyBYIEFDVElWRV9YPiINCndpbGwgY3VycmVudGx5IGJy
ZWFrIGF0IGxlYXN0IDMgZGV2aWNlIHRyZWVzOg0KDQphcmNoL2FybS9ib290L2R0cy9vbWFwMy1k
ZXZraXQ4MDAwLWNvbW1vbi5kdHNpDQphcmNoL2FybS9ib290L2R0cy9vbWFwLXpvb20tY29tbW9u
LmR0c2kNCmFyY2gvYXJtL2Jvb3QvZHRzL29tYXAzLWxpbGx5LWE4M3guZHRzaQ0KDQogDQpJIHRo
aW5rIGl0IG1ha2VzIHNlbnNlIHRvIGltcGxlbWVudCBhIHYzIGFzIFBPQz8NCg0KPiA+IEJ1dCBJ
IHRoaW5rIHRoZSBjdXJyZW50IG9tYXAtZ3BtYy5jIGltcGxlbWVudGF0aW9uIGRvZXMgbm90IG9m
ZmVyDQo+ID4gc3VjaA0KPiA+IGEgdXNlY2FzZSBhbmQgYXMgcm9nZXIgYWxyZWFkeSBtZW50aW9u
ZWQ6IA0KPiA+ICJHUE1DIHdhaXRfcGluIHBvbGFyaXR5IGxvZ2ljIGlzIGhhcmQtd2lyZWQgYW5k
IGRvZXNuJ3QgZGVwZW5kIG9uDQo+ID4gR1BJTw0KPiA+IHN1YnN5c3RlbSBmb3IgaXRzIHBvbGFy
aXR5Ig0KPiANCj4gVGhpcyBwYXJ0IEkgZG9uJ3QgZ2V0LiBZb3UgbWVhbiBoYXJkLXdpcmVkIGlu
IHRoZSBkcml2ZXIgb3IgaGFyZC0NCj4gd2lyZWQNCj4gaW4gdGhlIGhhcmR3YXJlPyBJZiB0aGUg
Zmlyc3QsIHBsZWFzZSB1bi13aXJlIGl0LiBJZiB0aGUgbGF0dGVyLCB5b3VyDQo+IHByb3BlcnR5
IG1ha2VzIG5vIHNlbnNlLCByaWdodD8NCj4gDQpJTUhPIHJvZ2VyIG1lYW50IHRoYXQgY29uZmln
dXJpbmcgdGhlIEdQTUMgcmVnaXN0ZXJzIHZpYSBncGlvbGliDQpjYWxsYmFja3Mgd291bGQgYmUg
dGhlIHdyb25nIHBsYWNlIHRvIGltcGxlbWVudGVudC4gSSBpbXBsZW1lbnRlZCANCnRoZSBncG1j
IHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24gaW4gdGhlIGdwaW9fZGlyZWN0aW9uX2lucHV0IGZ1bmN0
aW9uLg0KDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
