Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AEE369FE9
	for <lists+linux-omap@lfdr.de>; Sat, 24 Apr 2021 09:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhDXHBI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 24 Apr 2021 03:01:08 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21171 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhDXHBH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 24 Apr 2021 03:01:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619247615; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=VTzYT/CDkeExDzut6C1/3PY9x1CaADhUaKky2tKVLSoEn3gNiBaIf9a29RRWy3jXCb84P3YwP7zL/YRWwz0XB46GSY/Jp8wXQbD38ahpFllLw/PKi4p9xAfdeq36+FGbS8YiBDaHDv5Rhwl20mFzODOAu2U6z4TDF1nyCQE2qno=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1619247615; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=PpmKQct8T7SE+9HTjvr+Kcy/6X66BoTXVEZdN5kjPdY=; 
        b=j64CG/8W5yNGrNx/BcFUpNiovAIjQQ61vKaYnuIW4Q058piQz/gq+MdHcBXSCDZWLqBCYhRxHGFoPuLeoBMc9kTJtJxigX8YSLQI6xIJMoAz5f1Ttfrn7DV6HsZ8NGzirYULmysUsDinHHu5Q/1nnxC7HkTswkcAD1ahdTOpHNY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=carl@uvos.xyz;
        dmarc=pass header.from=<carl@uvos.xyz> header.from=<carl@uvos.xyz>
Received: from [100.99.127.58] (ip-109-40-128-234.web.vodafone.de [109.40.128.234]) by mx.zoho.eu
        with SMTPS id 1619247614335511.7873946835115; Sat, 24 Apr 2021 09:00:14 +0200 (CEST)
Date:   Sat, 24 Apr 2021 09:00:13 +0200
Subject: Re: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type
 auto detection for mapphone devices
From:   carl@uvos.xyz
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        linux-omap@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Message-ID: <17902adc982.11f94042187264621.8712932018769506839@zoho.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gQXByIDI0LCAyMDIxIDA4OjQ3LCBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPiB3
cm90ZToKPgo+IEhpLCAKPgo+ICogQ2FybCBQaGlsaXBwIEtsZW1tIDxwaGlsaXBwQHV2b3MueHl6
PiBbMjEwNDIzIDEyOjU1XTogCj4gPiArc3RhdGljIHZvaWQgY3BjYXBfYmF0dGVyeV9kZXRlY3Rf
YmF0dGVyeV90eXBlKHN0cnVjdCBjcGNhcF9iYXR0ZXJ5X2RkYXRhICpkZGF0YSkgCj4gPiAreyAK
PiA+ICsgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW07IAo+ID4gKyB1OCBiYXR0ZXJ5X2lkID0g
MDsgCj4gPiArIAo+ID4gKyBkZGF0YS0+Y2hlY2tfbnZtZW0gPSBmYWxzZTsgCj4gPiArIAo+ID4g
KyBudm1lbSA9IG52bWVtX2RldmljZV9maW5kKE5VTEwsICZjcGNhcF9iYXR0ZXJ5X21hdGNoX252
bWVtKTsgCj4gPiArIGlmIChJU19FUlJfT1JfTlVMTChudm1lbSkpIHsgCj4gPiArIGRkYXRhLT5j
aGVja19udm1lbSA9IHRydWU7IAo+ID4gKyBpZiAoIWRkYXRhLT5ub19udm1lbV93YXJuZWQpIHsg
Cj4gPiArIGRldl9pbmZvKGRkYXRhLT5kZXYsICJDYW4gbm90IGZpbmQgYmF0dGVyeSBudm1lbSBk
ZXZpY2UuIEFzc3VtaW5nIGdlbmVyaWMgbGlwbyBiYXR0ZXJ5XG4iKTsgCj4gPiArIGRkYXRhLT5u
b19udm1lbV93YXJuZWQgPSB0cnVlOyAKPiA+ICsgfSAKPgo+IEZvbGtzIGFyZSBhbHNvIHVzaW5n
IHRoZSBkZXZpY2Ugd2l0aCBubyBiYXR0ZXJ5IGF0IGFsbCB0byBoYXZlIGl0IGRpcmVjdGx5IAo+
IGNvbm5lY3RlZCB0byB0aGUgcG93ZXIgc3VwcGx5LiBUaGlzIGlzIGhhbmR5IGZvciByZW1vdGVs
eSBwb3dlciBjeWNsaW5nIAo+IHRoZSBkZXZpY2UsIGFuZCBhbHNvIGZvciBtZWFzdXJpbmcgcG93
ZXIgY29uc3VtcHRpb24gd2l0aCBhIGJlbmNoIHBvd2VyIAo+IHN1cHBseS4gU28gYnkgZGVmYXVs
dCBJIHRoaW5rIHdlIHNob3VsZCBjb250aW51ZSBhc3N1bWluZyBubyBiYXR0ZXJ5IGlzIAo+IGlu
c2VydGVkIHJhdGhlciB0aGFuIGFzc3VtZSBhIGdlbmVyaWMgYmF0dGVyeSBpcyBpbnNlcnRlZC4g
Cj4KPiBIb3cgYWJvdXQgcmVxdWlyZSBjb25maWd1cmluZyB0aGUgdW5kZXRlY3RlZCBiYXR0ZXJ5
IHBhcmFtZXRlcnMgdmlhIAo+IC9zeXMvY2xhc3MvcG93ZXJfc3VwcGx5IHRvIGluZGljYXRlIGEg
bm9uLXN0YW5kYXJkIGJhdHRlcnkgaXMgaW5zZXJ0ZWQ/IAo+Cj4gQXQgbGVhc3QgYmF0dGVyeSB0
eXBlLCBjYXBhY2l0eSwgYW5kIHZvbHRhZ2UgY2FuIGRlcGVuZCBvbiB0aGUgZ2VuZXJpYyAKPiBi
YXR0ZXJ5IGluc2VydGVkLiAKPgo+IE90aGVyIHRoYW4gdGhhdCwgdGhlIE5WUkFNIGNoYW5nZXMg
bG9vayBuaWNlIHRvIG1lLiAKPgo+IFJlZ2FyZHMsIAo+Cj4gVG9ueSAKClRoZSBiYXR0ZXJ5IGlu
c2VydGVkIHByb3BlcnR5IGlzIHN0aWxsIGJhc2VkIG9uIHRoZSBwcmVzZW5jZSBvZiBhIHRoZXJt
aXN0b3IsIHNvIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHBhdGNoIGNoYW5nZXMgdGhlIGJldmlvciB3
aXRoIHJlZ2FyZHMgdG8gdGhpcyB1c2UgY2FzZSBhdCBhbGwgZXhjZXB0IGZvciB0aGF0IGluZm8g
cHJpbnQuIFByZXZpb3VzbHkgdGhlIGJhdHRlcnkgaW5mb3JtYXRpb24gc3RydWN0IHdhcyBzaW1w
bHkgc2V0IHRvIHRoZSB2YWx1ZXMgZXhwZWN0ZWQgZnJvbSBlYjQxIG5vIG1hdHRlciB3aGF0Lg==

