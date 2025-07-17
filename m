Return-Path: <linux-omap+bounces-4095-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595DB0908E
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jul 2025 17:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712DE166076
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jul 2025 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34882F8C2B;
	Thu, 17 Jul 2025 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NbBSvXAI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0E2E54B0
	for <linux-omap@vger.kernel.org>; Thu, 17 Jul 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752766094; cv=none; b=n0S73AAXPk/wEvk8LiiDUR8tji4eHMuJKPByz6wwcO1oW7AmEaZ7VvdNCj2ZNcWdq0Eld9mpMAJoIp9m03reYk2SwJvccyl3nE9/0+B94eEjsD24eWIg8JnTzP1azlpkHd90jFPjMN0xVVHIr7FPE78/R+bMZ6sx8uAR9yrO6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752766094; c=relaxed/simple;
	bh=yFZgLXJvIbeULoKkdmIakSizxFoRhpNxchjM/FKvA04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2o6vioP49xfKUI82i5Hnp1uEG1mrTLysu6b4FzKvRTDGUYVVEg/xxd5nbgWa3L7Cp5/6B21Qr8fZthOkRwRSBX33MW7omH6gtCWbaX9Y/zgAo8xy4szDayNeth/Q3q4Lccf4V/AJCQ3zFTRy7oQt37CM7MWn1ssRSXiz/SwiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NbBSvXAI; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202507171528028dab52b3a7710782b9
        for <linux-omap@vger.kernel.org>;
        Thu, 17 Jul 2025 17:28:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qiwCF1Q0/dfbmH/h12rPJd3E/SUaGv51sALD25KqqZk=;
 b=NbBSvXAIUK+yejZE4f901rnzUou0mq+g7t2Qh6rawOr5d+iUhl/Nl3NTUb9yvGzWM3EQzY
 vox1EBk7tVrEZm0Dj6Ios/JxrLPDDIPRUjIjNj4MdfLZ8huMDvFLI3YaH7+pU6ljTR1RsiJK
 T/FX0w+BWBxgQdeaHajv2YC65VJfPkPrI8AQa4ebpwTRMVtxZ4i41ys5ePMdl/2CeqT4fqG4
 +A8A2CjWa8pzbp/abeUJJYs9s+N7yI+DH6bwFtYxov6WdKOR+xXwFDq+fcYM2/dfhO2Fagbf
 g1vNrPNfHSCr9LrzQ91Uz08rbbFKLJ94QFFUdmKtcsKUlWoi47Jc3BuQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-omap@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Michel <matthias.michel@siemens.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)
Date: Thu, 17 Jul 2025 17:27:03 +0200
Message-ID: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

There is an issue possible where TI AM33xx SoCs do not boot properly after
a reset if EMU0/EMU1 pins were used as GPIO and have been driving low level
actively prior to reset [1].

"Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
ICEPick Samples

The state of the EMU[1:0] terminals are latched during reset to determine
ICEPick boot mode. For normal device operation, these terminals must be
pulled up to a valid high logic level ( > VIH min) before ICEPick samples
the state of these terminals, which occurs
[five CLK_M_OSC clock cycles - 10 ns] after the falling edge of WARMRSTn.

Many applications may not require the secondary GPIO function of the
EMU[1:0] terminals. In this case, they would only be connected to pull-up
resistors, which ensures they are always high when ICEPick samples.
However, some applications may need to use these terminals as GPIO where
they could be driven low before reset is asserted. This usage of the
EMU[1:0] terminals may require special attention to ensure the terminals
are allowed to return to a valid high-logic level before ICEPick samples
the state of these terminals.

When any device reset is asserted, the pin mux mode of EMU[1:0] terminals
configured to operate as GPIO (mode 7) will change back to EMU input
(mode 0) on the falling edge of WARMRSTn. This only provides a short period
of time for the terminals to return high if driven low before reset is
asserted...

If the EMU[1:0] terminals are configured to operate as GPIO, the product
should be designed such these terminals can be pulled to a valid high-logic
level within 190 ns after the falling edge of WARMRSTn."

We've noticed this problem with custom am335x hardware in combination with
recently implemented cold reset method
(commit 6521f6a195c70 ("ARM: AM33xx: PRM: Implement REBOOT_COLD")).
It looks like the problem can affect other HW, for instance AM335x
Chiliboard, because the latter has LEDs on GPIO3_7/GPIO3_8 as well.

One option would be to check if the pins are in GPIO mode and either switch
to output active high, or switch to input and poll until the external
pull-ups have brought the pins to the desired high state. But fighting
with GPIO driver for these pins is probably not the most straight forward
approch in a reboot handler.

Fortunately we can easily control pinmuxing here and rely on the external
pull-ups. TI recommends 4k7 external pull up resistors [2] and even with
quite conservative estimation for pin capacity (1 uF should never happen)
the required delay shall not exceed 5ms.

[1] Link: https://www.ti.com/lit/pdf/sprz360
[2] Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/866346/am3352-emu-1-0-questions
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm/mach-omap2/am33xx-restart.c | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/mach-omap2/am33xx-restart.c b/arch/arm/mach-omap2/am33xx-restart.c
index fcf3d557aa786..3cdf223addcc2 100644
--- a/arch/arm/mach-omap2/am33xx-restart.c
+++ b/arch/arm/mach-omap2/am33xx-restart.c
@@ -2,12 +2,46 @@
 /*
  * am33xx-restart.c - Code common to all AM33xx machines.
  */
+#include <dt-bindings/pinctrl/am33xx.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/reboot.h>
 
 #include "common.h"
+#include "control.h"
 #include "prm.h"
 
+/*
+ * Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
+ * ICEPick Samples
+ *
+ * If EMU0/EMU1 pins have been used as GPIO outputs and actively driving low
+ * level, the device might not reboot in normal mode. We are in a bad position
+ * to override GPIO state here, so just switch the pins into EMU input mode
+ * (that's what reset will do anyway) and wait a bit, because the state will be
+ * latched 190 ns after reset.
+ */
+static void am33xx_advisory_1_0_36(void)
+{
+	u32 emu0 = omap_ctrl_readl(AM335X_PIN_EMU0);
+	u32 emu1 = omap_ctrl_readl(AM335X_PIN_EMU1);
+
+	/* If both pins are in EMU mode, nothing to do */
+	if (!(emu0 & 7) && !(emu1 & 7))
+		return;
+
+	/* Switch GPIO3_7/GPIO3_8 into EMU0/EMU1 modes respectively */
+	omap_ctrl_writel(emu0 & ~7, AM335X_PIN_EMU0);
+	omap_ctrl_writel(emu1 & ~7, AM335X_PIN_EMU1);
+
+	/*
+	 * Give pull-ups time to load the pin/PCB trace capacity.
+	 * 5 ms shall be enough to load 1 uF (would be huge capacity for these
+	 * pins) with TI-recommended 4k7 external pull-ups.
+	 */
+	mdelay(5);
+}
+
 /**
  * am33xx_restart - trigger a software restart of the SoC
  * @mode: the "reboot mode", see arch/arm/kernel/{setup,process}.c
@@ -18,6 +52,8 @@
  */
 void am33xx_restart(enum reboot_mode mode, const char *cmd)
 {
+	am33xx_advisory_1_0_36();
+
 	/* TODO: Handle cmd if necessary */
 	prm_reboot_mode = mode;
 
-- 
2.50.1


