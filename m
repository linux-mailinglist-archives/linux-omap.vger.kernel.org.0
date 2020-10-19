Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55EF292555
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgJSKSF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgJSKSD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:03 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70306C0613CE;
        Mon, 19 Oct 2020 03:18:03 -0700 (PDT)
Message-Id: <20201019100629.419020859@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Nyd4isVe6/GlM1d8iTI7s5tTrdG55U0GZrO0TXajZMY=;
        b=prsk2GrqguL50vaRVvTirHV4Z4d/yPRByAva/n4GAOW3dudDcCf4OrBJiJbEsZ9LusQZmm
        144HDNgi/TNWLnZw47pxOf7qQCQGMl2Ils0Ud6jMjvPKFiiZs1rQMU0IDwcMp/5hpHIC8k
        wRnttnpe0Qe3GFhtxaBoXwQZPxvv5gI1GEsh/TiIcYky/azodFH5q11LomuQevbOxM87DJ
        tfNI/qvQijt6vHGnQ6El8iPvjc0qFHKS08Tq2PFaiP8b2pXAIpOcflpvP474wq4Ier+AFs
        V1yFKpeVCg/t64w+ThJHVptS8TAAyOsj1F3p03D6RE4bPb86Wsggn1U+cvUyRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Nyd4isVe6/GlM1d8iTI7s5tTrdG55U0GZrO0TXajZMY=;
        b=KOQvTapeQAwwd6S4dECHvrg4lU4tGebpNrPm2NEKwpUfQV9ga2UJj6PCcTWSU+ldfo/FJ+
        NmpvpBTJ8s1tz0CQ==
Date:   Mon, 19 Oct 2020 12:06:29 +0200
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
Subject: [patch V2 00/13] USB: Cleanup in_interupt/in_irq/in_atomic() usage
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
IGFyZSBhbHNvIGEgZmV3CmZldyBidWdzIGluY2x1ZGluZyBvbmUgdW5maXhhYmxlLgoKVGhhdCdz
IGFuIHVwZGF0ZSB0byBWMSBvZiB0aGlzIHNlcmllcyB3aGljaCBjYW4gYmUgZm91bmQgaGVyZToK
CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMTAxNDE0NTIxNS41MTg5MTI3NTlAbGlu
dXRyb25peC5kZQoKQ2hhbmdlcyB2cy4gVjE6CgogLSBGaXggdGhlIGtleXNwYW5fcGRhIHF1ZXJ5
IGJ1ZmZlciBwcm9wZXJseQoKIC0gU2VwZXJhdGUgdGhlIHN0YXRpYyBjaGFuZ2UgZnJvbSB0aGUg
Y29tbWVudHMgY2hhbmdlcwoKIC0gQWRkcmVzcyByZXZpZXcgZmVlZGJhY2sgdnMuIGNvbW1lbnRz
CgogLSBGaXggdGhlIHR5cG8gaW4gaXNwMTM2MgoKIC0gQ29sbGVjdGVkIGFja3MvcmV2aWV3ZWQt
YnkgdGFncwoKVGhhbmtzLAoKCXRnbHgKCg==
