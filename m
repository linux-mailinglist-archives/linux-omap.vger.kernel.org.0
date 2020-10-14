Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3DB28E2F3
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgJNPSs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgJNPSs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:48 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8475CC061755;
        Wed, 14 Oct 2020 08:18:48 -0700 (PDT)
Message-Id: <20201014145215.518912759@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Xqc0nGkuw0k9CjZpwvy2mNqALgS9zNAoil65HHXmBWw=;
        b=Mkhg1oudooc1D7cLXeBlzAj7hV9tOJlOoUSWKfGCxcNRp6Akbl+i/CyTWi32vKAy7lg0HD
        MpTNLo8j0c6EvQX5dPujKOlzMfsWpRC/IAGFbyB7J30kUlouGRQC6UxMvviMD1Xi9LI5Gc
        /tUx+/iW5BkmL6l1c9DqG8PEMBYNYtnNrrLEc6+GyalxeR0rNtSyhrbWYjwHcPC/8G1wnD
        CipGvLyocVhb8dITN9e/hA/hw4WxMuO9L+LWd7F5MTfY497KVJQTe6u+JI+03auxA5jaGZ
        rWjukNONzdglu4DG3L22C67B3madfApoVOnOStsZF9GnCVFuDKsguAAGIFMFYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Xqc0nGkuw0k9CjZpwvy2mNqALgS9zNAoil65HHXmBWw=;
        b=J4cIGbxkYeb16Mx6vnpQGhkkmyjGQDefyDOdSDcFR6lkamlOV2UI4C4rPB+qkrPUWny9bY
        +XT22bHmagnyoqAQ==
Date:   Wed, 14 Oct 2020 16:52:15 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch 00/12] UBS: Cleanup in_interupt/in_irq/in_atomic() usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rm9sa3MsCgppbiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBwcmVlbXB0IGNvdW50IGNvbnNpc3RlbmN5
IGFjY3Jvc3Mga2VybmVsIGNvbmZpZ3VyYXRpb25zOgoKICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjAwOTE0MjA0MjA5LjI1NjI2NjA5M0BsaW51dHJvbml4LmRlLwoKTGludXMgY2xlYXJs
eSByZXF1ZXN0ZWQgdGhhdCBjb2RlIGluIGRyaXZlcnMgYW5kIGxpYnJhcmllcyB3aGljaCBjaGFu
Z2VzCmJlaGF2aW91ciBiYXNlZCBvbiBleGVjdXRpb24gY29udGV4dCBzaG91bGQgZWl0aGVyIGJl
IHNwbGl0IHVwIHNvIHRoYXQKZS5nLiB0YXNrIGNvbnRleHQgaW52b2NhdGlvbnMgYW5kIEJIIGlu
dm9jYXRpb25zIGhhdmUgZGlmZmVyZW50IGludGVyZmFjZXMKb3IgaWYgdGhhdCdzIG5vdCBwb3Nz
aWJsZSB0aGUgY29udGV4dCBpbmZvcm1hdGlvbiBoYXMgdG8gYmUgcHJvdmlkZWQgYnkgdGhlCmNh
bGxlciB3aGljaCBrbm93cyBpbiB3aGljaCBjb250ZXh0IGl0IGlzIGV4ZWN1dGluZy4KClRoaXMg
aW5jbHVkZXMgY29uZGl0aW9uYWwgbG9ja2luZywgYWxsb2NhdGlvbiBtb2RlIChHRlBfKikgZGVj
aXNpb25zIGFuZAphdm9pZGFuY2Ugb2YgY29kZSBwYXRocyB3aGljaCBtaWdodCBzbGVlcC4KCklu
IHRoZSBsb25nIHJ1biwgdXNhZ2Ugb2YgJ3ByZWVtcHRpYmxlLCBpbl8qaXJxIGV0Yy4nIHNob3Vs
ZCBiZSBiYW5uZWQgZnJvbQpkcml2ZXIgY29kZSBjb21wbGV0ZWx5LgoKVGhlIHVzYWdlIG9mIHN1
Y2ggY29uc3RydWN0cyBpbiBVU0IgaXMgcmF0aGVyIGxpbWl0ZWQuIE1vc3Qgb2YgaXQgaXMgaW4K
ZGVidWcgY29kZSBhbmQgKG1pc2xlYWRpbmcpIGNvbW1lbnRzLiBCdXQgb2YgY291cnNlIHRoZXJl
IGFyZSBhbHNvIGEgZmV3CmZldyBidWdzIGluY2x1ZGluZyBvbmUgdW5maXhhYmxlLgoKV2l0aCB0
aGUgZm9sbG93aW5nIHNlcmllcyBhcHBsaWVkLCBVU0IgaXMgY2xlYW4uCgpUaGFua3MsCgoJdGds
eAotLS0KIGF0bS91c2JhdG0uYyAgICAgICAgICAgICB8ICAgIDIgCiBjb3JlL2J1ZmZlci5jICAg
ICAgICAgICAgfCAgICA2ICstCiBjb3JlL2hjZC1wY2kuYyAgICAgICAgICAgfCAgICA2ICstCiBj
b3JlL2hjZC5jICAgICAgICAgICAgICAgfCAgIDIxICsrKystLS0tCiBjb3JlL2h1Yi5jICAgICAg
ICAgICAgICAgfCAgICAzIC0KIGNvcmUvbWVzc2FnZS5jICAgICAgICAgICB8ICAgMzUgKysrKysr
KysrLS0tLS0KIGNvcmUvdXNiLmMgICAgICAgICAgICAgICB8ICAgIDQgLQogZ2FkZ2V0L3VkYy9j
b3JlLmMgICAgICAgIHwgICAgMiAKIGdhZGdldC91ZGMvZHVtbXlfaGNkLmMgICB8ICAgIDUgKy0K
IGdhZGdldC91ZGMvcHhhMjd4X3VkYy5jICB8ICAgMTkgKysrKy0tLQogaG9zdC9laGNpLWZzbC5j
ICAgICAgICAgIHwgICAgOSArLS0KIGhvc3QvZWhjaS1wbWNtc3AuYyAgICAgICB8ICAgMTUgKysr
LS0tCiBob3N0L2lzcDEzNjIuaCAgICAgICAgICAgfCAgICA1ICstCiBob3N0L29oY2ktYXQ5MS5j
ICAgICAgICAgfCAgIDExICsrKy0KIGhvc3Qvb2hjaS1vbWFwLmMgICAgICAgICB8ICAgIDcgKy0K
IGhvc3Qvb2hjaS1weGEyN3guYyAgICAgICB8ICAgMTEgKystLQogaG9zdC9vaGNpLXMzYzI0MTAu
YyAgICAgIHwgICAxMiArKy0tLQogaG9zdC94aGNpLW1lbS5jICAgICAgICAgIHwgICAgMiAKIGhv
c3QveGhjaS5jICAgICAgICAgICAgICB8ICAgIDYgLS0KIG1pc2Mvc2lzdXNidmdhL0tjb25maWcg
ICB8ICAgIDIgCiBzZXJpYWwvZGlnaV9hY2NlbGVwb3J0LmMgfCAgICA3ICstCiBzZXJpYWwva2V5
c3Bhbl9wZGEuYyAgICAgfCAgMTEyICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiB1c2JpcC91c2JpcF9jb21tb24uYyAgICAgfCAgICA1IC0tCiAyMyBmaWxl
cyBjaGFuZ2VkLCAxNTYgaW5zZXJ0aW9ucygrKSwgMTUxIGRlbGV0aW9ucygtKQo=
