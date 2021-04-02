Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EDC352FBC
	for <lists+linux-omap@lfdr.de>; Fri,  2 Apr 2021 21:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbhDBT1d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Apr 2021 15:27:33 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:58457 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236540AbhDBT1c (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 2 Apr 2021 15:27:32 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id SPS2lt01JtpGHSPS6l2Gm5; Fri, 02 Apr 2021 21:27:30 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617391650; bh=grgL9Q3sGgmvPCTIgfN2e1WV0FqyEFUkPw1kyuvyjF4=;
        h=From;
        b=O501lndXdlvNNIKljJKIInkfMTpkDAuiHdRjJhiS4o04qCMm9DP3dC/c0KCD5O4s0
         AojE0wkkq+viWAXxhw6LYze23S5MogN7g5QeTDbhP7NVfhkF8BdlWoXWUsOUpZDaul
         xPG5kwbh84SmRz9JCMrPQa5b+MVq4oy0idvgC91dFT7eCgMuVaQNzfC3NOXnoitqJK
         K7LMj/6pZwXVzLLjK2MorMBPHKtK7Li+L+pZgbJ7I94eMsbPrILEAKr0tXdS8G+Pxp
         84deQu5pi6TeC0FSyOeQaVyRlkyLNV1U/vgKrUtG659hiy6rq3NEgG44dN6QP6D2g2
         9ZUDeVx3Jw6Jw==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60677022 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=E4scLkpOueEFzuNnOYYA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: remove omap2_set_globals_control()
Date:   Fri,  2 Apr 2021 21:27:20 +0200
Message-Id: <20210402192720.9487-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfPdwWTgt9achL+oyckcuJPiqYMERnZwnjydcfAahTZdXnDjqr8pjgUJ4Pmhl9/1IsI7VYCS7lcI++Xff2bx0BSKezdWuCjx2kujAuaLKR0cVAZtu5eZI
 JLwUTqh0ppEjcEDzB3RaBxczd6bphSr4cnIdj4+GNRwQqEBl1bzorzjrXhJ18aMZyORlIsS34mVro2Bf4MLvtalDTOdZ/QVhfntKj20l6UD/05FUZPwOJ60w
 8bXicVA3Qm2nUPx0sckh2EHVeZZeRgRyG/fswhOCkT9Wzt90givqwN0TayuPEUp06GrNatNn1nZZvFwRndzLDoRvQWP4pvp9xTkplt+ehFZRU1177xWmbUO4
 OhZBed8clmBbqUHnUMhvQwk2xNp4casRfhFN3YUna0HrKUozKgWUsBrFFd2zyLPei/V8MPFH
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The function is no longer used, so let's remove it.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 arch/arm/mach-omap2/control.c | 5 -----
 arch/arm/mach-omap2/control.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index 73338cf80d76..062d431fc33a 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -136,11 +136,6 @@ struct omap3_control_regs {
 static struct omap3_control_regs control_context;
 #endif /* CONFIG_ARCH_OMAP3 && CONFIG_PM */
 
-void __init omap2_set_globals_control(void __iomem *ctrl)
-{
-	omap2_ctrl_base = ctrl;
-}
-
 u8 omap_ctrl_readb(u16 offset)
 {
 	u32 val;
diff --git a/arch/arm/mach-omap2/control.h b/arch/arm/mach-omap2/control.h
index eceb4b09adb2..c4ca30ba1790 100644
--- a/arch/arm/mach-omap2/control.h
+++ b/arch/arm/mach-omap2/control.h
@@ -528,7 +528,6 @@ extern int omap3_ctrl_save_padconf(void);
 void omap3_ctrl_init(void);
 int omap2_control_base_init(void);
 int omap_control_init(void);
-void omap2_set_globals_control(void __iomem *ctrl);
 void __init omap3_control_legacy_iomap_init(void);
 #else
 #define omap_ctrl_readb(x)		0
-- 
2.17.1

