Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AE739E0DF
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 17:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhFGPmp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 11:42:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37492 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhFGPml (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Jun 2021 11:42:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 157Fel13032985;
        Mon, 7 Jun 2021 10:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623080447;
        bh=+uz/wq/yu7CBLDcKbOk5X+8UdykSkEhwFcrJKrAt544=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Cqv6Rrtq2uktAn8lvFtavIpkdoj262gmtL15eSmACZC/eeYrHJOYJbTzFcExGmaaD
         tp84O4dD+1k7IVYem3tpl9+oar89/YKr36wD/1X7OPBtEfRQAWb3l71INoej9l1Xwp
         7iwVt5q+68yKlFHI0EKEOIYFT4WQhfKAh3+SVQ8w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 157FelFX130866
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Jun 2021 10:40:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 10:40:47 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
 DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
 15.01.2176.012; Mon, 7 Jun 2021 10:40:47 -0500
From:   "Woodruff, Richard" <r-woodruff2@ti.com>
To:     David Russell <david.russell73@gmail.com>,
        "tony@atomide.com" <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Topic: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Thread-Index: AQHXW64KTel5D7x5GUqgCeE1dBGRWqsIrOqg
Date:   Mon, 7 Jun 2021 15:40:47 +0000
Message-ID: <cb562f9f798d4431a09f19e8efd24727@ti.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
In-Reply-To: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.57.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

R3Vlc3M6IHRoaXMgYml0IGluIEpUQUcgc2NyaXB0IHVzZWQgZm9yIElWQSB0ZXN0cyBwcm9iYWJs
eSBpcyBtaXNzaW5nIGFuZCBuZWVkcyB0byBiZSB3b3JrZWQgaW4uICBUaGUgZ2VuZXJpYyBsaW51
eC1vbWFwIGNsb2NrIGNvZGUgcHJvYmFibHkgaGFuZGxlcyB0aGUgSVZBIGNsb2NrIGJ1dCBtYXli
ZSBub3QgdGhlIHJlc2V0cy4NCg0KICAgLyogIEVuYWJsZSBJVkEtc3MgZnVuY3Rpb25hbCBjbG9j
ayAoc2V0IGJpdCAwKSAqLw0KICAgKCooaW50KikweDQ5MDA2ODAwKSB8PSAweDE7DQoNCiAgIC8q
IFJlbGVhc2UgbDNzX2lkbGVfcmVxICAqLw0KICAgKCooaW50KikweDQ5MDA2ODEwKSB8PSAoMSA8
PCAxKTsNCg0KICAgLyogUmVsZWFzZSBMM1MgcmVzZXQgYW5kIHBvd2VyLW9uIHJlc2V0IChjbGVh
ciBiaXQgMSkgYXQgdGhlIHNhbWUgdGltZSAqLw0KICAgKCooaW50KikweDQ5MDA2ODUwKSAmPSB+
KCggMSA8PCAxKSk7DQoNClJlZ2FyZHMsDQpSaWNoYXJkIFcuDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBEYXZpZCBSdXNzZWxsIDxkYXZpZC5ydXNzZWxsNzNAZ21haWwuY29t
PiANClNlbnQ6IE1vbmRheSwgSnVuZSAwNywgMjAyMSAxMDowMSBBTQ0KVG86IHRvbnlAYXRvbWlk
ZS5jb20NCkNjOiBsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogW0VYVEVSTkFM
XSBPTUFQMjQzMCBrZXJuZWwgaGFuZ3Mgb24gaW9yZW1hcCBvZiBJVkEyLjEgYWRkcmVzc2VzDQoN
Ckdvb2QgbW9ybmluZywNCg0KSSBoYXZlIGEgbGVnYWN5IHByb2plY3QgdGhhdCBydW5zIG9uIGFu
IE9NQVAyNDMwIGFuZCBpcyBiYXNlZCBvbiB0aGUgbGludXgtb21hcCByZXBvICh0YWcgdjIuNi4y
OC1vbWFwMSkuICBJIGFtIGluIHRoZSBwcm9jZXNzIG9mIHVwZ3JhZGluZyB0aGUgcHJvamVjdCB0
byBtYWlubGluZSB2NS4xMDsgSSBoYXZlIGJlZW4gYWJsZSB0byBnZXQgbW9zdCBpc3N1ZXMgcmVz
b2x2ZWQgKGUuZy4sIFVTQiBETUEgc3RpbGwgZmFpbHMsIGJ1dCBQSU8gd29ya3MgZm9yIG5vdyks
IGJ1dCBoYXZlIGEgZGlmZmljdWx0IHByb2JsZW0gdGhhdCBJIGFtIGhvcGluZyBzb21lb25lIG1p
Z2h0IGxlbmQgYW4gaWRlYSB0by4gIFdlIGhhdmUgYSBjdXN0b20gRFNQIGRyaXZlciB0aGF0IGlz
IHJlc3BvbnNpYmxlIGZvciByZXNldHRpbmcgdGhlIERTUCwgZG93bmxvYWRpbmcgdGhlIGZpcm13
YXJlLCBzZXR0aW5nIHVwIHRoZSBtYWlsYm94IGFuZCB0aGVuIG1hbmFnaW5nIHRoZSBjb21tdW5p
Y2F0aW9uIGJldHdlZW4gdGhlIEFSTSBhbmQgRFNQLiAgSSBoYXZlIHRoZSBkcml2ZXIgbW9zdGx5
IHBvcnRlZCAoaS5lLiwgY29tcGlsaW5nKSBhbmQgYW0gd29ya2luZyB0aHJvdWdoIHRoZSBiZWhh
dmlvci4gIEF0IHByb2JlLXRpbWUgdGhlcmUgYXJlIHNldmVyYWwgaW9yZW1hcOKAmXMgb2YgSVZB
Mi4xIG1lbW9yeSAoMHg1YzgwMDAwMCBhbmQgMHg1ZDAwMDAwMCDigJQgdGhlIGludGVybmFsIFNS
QU0gYW5kIHRoZSBNTVUpLiAgVGhlIGlvcmVtYXDigJlzIHN1Y2NlZWQgd2l0aG91dCBlcnJvciwg
YnV0IGFzIHNvb24gYXMgSSBzaW1wbHkgdHJ5IHRvIHJlYWQgdGhlIHJldmlzaW9uIHJlZ2lzdGVy
IGF0IDB4NWQwMDAwMDAgdGhlIEFSTSBoYW5ncyAoaS5lLiwgbm90IGV2ZW4gYSBrZXJuZWwgcGFu
aWMgbWVzc2FnZSBpcyBwcmVzZW50ZWQsIHRoZSBjb25zb2xlIGp1c3QgZnJlZXplcykuICBJIGFz
c3VtZSB0aGF0IEkgYW0gbWlzc2luZyBhIGNsb2NrIG9yIHNvbWUgbW9kdWxlIGlzIHBvd2VyZWQt
ZG93biwgYnV0IGFtIG5vdCBzdXJlLiAgSW50ZXJlc3RpbmdseSwgaW4gYXJjaC9hcm0vbWFjaC1v
bWFwMi9pb21hcC5oIGl0IGlzIGV4cGxpY2l0bHkgbm90ZWQgdGhhdCB0aGUgMjQzMCBJVkEyLjEg
aXMgbm90IG1hcHBlZCDigJQgSSBhdHRlbXB0ZWQgdG8gYWRkIHRoZXNlIG1hcHBpbmdzIHRvIHRo
ZSAyNDMwIHRhYmxlIHdoaWNoIHJlc3VsdGVkIGluIHplcm8gY29uc29sZSBvdXRwdXQgb2YgdGhl
IGtlcm5lbCBib290IChpLmUuLCBJIGNhbiBzZWUgdGhlIHgtbG9hZGVyIGNvbnNvbGUgb3V0cHV0
IGdldHRpbmcgcmVhZHkgdG8gbGF1bmNoIHRoZSBrZXJuZWwsIGFuZCB0aGVuIG5vdGhpbmcpLg0K
DQpUaGlzIGlzIGEgY2hhbGxlbmdpbmcgcHJvYmxlbSB3aXRoIHRoZSBjb25zb2xlIHNpbXBseSBm
cmVlemluZyBvbiB0aGUgbWVtb3J5IGFjY2Vzcy4gIEkgd291bGQgdmVyeSBtdWNoIGFwcHJlY2lh
dGUgYW55IGlkZWFzIGFzIHRvIHRoaXMgaXNzdWUuDQoNClJlZ2FyZHMsDQoNCkRhdmUNCg0K
