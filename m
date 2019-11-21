Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03481054BC
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 15:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUOmm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 09:42:42 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43764 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUOmm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 09:42:42 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALEgYTn047279;
        Thu, 21 Nov 2019 08:42:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574347354;
        bh=6exCQJkdOoSXLv64y9apXR+/Th2jdoMxADs7brLy9Ng=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=H4dm7TgHmRPZFRtlo6xr6eddpeWB6sQ0K9M+oh++F8mdewF8M/GohfWBpT0hApnyP
         n5kTxoMl26xi8bLMm8D4AN2b2L1SgdCa5cVhaWZzKibdJ5Rlmwr9NrB0vM7n90Gs/p
         tdJnMUbZbsy593jmVLAHA0EE1ahzUG3+MRfKuUjA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xALEgYOf095915
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Nov 2019 08:42:34 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 21
 Nov 2019 08:42:34 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
 DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
 15.01.1847.003; Thu, 21 Nov 2019 08:42:34 -0600
From:   "Robey, Caleb" <c-robey@ti.com>
To:     "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "Kridner, Jason" <jdk@ti.com>,
        "Rizvi, Mohammad Faiz Abbas" <faiz_abbas@ti.com>,
        "Dannenberg, Andreas" <dannenberg@ti.com>,
        "Hiblot, Jean-Jacques" <jjhiblot@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Davis, Andrew" <afd@ti.com>, Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/1] ARM: dts: am5729: beaglebone-ai: enable board
Thread-Topic: [PATCH 0/1] ARM: dts: am5729: beaglebone-ai: enable board
Thread-Index: AQHVnxf+XQY9ZEgIEE6Un/4ZcnJNEqeV3XAA///YBzA=
Date:   Thu, 21 Nov 2019 14:42:33 +0000
Message-ID: <01d431e9c99246fd9cb3e5eba94c1cec@ti.com>
References: <20191119202850.18149-1-c-robey@ti.com>
 <e831422f-66b7-32e1-5b44-f7ca287abc4b@ti.com>
In-Reply-To: <e831422f-66b7-32e1-5b44-f7ca287abc4b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.31.74]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RyYXNoa28sIEdyeWdv
cmlpDQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwgMjAxOSA1OjA1IEFNDQo+IFRvOiBS
b2JleSwgQ2FsZWI7IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnDQo+IENjOiBKYXNvbiBLcmlk
bmVyOyBWdXRsYSwgTG9rZXNoOyBLcmlkbmVyLCBKYXNvbjsgUml6dmksIE1vaGFtbWFkIEZhaXoN
Cj4gQWJiYXM7IERhbm5lbmJlcmcsIEFuZHJlYXM7IEhpYmxvdCwgSmVhbi1KYWNxdWVzOyBCYWpq
dXJpLCBQcmFuZWV0aDsgRGF2aXMsDQo+IEFuZHJldzsgVG9tIFJpbmk7IFJvYiBIZXJyaW5nOyBN
YXJrIFJ1dGxhbmQ7IEJlbm/DrnQgQ291c3NvbjsgVG9ueQ0KPiBMaW5kZ3JlbjsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAwLzFdIEFSTTogZHRzOiBhbTU3Mjk6IGJlYWdsZWJvbmUtYWk6IGVuYWJs
ZSBib2FyZA0KPiANCj4gDQo+IA0KPiBPbiAxOS8xMS8yMDE5IDIyOjI4LCBDYWxlYiBSb2JleSB3
cm90ZToNCj4gPiBUaGUgZm9sbG93aW5nIHBhdGNoIGFkZHMgdGhlIGRldmljZSB0cmVlIGZpbGUg
Zm9yIEJlYWdsZUJvbmUgQUkNCg0KU2luY2UgdGhpcyBzdWJtaXNzaW9uIGlzIG5vdCB0byBMUFIs
IEkgd2FzIHRvbGQgdGhhdCB0aGlzIHNob3VsZCBiZSANCmxpc3RlZCBhcyB2MS4NCg0KPiANCj4g
DQo+IFBsZWFzZSwgYWRkIHZlcnNpb24gaW5mbyBpbiBzdWJqZWN0cyBhbmQNCj4gcHJvdmlkZSBj
aGFuZ2UgbG9nIGluIGNvdmVyLg0KPiANCj4gDQo+ID4NCj4gPiBDYWxlYiBSb2JleSAoMSk6DQo+
ID4gICAgQVJNOiBkdHM6IGFtNTcyOTogYmVhZ2xlYm9uZS1haTogYWRkaW5nIGRldmljZSB0cmVl
DQo+ID4NCj4gPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNTcyOS1iZWFnbGVib25lYWkuZHRzIHwg
NzgyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNzgz
IGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0
cy9hbTU3MjktYmVhZ2xlYm9uZWFpLmR0cw0KPiA+DQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMs
DQo+IGdyeWdvcmlpDQo=
