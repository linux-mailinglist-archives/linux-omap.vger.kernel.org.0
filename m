Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA0C72B862
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 08:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjFLG62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 02:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbjFLG61 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 02:58:27 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989941980;
        Sun, 11 Jun 2023 23:53:26 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 07F462044E;
        Mon, 12 Jun 2023 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686552476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6wE81mZgGekI+zZfjGb3Zd3JrQJ6DIxbSyJg2JT6m24=;
        b=EosoEavUBiwOoLREzx8G5hAD1JSfVPolrZdbsMk0S5FYzFCKqZKZ5MZeLAtpIXwCNWF9wn
        9pJst0COC8j0Ktkai4WTS7CVW18tVTpc4Ft5wwVB/6rLEFx4jfKAKc0kNPdDR6PBsOA5cf
        srQ1kqqWUW7tspzd/AkTaMEiFAI5PLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686552476;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6wE81mZgGekI+zZfjGb3Zd3JrQJ6DIxbSyJg2JT6m24=;
        b=DbnT9mQw+A3ye6hA+ZYuIoIr88DRAKtg3Y+HHzmwU+R9/R76+MHosLoG4TvssR1+7Ppjmb
        DaWZpuM9oDGVw/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD33B138EC;
        Mon, 12 Jun 2023 06:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Y6wQKZu/hmRaUwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 06:47:55 +0000
Message-ID: <fd02bf75-5653-9f82-6d4c-6cdf98dbf7af@suse.de>
Date:   Mon, 12 Jun 2023 08:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
        geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <20230611163716.GA1139759@ravnborg.org>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230611163716.GA1139759@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rIVxUTv1Vwc0inEcktkUyAp7"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rIVxUTv1Vwc0inEcktkUyAp7
Content-Type: multipart/mixed; boundary="------------UGua3H0qju2qz0h33EQwfr8V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Message-ID: <fd02bf75-5653-9f82-6d4c-6cdf98dbf7af@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <20230611163716.GA1139759@ravnborg.org>
In-Reply-To: <20230611163716.GA1139759@ravnborg.org>

