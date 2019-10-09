Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF5CED0A58
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 10:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfJII45 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 04:56:57 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:48851 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJII45 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 04:56:57 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iI7m4-0008Cl-9s; Wed, 09 Oct 2019 09:56:48 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iI7m3-0005fe-Pt; Wed, 09 Oct 2019 09:56:47 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 1/2] ARM: OMAP2+: make dra7xx_sha0_hwmod static
Date:   Wed,  9 Oct 2019 09:56:45 +0100
Message-Id: <20191009085646.21755-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dra7xx_sha0_hwmod object is not exported outside of
omap_hwmod_7xx_data. so make it static to avoid the
following warning:

arch/arm/mach-omap2/omap_hwmod_7xx_data.c:686:19: warning: symbol 'dra7xx_sha0_hwmod' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
index e5bd549d2a5e..bd392d59382b 100644
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -683,7 +683,7 @@ static struct omap_hwmod_class dra7xx_sha0_hwmod_class = {
 	.sysc		= &dra7xx_sha0_sysc,
 };
 
-struct omap_hwmod dra7xx_sha0_hwmod = {
+static struct omap_hwmod dra7xx_sha0_hwmod = {
 	.name		= "sham",
 	.class		= &dra7xx_sha0_hwmod_class,
 	.clkdm_name	= "l4sec_clkdm",
-- 
2.23.0

