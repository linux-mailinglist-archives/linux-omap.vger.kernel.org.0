Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593CF39211B
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 21:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbhEZTuE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 15:50:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33176 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbhEZTuA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 15:50:00 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QJmNEi098993;
        Wed, 26 May 2021 14:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622058503;
        bh=jmGUOiH5Kh5C55VfKeVNPLm81ACiT20v+T/oKoj/f74=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Ja/RAjoOSeiNG3rPH4u+iH3Pt3VA5OC4eiWFHsX+e3JUcb5k0A478zAvu7t0ygKO9
         0d7XTHHejXa52GnxLOVxquWdjwcr+9nrq+CBqe8FBgOyLWuskuJfRxHfnFh4yrKiBh
         ApZGtZ8+bBF4xJydSRHcwu4kl7dwBnSvHja5QODk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QJmN1v031454
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 14:48:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 14:48:23 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.2176.012; Wed, 26 May 2021 14:48:23 -0500
From:   "Tammana, Gowtham" <g-tammana@ti.com>
To:     "Anna, Suman" <s-anna@ti.com>,
        "tony@atomide.com" <tony@atomide.com>,
        "bcousson@baylibre.com" <bcousson@baylibre.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        "Menon, Nishanth" <nm@ti.com>
Subject: RE: [PATCH v2] ARM: dts: dra7: Fix duplicate USB4 device node
Thread-Topic: [PATCH v2] ARM: dts: dra7: Fix duplicate USB4 device node
Thread-Index: AQHXUlN5Jk6XvXlbc0C/UV9VMQLecKr2YXOA///ASFA=
Date:   Wed, 26 May 2021 19:48:23 +0000
Message-ID: <555c768263cc48499b299c0b595fcb94@ti.com>
References: <20210526172038.17542-1-g-tammana@ti.com>
 <64bb0e71-dc6d-e21d-cfc0-cfeb787ca7c2@ti.com>
In-Reply-To: <64bb0e71-dc6d-e21d-cfc0-cfeb787ca7c2@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFubmEsIFN1bWFuDQo+U2Vu
dDogV2VkbmVzZGF5LCBNYXkgMjYsIDIwMjEgMTowMSBQTQ0KPg0KPkhpIEdvd3RoYW0sDQo+DQo+
T24gNS8yNi8yMSAxMjoyMCBQTSwgR293dGhhbSBUYW1tYW5hIHdyb3RlOg0KPj4gV2l0aCBbMV0g
VVNCNCBkZXZpY2Ugbm9kZSBnb3QgZGVmaW5lZCBpbiBkcmE3NHguZHRzaSBmaWxlLiBIb3dldmVy
LA0KPj4gdGhlcmUgd2FzIGEgcHJpb3IgZGVmaW50aW9uIG9mIHRoZSBzYW1lIGluIFsyXSB3aGlj
aCBkaWRuJ3QgZ2V0IHJlbW92ZWQNCj4NCj5JIGxpa2UgdGhpcyBhcHByb2FjaCBhbmQgaXMgbW9y
ZSBpbiBsaW5lIHdpdGggdGhlIG9yaWdpbmFsIG1vdmUgb2YgVVNCNA0KPm5vZGUNCj5pbnRvIGRy
YTc0eC5kdHNpIGZpbGUuDQo+DQo+TG9va3MgbGlrZSB5b3UgbWl4ZWQgdXAgWzFdIGFuZCBbMl0g
b3IgSSBtaXN1bmRlcnN0YW5kIHlvdXIgdGVybWlub2xvZ3kuDQoNClllcywgMSBhbmQgMiBnb3Qg
bWl4ZWQgdXAgaGVyZS4gV2lsbCBwb3N0IGEgdjMuDQoNCj5BbHNvLA0KPmxldCdzIGJlIHByZWNp
c2UsIGl0IGlzIHRoZSBVU0I0IHRhcmdldC1tb2R1bGUgbm9kZSB0aGF0IGdvdCBkdXBsaWNhdGVk
IGluDQo+WzJdLA0KPlVTQjQgbm9kZSBhbHdheXMgZXhpc3RlZCBidXQgb3V0c2lkZSBvZiB0aS1z
eXNjIGNvbnRyb2wgYmVmb3JlIFsyXSBhbmQgZGlkDQo+bm90DQo+Y29uZmxpY3Qgd2l0aCB0aGUg
dGFyZ2V0LW1vZHVsZSBub2RlIGFkZGVkIGluIFsxXS4NCj4NCj4+IGNhdXNpbmcgYm9vdCBmYWls
dXJlcy4NCj4NCj5vbiB3aGF0IGJvYXJkcz8gSXMgaXQgYWZmZWN0aW5nIGFsbCBvZiB0aGVtPw0K
DQpJIGhhdmUgYSBkcmE3LWV2bSBib2FyZCBhbmQgc2VlIGZhaWx1cmUgb24gaXQuIFRoaXMgc2hv
dWxkIGFsc28gYWZmZWN0DQpEcmE3Ni1ldm0sIGFtNTcyeCBiZWFnbGUgYm9hcmRzLCBhbTU3NHgg
YXMgdGhleSBhbGwgcHVsbCBpbiBkcmE3NHguZHRzaS4NCldpbGwgbWVudGlvbiB0aGVzZSBpbiB0
aGUgdjMgdXBkYXRlLg0KDQpUaGFua3MsDQpHb3d0aGFtIA0KDQo+IFVTQjQgbm9kZSBpcyBwcmVz
ZW50IG9ubHkgaW4gRFJBNzR4IHZhcmlhbnRzIHNvDQo+PiBrZWVwaW5nIHRoZSBlbnRyeSBpbiBk
cmE3NHguZHRzaSBhbmQgcmVtb3ZpbmcgaXQgZnJvbSB0aGUgdG9wIGxldmVsDQo+PiBpbnRlcmNv
bm5lY3QgaGllcmFyY2h5IGRyYTctbDQuZHRzaSBmaWxlLg0KPj4NCj4+IFNpbmNlIFVTQjQgaXMg
b25seSBpbmNsdWRlZCBpbiBEUkE3NHggdmFyaWFudHMsIHJlbW92ZSBpdHMgcmVmZXJlbmNlDQo+
PiBmb3IgQU01NzE4LCBEUkE3MXggYW5kIERSNzJ4IGJvYXJkcy4NCj4+DQo+PiBbMV06IGNvbW1p
dCA1NDlmY2UwNjhhMzExICgiQVJNOiBkdHM6IGRyYTc6IEFkZCBsNCBpbnRlcmNvbm5lY3QNCj4+
IGhpZXJhcmNoeSBhbmQgdGktc3lzYyBkYXRhIikNCj4+IFsyXTogY29tbWl0IGM3YjcyYWJjYTYx
ZWMgKCJBUk06IE9NQVAyKzogRHJvcCBsZWdhY3kgcGxhdGZvcm0gZGF0YSBmb3INCj4+IGRyYTcg
ZHdjMyIpDQo+Pg0KPj4gRml4ZXM6IGM3YjcyYWJjYTYxZWMgKCJBUk06IE9NQVAyKzogRHJvcCBs
ZWdhY3kgcGxhdGZvcm0gZGF0YSBmb3IgZHJhNw0KPmR3YzMiKQ0KPj4gU2lnbmVkLW9mZi1ieTog
R293dGhhbSBUYW1tYW5hIDxnLXRhbW1hbmFAdGkuY29tPg0KPj4gLS0tDQo+PiB2MjoNCg==