--------------UGua3H0qju2qz0h33EQwfr8V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDExLjA2LjIzIHVtIDE4OjM3IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIEp1biAwNSwgMjAyMyBhdCAwNDo0ODoxMlBN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFkZCBLY29uZmlnIG9wdGlv
biBDT05GSUdfRkJfREVWSUNFIGFuZCBtYWtlIHRoZSB2aXJ0dWFsIGZiZGV2DQo+PiBkZXZp
Y2Ugb3B0aW9uYWwuIElmIHRoZSBuZXcgb3B0aW9uIGhhcyBub3QgYmVlbiBzZWxlY3RlZCwg
ZmJkZXYNCj4+IGRvZXMgbm90IGNyZWF0ZSBhIGZpbGVzIGluIGRldmZzIG9yIHN5c2ZzLg0K
PiBzLyBhLy8NCj4+DQo+PiBNb3N0IG1vZGVybiBMaW51eCBzeXN0ZW1zIHJ1biBhIERSTS1i
YXNlZCBncmFwaGljcyBzdGFjayB0aGF0IHVzZXMNCj4+IHRoZSBrZXJuZWwncyBmcmFtZWJ1
ZmZlciBjb25zb2xlLCBidXQgaGFzIG90aGVyd2lzZSBkZXByZWNhdGVkIGZiZGV2DQo+PiBz
dXBwb3J0LiBZZXQgZmJkZXYgdXNlcnNwYWNlIGludGVyZmFjZXMgYXJlIHN0aWxsIHByZXNl
bnQuDQo+Pg0KPj4gVGhlIG9wdGlvbiBtYWtlcyBpdCBwb3NzaWJsZSB0byB1c2UgdGhlIGZi
ZGV2IHN1YnN5c3RlbSBhcyBjb25zb2xlDQo+PiBpbXBsZW1lbnRhdGlvbiB3aXRob3V0IHN1
cHBvcnQgZm9yIHVzZXJzcGFjZS4gVGhpcyBjbG9zZXMgcG90ZW50aWFsDQo+PiBlbnRyeSBw
b2ludHMgdG8gbWFuaXB1bGF0ZSBrZXJuZWwgb3IgSS9PIG1lbW9yeSB2aWEgZnJhbWVidWZm
ZXJzLiBJdA0KPj4gYWxzbyBwcmV2ZW50cyB0aGUgZXhlY3V0aW9uIG9mIGRyaXZlciBjb2Rl
IHZpYSBpb2N0bCBvciBzeXNmcywgYm90aA0KPj4gb2Ygd2hpY2ggbWlnaHQgYWxsb3cgbWFs
aWNpb3VzIHNvZnR3YXJlIHRvIGV4cGxvaXQgYnVncyBpbiB0aGUgZmJkZXYNCj4+IGNvZGUu
DQo+Pg0KPj4gQSBzbWFsbCBudW1iZXIgb2YgZmJkZXYgZHJpdmVycyByZXF1aXJlIHN0cnVj
dCBmYmluZm8uZGV2IHRvIGJlDQo+PiBpbml0aWFsaXplZCwgdXN1YWxseSBmb3IgdGhlIHN1
cHBvcnQgb2Ygc3lzZnMgaW50ZXJmYWNlLiBNYWtlIHRoZXNlDQo+PiBkcml2ZXJzIGRlcGVu
ZCBvbiBGQl9ERVZJQ0UuIFRoZXkgY2FuIGxhdGVyIGJlIGZpeGVkIGlmIG5lY2Vzc2FyeS4N
Cj4gU2hvdWxkIHRoYXQgYmUgYSBUT0RPIGluIGdwdS90b2RvLnJzdD8NCj4gT3RoZXJ3aXNl
IHRoZSBhbW91bnQgb2YgcGVvcGxlIGtub3dpbmcgYWJvdXQgdGhpcw0KPiBpcyB2ZXJ5IGNs
b3NlIHRvIDEuDQoNCkhhISBZZXMsIEknbGwgYWRkIGEgVE9ETyBpdGVtLiBHb29kIGlkZWEu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gQXMgYW4gYWx0ZXJuYXRpdmUgYWRkIGEg
VE9ETyB0byBlYWNoIEtjb25maWcgZmlsZS4NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcgICAgICAgICAgICB8ICAxICsNCj4+ICAg
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnICAgICAgICAgICAgICB8IDEyICsrKysrKysr
Kw0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUgICAgICAgIHwgIDcg
KysrLS0tDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9pbnRlcm5hbC5oICAg
fCAzMiArKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgZHJpdmVycy92aWRlby9mYmRl
di9vbWFwMi9vbWFwZmIvS2NvbmZpZyB8ICAyICstDQo+PiAgIGluY2x1ZGUvbGludXgvZmIu
aCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPj4gICA2IGZpbGVzIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L0tjb25maWcNCj4+IGluZGV4IDRkMjllOGMxMDE0ZS4uNWRkYTNjNjVhMzhlIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcNCj4+ICsrKyBiL2RyaXZl
cnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnDQo+PiBAQCAtMiw2ICsyLDcgQEANCj4+ICAgbWVu
dWNvbmZpZyBGQl9URlQNCj4+ICAgCXRyaXN0YXRlICJTdXBwb3J0IGZvciBzbWFsbCBURlQg
TENEIGRpc3BsYXkgbW9kdWxlcyINCj4+ICAgCWRlcGVuZHMgb24gRkIgJiYgU1BJDQo+PiAr
CWRlcGVuZHMgb24gRkJfREVWSUNFDQo+PiAgIAlkZXBlbmRzIG9uIEdQSU9MSUIgfHwgQ09N
UElMRV9URVNUDQo+PiAgIAlzZWxlY3QgRkJfU1lTX0ZJTExSRUNUDQo+PiAgIAlzZWxlY3Qg
RkJfU1lTX0NPUFlBUkVBDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+PiBpbmRleCA2ZGY5YmQw
OTQ1NGEuLjQ4ZDlhMTRmODg5YyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+PiBA
QCAtNTcsNiArNTcsMTUgQEAgY29uZmlnIEZJUk1XQVJFX0VESUQNCj4+ICAgCSAgY29tYmlu
YXRpb24gd2l0aCBjZXJ0YWluIG1vdGhlcmJvYXJkcyBhbmQgbW9uaXRvcnMgYXJlIGtub3du
IHRvDQo+PiAgIAkgIHN1ZmZlciBmcm9tIHRoaXMgcHJvYmxlbS4NCj4+ICAgDQo+PiArY29u
ZmlnIEZCX0RFVklDRQ0KPj4gKyAgICAgICAgYm9vbCAiUHJvdmlkZSBsZWdhY3kgL2Rldi9m
YiogZGV2aWNlIg0KPj4gKyAgICAgICAgZGVwZW5kcyBvbiBGQg0KPj4gKyAgICAgICAgaGVs
cA0KPj4gKwkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdGhlIGxlZ2FjeSAvZGV2L2ZiKiBk
ZXZpY2UgZmlsZS4gSXQncw0KPj4gKwkgIG9ubHkgcmVxdWlyZWQgaWYgeW91IGhhdmUgdXNl
cnNwYWNlIHByb2dyYW1zIHRoYXQgZGVwZW5kIG9uDQo+PiArCSAgZmJkZXYgZm9yIGdyYXBo
aWNzIG91dHB1dC4gVGhpcyBkb2VzIG5vdCBlZmZlY3QgdGhlIGZyYW1lYnVmZmVyDQo+PiAr
CSAgY29uc29sZS4NCj4gdGFicyB0byBzcGFjZXMgdG8gaW5kZW50IHRoZSBhYm92ZSBjb3Jy
ZWN0Lg0KPiANCj4+ICsNCj4+ICAgY29uZmlnIEZCX0REQw0KPj4gICAJdHJpc3RhdGUNCj4+
ICAgCWRlcGVuZHMgb24gRkINCj4+IEBAIC0xNTQ1LDYgKzE1NTQsNyBAQCBjb25maWcgRkJf
M0RGWF9JMkMNCj4+ICAgY29uZmlnIEZCX1ZPT0RPTzENCj4+ICAgCXRyaXN0YXRlICIzRGZ4
IFZvb2RvbyBHcmFwaGljcyAoc3N0MSkgc3VwcG9ydCINCj4+ICAgCWRlcGVuZHMgb24gRkIg
JiYgUENJDQo+PiArCWRlcGVuZHMgb24gRkJfREVWSUNFDQo+PiAgIAlzZWxlY3QgRkJfQ0ZC
X0ZJTExSRUNUDQo+PiAgIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+PiAgIAlzZWxlY3Qg
RkJfQ0ZCX0lNQUdFQkxJVA0KPj4gQEAgLTE4NjIsNiArMTg3Miw3IEBAIGNvbmZpZyBGQl9T
SF9NT0JJTEVfTENEQw0KPj4gICAJdHJpc3RhdGUgIlN1cGVySCBNb2JpbGUgTENEQyBmcmFt
ZWJ1ZmZlciBzdXBwb3J0Ig0KPj4gICAJZGVwZW5kcyBvbiBGQiAmJiBIQVZFX0NMSyAmJiBI
QVNfSU9NRU0NCj4+ICAgCWRlcGVuZHMgb24gU1VQRVJIIHx8IEFSQ0hfUkVORVNBUyB8fCBD
T01QSUxFX1RFU1QNCj4+ICsJZGVwZW5kcyBvbiBGQl9ERVZJQ0UNCj4+ICAgCXNlbGVjdCBG
Ql9TWVNfRklMTFJFQ1QNCj4+ICAgCXNlbGVjdCBGQl9TWVNfQ09QWUFSRUENCj4+ICAgCXNl
bGVjdCBGQl9TWVNfSU1BR0VCTElUDQo+PiBAQCAtMTkzMCw2ICsxOTQxLDcgQEAgY29uZmln
IEZCX1NNU0NVRlgNCj4+ICAgY29uZmlnIEZCX1VETA0KPj4gICAJdHJpc3RhdGUgIkRpc3Bs
YXlsaW5rIFVTQiBGcmFtZWJ1ZmZlciBzdXBwb3J0Ig0KPj4gICAJZGVwZW5kcyBvbiBGQiAm
JiBVU0INCj4+ICsJZGVwZW5kcyBvbiBGQl9ERVZJQ0UNCj4+ICAgCXNlbGVjdCBGQl9NT0RF
X0hFTFBFUlMNCj4+ICAgCXNlbGVjdCBGQl9TWVNfRklMTFJFQ1QNCj4+ICAgCXNlbGVjdCBG
Ql9TWVNfQ09QWUFSRUENCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvTWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUNCj4+IGlu
ZGV4IDEyNWQyNGY1MGMzNi4uZDVlODc3MjYyMGY4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL01ha2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvTWFrZWZpbGUNCj4+IEBAIC0yLDEyICsyLDEzIEBADQo+PiAgIG9iai0kKENP
TkZJR19GQl9OT1RJRlkpICAgICAgICAgICArPSBmYl9ub3RpZnkubw0KPj4gICBvYmotJChD
T05GSUdfRkIpICAgICAgICAgICAgICAgICAgKz0gZmIubw0KPj4gICBmYi15ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOj0gZmJfYmFja2xpZ2h0Lm8gXA0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYl9kZXZmcy5vIFwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZiX2luZm8ubyBcDQo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZiX3Byb2Nmcy5vIFwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJtZW0ubyBmYm1vbi5vIGZiY21h
cC5vIGZic3lzZnMubyBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZibWVtLm8gZmJtb24ubyBmYmNtYXAubyBcDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb2RlZGIubyBmYmN2dC5vIGZiX2NtZGxpbmUubyBmYl9p
b19mb3BzLm8NCj4+ICAgZmItJChDT05GSUdfRkJfREVGRVJSRURfSU8pICAgICAgICs9IGZi
X2RlZmlvLm8NCj4+ICtmYi0kKENPTkZJR19GQl9ERVZJQ0UpICAgICAgICAgICAgKz0gZmJf
ZGV2ZnMubyBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZi
X3Byb2Nmcy5vIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmJzeXNmcy5vDQo+IE1heWJlIGNoYW5nZSB0aGlzIHRvIG9uZSBsaW5lIHRvIGF2b2lkICdc
Jz8NCj4gDQo+PiAgIA0KPj4gICBpZmVxICgkKENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xF
KSx5KQ0KPj4gICBmYi15CQkJCSAgKz0gZmJjb24ubyBiaXRibGl0Lm8gc29mdGN1cnNvci5v
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2ludGVybmFs
LmggYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfaW50ZXJuYWwuaA0KPj4gaW5kZXgg
MGI0M2MwY2Q1MDk2Li5iOGEyODQ2NmRiNzkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJfaW50ZXJuYWwuaA0KPj4gKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiX2ludGVybmFsLmgNCj4+IEBAIC0zLDEyICszLDIyIEBADQo+PiAgICNp
Zm5kZWYgX0ZCX0lOVEVSTkFMX0gNCj4+ICAgI2RlZmluZSBfRkJfSU5URVJOQUxfSA0KPj4g
ICANCj4+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51
eC9mYi5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4+ICAgDQo+PiAgIC8q
IGZiX2RldmZzLmMgKi8NCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfRkJfREVWSUNFKQ0KPj4g
ICBpbnQgZmJfcmVnaXN0ZXJfY2hyZGV2KHZvaWQpOw0KPj4gICB2b2lkIGZiX3VucmVnaXN0
ZXJfY2hyZGV2KHZvaWQpOw0KPj4gKyNlbHNlDQo+PiArc3RhdGljIGlubGluZSBpbnQgZmJf
cmVnaXN0ZXJfY2hyZGV2KHZvaWQpDQo+PiArew0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+
PiArc3RhdGljIGlubGluZSB2b2lkIGZiX3VucmVnaXN0ZXJfY2hyZGV2KHZvaWQpDQo+PiAr
eyB9DQo+PiArI2VuZGlmDQo+PiAgIA0KPj4gICAvKiBmYm1lbS5jICovDQo+PiAgIGV4dGVy
biBzdHJ1Y3QgY2xhc3MgKmZiX2NsYXNzOw0KPj4gQEAgLTE5LDExICsyOSwzMyBAQCBzdHJ1
Y3QgZmJfaW5mbyAqZ2V0X2ZiX2luZm8odW5zaWduZWQgaW50IGlkeCk7DQo+PiAgIHZvaWQg
cHV0X2ZiX2luZm8oc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPj4gICANCj4+ICAgLyog
ZmJfcHJvY2ZzLmMgKi8NCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfRkJfREVWSUNFKQ0KPj4g
ICBpbnQgZmJfaW5pdF9wcm9jZnModm9pZCk7DQo+PiAgIHZvaWQgZmJfY2xlYW51cF9wcm9j
ZnModm9pZCk7DQo+PiArI2Vsc2UNCj4+ICtzdGF0aWMgaW5saW5lIGludCBmYl9pbml0X3By
b2Nmcyh2b2lkKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBmYl9jbGVhbnVwX3Byb2Nmcyh2b2lkKQ0KPj4gK3sgfQ0KPj4gKyNlbmRp
Zg0KPj4gICANCj4+ICAgLyogZmJzeXNmcy5jICovDQo+PiArI2lmIGRlZmluZWQoQ09ORklH
X0ZCX0RFVklDRSkNCj4+ICAgaW50IGZiX2RldmljZV9jcmVhdGUoc3RydWN0IGZiX2luZm8g
KmZiX2luZm8pOw0KPj4gICB2b2lkIGZiX2RldmljZV9kZXN0cm95KHN0cnVjdCBmYl9pbmZv
ICpmYl9pbmZvKTsNCj4+ICsjZWxzZQ0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGZiX2Rldmlj
ZV9jcmVhdGUoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pDQo+PiArew0KPj4gKwlnZXRfZGV2
aWNlKGZiX2luZm8tPmRldmljZSk7IC8vIGFzIGluIGRldmljZV9hZGQoKQ0KPj4gKw0KPj4g
KwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArc3RhdGljIGlubGluZSB2b2lkIGZiX2RldmljZV9k
ZXN0cm95KHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQ0KPj4gK3sNCj4+ICsJcHV0X2Rldmlj
ZShmYl9pbmZvLT5kZXZpY2UpOyAvLyBhcyBpbiBkZXZpY2VfZGVsKCkNCj4+ICt9DQo+PiAr
I2VuZGlmDQo+IEkgZG8gbm90IHNlZSB3aHkgZmJfZGV2aWNlX3tjcmVhdGUsZGVzdHJveX0g
bmVlZHMgdG8gY2FsbA0KPiB7Z2V0LHB1dH1fZGV2aWNlIC0gYW5kIGl0IGlzIG5vdCBleHBs
YWluZWQuDQo+IEEgc2hvcnQgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtYXliZT8NCj4g
DQo+IFdpdGggbXkgY29tbWVudHMgYWRkcmVzc2VkOg0KPiBSZXZpZXdlZC1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gTm90ZTogSSBkbyBub3QgZW5nYWdl
IGluIHRoZSB0aHJlYWQgYWJvdXQgdGhlIGJlc3QgS2NvbmZpZw0KPiBzb2x1dGlvbiAtIEkg
dHJ1c3QgdGhlIGludm9sdmVkIHBlb3BsZSB3aWxsIGZpbmQgYSBnb29kIHNvbHV0aW9uLg0K
PiANCj4gCVNhbQ0KPiANCj4+ICAgDQo+PiAgICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL0tjb25maWcgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAyL29tYXBmYi9LY29uZmlnDQo+PiBpbmRleCA2OWY5Y2IwMzUwN2UuLjIx
MDY5ZmRiN2NjMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIv
b21hcGZiL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21h
cGZiL0tjb25maWcNCj4+IEBAIC01LDkgKzUsOSBAQCBjb25maWcgT01BUDJfVlJGQg0KPj4g
ICBtZW51Y29uZmlnIEZCX09NQVAyDQo+PiAgIAl0cmlzdGF0ZSAiT01BUDIrIGZyYW1lIGJ1
ZmZlciBzdXBwb3J0Ig0KPj4gICAJZGVwZW5kcyBvbiBGQg0KPj4gKwlkZXBlbmRzIG9uIEZC
X0RFVklDRQ0KPj4gICAJZGVwZW5kcyBvbiBEUk1fT01BUCA9IG4NCj4+ICAgCWRlcGVuZHMg
b24gR1BJT0xJQg0KPj4gLQ0KPj4gICAJc2VsZWN0IEZCX09NQVAyX0RTUw0KPj4gICAJc2Vs
ZWN0IE9NQVAyX1ZSRkIgaWYgQVJDSF9PTUFQMiB8fCBBUkNIX09NQVAzDQo+PiAgIAlzZWxl
Y3QgRkJfQ0ZCX0ZJTExSRUNUDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5o
IGIvaW5jbHVkZS9saW51eC9mYi5oDQo+PiBpbmRleCA1NDFhMGUzY2UyMWYuLjQwZWQxMDI4
MTYwYyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPj4gKysrIGIvaW5j
bHVkZS9saW51eC9mYi5oDQo+PiBAQCAtNDgxLDcgKzQ4MSw5IEBAIHN0cnVjdCBmYl9pbmZv
IHsNCj4+ICAgDQo+PiAgIAljb25zdCBzdHJ1Y3QgZmJfb3BzICpmYm9wczsNCj4+ICAgCXN0
cnVjdCBkZXZpY2UgKmRldmljZTsJCS8qIFRoaXMgaXMgdGhlIHBhcmVudCAqLw0KPj4gKyNp
ZiBkZWZpbmVkKENPTkZJR19GQl9ERVZJQ0UpDQo+PiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7
CQkvKiBUaGlzIGlzIHRoaXMgZmIgZGV2aWNlICovDQo+PiArI2VuZGlmDQo+PiAgIAlpbnQg
Y2xhc3NfZmxhZzsgICAgICAgICAgICAgICAgICAgIC8qIHByaXZhdGUgc3lzZnMgZmxhZ3Mg
Ki8NCj4+ICAgI2lmZGVmIENPTkZJR19GQl9USUxFQkxJVFRJTkcNCj4+ICAgCXN0cnVjdCBm
Yl90aWxlX29wcyAqdGlsZW9wczsgICAgLyogVGlsZSBCbGl0dGluZyAqLw0KPj4gLS0gDQo+
PiAyLjQwLjENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------UGua3H0qju2qz0h33EQwfr8V--

