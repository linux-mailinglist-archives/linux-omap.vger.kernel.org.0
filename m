Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCBBE7D2D5
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 03:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfHAB2k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 21:28:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34168 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfHAB2k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 21:28:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id k10so68644051qtq.1
        for <linux-omap@vger.kernel.org>; Wed, 31 Jul 2019 18:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vkqM9EeVWWbKA5vw3EmFiWRlvOGZd/rCtzh5bKIOEKs=;
        b=TtXwCp1OmcqGOrZ/c5whDtNcVaG6swgTRzPBUJuiRzCXTtzSxUzHusXVvfOz7SDDZS
         E4eatwtbNzvNIF6WOkkZR99pEImwQMK0X/g/SrkKym0S8XrOtXBjzDtKEDaO4f41BALw
         61PBSxKwwb5YEqNhcuN2/oyXLNixhjavktSfy6uyCY6KwoyBbVdqIt5G/9hmY/hwZCqb
         VltYx6kvHnnQgloIBw3Ult42PYspiiw30JRcXagTL6Nh+023bw2ZNWkxUDji7N8SLsTF
         wMr7AtEcnKZhCuYSzZkufDGhvCvpRCN9bhY5ZUIoWmCdhCJY8ya9CSfHB+RAk7enEVu4
         0Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vkqM9EeVWWbKA5vw3EmFiWRlvOGZd/rCtzh5bKIOEKs=;
        b=ktYa/28TCcU3e8jRxr+5NhUTNjUklV+mEtArP/XTu8ySln1Rc7iRtpKGsj4Oq6bvQ4
         X9R60aLTXeLfoJNSkqNoJxWl4y9eLWIDUYN3v8UtF49Dg/h8poNqLo3t0SFpzJh865uY
         j/Zbu/1+tkgr9G+UbXHiky/PXkP69HQ/MnX68uVGDFu1vbRlqjQviyt+uc7KP6lwElqO
         z6SqkThWHj7yu0nqn5hZ6SWm74qrS5lqBrfzkqNJf6Eio7ilwJZSx+A45vmPW7KxRvSl
         yQMwO093MFHCxiYFrgxU74hitJ7m3h9tTihvLb6WvSLD52AWmRnXkU1/ySBdCQv/nFJT
         DrRg==
X-Gm-Message-State: APjAAAWqI3BUJ717ZmIjVh5W+YW+sPx5jpHIm8U1S3O7Mr6E3WyKFDpn
        KcdHmd/2RlJY/7dSWmAZn0ITV9UkIlkSIA==
X-Google-Smtp-Source: APXvYqzrdYFVajCv/ELm7UeBTS84YqJ+gPNjTEeZ9kzMyJCajmN9OwLd9Xw5Ih1cdeCeEn15zw3Ycw==
X-Received: by 2002:ac8:2535:: with SMTP id 50mr87216438qtm.373.1564622919238;
        Wed, 31 Jul 2019 18:28:39 -0700 (PDT)
Received: from lepton.domain.name ([191.243.232.18])
        by smtp.gmail.com with ESMTPSA id x205sm32130536qka.56.2019.07.31.18.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 18:28:38 -0700 (PDT)
From:   =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Thara Gopinath <thara@ti.com>, Nishanth Menon <nm@ti.com>,
        Shweta Gulati <shweta.gulati@ti.com>,
        linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@ti.com>
Subject: [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
Date:   Thu,  1 Aug 2019 03:28:21 +0200
Message-Id: <20190801012823.28730-2-neolynx@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801012823.28730-1-neolynx@gmail.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Thara Gopinath <thara@ti.com>

Voltage control on TWL can be done using VMODE/I2C1/I2C_SR.
Since almost all platforms use I2C_SR on omap3, omap3_twl_init by
default expects that OMAP's I2C_SR is plugged in to TWL's I2C
and calls omap3_twl_set_sr_bit. On platforms where I2C_SR is not connected,
the board files are expected to call omap3_twl_set_sr_bit(false) to
ensure that I2C_SR path is not set for voltage control and prevent
the default behavior of omap3_twl_init.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Thara Gopinath <thara@ti.com>
Signed-off-by: Shweta Gulati <shweta.gulati@ti.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kevin Hilman <khilman@ti.com>
---
 arch/arm/mach-omap2/omap_twl.c | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index 6787f1e72c6b..1dae906128c2 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -43,8 +43,15 @@
 
 static bool is_offset_valid;
 static u8 smps_offset;
+/*
+ * Flag to ensure Smartreflex bit in TWL
+ * being cleared in board file is not overwritten.
+ */
+static bool __initdata twl_sr_enable_autoinit;
 
+#define TWL4030_DCDC_GLOBAL_CFG        0x06
 #define REG_SMPS_OFFSET         0xE0
+#define SMARTREFLEX_ENABLE     BIT(3)
 
 static unsigned long twl4030_vsel_to_uv(const u8 vsel)
 {
@@ -241,6 +248,18 @@ int __init omap3_twl_init(void)
 	if (!cpu_is_omap34xx())
 		return -ENODEV;
 
+	/*
+	 * The smartreflex bit on twl4030 specifies if the setting of voltage
+	 * is done over the I2C_SR path. Since this setting is independent of
+	 * the actual usage of smartreflex AVS module, we enable TWL SR bit
+	 * by default irrespective of whether smartreflex AVS module is enabled
+	 * on the OMAP side or not. This is because without this bit enabled,
+	 * the voltage scaling through vp forceupdate/bypass mechanism of
+	 * voltage scaling will not function on TWL over I2C_SR.
+	 */
+	if (!twl_sr_enable_autoinit)
+		omap3_twl_set_sr_bit(true);
+
 	voltdm = voltdm_lookup("mpu_iva");
 	omap_voltage_register_pmic(voltdm, &omap3_mpu_pmic);
 
@@ -249,3 +268,44 @@ int __init omap3_twl_init(void)
 
 	return 0;
 }
+
+/**
+ * omap3_twl_set_sr_bit() - Set/Clear SR bit on TWL
+ * @enable: enable SR mode in twl or not
+ *
+ * If 'enable' is true, enables Smartreflex bit on TWL 4030 to make sure
+ * voltage scaling through OMAP SR works. Else, the smartreflex bit
+ * on twl4030 is cleared as there are platforms which use OMAP3 and T2 but
+ * use Synchronized Scaling Hardware Strategy (ENABLE_VMODE=1) and Direct
+ * Strategy Software Scaling Mode (ENABLE_VMODE=0), for setting the voltages,
+ * in those scenarios this bit is to be cleared (enable = false).
+ *
+ * Returns 0 on sucess, error is returned if I2C read/write fails.
+ */
+int __init omap3_twl_set_sr_bit(bool enable)
+{
+	u8 temp;
+	int ret;
+	if (twl_sr_enable_autoinit)
+		pr_warning("%s: unexpected multiple calls\n", __func__);
+
+	ret = twl_i2c_read_u8(TWL_MODULE_PM_RECEIVER, &temp,
+					TWL4030_DCDC_GLOBAL_CFG);
+	if (ret)
+		goto err;
+
+	if (enable)
+		temp |= SMARTREFLEX_ENABLE;
+	else
+		temp &= ~SMARTREFLEX_ENABLE;
+
+	ret = twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER, temp,
+				TWL4030_DCDC_GLOBAL_CFG);
+	if (!ret) {
+		twl_sr_enable_autoinit = true;
+		return 0;
+	}
+err:
+	pr_err("%s: Error access to TWL4030 (%d)\n", __func__, ret);
+	return ret;
+}
-- 
2.17.1

