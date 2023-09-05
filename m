Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EBE792451
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjIEP6q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354608AbjIEMxc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:53:32 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A1E1A8
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918224; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KUiZ4pyLlKlYGOmsIigyoD4Vj4ju5SZNboHlUfLZnoCnF1AI6CUpVgyJBHXzJtB2z3
    +fdsdRgPzQ0pDKvEjxp0CyU5RIlXe7R98onfTzkoIFxNsV5TK+tERUCUAgOu+dj80bwK
    5V2kh61vsZdrQdaksqYmtu50cCX23Jap0J1tm3BakcygyPDqY/DNLZmgUsuBRe8Iwdtq
    s3kogu2jn0JDriRr4UVSCQo/60svSdPQGxoNYttyfYQZ428P06X1J6bFCEjM41A091tO
    CqsOQmLCjWG7gCJPCpOEHR16N8jYOPBWglGw07WQJpTv8eT9VB/LxT8o2cAOs522LHjV
    Q+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l3kjPAZ5P6l1MwudssTJGXLTul4+f0c8rYaBiPGnmVw=;
    b=LtNaeHYrW6hloKuljLHAFI+HVnkpJ7Pd7B+Zkrv/CIjHaGXTtI5jD35SpXgv9cCGoo
    7T4Fporv+6nCIAG/B9f9Py2EcYReqUR5fxeDglH7MTxXmEFEwh7U+dDzFmHnuIPUJer3
    8UEbUrt18XCO2GgoJf6+EStabWwsgOwBakXdqnO7kY6bi7P8suVk9A6SafFQ24wxVFAQ
    C5QnWNZZyvjYE8Ua9Cnk37tpUuXR3ZPDRd7O8GapEBwDpLOl8AijXGDk/kqoKU5H9kch
    PfTUw3Gfa3t+GgGvOPGpBPRKyKz/L/77Nn9BYnvvtmlrYCPi+8/+1pmrvn4TS4D/g7iA
    af9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l3kjPAZ5P6l1MwudssTJGXLTul4+f0c8rYaBiPGnmVw=;
    b=TeAo061lYnbhYd9naNYdiiJMRCErabPC+uW9+cl8UcMVs8/u3kSPjoGgcuG1ST+Bad
    nUYTdCzdc0wsJ+W0HbZEihXtQGiShzNCkYE11WYTlzTOPjAcHYbl0D2XtVdqXuDCgGjo
    Kh92y342cenxpS9BuaST0OtXAsGPgJgosGExyMWiA3KhsrLV1NPXB7fdtxpvfxgbnJLx
    4bLpvXcv56DYGMiQY3VOFgauPs0z112KKYNqYWVitBULmMNhKUnFpDapfSkl3q9Q4naE
    DcSJjOPIOlroedjYRRUy2KQysTqCl4Lb3HDls9wP6WKVDvSl/QSjuu/013BGPdiFNDZl
    wu4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l3kjPAZ5P6l1MwudssTJGXLTul4+f0c8rYaBiPGnmVw=;
    b=QbyblbcPzeTwqnlgKYawpwdtRpLNrpJgNzWHvXTrlOV417nosF8VrSDs9/5I9l+/EX
    l8WuVeU0Uu623wCqK7Bg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoOLbI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:50:24 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        Marek Belisko <marek.belisko@open-nandra.com>
Subject: [RFC 3/6] ARM: DTS: omap5-board-common: enable aess, add phandles for aess and mcbsp1/2/3
Date:   Tue,  5 Sep 2023 14:50:12 +0200
Message-ID: <66796061c358802835cdebfa3cc33df27b20120d.1693918214.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1693918214.git.hns@goldelico.com>
References: <cover.1693918214.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Marek Belisko <marek.belisko@open-nandra.com>

and extend audio-routing.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
index 6f46f1ecf1e57..49ced2f4096fb 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
@@ -123,22 +123,37 @@ sound: sound {
 		ti,mclk-freq = <19200000>;
 
 		ti,mcpdm = <&mcpdm>;
+		ti,mcbsp1 = <&mcbsp1>;	/* bluetooth */
+		ti,mcbsp2 = <&mcbsp2>;	/* fm radio */
+		ti,mcbsp3 = <&mcbsp3>;	/* modem */
 
 		ti,twl6040 = <&twl6040>;
+		ti,aess = <&aess>;
 
 		/* Audio routing */
 		ti,audio-routing =
 			"Headset Stereophone", "HSOL",
 			"Headset Stereophone", "HSOR",
+			"Earphone Spk", "EP",
 			"Line Out", "AUXL",
 			"Line Out", "AUXR",
+			"Vibrator", "VIBRAL",
+			"Vibrator", "VIBRAR",
 			"HSMIC", "Headset Mic",
 			"Headset Mic", "Headset Mic Bias",
+			"MAINMIC", "Main Handset Mic",
+			"Main Handset Mic", "Main Mic Bias",
+			"SUBMIC", "Sub Handset Mic",
+			"Sub Handset Mic", "Main Mic Bias",
 			"AFML", "Line In",
 			"AFMR", "Line In";
 	};
 };
 
+&aess {
+	status = "okay";
+};
+
 &gpio8 {
 	/* TI trees use GPIO instead of msecure, see also muxing */
 	msecure-hog {
-- 
2.42.0

