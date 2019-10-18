Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED2DD3EB
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2019 00:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbfJRWV1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 18:21:27 -0400
Received: from muru.com ([72.249.23.125]:38192 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404730AbfJRWV1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 18:21:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1002D8168;
        Fri, 18 Oct 2019 22:22:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/2] ARM: OMAP2+: Configure voltage controller for retention
Date:   Fri, 18 Oct 2019 15:21:06 -0700
Message-Id: <20191018222107.32917-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018222107.32917-1-tony@atomide.com>
References: <20191018222107.32917-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Similar to existing omap3_vc_set_pmic_signaling(), let's add omap4
specific omap4_vc_set_pmic_signaling(). This allows the configured
devices to enable voltage controller for retention later on during
init.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/vc.c | 32 +++++++++++++++++++++++++++++---
 arch/arm/mach-omap2/vc.h |  2 +-
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/vc.c b/arch/arm/mach-omap2/vc.c
--- a/arch/arm/mach-omap2/vc.c
+++ b/arch/arm/mach-omap2/vc.c
@@ -36,15 +36,21 @@
 #define OMAP4430_AUTO_CTRL_VDD_CORE(x)		((x) << 0)
 #define OMAP4430_AUTO_CTRL_VDD_RET		2
 
-#define OMAP4_VDD_DEFAULT_VAL	\
+#define OMAP4430_VDD_I2C_DISABLE_MASK	\
 	(OMAP4430_VDD_IVA_I2C_DISABLE | \
-	 OMAP4430_VDD_MPU_I2C_DISABLE |	 \
-	 OMAP4430_VDD_CORE_I2C_DISABLE | \
+	 OMAP4430_VDD_MPU_I2C_DISABLE | \
+	 OMAP4430_VDD_CORE_I2C_DISABLE)
+
+#define OMAP4_VDD_DEFAULT_VAL	\
+	(OMAP4430_VDD_I2C_DISABLE_MASK | \
 	 OMAP4430_VDD_IVA_PRESENCE | OMAP4430_VDD_MPU_PRESENCE | \
 	 OMAP4430_AUTO_CTRL_VDD_IVA(OMAP4430_AUTO_CTRL_VDD_RET) | \
 	 OMAP4430_AUTO_CTRL_VDD_MPU(OMAP4430_AUTO_CTRL_VDD_RET) | \
 	 OMAP4430_AUTO_CTRL_VDD_CORE(OMAP4430_AUTO_CTRL_VDD_RET))
 
+#define OMAP4_VDD_RET_VAL	\
+	(OMAP4_VDD_DEFAULT_VAL & ~OMAP4430_VDD_I2C_DISABLE_MASK)
+
 /**
  * struct omap_vc_channel_cfg - describe the cfg_channel bitfield
  * @sa: bit for slave address
@@ -299,6 +305,26 @@ void omap3_vc_set_pmic_signaling(int core_next_state)
 	}
 }
 
+void omap4_vc_set_pmic_signaling(int core_next_state)
+{
+	struct voltagedomain *vd = vc.vd;
+	u32 val;
+
+	if (!vd)
+		return;
+
+	switch (core_next_state) {
+	case PWRDM_POWER_RET:
+		val = OMAP4_VDD_RET_VAL;
+		break;
+	default:
+		val = OMAP4_VDD_DEFAULT_VAL;
+		break;
+	}
+
+	vd->write(val, OMAP4_PRM_VOLTCTRL_OFFSET);
+}
+
 /*
  * Configure signal polarity for sys_clkreq and sys_off_mode pins
  * as the default values are wrong and can cause the system to hang
diff --git a/arch/arm/mach-omap2/vc.h b/arch/arm/mach-omap2/vc.h
--- a/arch/arm/mach-omap2/vc.h
+++ b/arch/arm/mach-omap2/vc.h
@@ -117,7 +117,7 @@ extern struct omap_vc_param omap4_iva_vc_data;
 extern struct omap_vc_param omap4_core_vc_data;
 
 void omap3_vc_set_pmic_signaling(int core_next_state);
-
+void omap4_vc_set_pmic_signaling(int core_next_state);
 
 void omap_vc_init_channel(struct voltagedomain *voltdm);
 int omap_vc_pre_scale(struct voltagedomain *voltdm,
-- 
2.23.0
