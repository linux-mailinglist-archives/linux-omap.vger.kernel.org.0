Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5468DD0A59
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 10:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfJII45 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 04:56:57 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:48850 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfJII45 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 04:56:57 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iI7m5-0008Cm-1p; Wed, 09 Oct 2019 09:56:49 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iI7m4-0005fh-8R; Wed, 09 Oct 2019 09:56:48 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 2/2] ARM: OMAP2+: make omap44xx_sha0_hwmod and omap44xx_l3_main_2__des static
Date:   Wed,  9 Oct 2019 09:56:46 +0100
Message-Id: <20191009085646.21755-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009085646.21755-1-ben.dooks@codethink.co.uk>
References: <20191009085646.21755-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omap44xx_sha0_hwmod and omap44xx_l3_main_2__des objects are
not exported so make them static to avoid the following warnings:

arch/arm/mach-omap2/omap_hwmod_44xx_data.c:793:19: warning: symbol 'omap44xx_sha0_hwmod' was not declared. Should it be static?
arch/arm/mach-omap2/omap_hwmod_44xx_data.c:977:26: warning: symbol 'omap44xx_l3_main_2__des' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
index 28ea2960a9b2..a11cd6f57d7c 100644
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -790,7 +790,7 @@ static struct omap_hwmod_class omap44xx_sha0_hwmod_class = {
 	.sysc		= &omap44xx_sha0_sysc,
 };
 
-struct omap_hwmod omap44xx_sha0_hwmod = {
+static struct omap_hwmod omap44xx_sha0_hwmod = {
 	.name		= "sham",
 	.class		= &omap44xx_sha0_hwmod_class,
 	.clkdm_name	= "l4_secure_clkdm",
@@ -974,7 +974,7 @@ static struct omap_hwmod omap44xx_des_hwmod = {
 	},
 };
 
-struct omap_hwmod_ocp_if omap44xx_l3_main_2__des = {
+static struct omap_hwmod_ocp_if omap44xx_l3_main_2__des = {
 	.master		= &omap44xx_l3_main_2_hwmod,
 	.slave		= &omap44xx_des_hwmod,
 	.clk		= "l3_div_ck",
-- 
2.23.0

