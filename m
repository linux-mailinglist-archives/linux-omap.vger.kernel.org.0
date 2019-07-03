Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C17E5DC02
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2019 04:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbfGCCUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jul 2019 22:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727642AbfGCCSw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 2 Jul 2019 22:18:52 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D7D72187F;
        Wed,  3 Jul 2019 02:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562120331;
        bh=eUj0ZVGO8PKILQTJEtxf6raT4rDm6uUSVkzKyoS5pJs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qbafI6Xh7s3GDlUJ2+iXJfGGyf3QQogham9sd/ruSceNYEuNu1PUe6eIdYMkXMkUw
         wpFt3z+RdvpzC5LPHIM81ySXi/+8JsXK5MA2QPsauEfjqZ8LdoFP82MpDSvMup+6Dt
         iO212Inqi1toAIip81pdY1STPVo9yy5HfJ0JpioA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 4.9 2/8] ARM: omap2: remove incorrect __init annotation
Date:   Tue,  2 Jul 2019 22:18:41 -0400
Message-Id: <20190703021847.18542-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703021847.18542-1-sashal@kernel.org>
References: <20190703021847.18542-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 27e23d8975270df6999f8b5b3156fc0c04927451 ]

omap3xxx_prm_enable_io_wakeup() is marked __init, but its caller is not, so
we get a warning with clang-8:

WARNING: vmlinux.o(.text+0x343c8): Section mismatch in reference from the function omap3xxx_prm_late_init() to the function .init.text:omap3xxx_prm_enable_io_wakeup()
The function omap3xxx_prm_late_init() references
the function __init omap3xxx_prm_enable_io_wakeup().
This is often because omap3xxx_prm_late_init lacks a __init
annotation or the annotation of omap3xxx_prm_enable_io_wakeup is wrong.

When building with gcc, omap3xxx_prm_enable_io_wakeup() is always
inlined, so we never noticed in the past.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/prm3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/prm3xxx.c b/arch/arm/mach-omap2/prm3xxx.c
index 718981bb80cd..0aec48c1736b 100644
--- a/arch/arm/mach-omap2/prm3xxx.c
+++ b/arch/arm/mach-omap2/prm3xxx.c
@@ -433,7 +433,7 @@ static void omap3_prm_reconfigure_io_chain(void)
  * registers, and omap3xxx_prm_reconfigure_io_chain() must be called.
  * No return value.
  */
-static void __init omap3xxx_prm_enable_io_wakeup(void)
+static void omap3xxx_prm_enable_io_wakeup(void)
 {
 	if (prm_features & PRM_HAS_IO_WAKEUP)
 		omap2_prm_set_mod_reg_bits(OMAP3430_EN_IO_MASK, WKUP_MOD,
-- 
2.20.1

