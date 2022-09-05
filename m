Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04415ACC52
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 09:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236750AbiIEHVB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 03:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbiIEHUb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 03:20:31 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BCC33A3D;
        Mon,  5 Sep 2022 00:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxuvPHOFYL1OK1fb9l/GOgvuAj5brUQiv3MDdA/KuWHvVC5oiLhjZQOIROzX6NIyZCdUerVOOqtJKW8zS2TDKaR0vqfVlFgnNgA3JmjRppKaQ2uq3Tg0moHtT6LE5rbm8vurPWEnSt3rKbNi9I65aeJHRpDkfbwkoZIoYk6zxDo9sPkRg5BINWjkEngylP5x+8xZM8qDZLDGTJoIZDNHEf//Wxk+sGFEg1ZnQMmJk1ZtaIhfNZmeQzzz410BxHLv5ebJB2bDVj9P/NeyKO6xnMAaPvIkTT7vLhXKk6I7h4rGdT3ZW2e3dbPUO1nlEBdgx0yLxmDgPZKW6pj/8NWwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBy4yQlDJ5ep3flacB5DDs4HJ2ZLuB4kYyvAIzLk8VY=;
 b=Ap3QuVi06gepbxJiRVRrPlP7UYoysN7Tdl186Nh+aTzmsQioayRoiuAav2XYua17ATl64D8TcJInvo5zka7Qq4eV3xSZqmRrj6YeSMvlYC+umSrlqm7072T9giNJ4dHJJ1sKmg17gar5jRJMoRDKQXk8AnUTuZeknXio2OPZ/0nUCQDuQRsADKMz5ZOWQ1ymnOGRZf+IQaziAx4CMjmi2td/IhTgeqG6FnZ+XX1asTkrpxvTbHmJWgS16rHy/j972Nqr8NoXOWXAMG0497X3jJpjtj4hYgsTk3XnfRpQhGLxZ85p1EjwyppB6uDPvoF89YIvbFdVEHlF14ttoNxylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBy4yQlDJ5ep3flacB5DDs4HJ2ZLuB4kYyvAIzLk8VY=;
 b=h/9ML6rHCiZIlP2DccLNVIk4nsEALkCkTRYN3s8cZfU6WTq3TEejYaM8pVakdWNQHy+bT8bxXDT7HYBoEPnt1nuWGElYiuKtlPq8BPnOFVlHbwHRZWzRaMi+0aXoPiggu9PrX0uXr+db7+oqUKboFltMX3hWEWCqrUt4tl1NLU8SEiq94s0h+jqC2cNNirBtYXGEd9wLkMrPJ/va0AkFM45n+0EWDYu5ZttBRZuq4r5nixkP4ifoqe9es1UpDJsLhct9MicHkQWlZkA/La9bocbIGtVkC6YszU/ZIJThEhqxkIFuxXAhkWpFaYp+/P4GumsTVg+uCOjFwnPM7rD6PA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by GVXPR10MB6006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Mon, 5 Sep 2022 07:15:47 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5401:c86f:c182:8bbf%7]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 07:15:47 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 0/3] omap-gpmc wait pin additions
Thread-Topic: [PATCH v2 0/3] omap-gpmc wait pin additions
Thread-Index: AQHYwPLo0sZnpbq91EmL0+67xP7jtq3QbL2A
Date:   Mon, 5 Sep 2022 07:15:47 +0000
Message-ID: <39fafd913f529248e9d9c6170a7102154da0ecf7.camel@siemens.com>
References: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
         <9d5182cc-2c2f-287d-b1d4-a4f5fb19788b@kernel.org>
