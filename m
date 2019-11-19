Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5A71102DB8
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 21:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSUpU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 15:45:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51250 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSUpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 15:45:20 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJKj7hP124785;
        Tue, 19 Nov 2019 14:45:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574196307;
        bh=Ojx+SKgazvrggEXzEBg4yMTN/EjefOXCqh4dDaSVgCA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=OilMz7vvFsyhv/lpO57VHl/T6C1horvvAS3/5Pnx/IpdNeydE9hebFY2zZHMm/5st
         Zru3SVfzJp21dPxDwfLALJxSzBmgEFhTi8dF2eYklCvK5O4NO0ZxxDfL0wmRUzePHb
         ZV7O7BRd9wReBRu0XWt1DrL/KTVQKsXmRPDtgGiI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJKj6cc130848
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 14:45:07 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 14:45:06 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
 DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
 15.01.1847.003; Tue, 19 Nov 2019 14:45:06 -0600
From:   "Robey, Caleb" <c-robey@ti.com>
To:     "Davis, Andrew" <afd@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "Kridner, Jason" <jdk@ti.com>,
        "Rizvi, Mohammad Faiz Abbas" <faiz_abbas@ti.com>,
        "Dannenberg, Andreas" <dannenberg@ti.com>,
        "Hiblot, Jean-Jacques" <jjhiblot@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/1] ARM: dts: am5729: beaglebone-ai: enable board
Thread-Topic: [PATCH 0/1] ARM: dts: am5729: beaglebone-ai: enable board
Thread-Index: AQHVnxf+XQY9ZEgIEE6Un/4ZcnJNEqeTWaIA//+ceiA=
Date:   Tue, 19 Nov 2019 20:45:06 +0000
Message-ID: <770139b562564445a743e2b7c905e469@ti.com>
References: <20191119202850.18149-1-c-robey@ti.com>
 <a117b152-8fcb-01a8-5a53-2cb615e87111@ti.com>
In-Reply-To: <a117b152-8fcb-01a8-5a53-2cb615e87111@ti.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGF2aXMsIEFuZHJldw0K
PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxOSwgMjAxOSAyOjQxIFBNDQo+IFRvOiBSb2JleSwg
Q2FsZWI7IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnDQo+IENjOiBKYXNvbiBLcmlkbmVyOyBW
dXRsYSwgTG9rZXNoOyBLcmlkbmVyLCBKYXNvbjsgUml6dmksIE1vaGFtbWFkIEZhaXoNCj4gQWJi
YXM7IERhbm5lbmJlcmcsIEFuZHJlYXM7IEhpYmxvdCwgSmVhbi1KYWNxdWVzOyBCYWpqdXJpLCBQ
cmFuZWV0aDsNCj4gU3RyYXNoa28sIEdyeWdvcmlpOyBUb20gUmluaTsgUm9iIEhlcnJpbmc7IE1h
cmsgUnV0bGFuZDsgQmVub8OudCBDb3Vzc29uOw0KPiBUb255IExpbmRncmVuOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDAvMV0gQVJNOiBkdHM6IGFtNTcyOTogYmVhZ2xlYm9uZS1haTogZW5hYmxl
IGJvYXJkDQo+IA0KPiBPbiAxMS8xOS8xOSAzOjI4IFBNLCBDYWxlYiBSb2JleSB3cm90ZToNCj4g
PiBUaGUgZm9sbG93aW5nIHBhdGNoIGFkZHMgdGhlIGRldmljZSB0cmVlIGZpbGUgZm9yIEJlYWds
ZUJvbmUgQUkNCj4gPg0KPiANCj4gDQo+IENvdmVyLWxldHRlciBmb3IgYSBzaW5nbGUgcGF0Y2gg
aXMgcHJvYmFibHkgbm90IG5lZWRlZCwgZXNwZWNpYWxseSB3aGVuDQo+IHlvdSBkb24ndCBhZGQg
YW55dGhpbmcgdXNlZnVsIGluIHRoZSBjb3ZlciBsZXR0ZXIuDQo+IA0KPiBBbmRyZXcNCg0KT2th
eSwgdGhhbmsgeW91IGZvciBsZXR0aW5nIG1lIGtub3cgLSBJIHdpbGwga2VlcCB0aGF0IGluIG1p
bmQgaW4gdGhlIGZ1dHVyZS4NCkNhbGViDQogDQo+IA0KPiANCj4gPiBDYWxlYiBSb2JleSAoMSk6
DQo+ID4gICBBUk06IGR0czogYW01NzI5OiBiZWFnbGVib25lLWFpOiBhZGRpbmcgZGV2aWNlIHRy
ZWUNCj4gPg0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8
ICAgMSArDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNTcyOS1iZWFnbGVib25lYWkuZHRzIHwg
NzgyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3ODMg
aW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMv
YW01NzI5LWJlYWdsZWJvbmVhaS5kdHMNCj4gPg0K
