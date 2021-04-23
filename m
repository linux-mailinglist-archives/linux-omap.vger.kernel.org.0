Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1053692CB
	for <lists+linux-omap@lfdr.de>; Fri, 23 Apr 2021 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhDWNM7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Apr 2021 09:12:59 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21124 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbhDWNM7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Apr 2021 09:12:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619182625; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=fpPMKRjvPa2lAB4SKRQeTIvSS0lsai49ZBOrXXnQyEZAEWpFrFLeUr8148DFZSYfw0wGn+keCl7gIBLg60/8laP3k5Vx/ttf+0/5+XJtUZaY4TYrM8XGG/dIICpWY97RjbJgfXC+TM4rlzOqG4kxKvZktns+sbwrPvHK9d7Ssms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1619182625; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=+sCYwSXZCsQOUxoE4AISnejAKPvjss0GviDBbKJ1xQA=; 
        b=KHlxBadPXJFOTRdrgen1f6Hq7j1p2tLV3zkjXLFWMuYW83Tk3P03YMdSovLGehVL2OYPufF4QrCCdFk091o6zK/IRgdxRntZCIu6LympezO47bTq5asZIfQZxKzPb8BvbwG0EPwvJWI5w6odFwazsUy1ATiuqLDFGN3H4Uj0l7w=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-95-222-215-151.hsi15.unitymediagroup.de [95.222.215.151]) by mx.zoho.eu
        with SMTPS id 1619182623125444.55445572925476; Fri, 23 Apr 2021 14:57:03 +0200 (CEST)
Date:   Fri, 23 Apr 2021 14:57:02 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 2/2] power: supply: cpcap-battery: kconfig: depend on (
 NVMEM || !NVMEM )
Message-Id: <20210423145702.e31dd7be8843d97195f98bd3@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 006b95eca673..0775a8cda265 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -110,7 +110,7 @@ config BATTERY_ACT8945A
 
 config BATTERY_CPCAP
 	tristate "Motorola CPCAP PMIC battery driver"
-	depends on MFD_CPCAP && IIO
+	depends on ( MFD_CPCAP && IIO ) && ( NVMEM || !NVMEM )
 	default MFD_CPCAP
 	help
 	  Say Y here to enable support for battery on Motorola
-- 
2.31.0


