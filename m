Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1DD12B867
	for <lists+linux-omap@lfdr.de>; Fri, 27 Dec 2019 18:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfL0Rzc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Dec 2019 12:55:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:38988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727797AbfL0RmP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Dec 2019 12:42:15 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C8D2222C2;
        Fri, 27 Dec 2019 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468535;
        bh=QOJ/HmWlN3DYN2V57jaXJYrIYWXf794kujwxayZsLBw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JxoEvSyG7M7z4RAg7yVy67aiArDTFUORHRUdFA/NiS1jwed9DiQCgS4JvyR16Blt4
         YLFm6BSjrBF4Z8m71roglSl26HGS3y5cYIxhXWfPy7U2HnWKwSEqA54ABa06QtrbGR
         uzjj2toxs7jMn+184KGcBHS6i0n9+wb+l2tV4vLI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 065/187] ARM: omap2plus_defconfig: Add back DEBUG_FS
Date:   Fri, 27 Dec 2019 12:38:53 -0500
Message-Id: <20191227174055.4923-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit e00b59d30506dc9ef91caf2f3c584209cc9f61e4 ]

Commit 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
removed select for DEBUG_FS but we still need it at least for enabling
deeper idle states for the SoCs.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 40d7f1a4fc45..4ec69fb8a698 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -552,5 +552,6 @@ CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_SPLIT=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-- 
2.20.1

