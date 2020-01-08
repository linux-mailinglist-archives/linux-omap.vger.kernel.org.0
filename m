Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92162133DCE
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 10:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgAHJGq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jan 2020 04:06:46 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53996 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgAHJGq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jan 2020 04:06:46 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 883594016E;
        Wed,  8 Jan 2020 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1578474405; bh=5WU7s3fuKPSImRBkNVD6MJh/UOcuYXmgsl8ADr8fvgk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bXKUEXfKzCZbQaHkkW/jcse2DTcLIMduLUk2hm+81RwkO0ZDkvLcyxjkbfRNbYt02
         9uZVAVAjxf3+aqC0yrFokvswgvfsA1AVtCpGBYRqHfaXZN0XyLJOLN78ISz3gE3OB6
         wrI+vS9GmAjTJlz6wHsrC9UyQD6crMtWLWo48pcmirAUiITREz6gTPwWAgew/RuvIa
         G70u/RRslRhvnX/wICaiydk5k3R3gw0O5RoIfLvobvfsSAP7HqKSQASUfkWX7zudFj
         hA+1fxiWY2YHwCEPQr5Spie5jsoET/ioGMCk9vHdWe835/BgsNaXI8v0+glYAZyqE/
         oydqs6R6PZYew==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2B4B0A006C;
        Wed,  8 Jan 2020 09:06:42 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 8 Jan 2020 01:06:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 8 Jan 2020 01:06:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJABM+RCwZ9/syV7YZw8Z+yHhy2/pZ7xtkmDBUg5Lh6xE37861sUTrpTvvLC7IcNf+ieOSXpWx+Ia80If6q2WkqOeEQRxSIKhHusgmVuO9ivj0yFF1938FSQW6tfbAdQpfBVdUJGQJvIxQhVLH5nMNf5duMA4a1ZlZgfR+2GLApNlJ6LEo9SATJnarcHrIBPQyRCEN7qz8kbpn2LHN1TzZfLKJym/49fvT/j3JnEjMQpMR9jws5+r1DW2X7k7fy5Ly1olwoYAzphni0+JBJKQzk4D8HL5VyKA5GJMrTYC+DwW0zbSMYfT2lyOb/SOvnF5XEGl1xR6PrmSzhcGIhRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WU7s3fuKPSImRBkNVD6MJh/UOcuYXmgsl8ADr8fvgk=;
 b=KWIszj4v40zInddRXpwAuBPXJAD+Ut1CmtiRZ/BrirYv/iu1ciBw6tLEoRHA/xCkxU1VWou4cAdoN2Zzif2cixf01EdMC5C4doWBfvCFvh7RH8hIgcVruds2da+6/4LT7mnWIGulY7OMmRQzItKU+q6OWUqKVIoIcWL2+Rc9ncxxp4GI0kwb0PkgEIv7jg6ymXKPeMZpeicpJpp/rkXfiYZAvC/eeaZ8fBcXOfJobVFHPGJtP/4XJVtdsoge3v/7pzeNfsZuGrdJaNFyw2nUWjUolmAD5yWyVoD8H4MPp/ZYNtuXAmZGICkrdUhD7BH9wQfWJA0NUMTBzCASj11QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WU7s3fuKPSImRBkNVD6MJh/UOcuYXmgsl8ADr8fvgk=;
 b=A8NA/g5+EfSKAkSNcKlrnky5TKDpvAl2+G/WDe26ZcPAxR5FAC7TFI8/NteD7PRxVew3nmLyMnM+ZtDAnbrLUB3Wf59ZhWWC7wOv3GVXW7GaDRaFe7jqjxoguuboMfmgc/dqr6kaOgiq8hgdJ3x+SPmNGlq0KA514W3DEh/HoRw=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (20.176.27.97) by
 BN7PR12MB2755.namprd12.prod.outlook.com (20.176.178.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Wed, 8 Jan 2020 09:06:34 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca%3]) with mapi id 15.20.2623.008; Wed, 8 Jan 2020
 09:06:34 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Discussions about the Letux Kernel" <letux-kernel@openphoenux.org>,
        "kernel@pyra-handheld.com" <kernel@pyra-handheld.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [BUG]: usb: dwc3: gadget: broken on OMAP5432