--------------rIVxUTv1Vwc0inEcktkUyAp7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSGv5oFAwAAAAAACgkQlh/E3EQov+B6
mg/+LwfLX6yPUTzhxfbJFuG2jy9BFASnl1M5m7FeTopTmezYYhN78U/dS3Gv+XkJ+5Xyw0vomKwz
TG1XmeoRGqJB7cbg2mgI83OWJWevHhUIY5osE1Kwgaj3C6QyunV9KPOUqv+K2s/RU+KOvvUSta10
ydBMkByaDLF2CBDqiLi4jVGQto9AYMVWCqLG7JyzOYhKShsrCzUgiQUfv4z1+sb4Q8dBlOIbCDqm
YSMYMgJc1m+6N/EpZ6qp9x0ZWxYHYWZAefaIrx3cWo0fQzFkwqT8sqIGhU4uWa4w4PB18oChmPzl
G40Nrws1VoO1/SlDRNmNCsJF9vgwZB64vh9ZCZVNFhFMx/26xI2DNydZnnkpRykkpvS3tERAytZ2
hV/W4Q91dULbpLviRNFyUCBikLFPUs59YIbR1X6pHEVwxUGGDsFxuL7M1Vjz+ttaPIdBY2dEpSe7
Wd3nWYcbIsRs5qdzv55MlNTlfC7N28qO3XH5GEexNGAOwdgcqwkskHOsvXmZ2QGxAhzt+T9I3TpQ
OJ8VDUhAZFvI9FQf4r3g9n0XilqTQZZedKUVTNIQ8qAWkEeU/zLa1xxfNGIjnq9a6mkFa/Rgycxi
Kw4FLmtJ87KRru/KH6JItUl+pjMUEIeQZ0DmiTv8RGWLhIM9deGCDxnWy39rWIJLiHm87FVfqt6q
F7Q=
=vy7p
-----END PGP SIGNATURE-----

--------------rIVxUTv1Vwc0inEcktkUyAp7--
