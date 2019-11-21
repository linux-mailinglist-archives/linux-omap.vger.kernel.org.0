Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812021054B7
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 15:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfKUOmA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 09:42:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38434 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKUOmA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 09:42:00 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALEfofv117535;
        Thu, 21 Nov 2019 08:41:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574347310;
        bh=X3k1ah00JHrP/MAWY03kTO2aU8Sh6x1vrKpLESudLkU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=v+TpD8Gk1GlAHAF1V2koWCttKh0UuUwudm33kJmE0z078cfb7JbiHbClybXEnSfxO
         DPdOQdxu5jjA72JcY8hbS75XEA+573FKovVE1+hmB0x/68NXBgovB8mJHmKz7O5+jz
         soNiKYAchyCUHJltOKg/dtFYJ/ZU7A8hRcEep93I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xALEfoov094649
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Nov 2019 08:41:50 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 21
 Nov 2019 08:41:49 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
 DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
 15.01.1847.003; Thu, 21 Nov 2019 08:41:49 -0600
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
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] ARM: dts: am5729: beaglebone-ai: adding device tree
Thread-Topic: [PATCH 1/1] ARM: dts: am5729: beaglebone-ai: adding device tree
Thread-Index: AQHVnxgKGYt/3fBzT0yydyTQPJmWqKeV3U+A///XuDA=
Date:   Thu, 21 Nov 2019 14:41:49 +0000
Message-ID: <12acbc1a96754fe68d7447b6ee99efd3@ti.com>
References: <20191119202850.18149-1-c-robey@ti.com>
 <20191119202850.18149-2-c-robey@ti.com>
 <8465b8c3-db4b-31fd-a299-3d5251ec99cf@ti.com>