Thread-Topic: [BUG]: usb: dwc3: gadget: broken on OMAP5432
Thread-Index: AQHVxgIdUvY8PDkJv0e4ULUpdkC8K6fgedIA
Date:   Wed, 8 Jan 2020 09:06:34 +0000
Message-ID: <7daf64ba-7efb-e2f1-a449-f5f3791a3c8e@synopsys.com>
References: <703DD239-8E3B-405C-A531-FF7DEEED38DC@goldelico.com>
In-Reply-To: <703DD239-8E3B-405C-A531-FF7DEEED38DC@goldelico.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 603c1523-1e4c-452d-3cc7-08d7941a0f6c
x-ms-traffictypediagnostic: BN7PR12MB2755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB2755132D07B3FA466F3E4BF9A43E0@BN7PR12MB2755.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(2906002)(54906003)(86362001)(26005)(6512007)(110136005)(6506007)(186003)(966005)(71200400001)(53546011)(66556008)(8936002)(81166006)(81156014)(66446008)(64756008)(5660300002)(76116006)(91956017)(478600001)(8676002)(2616005)(4326008)(31686004)(66946007)(31696002)(316002)(6486002)(66476007)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:BN7PR12MB2755;H:BN7PR12MB2802.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QH8joqfYbsMGETjpTuRP9c6UzOnhEzTqtC/KjJ3p1YScMhdlvFWg/mfH4rmwyTurXW3XGHNjxG+my1NRQoIjl/q4ZdBU9r23zIiQPP7rPZtWPiEbBi2dcK0NkcxBxEQ8JhauS+3ZLNtcRKVq6aR7rCcvKvO04Uy19787lyFmnb9ufh4Yn31lQ6nP+hfpJ0zL5RnR3gIl1Cc4fasaHrRx5bkcPM7Y0O4sqJyzMHeEjTvaHQXYTmUbRL4mv7oLjomg1VowxdWkwEBGuHeK8+tqZufQVsQOAJM/vdvv9KbTywEWdtrKD21s5zG8r1P5JAZeA8cGiANsTw8OPlJoo/qGqRR8IZU91UIKwuUMf7Wr1KckbtKQgn+d8bstPCFaGWs7O2CFt1ujKzbYLnfhDsUdIExiTAlxAexACATqFf9bO2A5LXMnF/TfFYm+QldqsRWgflTLfknNEZCVjvxMjrOURi/w43F+63MccopZK9c2LHs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <666903A83C10EE4E9B4A21EC16F6DBCE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 603c1523-1e4c-452d-3cc7-08d7941a0f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 09:06:34.3597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxOlL6skl9P32ieUmJ2kHGgipUzAU2hrho1lvtRMijf2R0Ro+DYZAYdlQBb04eXOkS58OsNCBVSxpeU+dXjpFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2755
X-OriginatorOrg: synopsys.com
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGksDQpPbiAxLzgvMjAyMCAyOjI5IFBNLCBILiBOaWtvbGF1cyBTY2hhbGxlciB3cm90ZToNCj4g
SGksDQo+IEkgbm90aWNlZCB0aGF0IHRoZSB1c2IgZXRoZXJuZXQgZ2FkZ2V0IGRyaXZlciBpcyBi
cm9rZW4gc2luY2UgdjUuNS1yYzINCj4gYW5kIDUuNC40LCBidXQgb25seSBmb3Igb3VyIE9NQVA1
IGJvYXJkLiBPdXIgT01BUDMgYm9hcmRzIHdvcmsgd2l0aA0KPiB0aGUgc2FtZSB0cmVlLCBrZXJu
ZWwgYmluYXJ5IGFuZCB1c2VyLXNwYWNlIChEZWJpYW4gU3RyZXRjaCkuDQo+IA0KPiBUaGUgc3lt
cHRvbSBpcyB0aGF0IEkgY2FuIHNlZSB0aGUgaW50ZXJmYWNlIG9uIHRoZSBob3N0IFBDIGJlaW5n
DQo+IGVudW1lcmF0ZWQgYW5kIElQIGFkZHJlc3NlcyBldGMuIGFyZSBzZXQgdXAuIEJ1dCBhIHBp
bmcgaW4gZWl0aGVyDQo+IGRpcmVjdGlvbiBmYWlscy90aW1lcyBvdXQuDQo+IA0KPiBBZnRlciBp
bnNwZWN0aW5nIGRpZmZzIEkgZm91bmQgc29tZSBjaGFuZ2VzIGluIGR3YzM6Z2FkZ2V0DQo+IGFu
ZCBpbmRlZWQgb21hcDMvdHdsNDAzMCB1c2VzIG11c2IgYW5kIG9tYXA1IHVzZXMgZHdjMy4NCj4g
DQo+IFJldmVydGluZw0KPiANCj4gYTdmN2U2MTI3MGYxICgidXNiOiBkd2MzOiBnYWRnZXQ6IEZp
eCBsb2dpY2FsIGNvbmRpdGlvbiIpOw0KPiANCj4gb24gdjUuNS1yYyBtYWtlcyBpdCB3b3JrIGFn
YWluLg0KPiANCj4gQlRXOiB2NC4xOS45MCB3b3JrcyBhbHRob3VnaCBpdCBpbmNsdWRlcyB0aGlz
IGxvZ2ljYWwgY29uZGl0aW9uIGZpeC4NCj4gU28gdGhlIHJlYWwgZGlmZmVyZW5jZSBiZXR3ZWVu
IHY0LjE5IGFuZCB2NS41IG1heSBiZSBlbHNld2hlcmUgaW4NCj4gbmV3ZXIga2VybmVscyBhbmQg
b25seSBiZSByZXZlYWxlZCBieSB0aGUgcGF0Y2guDQo+IA0KPiBJZiBpbXBvcnRhbnQ6IG15IHNl
dHVwIGlzIHJ1bm5pbmcgd2l0aCBVU0IyIGNhYmxlIGFuZCBzcGVlZA0KPiBvbmx5Lg0KPiANCj4g
U28gcGxlYXNlIGNoZWNrIHRoaXMgYW5kIG90aGVyIHJlY2VudCBkd2MzIHBhdGNoZXMgZm9yIGlu
dHJvZHVjaW5nDQo+IGEgc3RhbGwgb2YgY29tbXVuaWNhdGlvbi4NCj4gDQpBbm90aGVyIGdhZGdl
dCBkcml2ZXIgaXNzdWUgd2FzIHJlcG9ydGVkIGJ5IFRoaW5oIGFmdGVyIG15IGZpeCwgYW5kIGhl
IGhhcyBzdWJtaXR0ZWQgYSBwYXRjaCBmb3IgdGhlIHNhbWUuIFlvdSBjYW4gcmVmZXIgdGhlIGRp
c2N1c3Npb24gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTI5MjA4Ny8uDQpD
YW4geW91IGNoZWNrIGlmIHRoYXQgcGF0Y2ggd29ya3MgZm9yIHlvdSA/DQoNCj4gQlIgYW5kIHRo
YW5rcywNCj4gTmlrb2xhdXMgU2NoYWxsZXINCj4gDQo+IA0KDQpUaGFua3MgJiBSZWdhcmRzLA0K
IFRlamFzIEpvZ2xla2FyDQo=
