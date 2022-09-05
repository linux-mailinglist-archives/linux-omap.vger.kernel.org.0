Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933985ACF2C
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236354AbiIEJrr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 05:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbiIEJrb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 05:47:31 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9786D520BE;
        Mon,  5 Sep 2022 02:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5/F4fLM7SawFsaT3UZAfVWZ8LnSoJfQNHTbBe/2vgcIgQlLxZ4cdWbpszlcTagvTjSufkTMpWIRgLf7Pd/JUvngV66fPB2beKdFnIuqooih+qmiTSsYs2alKJz9wKX47v3toYYMIDD/NRyGUOSuOKNZaOVjW+xgyQDSwU1fCVOZYlI+/ktteDnfmvRLp0QZDEmBcbMOGtuZmb4DcerrJDS0ItOzBsvqity6ynf4bB6en7fqyr66EJyq6tPtTi4xWKg6MDTlyeSAL2eY9Ddw0qYPOORo3SyJWC37LAxnsrhn57TIZ8oFY6OT0eZ414vIadvLSWWTcbcw6AcrwxGdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyQ4W/xM7O7jzuEs7KXVlYE3Sg/sHA4kD2cydrMsdrM=;
 b=fuYMdn90afP0RYLQabOp9MusIUXXByAIniYiu490jues03O3diz2WcJwWfisAlGYp5CJwJmChrWjf6xrOYRXx093S3zFw+3mZ+V3hPqItKZR6TvvnmWSobTfw7PDKEfOGKYHZNxJSI5J6myguFSmgrw0UEtd5qxU3gCRwCsXBhdpjFm3GdUgVRVLyaz6Acliyi4iwoECCNmBKm7Dp8uYdBciYd8104ZH9q5fKMr3jXO75xjgy6G5vCR1NPx7mW6891BKsOW6Tc/uOMDM4e35v3CGePqTl0Kj+7JQvNsZmidozZ7NbTmrovoU/BLzeGphRN6qXfLzNDnRDqakU5sqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyQ4W/xM7O7jzuEs7KXVlYE3Sg/sHA4kD2cydrMsdrM=;
 b=B8c97aCNa85YzskErTXlUuoPmgv9Z/v7WW9ins83qODcKrJ3MkqlRjXnxKWmyqgSqUmjPgrahFySGtQ7Siinx1nBlZHNSURibMWz59qNICNIpxd0SQRPzJV9Morty8s7cNRhWaQuvJQT8vdSzd01pAfJFY19KoPdFGsQSoJ6Hbd/hqTZ7s6IBmE79LKzzKam3xpupoKFhp0rUSPvbb2gqL/y/QOP939Kb3lGG1B9QQy8MEQSJHweqTgcwMepftz0URiBLoENCF6fvM0uedg87VFNDonRL01qNoNeolbIz78K9eLr18Gcb8w32fof3fvSMSpmDb4O5VW3AD1K0O+qBA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS8PR10MB5949.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:528::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:47:27 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf%7]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 09:47:27 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Topic: [PATCH v2 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Index: AQHYwQicoRUX26JaTEGlbA+CcMxuU63QlvEA
Date:   Mon, 5 Sep 2022 09:47:27 +0000
Message-ID: <4d46e32650b5097f596d1d93f0620d1fdd154da6.camel@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
         <20220905071717.1500568-3-benedikt.niedermayr@siemens.com>
         <3e55572d-2e5e-71bd-79db-835f3c913ab4@kernel.org>
In-Reply-To: <3e55572d-2e5e-71bd-79db-835f3c913ab4@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e98efc92-ba45-40dc-2921-08da8f23a49b
x-ms-traffictypediagnostic: AS8PR10MB5949:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0J5/jlcXKebuW399y90f+EABNuIGiPpYro3c+BJlNhgimfXSay8SYui84Xv063v58JMCG6yDlGIBWS4fXvjkUKKEhZLnUP+FoEDrcELUka6ixXHZemYntzLmapGH7fXKDWQxAabLAN/dRe/o8R8nMWDEVXxbViDBllWbf4weF6iZRoJyr7Kr7ZPTHa+axgqbnrSGcnlLBvLQxEl6JF2aT4WKnaUPfBkOlqA4LrhAw4t5boHg1e3/FkG8ZWMGwiK5a++w6Ttaaj0ATme8o9n3EsMUlQvrY46pKXDTNu3uCNVmMsa7VSeOQIMKBRi/y5o6vzWSI7ynmesB0RG/vTAXvWL1VkNot0CkLF+pmFCYcxP6K3yEr/sUoGWSWSvQyBxBbko3TN0m3ybGPagPHdikFyjrnkB5vyx4pcI7wriuRElZSYCgroOKb6HrMx59HZ4rhWumWGiy4Go8fYFHwieORcCqynFE4wmxpBr5DDjq2icnTBiOMu5ko72RPba1HWlORSS1dRZWags1bB8OimwhkyfaR8rAE6a2ARC2gJvnvBMAzEfzV36UCBjBh6DkGZmA3ov2z/Rtm2j8yKZSZnkkG9ywCPX9l++1V2qaQ8FCIYobovZ9Cx+KQwMKYkgXuY/VRdmem8BdyfsG1vnmMNblgtez90v3O3rDzQ99v58U0bHDXbjgC/JpDokpKuutDPHKis620v8TZjPeUjB6xMrmF5XYNZt1BiTqVsXZuy2fqVpGgzMMW742qHps7RJX1SxSMrJCdFygqnKDDxXJ/MFK8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(38100700002)(36756003)(122000001)(54906003)(478600001)(71200400001)(6486002)(110136005)(316002)(86362001)(82960400001)(38070700005)(41300700001)(53546011)(6506007)(26005)(2616005)(3450700001)(8676002)(4326008)(2906002)(66446008)(76116006)(66946007)(66556008)(66476007)(186003)(8936002)(64756008)(5660300002)(6512007)(91956017)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGJBbGpOeHU1bzRzdjZvbmtVS1h3dmxibGd1OXp4UWdiSU9adXpIT21GMlJ4?=
 =?utf-8?B?VmV2TncyMmpPdXNITXM4Vjh2SFg5ZStST01Nd3Z1ZTNwOFp3RVFXU3B5cU84?=
 =?utf-8?B?Nm1STllsWFVXcUVBcWdzR1ZGY3BCNzBFMUEwY0hPaml4bThuUFFjbFZ3ODUr?=
 =?utf-8?B?bVhldlZHRnBqTlN0Ri9NOXlOSDh2Mjg3NVlsT2JDKzJjYlVKbElDbjkzRnov?=
 =?utf-8?B?MmR5M2RsekFBbFNpcy8wNTlDWmxXRzlTZEVQN2tuOElISzkzOHMvanRXdDVS?=
 =?utf-8?B?M3AzcExKMUR2N0xuV0xURGdNRzJzZ2N6c0grZGJSYU5FVFllOC91NEVKM3E3?=
 =?utf-8?B?YW9oUUdZc1I0OEc0L09Uc1Z4WU53NHJmRUR1Umk5L1ZJVWNtcjhYbG04eWNP?=
 =?utf-8?B?TEdNelI2czM1eGJFTFRnZk9XWlBiUU15a21zdXFYQ1hWelJ4VzhDTUhqUnRR?=
 =?utf-8?B?dVMxc1E3YnFnVmQ0cXAxNDVUeWx2MFRlUWZ5S1lieWRIYitaQXdTbHdwWXUw?=
 =?utf-8?B?UlR1bmQvSVNLZm5GNEJWcTk1MVdJYk91eTFMWE1GYzBwdmw3bm1tclByNmpH?=
 =?utf-8?B?RG05V2NjeXVNUEVwaUxuNnFLN1dSUWY2MFJTLzlxazIxWGJTRThXdlVGdmRL?=
 =?utf-8?B?T2EzdklDQmY1TDB3MEEwdjZiYVl3azRYMnVQOUx5aTgwcEZXeldFWG54Nk5G?=
 =?utf-8?B?MFNrdkdndGtkLzd4TEpqQmdRa3Z3TjdDVHQ2R0NISG1FK3BId3NUNmozU3Bu?=
 =?utf-8?B?YlhIekdtb29oQ3NHY1prSmVEL2ZTMWg3bEREaWRLd2JhUzJuSW9TcmNla25L?=
 =?utf-8?B?UUJVQ05qeHRxbFJiclBOeGc3UnlkeFc0aDB4anNRRFZPaWNSOVhnQXhKdk04?=
 =?utf-8?B?UzcyOEpUMGlGRllnaXdhVGNNcGNTaFcraHFkVFJUb2d3ZERNVUp1aDZ1QVI1?=
 =?utf-8?B?OG95MW1VRmVzOEFLY3JZckFncEc2bjNxUTIzN3JJbnNvN1ZIM1UydnZzUnow?=
 =?utf-8?B?eXRvckV5SnVLR1o1ei95YUptRU4ybjQ3YTFSdjBIOFFOb0g1ZlExME5aSHB5?=
 =?utf-8?B?MFRZT0dySmRtcStXZWVwc0tzUk1MMWxxTlk2eUYwbE5YNXI5bmJQRGxaV2pI?=
 =?utf-8?B?TW5rZEdRMU5waHZIZVJEOUplelFhbHVOSmp5RWsrWlVPNUluOGJJME0xWTFr?=
 =?utf-8?B?Nko1Sk5yaFRDQjUwM1BROXNzYk9jb2NEd040VExtSzJDODV6MDBwNWZpeDVN?=
 =?utf-8?B?cVY4aUREUUQ1ZS9od0c0ZWppTzk1SWhQT0FTNEozamVhUS9kTklQU3lLVVBJ?=
 =?utf-8?B?WUljKzJZZUNhbWZ5QnNJRVNhYkt1MHF5NXJMaWxZbE42MjlpcEl4Qll6NDRX?=
 =?utf-8?B?NWhhNmd5OFVtbXJiTnBxSU9OeXB2eWJqVEl5NjJLd2pWODhSUzdKY1JTbzVM?=
 =?utf-8?B?UGZRTkFDRlB2MjdjM3ZIZkJ2YU5jNjVwMGRCYUdUcCtZUFN0WndTTlBnWklH?=
 =?utf-8?B?S0RLWlZvcENUQVhjT3hLQU9sMzhvVXovL1ZDSHNLL0U3a0s4bmZsNDhRNVMx?=
 =?utf-8?B?WkRtTmtzd1U0M1VSUTFTRzQxMjZZcjhyU0FRd0V0ZEJZb2h4N3p0MDg0OVQv?=
 =?utf-8?B?L3Q4NTEwWFNFNFd3aStrQ0tEaDlYam82YVkxamNTeDEyRytHSHQvdnJadFVQ?=
 =?utf-8?B?QVkzOWZnMDd4MVgxZnBYcDZvRzU1b3M5WkRWM1AzelgvN2VZcElXeHRNeEVG?=
 =?utf-8?B?Yy9zVm5PYUpsblYwajF5MlZUVm81SzAySUpSemZRMEtTYlFlT2JxcHVYWnRu?=
 =?utf-8?B?T3Y1L3B0em5WK2VaVW5iU0gvTlg5U05BbnlNN3VXTUVWRFlObWRiTFRMbFBi?=
 =?utf-8?B?S05rSHdBRnZZYjRsOHlQR1U5RkNldUJzancrU3l6T3Z6dVQrRGJ4RUFsT3Bv?=
 =?utf-8?B?b29CRVZWL2c2SEhycTFjZHZRKy8ydUVkUHhtWlBoVXRjMWo5N1dQZ3JmUm1t?=
 =?utf-8?B?QjRJYnFjNjhOejNiUE1WTWszU3JjYTk1ektwcU90dEFGbjlCSXFTTlA5L2da?=
 =?utf-8?B?U3lScUlRVWdmUFk3K3VnZ05ZTDFrNHRSRjNwYU8weWVHWG1ZUnQxb0t0aUJB?=
 =?utf-8?B?YVo3U1NUbTRtU2p0N2dkUzVGVWJjaCtqTE5mRUdaNUJJb3daaEdqR0VGeTJo?=
 =?utf-8?Q?JGtPR1hvDIaDg7dsQafBG1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41BEDEA638B5314B82F2ABFF39BAF81B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e98efc92-ba45-40dc-2921-08da8f23a49b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 09:47:27.4293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XG48H1qwlnxPWdze7WVwCiyFpoVJj2Bbp1/2pedpDPGSWqAb6crHtAqptt+xSTXG/qffARAkpYgAvTbRJZ+IgpFo/XZCqb9d+/t7V6QOqhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5949
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTA1IGF0IDEyOjE5ICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDA1LzA5LzIwMjIgMTA6MTcsIEIuIE5pZWRlcm1heXIgd3JvdGU6DQo+
ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5z
LmNvbT4NCj4gPiANCj4gPiBTZXR0aW5nIHRoZSB3YWl0IHBpbiBwb2xhcml0eSBmcm9tIHRoZSBk
ZXZpY2UgdHJlZSBpcyBjdXJyZW50bHkgbm90DQo+ID4gcG9zc2libGUuIFRoZSBkZXZpY2UgdHJl
ZSBwcm9wZXJ0eSAiZ3BtYyx3YWl0LXBpbi1wb2xhcml0eSIgY2FuIGJlDQo+ID4gdXNlZA0KPiA+
IGZvciB0aGF0LiBJZiB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcgdGhlIHByZXZpb3VzIGRlZmF1
bHQgdmFsdWUNCj4gPiBpcyB1c2VkIGluc3RlYWQsIHdoaWNoIHByZXNlcnZlcyBiYWNrd2FyZHMg
Y29tcGF0aWJpbGl0eS4NCj4gPiANCj4gPiBUaGUgd2FpdCBwaW4gcG9sYXJpdHkgaXMgdGhlbiBz
ZXQgdmlhIHRoZSBncGlvY2hpcA0KPiA+IGRpcmVjdGlvbl9pbnB1dCBjYWxsYmFjayBmdW5jdGlv
bi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBOaWVkZXJtYXlyIDxiZW5lZGlr
dC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tDQo+ID4gPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21l
bW9yeS9vbWFwLWdwbWMuYyAgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKy0N
Cj4gPiAtLS0tDQo+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncG1jLW9tYXAuaCB8
ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyBi
L2RyaXZlcnMvbWVtb3J5L29tYXAtDQo+ID4gZ3BtYy5jDQo+ID4gaW5kZXggNTc5OTAzNDU3NDE1
Li5iZTNjMzVhZTk2MTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1j
LmMNCj4gPiArKysgYi9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYw0KPiA+IEBAIC0zNSw2ICsz
NSw4IEBADQo+ID4gIA0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFu
ZC1vbWFwMi5oPg0KPiA+ICANCj4gPiArI2luY2x1ZGUgIi4uL2dwaW8vZ3Bpb2xpYi5oIg0KPiA+
ICsNCj4gPiAgI2RlZmluZQlERVZJQ0VfTkFNRQkJIm9tYXAtZ3BtYyINCj4gPiAgDQo+ID4gIC8q
IEdQTUMgcmVnaXN0ZXIgb2Zmc2V0cyAqLw0KPiA+IEBAIC0xOTgwLDYgKzE5ODIsMTEgQEAgdm9p
ZCBncG1jX3JlYWRfc2V0dGluZ3NfZHQoc3RydWN0DQo+ID4gZGV2aWNlX25vZGUgKm5wLCBzdHJ1
Y3QgZ3BtY19zZXR0aW5ncyAqcCkNCj4gPiAgCQkJCQkJCSJncG1jLHdhaXQtb24tDQo+ID4gcmVh
ZCIpOw0KPiA+ICAJCXAtPndhaXRfb25fd3JpdGUgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAs
DQo+ID4gIAkJCQkJCQkgImdwbWMsd2FpdC1vbi0NCj4gPiB3cml0ZSIpOw0KPiA+ICsJCXAtPndh
aXRfcGluX3BvbGFyaXR5ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsDQo+ID4gKwkJCQkJCQkJ
ICJncG1jLA0KPiA+IHdhaXQtcGluLXBvbGFyaXR5IiwNCj4gPiArCQkJCQkJCQkgJnAtDQo+ID4g
PndhaXRfcGluX3BvbGFyaXR5KTsNCj4gDQo+IFRoaXMgaXMgd3JvbmcuIG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKCkgcmV0dXJucyAwIG9yIGVycm9yIHZhbHVlLiBJdA0KPiBkb2VzIG5vdCByZXR1cm4g
dGhlIHByb3BlcnRpZXMgdmFsdWUuDQo+IFRoZSBwcm9wZXJ0aWVzIHZhbHVlIGlzIGFscmVhZHkg
c3RvcmVkIGluIHRoZSBwb2ludGVyIHBhc3NlZCBpbiB0aGUNCj4gM3JkIGFyZ3VtZW50Lg0KPiAN
Cg0KQWguIFllcyB0aGF0J3MgYSBtaXN0YWtlLiBUaGFua3MgZm9yIHRoYXQgaGludCENCkEgYm9v
bCBwcm9wZXJ0eSB3aWxsIG1ha2UgdGhpbmdzIGEgYml0IGVhc2llciBhdCB0aGlzIHBvaW50Lg0K
DQoNCj4gPiArCQlpZiAocC0+d2FpdF9waW5fcG9sYXJpdHkgPCAwKQ0KPiA+ICsJCQlwLT53YWl0
X3Bpbl9wb2xhcml0eSA9IEdQSU9fQUNUSVZFX0hJR0g7DQo+ID4gIAkJaWYgKCFwLT53YWl0X29u
X3JlYWQgJiYgIXAtPndhaXRfb25fd3JpdGUpDQo+ID4gIAkJCXByX2RlYnVnKCIlczogcmQvd3Ig
d2FpdCBtb25pdG9yaW5nIG5vdA0KPiA+IGVuYWJsZWQhXG4iLA0KPiA+ICAJCQkJIF9fZnVuY19f
KTsNCj4gPiBAQCAtMjIxMCwxMCArMjIxNywxMSBAQCBzdGF0aWMgaW50IGdwbWNfcHJvYmVfZ2Vu
ZXJpY19jaGlsZChzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4gIAlpZiAo
Z3BtY19zLndhaXRfb25fcmVhZCB8fCBncG1jX3Mud2FpdF9vbl93cml0ZSkgew0KPiA+ICAJCXVu
c2lnbmVkIGludCB3YWl0X3BpbiA9IGdwbWNfcy53YWl0X3BpbjsNCj4gPiAgDQo+ID4gLQkJd2Fp
dHBpbl9kZXNjID0gZ3Bpb2NoaXBfcmVxdWVzdF9vd25fZGVzYygmZ3BtYy0NCj4gPiA+Z3Bpb19j
aGlwLA0KPiA+IC0JCQkJCQkJIHdhaXRfcGluLA0KPiA+ICJXQUlUUElOIiwNCj4gPiAtCQkJCQkJ
CSBHUElPX0FDVElWRV9ISQ0KPiA+IEdILA0KPiA+IC0JCQkJCQkJIEdQSU9EX0lOKTsNCj4gPiAr
CQl3YWl0cGluX2Rlc2MgPQ0KPiA+ICsJCQlncGlvY2hpcF9yZXF1ZXN0X293bl9kZXNjKCZncG1j
LT5ncGlvX2NoaXAsDQo+ID4gKwkJCQl3YWl0X3BpbiwgIldBSVRQSU4iLA0KPiA+ICsJCQkJZ3Bt
Y19zLndhaXRfcGluX3BvbGFyaXR5ID8NCj4gPiBHUElPX0FDVElWRV9ISUdIIDogR1BJT19BQ1RJ
VkVfTE9XLA0KPiANCj4gI2RlZmluZSBHUElPX0FDVElWRV9ISUdIIDANCj4gI2RlZmluZSBHUElP
X0FDVElWRV9MT1cgMQ0KPiANCj4gV2h5IG5vdCBqdXN0IHJldGFpbiB0aGUgc2FtZSBsb2dpYyBm
b3IgZ3BtY19zLndhaXRfcGluX3BvbGFyaXR5IGFuZA0KPiB0aGUgRFQgcHJvcGVydHk/DQoNCkFs
c28gbWFrZXMgc2Vuc2UhDQo+IA0KPiA+ICsJCQkJR1BJT0RfSU4pOw0KPiANCj4gVGhpcyBjaGFu
Z2UgdG8gZ3Bpb2NoaXBfcmVxdWVzdF9vd25fZGVzYygpIGlzIG5vdCByZWFsbHkgcmVxdWlyZWQg
YXMNCj4gd2UgYXJlIG1lcmVseSByZXNlcnZpbmcgdGhlIEdQSU8gc28gb3RoZXIgdXNlcnMgY2Fu
bm90IHVzZSBpdC4gVGhlDQo+IHdhaXRfcGluJ3MgcG9sYXJpdHkgaXMgYWN0dWFsbHkgc2V0IGlu
IEdQTUNfQ09ORklHIHJlZ2lzdGVyLiBHUE1DDQo+IHdhaXRfcGluIHBvbGFyaXR5IGxvZ2ljIGlz
IGhhcmQtd2lyZWQgYW5kIGRvZXNuJ3QgZGVwZW5kIG9uIEdQSU8NCj4gc3Vic3lzdGVtIGZvciBp
dHMgcG9sYXJpdHkuDQo+IA0KPiA+ICAJCWlmIChJU19FUlIod2FpdHBpbl9kZXNjKSkgew0KPiA+
ICAJCQlyZXQgPSBQVFJfRVJSKHdhaXRwaW5fZGVzYyk7DQo+ID4gIAkJCWlmIChyZXQgPT0gLUVC
VVNZKSB7DQo+ID4gQEAgLTIzNDIsNyArMjM1MCwxOSBAQCBzdGF0aWMgaW50IGdwbWNfZ3Bpb19n
ZXRfZGlyZWN0aW9uKHN0cnVjdA0KPiA+IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9m
ZnNldCkNCj4gPiAgc3RhdGljIGludCBncG1jX2dwaW9fZGlyZWN0aW9uX2lucHV0KHN0cnVjdCBn
cGlvX2NoaXAgKmNoaXAsDQo+ID4gIAkJCQkgICAgIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4g
IHsNCj4gPiAtCXJldHVybiAwOwkvKiB3ZSdyZSBpbnB1dCBvbmx5ICovDQo+ID4gKwl1MzIgcmVn
Ow0KPiA+ICsJc3RydWN0IGdwaW9fZGVzYyAqZGVzYyA9IGdwaW9jaGlwX2dldF9kZXNjKGNoaXAs
IG9mZnNldCk7DQo+ID4gKw0KPiA+ICsJb2Zmc2V0ICs9IDg7DQo+ID4gKwlyZWcgPSBncG1jX3Jl
YWRfcmVnKEdQTUNfQ09ORklHKTsNCj4gPiArDQo+ID4gKwlpZiAoQklUKEZMQUdfQUNUSVZFX0xP
VykgJiBkZXNjLT5mbGFncykNCj4gPiArCQlyZWcgJj0gfkJJVChvZmZzZXQpOw0KPiA+ICsJZWxz
ZQ0KPiA+ICsJCXJlZyB8PSBCSVQob2Zmc2V0KTsNCj4gPiArDQo+ID4gKwlncG1jX3dyaXRlX3Jl
ZyhHUE1DX0NPTkZJRywgcmVnKTsNCj4gPiArCXJldHVybiAwOw0KPiANCj4gVGhpcyBpcyB0aGUg
d3JvbmcgcGxhY2UgdG8gcHV0IHRoaXMgY29kZS4NCj4gV2FpdCBwaW4gcGxhcml0eSBsb2dpYyBo
YXMgbm90aGluZyB0byBkbyB3aXRoIEdQSU8gc3Vic3lzdGVtLg0KPiANCj4gVGhlIEdQTUNfQ09O
RklHIHdhaXRfcGluIHBvbGFyaXR5IHNldHRpbmcgbmVlZHMgdG8gYmUgc2V0IGluDQo+IGdwbWNf
Y3NfcHJvZ3JhbV9zZXR0aW5ncygpLg0KPiBZb3UgbmVlZCB0byBjaGVjayBncG1jX3NldHRpbmdz
LT53YWl0X3Bpbl9wb2xhcml0eSB0aGVyZSBhbmQgc2V0IHRoZQ0KPiBwb2xhcml0eSBmbGFnIGlu
IEdQTUNfQ09ORklHIHJlZ2lzdGVyIGFjY29yZGluZ2x5Lg0KPiANCk9rIHRoYW4gSSB3aWxsIHB1
dCB0aGlzIGludG8gZ3BtY19jc19wcm9ncmFtbV9zZXR0aW5ncyBmdW5jdGlvbi4NClRoaXMgd2F5
LCB0aGUgIiNpbmNsdWRlIC4uL2dwaW8vZ3Bpb2xpYi5oIiBpcyBhbHNvIG5vdCByZXF1aXJlZA0K
YW55bW9yZS4NCg0KSXQgd2Fzbid0IHZlcnkgc3VyZSBhYm91dCB3aHkgdGhlIHdhaXRwaW5zIHdo
ZXJlIGFsbG9jYXRlZCB2aWEgYQ0KZ3Bpb2NoaXAuIEJ1dCBJIGNhbiBpbWFnZSBpdCB3YXMgYmVj
YXVzZSBvZiByZXNzb3VyY2UgbG9ja2luZyBvZiB0aG9zZQ0KcGlucyBzbyB0aGV5IGRvbid0IGdl
dCBhbGxvY2F0ZWQgZnJvbSBzb21ld2hlcmUgZWxzZT8NCg0KDQo+ID4gIH0NCj4gPiAgDQo+ID4g
IHN0YXRpYyBpbnQgZ3BtY19ncGlvX2RpcmVjdGlvbl9vdXRwdXQoc3RydWN0IGdwaW9fY2hpcCAq
Y2hpcCwNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwbWMt
b21hcC5oDQo+ID4gYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3BtYy1vbWFwLmgNCj4g
PiBpbmRleCBjOWNjNGUzMjQzNWQuLmJmNGYyMjQ2ZjMxZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3BtYy1vbWFwLmgNCj4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RhdGEvZ3BtYy1vbWFwLmgNCj4gPiBAQCAtMTQ5LDYgKzE0OSw3IEBAIHN0
cnVjdCBncG1jX3NldHRpbmdzIHsNCj4gPiAgCXUzMiBkZXZpY2Vfd2lkdGg7CS8qIGRldmljZSBi
dXMgd2lkdGggKDggb3IgMTYgYml0KSAqLw0KPiA+ICAJdTMyIG11eF9hZGRfZGF0YTsJLyogbXVs
dGlwbGV4IGFkZHJlc3MgJiBkYXRhICovDQo+ID4gIAl1MzIgd2FpdF9waW47CQkvKiB3YWl0LXBp
biB0byBiZSB1c2VkICovDQo+ID4gKwl1MzIgd2FpdF9waW5fcG9sYXJpdHk7CS8qIHdhaXQtcGlu
IHBvbGFyaXR5ICovDQo+ID4gIH07DQo+ID4gIA0KPiA+ICAvKiBEYXRhIGZvciBlYWNoIGNoaXAg
c2VsZWN0ICovDQo+IA0KPiBjaGVlcnMsDQo+IC1yb2dlcg0KDQpJIHdpbGwgc3VibWl0IG15IGNo
YW5nZXMgZHVyaW5nIHRoZSBkYXkuDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayENCg0KY2hlZXJz
LA0KYmVuZWRpa3QNCg0K