In-Reply-To: <9d5182cc-2c2f-287d-b1d4-a4f5fb19788b@kernel.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bce930ab-05b1-49cc-6b1c-08da8f0e74a2
x-ms-traffictypediagnostic: GVXPR10MB6006:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H8Vcw8SZFP39vGUd4dFN0PMfJ/PVsU3Bqk19/tcTGpZs8sdTZ81DwAbej2YNudU1y+O9HsIMbWZqlA0xtCd5S4nWyRH/btml8XfF7lSyA+QTUgEPggvC8fqJm3d1z/st9hZgZrJYLtJGiJMuB92dmkDw6cBKdw3CYqIJuyJc2hmH5jAN9yAaQdmqpbF7O3DXrHX1Y7jPlO+GGX25Qce0u/S4m7WXx0tItBfzOcF634Shri/WAZBUIt/JfB6bUmwMNcee5bjZ3o44qZF9+JvUU301MOjhMj7a/IizuqSeXHV5pjNyM7ojcymjAGFmREOuPh15QI7Gb9BpjCJ2YPTOsnfW5Jy+3eZ9sPQD9y2tSmPZCQJ+e54YdYF6L+0OkXsY60daXkKUN3BOVUQJRRZICYuPTVLt3cvuf84VJF+qVu1jRUb2qg9euEbMX3BVUN+7GbZuvMKgcgFc3pFoiOwoC7otq5D2ObkXnBNWL15IhjsZ7SgnXKjBAk2IjOinPgZN3yJCSUTT0OuksA0htWLed/PzAzlrL81vEAziEAm9EIHJqOyVq1Xja2N6N17MjNpfspxovMApD8DpgB3xgbs/JW+Kh01qtU9vzt7JL7o1pB5yAbdHeeE+TltNyJrUM/ysCShz7/0SrxiQ+uMjNUy8uF5kjEN6dnC+y2NcwCv1X+ivVghaT9vPPPywasVsYFeB+e690srS0HHy/UfzUgjvdu2IXT90z10ZIc9jAIHOsDO3gipikZSCdOXEDYB6Xd9f40JdBFLORpKx3O11JGXUcQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(8936002)(478600001)(3450700001)(6486002)(86362001)(186003)(2616005)(6506007)(6512007)(41300700001)(26005)(2906002)(5660300002)(82960400001)(53546011)(38100700002)(91956017)(66946007)(110136005)(76116006)(316002)(122000001)(8676002)(4326008)(66476007)(36756003)(66446008)(54906003)(66556008)(71200400001)(38070700005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDJlQzhrVXVmN29ZSStxOEtwQzYzNzUwd2g3cmkyT1FGb3Rya3lEckJTdnBY?=
 =?utf-8?B?L0tjL3hlRXRLQkVUakRBRklrREVrRTdETVB4UWt6WFNRUmRlVVBNYVJ6eE41?=
 =?utf-8?B?VmtNdEp2VW9aLzFMYU1zU1REZ05tNEZnZXJyc1pJaGtDdmh3ZStSZHUxOERU?=
 =?utf-8?B?MHlQd1dZSEhNZFc0dCswN1U5S20xbEMwYlBUYTR1UlhyU045RU5sYjFQZWt3?=
 =?utf-8?B?K1FLUWhTRkI3d3NLYUhmTlpBbjFtam5NTDdrdmtYNk5sK2hlMjlWT1NXL0NZ?=
 =?utf-8?B?VkRSV29UKytUbEhpM05nWkx4MkMybjA1MFBENThYS2UxTjZUS0YxLzFESHgr?=
 =?utf-8?B?akthZkpVa2N6U1FqYkJkYVhjWCtzdmlQM1RFV3UzSnBHK2wwQTJNU2NjdFNz?=
 =?utf-8?B?WGUwbENiMHp3cDFlYU5zQVF4dyt0b1dJcmo4NUUrNk14bEoxSTJ4UGd2bTZ5?=
 =?utf-8?B?ZXVmNUtsc2hlVWRweUxSc3kxTEZENDc3eHlWMHdodVU1T3RySHV2UjNuamVj?=
 =?utf-8?B?ZXEwdW5xR2V2djB0bUZObTRYeEtUaWdkSFNiWGlLcEcvNEhPNzRNdVQ0TndD?=
 =?utf-8?B?ZVFsV2E0elIyTGxCaGxlWjcza1N2V05RRlcvRlhaTlZHZTN6VjEwcFRMY1Vv?=
 =?utf-8?B?TERRdnZncDFSNG8yQ1hJeFdOM05jMTY0RStPZklqN2tUcXJEYnlvZy9vWWZ6?=
 =?utf-8?B?UFNUQlRvYUYwNWRoeXI2MndzNXBCa0JYOEtzV2lMdXo0eU1vV3pUYUdvNWZB?=
 =?utf-8?B?dE1IcVRUeXhtN0FTbndRbHZ3clJHTHJMUlc2NUVZcTI3aUFaR09VUDU4WDdh?=
 =?utf-8?B?K1lpVURTVXJ3Y2E3VTZQSXliVkQxU0RzTitETGd1L3R4eE50TzBmd2RHZ0xT?=
 =?utf-8?B?RGtxcWF3ZngyTHhzYWVhS05LanVOTnpadG1QbVl4K0hFRnJNdlQxVDFub21H?=
 =?utf-8?B?T3dzSzdnRmVxSVpmajU3RFdJYXd5bE16TExhelRvS1Z1ZFJ1d3p2NEVlSDVJ?=
 =?utf-8?B?K2E1azRmUDY1R3B3VFJPdjloRk02LytFR0E5clU2S2ZkaGhiVUh4aHVRTGhi?=
 =?utf-8?B?UlI0YUVVRXhLZUVNcDI0UVVLdTFhNVVWcC81VzBZb1U3UmV3WllVM0l5ZnVF?=
 =?utf-8?B?Y0hHcE9qQWtOblVHckFZdTNObjJJYVZhTTJaTDQ1TzZ4anFXUFNPWXRiRWI5?=
 =?utf-8?B?eVJqK1EydGRCUFpTNWF0R21TSGVXeXBSNm04SVVPenY0ajd4aWExUU4xcGRy?=
 =?utf-8?B?c0lZY2VVZDNYR0UzTUtEZmFOU1VnN0poYmpJR2JWNVdVMFkvN04rL05HRnZr?=
 =?utf-8?B?d2lURkpxc0xNR0pyVkt4MzRtOVd6Yy96MnkvZVlROUxXbldJdTNpYW5YUjNW?=
 =?utf-8?B?dFRjam5KMDAvckliL1NQT1ZVSTJ0NE5mS24va081M04zVktHaTVrL3RMMnpW?=
 =?utf-8?B?b3FhYVREbEFHMUhDejZxVDMyWUt6K0x1dnBhcGl4TERTbHd5K2ExVFp3d0Mw?=
 =?utf-8?B?U3ZJdUp4YWNvQUdDYUNac3hvTFdwaHpQZFd6YmRuVTQ2R0xRNEJYTzRPVEha?=
 =?utf-8?B?MGxwSDVOc3Jud1N4Z2xQZEFMNFBlNnl6Z0s4bzN6RzdtckNZYVo3QSs0a1Mw?=
 =?utf-8?B?dlh1MzhXUDdDeTRyM0NEWExMNG5ra2FJU04wUSs5VkVNOUpKYmVmemFCM0NK?=
 =?utf-8?B?L1VFLzFrbS8xRDNaWGdkeDlubHBYWFdaMHlqcnFrYUVhU1hiSHBWNUhkTE1N?=
 =?utf-8?B?eUI5cEdHQ3VzZzl0dlJtTUwwRlBidWtTUVIxVVV3VXB5Y1ZsMXJUY3hveWY0?=
 =?utf-8?B?SnBwVmpGVzZRVGtseHNXQ2hwYlNPZ1RyaVFRbTVRY3k3anVZZkFQb1J6c2R4?=
 =?utf-8?B?bWJtMUpYR2Rvc1FGN2I1R2JEVHd6eVA3c3RtaHl0K09FK1B0a0pHTDFCeC9o?=
 =?utf-8?B?VEFTVUxNcUpQbW9hYmp2V3hJckw5ZUVpUllRbHBjODRXTy9EZkNFRlJxTVhZ?=
 =?utf-8?B?QlkvSThEZU9DVVQ5ZkQrbU5jMW5qbUdzZm9yV0dpWVBPNHIwL1NqSXZCMkVO?=
 =?utf-8?B?djBNSWR5L1d6Sm5OdVF5aStFUEt2UDJKOFhtUDVSSkNDdjZJS3BLd05XdjQy?=
 =?utf-8?B?QXhrbldGR3F5aWRRQm1HelBENkFrczNSVkhwOVV1ODhYeG5PcVZmMVErMnpK?=
 =?utf-8?Q?GZCd/qdm9rjmDqeaU3DQuSo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56F0BA44A017764695A3054427E34846@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bce930ab-05b1-49cc-6b1c-08da8f0e74a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 07:15:47.4837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2lFgUsbVgbioSXo9Q2jLuH/se2+NcCaa9x57skM48trJzLOESOfEsY6PfyBzXyflJaWeyUW6ddunMMac1VTS/Nc5bDl2/tb4Y7uGhKPiEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB6006
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTA1IGF0IDA5OjQ0ICswMzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwMi8wOS8yMDIyIDEyOjEwLCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+IEZy
b206IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+
DQo+ID4gDQo+ID4gVGhlcmUgaXMgY3VycmVudGx5IG5vIHBvc3NpYmlsaXR5IGZvciB0aGUgZ3Bt
YyB0byBzZXQgZWl0aGVyIHRoZQ0KPiA+IHdhaXRwLXBpbiBwb2xhcml0eSBvciB1c2UgdGhlIHNh
bWUgd2FpdC1waW4gZm9yIGRpZmZlcmVudCBjcy0NCj4gPiByZWdpb25zLg0KPiA+IA0KPiA+IFdo
aWxlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG1heSBmdWxsZmlsbCBtb3N0IHVzZWNhc2Vz
LCBpdCBtYXkNCj4gPiBub3QNCj4gPiBiZSBzdWZmaWNpZW50IGZvciBtb3JlIGNvbXBsZXggc2V0
dXBzIChlLmcuIEZQR0EvQVNJQyBpbnRlcmZhY2VzKSwNCj4gPiB3aGVyZQ0KPiA+IG1vcmUgY29t
cGxleCBpbnRlcmZhY2luZyBvcHRpb25zIHdoZXJlIHBvc3NpYmxlLg0KPiA+IA0KPiA+IEZvciBl
eGFtcGxlIGludGVyZmFjaW5nIGFuIEFTSUMgd2hpY2ggb2ZmZXJzIG11bHRpcGxlIGNzLXJlZ2lv
bnMNCj4gPiBidXQNCj4gPiBvbmx5IG9uZSB3YWl0cGluIHRoZSBjdXJyZW50IGRyaXZlciBhbmQg
ZHQtYmluZGluZ3MgYXJlIG5vdA0KPiA+IHN1ZmZpY2llbnQuDQo+ID4gDQo+ID4gV2hpbGUgdXNp
bmcgdGhlIHNhbWUgd2FpdHBpbiBmb3IgZGlmZmVyZW50IGNzLXJlZ2lvbnMgd29ya2VkIGZvcg0K
PiA+IG9sZGVyDQo+ID4ga2VybmVscyAoNC4xNCkgdGhlIG9tYXAtZ3BtYy5jIGRyaXZlciByZWZ1
c2VkIHRvIHByb2JlICgtRUJVU1kpDQo+ID4gd2l0aA0KPiA+IG5ld2VyIGtlcm5lbHMgKD41LjEw
KS4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOiANCj4gPiAgICogUmViYXNlIGFnYWluc3Qg
cmVjZW50IDYuMC4wLXJjMyBrZXJuZWwsIGJ1dCB0aGUgbWFpbnRhaW5lcnMNCj4gPiBsaXN0DQo+
ID4gICAgIHN0YXlzIHRoZSBzYW1lIQ0KPiANCj4gTm8uLi4gdGhhbmtzIGZvciByZWJhc2luZyB5
ZXQgc3RpbGwgeW91IHVzZSB3cm9uZyBhZGRyZXNzIGVtYWlsLg0KPiANCj4gPiAgIC4vc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYw0KPiA+ICAgUm9n
ZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+IChtYWludGFpbmVyOk9NQVAgR0VORVJBTA0K
PiA+IFBVUlBPU0UgTUVNT1JZIENPTlRST0xMRVIgU1VQUE9SVCkNCj4gPiAgIFRvbnkgTGluZGdy
ZW4gPHRvbnlAYXRvbWlkZS5jb20+IChtYWludGFpbmVyOk9NQVAgR0VORVJBTCBQVVJQT1NFDQo+
ID4gTUVNT1JZIENPTlRST0xMRVIgU1VQUE9SVCkNCj4gPiAgIEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPiAobWFpbnRhaW5lcjpNRU1PUlkg
Q09OVFJPTExFUiBEUklWRVJTKQ0KPiANCj4gRGlmZmVyZW50IGFkZHJlc3MgZW1haWwuDQo+IA0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCk9rIG5vdyBJIHNlZTogDQogIGtyemtA
a2VybmVsLm9yZyAgaGFzIGNoYW5nZWQgdG8ga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
DQoNCg0KDQo=
