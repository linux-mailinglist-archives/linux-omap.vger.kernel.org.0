Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD88214AB6
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 08:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgGEGw1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 02:52:27 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:12443 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgGEGw1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 02:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593931942;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Pt8uxHSZp3GMQNP+Tt97eSbk4cOtbkyFuCOIZlDEkgA=;
        b=HGfQdI0kkfrVQqrlQVRdCEKXOsc7gt6PUv2YQdrEAA5hnVtOwz9agKC3gSodHFCA+O
        AhTeRZAYJOkiZSGIpcxmU0fBzT2jVkOrfPNw0+s9JHwUndh5+HWdmxPNs/44CMSJCgQb
        OKiv29HPMCiaIaBvD8wpLXb6AAcffQoAcmgec7PPA1KK7IgnnVmrQDIsb9Mb8V2ve6Ef
        Chzhha7BAwUZQv6EERAQQGetW1oU4Q31+Ya50vL8vIQ2dkPDIb3esLWSQ3GUB2Xt5LFY
        BRFrXqsSNcK7MLrKtLp7Mx/YXrPayzfEcLR8HqBR9y8cIggvOTaER7wUxDZuoKKtustI
        AzlQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrqwDCpBMA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w656qHlt1
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 5 Jul 2020 08:52:17 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: OMAP5: inconsistency between target-module and dsi_of_data_omap5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Sun, 5 Jul 2020 08:52:16 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,
since v5.7-rc1 our Pyra (OMAP5) dsi panel doesn't initialize and we do not
get a /dev/fb0.

There is a suspicious log message:

[   15.352314] DSI: omapdss DSI error: unsupported DSI module

I could trace it down to be likely a discrepancy between

target-module@58000000 { 

...

				target-module@5000 {
					compatible = "ti,sysc-omap2", "ti,sysc";
					reg = <0x5000 0x4>,
...
					ranges = <0 0x5000 0x1000>;

					dsi1: encoder@0 {
						compatible = "ti,omap5-dsi";

				target-module@9000 {
					compatible = "ti,sysc-omap2", "ti,sysc";
					reg = <0x9000 0x4>,
					      <0x9010 0x4>,
					      <0x9014 0x4>;

...

					ranges = <0 0x9000 0x1000>;

					dsi2: encoder@0 {
						compatible = "ti,omap5-dsi";
						reg = <0 0x200>,
						      <0x200 0x40>,
						      <0x300 0x40>;



and

static const struct dsi_of_data dsi_of_data_omap5 = {
	.model = DSI_MODEL_OMAP5,
	.pll_hw = &dss_omap5_dsi_pll_hw,
	.modules = (const struct dsi_module_id_data[]) {
		{ .address = 0x58004000, .id = 0, },
		{ .address = 0x58009000, .id = 1, },
		{ },
	},

Therefore the address match logic in dsi_probe() fails and ends in
the mentioned log message.

Looking at git blame, the DTS was recently changed by 5a507162f096b54.
Commit 98e1a6a86a22d62 did do a similar change for dsi2 but did not
modify the address.

So I wonder if the 0x5000 is just a typo or if there is something
where the dsi1: encoder@0 should have a negative offset to end
up at address 0x58004000?

BR and thanks,
Nikolaus

