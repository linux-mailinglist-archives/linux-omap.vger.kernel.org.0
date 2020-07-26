Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45F622DAC5
	for <lists+linux-omap@lfdr.de>; Sun, 26 Jul 2020 02:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgGZAWU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Jul 2020 20:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGZAWU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 25 Jul 2020 20:22:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566CCC08C5C0;
        Sat, 25 Jul 2020 17:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nRp9lGozDtFJ2GX7cffYwMAfqWdngVN7WpgR+Q/vvi8=; b=gTtWMlc98ZBimwqC1QQuPTMe2T
        saZmCKP5v4soB+4BwS6Jdtf6FM/QRo2Cbt7nPeVdInEX+TmL1IzBOujDeuI7yXIMKDCAZP3AATOCd
        gEW7eNuUyXF5j5OW4esDNvv8fVAD6x1kXXBCJ9LGHs3aNglywOn4FlTElRF51xhiD6go785uDDnfx
        52Jhb6cP213MPCk7+xq9qnOvo2JHz69hCCFkpfDXMiry/b3mr1y34+18VrRyaa+57+kIHEEGU4Ddi
        ntwJGM8EbqJxR2ELrBFNlotjM7Vp802JxhVKDjiYKW6dvlQKWkmX+yaFMX46cTZdrzFC0Lm6fNOWM
        eBXTwK1Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jzUQh-0002YX-Jh; Sun, 26 Jul 2020 00:22:16 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH] arm: mach-omap1: mux.h: delete duplicate word
Date:   Sat, 25 Jul 2020 17:22:12 -0700
Message-Id: <20200726002212.19896-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop the repeated word "is".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
---
 arch/arm/mach-omap1/include/mach/mux.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/arm/mach-omap1/include/mach/mux.h
+++ linux-next-20200720/arch/arm/mach-omap1/include/mach/mux.h
@@ -88,7 +88,7 @@
  * OMAP730/850 has a slightly different config for the pin mux.
  * - config regs are the OMAP7XX_IO_CONF_x regs (see omap7xx.h) regs and
  *   not the FUNC_MUX_CTRL_x regs from hardware.h
- * - for pull-up/down, only has one enable bit which is is in the same register
+ * - for pull-up/down, only has one enable bit which is in the same register
  *   as mux config
  */
 #define MUX_CFG_7XX(desc, mux_reg, mode_offset, mode,	\
