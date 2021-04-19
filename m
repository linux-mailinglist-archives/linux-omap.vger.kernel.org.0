Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957E6364C16
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 22:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243133AbhDSUsc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 16:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242616AbhDSUqb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Apr 2021 16:46:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58440613D1;
        Mon, 19 Apr 2021 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618865124;
        bh=g/eXUpVLDWn4ZrQfKGHLQWDA56ui5qqB1PXgWsHwueE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gkn4jB7wXcRJi3TcF4fxZtZ/AHFTEEXlH5WGHDtwcqDfC3Dyxo917ZDlqR4vXsCHZ
         9x+8Ex05z5RMA3Gxg1oczNjb/v80HvuK47QSgMT5IgqGJY6CwdHh0TQdvCZdXCvS/z
         ZKK8rbpS0lNN1C86iDqp7IrtoOaGfTfU5BxZvbxwgJJrCoxUlGvRTP+LGKnFd1AsWW
         IRjzLLogE/VQPtXbI38kXgd4CTD2Y8LYTbvnUnD83P9KpLwmxyw6Ba0K5WFrL850Vu
         NZ5kEuoZlB6wGY+LCVdOnR5tOmqNoYPu5Gs5VR9Od22bLZbmo9VYPtlOED/JIpbckZ
         LF2vvPFOFCpsg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 04/12] ARM: dts: Fix swapped mmc order for omap3
Date:   Mon, 19 Apr 2021 16:45:09 -0400
Message-Id: <20210419204517.6770-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204517.6770-1-sashal@kernel.org>
References: <20210419204517.6770-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit a1ebdb3741993f853865d1bd8f77881916ad53a7 ]

Also some omap3 devices like n900 seem to have eMMC and micro-sd swapped
around with commit 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for
drivers that existed in v4.4").

Let's fix the issue with aliases as discussed on the mailing lists. While
the mmc aliases should be board specific, let's first fix the issue with
minimal changes.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/omap3.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 4043ecb38016..0c8fcfb292bf 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -23,6 +23,9 @@ aliases {
 		i2c0 = &i2c1;
 		i2c1 = &i2c2;
 		i2c2 = &i2c3;
+		mmc0 = &mmc1;
+		mmc1 = &mmc2;
+		mmc2 = &mmc3;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
-- 
2.30.2