In-Reply-To: <8465b8c3-db4b-31fd-a299-3d5251ec99cf@ti.com>
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
dXJpLCBQcmFuZWV0aDsgRGF2aXMsDQo+IEFuZHJldzsgVG9tIFJpbmk7IFJvYmVydCBOZWxzb247
IFJvYiBIZXJyaW5nOyBNYXJrIFJ1dGxhbmQ7IEJlbm/DrnQNCj4gQ291c3NvbjsgVG9ueSBMaW5k
Z3JlbjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8xXSBBUk06IGR0czogYW01NzI5OiBi
ZWFnbGVib25lLWFpOiBhZGRpbmcgZGV2aWNlDQo+IHRyZWUNCj4gDQo+IA0KPiANCj4gT24gMTkv
MTEvMjAxOSAyMjoyOCwgQ2FsZWIgUm9iZXkgd3JvdGU6DQo+ID4gRnJvbTogSmFzb24gS3JpZG5l
ciA8amRrQHRpLmNvbT4NCj4gPg0KPiA+IEJlYWdsZUJvYXJkLm9yZyBCZWFnbGVCb25lIEFJIGlz
IGFuIG9wZW4gc291cmNlIGhhcmR3YXJlIHNpbmdsZQ0KPiA+IGJvYXJkIGNvbXB1dGVyIGJhc2Vk
IG9uIHRoZSBUZXhhcyBJbnN0cnVtZW50cyBBTTU3MjkgU29DIGZlYXR1cmluZw0KPiA+IGR1YWwt
Y29yZSAxLjVHSHogQXJtIENvcnRleC1BMTUgcHJvY2Vzc29yLCBkdWFsLWNvcmUgQzY2IGRpZ2l0
YWwNCj4gPiBzaWduYWwgcHJvY2Vzc29yIChEU1ApLCBxdWFkLWNvcmUgZW1iZWRkZWQgdmlzaW9u
IGVuZ2luZSAoRVZFKSwNCj4gPiBBcm0gQ29ydGV4LU00IHByb2Nlc3NvcnMsIGR1YWwgcHJvZ3Jh
bW1hYmxlIHJlYWx0aW1lIHVuaXQNCj4gPiBpbmR1c3RyaWFsIGNvbnRyb2wgc3Vic3lzdGVtcyBh
bmQgbW9yZS4gVGhlIGJvYXJkIGZlYXR1cmVzIDFHQg0KPiA+IEREUjNMLCBVU0IzLjAgVHlwZS1D
LCBVU0IgSFMgVHlwZS1BLCBtaWNyb0hETUksIDE2R0IgZU1NQyBmbGFzaCwNCj4gPiAxRyBFdGhl
cm5ldCwgODAyLjExYWMgMi81R0h6LCBCbHVldG9vdGgsIGFuZCBCZWFnbGVCb25lIGV4cGFuc2lv
bg0KPiA+IGhlYWRlcnMuDQo+ID4NCj4gPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgcmVmZXIgdG86
DQo+ID4gaHR0cHM6Ly9iZWFnbGVib25lLmFpDQo+IA0KPiANCj4gPg0KPiA+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyB0aGUgQmVhZ2xlQm9uZSBBSSBkZXZpY2UgdHJlZS4NCj4gPg0KPiA+IE5vdGUg
dGhhdCB0aGUgZGV2aWNlIHVzZSB0aGUgInRpLHRwZDEyczAxNiIgY29tcG9uZW50IHdoaWNoIGlz
DQo+ID4gc29mdHdhcmUgY29tcGF0aWJsZSB3aXRoICJ0aSx0cGQxMnMwMTUiLiBUaHVzIHdlIG9u
bHkgdXNlIHRoZQ0KPiA+IGxhdHRlciBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBLcmlkbmVyIDxqZGtAdGkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENhbGViIFJvYmV5
IDxjLXJvYmV5QHRpLmNvbT4NCj4gPiBDYzogUm9iZXJ0IE5lbHNvbiA8cm9iZXJ0Y25lbHNvbkBn
bWFpbC5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxl
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNTcyOS1i
ZWFnbGVib25lYWkuZHRzIHwgNzgyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNzgzIGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL2FybS9ib290L2R0cy9hbTU3MjktYmVhZ2xlYm9uZWFpLmR0cw0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMv
TWFrZWZpbGUNCj4gPiBpbmRleCBiMjFiM2E2NDY0MWEuLmIxMTU0ZGJkYTczYyAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlDQo+IA0KPiBbLi5dDQo+IA0KPiA+ICsNCj4gPiArJnVhcnQxIHsNCj4g
PiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZkYXZpbmNpX21kaW8g
ew0KPiA+ICsJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8yIDIzIEdQSU9fQUNUSVZFX0xPVz47DQo+ID4g
KwlyZXNldC1kZWxheS11cyA9IDwyPjsNCj4gPiArDQo+ID4gKwlwaHkwOiBldGhlcm5ldC1waHlA
MSB7DQo+ID4gKwkJcmVnID0gPDQ+Ow0KPiA+ICsJCWNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5
LWlkMDA0ZC5kMDcyIiwNCj4gPiArCQkJImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIyIjsNCj4g
DQo+IFBscywgZG8gbm90IGlnbm9yZSBteSBjb21tZW50cy4NCj4gDQo+IEFib3ZlIGNvbXBhdGli
bGUgc2hvdWxkIG5vdCBiZSByZXF1aXJlZC4NCg0KR3J5Z29yaSwgSSBhbSBzbyBzb3JyeSBhYm91
dCB0aGlzIC0gSSBoYWQgZGVsZXRlZCB0aGlzLA0KYnV0IG11c3QgaGF2ZSBtYWRlIGEgbWlzdGFr
ZSBpbiB0aGUgcmVzdWJtaXNzaW9uLiBJDQp3aWxsIGZpeCBpdCBpbW1lZGlhdGVseS4NCg0KDQo+
IA0KPiA+ICsJCWVlZS1icm9rZW4tMTAwdHg7DQo+ID4gKwkJZWVlLWJyb2tlbi0xMDAwdDsNCj4g
PiArCX07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmbWFjIHsNCj4gPiArCXNsYXZlcyA9IDwxPjsN
Cj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gDQo+IFBscywgbW92ZSBjcHN3IG5v
ZGUgaGVyZQ0KDQpTYW1lIGFzIGFib3ZlLi4uIHRoaXMgbXVzdCBiZSB0aGUgd3JvbmcgZmlsZS4g
SSBhcG9sb2dpemUuDQogDQoNCj4gDQo+ID4gKw0KPiA+ICsmb2NwIHsNCj4gPiArCXBydXNzMV9z
aG1lbTogcHJ1c3Nfc2htZW1ANGIyMDAwMDAgew0KPiA+ICsJCXN0YXR1cyA9ICJva2F5IjsNCj4g
PiArCQljb21wYXRpYmxlID0gInRpLHBydXNzLXNobWVtIjsNCj4gPiArCQlyZWcgPSA8MHg0YjIw
MDAwMCAweDAyMDAwMD47DQo+ID4gKwl9Ow0KPiA+ICsNCj4gDQo+IFsuLl0NCj4gDQo+ID4gKw0K
PiA+ICsmY3Bzd19lbWFjMCB7DQo+ID4gKwlwaHktaGFuZGxlID0gPCZwaHkwPjsNCj4gPiArCXBo
eS1tb2RlID0gInJnbWlpIjsNCj4gPiArfTsNCj4gDQo+IE1vdmUgaXQgdXAsIHBscy4NCj4gDQo+
IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gZ3J5Z29yaWkNCg==
