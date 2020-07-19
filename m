Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E302251F4
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 15:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgGSNXM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 09:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSNXK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jul 2020 09:23:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A076C0619D2
        for <linux-omap@vger.kernel.org>; Sun, 19 Jul 2020 06:23:10 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so19820933wmi.3
        for <linux-omap@vger.kernel.org>; Sun, 19 Jul 2020 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuzrtuHN21oOAZxIlittwwnGBTHcg7DOnqANihEyN2Y=;
        b=mDzm0vp/+eWsDlF0dQwnZFx8Yq3+hGPmU7PkW7ss76VWEulTAsRDUW0FLb29vYTT0b
         o8O9qRwThNCVgWAzGlALOPWCH35bZtsz/jiiTGRAN1Aj2+lepPqYH/WiH4MM2mE2Hbck
         0NskG4tlnn6AWjL3WHwmpxAlsodHPeRKrCwzs83oOd0r3sTMaF9Ai/zqAJdIzK6tm0Z/
         fbDS9doxPMOGNnxU9i/BZvZ965OOqV+wQjYtGoICBI3nXGtAviwfrgw48hsC7wIphYsT
         z080dzmbMiPxfRdhJau/XXvvqnNBGD6jlVIJzjax5nc5bGRLxlaFYMTMfKspYxQXst6P
         V92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuzrtuHN21oOAZxIlittwwnGBTHcg7DOnqANihEyN2Y=;
        b=r1j654tN/K2aaWQi8N7IRFpmpDBWwn4j6UO4137BYHxAD1mjhhOIx+ZH8h8exekIVi
         VN4AKzBg4tgMp9/+uKQ2Wzxpur0EyjqK1VBNdMk33m/SZBc/bmVUnjJ8nJX+n+B9qcCs
         8BX+DjQzAYeGl/1zUtjXq0H0HehfphcKJQAGfNj7tz0Xy5TEuGPr8sSWrG24z3I8ZcBn
         ctQ9O3hwSH9sUBhmWKcr2/ERt8SYKlIO34+WDj5X3MSu4uQ3TaNQ+ym2JBSq3C68IdBI
         GnjnnvhYheC/qEfkAokLaUE2l5Rnkpy6G63jIIJQ4T/deoRePbToo77FZfW7Ou0AYqNO
         nC4Q==
X-Gm-Message-State: AOAM533G3Vs3PoNWS4d+q95v6UAcnI5RbtkLmQ1p4B0VVtgIVFPVHMyR
        HSA73lEADDhZ4+ezIdwTZFXk4w==
X-Google-Smtp-Source: ABdhPJys3kBCZ/Ng9Jd/mHjjve9HkWa6Z66C4tFzOLZMlEx5dj9cchomB6LLyg490qdZo8QF8Dz9EA==
X-Received: by 2002:a1c:2805:: with SMTP id o5mr17859971wmo.25.1595164987582;
        Sun, 19 Jul 2020 06:23:07 -0700 (PDT)
Received: from localhost.localdomain (188.29.165.134.threembb.co.uk. [188.29.165.134])
        by smtp.gmail.com with ESMTPSA id q188sm27193851wma.46.2020.07.19.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 06:23:06 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] pinctrl: core: print gpio in pins debugfs file
Date:   Sun, 19 Jul 2020 15:22:01 +0200
Message-Id: <20200719132200.1878265-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
number for the pin in the debugfs 'pins' file.

Here is an example output on the BeagleBone Black from:
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins

pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
pin 105 (PIN105) GPIO-115 44e109a4 00000027 pinctrl-single
pin 106 (PIN106) GPIO-116 44e109a8 00000027 pinctrl-single
pin 107 (PIN107) GPIO-117 44e109ac 00000027 pinctrl-single
pin 108 (PIN108) GPIO-19 44e109b0 00000027 pinctrl-single
pin 109 (PIN109) GPIO-20 44e109b4 00000027 pinctrl-single
pin 110 (PIN110) NA 44e109b8 00000030 pinctrl-single
pin 111 (PIN111) NA 44e109bc 00000028 pinctrl-single
pin 112 (PIN112) NA 44e109c0 00000030 pinctrl-single
pin 113 (PIN113) NA 44e109c4 00000028 pinctrl-single
pin 114 (PIN114) NA 44e109c8 00000028 pinctrl-single

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

v2 changes:
- print 'NA' if pin does not have a GPIO number
- change gpio_num from unsigned to unsigned int per checkpatch

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 821242bb4b16..8478025926a2 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1601,6 +1601,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+	struct pinctrl_gpio_range *range;
+	unsigned int gpio_num;
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
@@ -1618,6 +1620,18 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
+		gpio_num = 0;
+		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
+			if ((pin >= range->pin_base) &&
+			    (pin < (range->pin_base + range->npins)))
+				gpio_num = range->base + (pin - range->pin_base);
+		}
+
+		if (gpio_num > 0)
+			seq_printf(s, "GPIO-%u ", gpio_num);
+		else
+			seq_puts(s, "NA ");
+
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);
-- 
2.25.1

