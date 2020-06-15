Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EC01FA3E2
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgFOXJM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 19:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFOXJL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 19:09:11 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE39C061A0E
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 16:09:10 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t21so12795764edr.12
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 16:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=bk2DDWTpTttEWYCFILNhZOQEi6YabfV1fIkqBtWhOns=;
        b=Zt2quLEt6Rzgpd3ABJyk5Dv1lu4fAk1DvHGdpwL3SFFOs9Qk6qzedOiJ/Bth9dZp+v
         CiW1CpJjQFQKcUwIz1CsQ9OFM76GnkFyU30MGvQjGYf8awHgm9g5iKqEYqCeVZPMwln/
         smRONrkAB7Mp5upc5nDnI/tegEBiRN/4qbRnxqNf/uZjibGVyNx+Xh1Ak+KFTIFeWQqE
         Z5w1PZyL4BqUO1JkkhPRSk0P4J4Iqx9XdEnHiVHBchiEAeId7E7IqpUYPs+XGNBVyxom
         RI+CuUjP65ijuqZZBkQYAcs+NFArj+AyyF6VZhTXO8ZhiKYsOmFingCJqwBNWaEprUX+
         gNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=bk2DDWTpTttEWYCFILNhZOQEi6YabfV1fIkqBtWhOns=;
        b=MAS+RspMePbxf2QcXptA/BPuwS75TOR9CCdyBj5U5UJ0yq1lqY2fFlwXhPiswKBOue
         hiigdV7jdSjcCR4xrMgbLVZnCHg4VI1STP2JimlL6woMIgcyiprByP5c4HUY4nWcpiqL
         jW8Pc59nCGjTbIwYaAN0yFumTBH7rJswoZQ70LL+sr/5dr+xhdTLpfeHaH9WBVXQ/EeF
         PcI0atuLF/Op/O5W9JdKoWmzW5O8b9DtEGJKaJKVDCovR87el5jkzJ6zfoNh5GzWjrAb
         bHjgsSgp7p02yz9tdjyAf6OF3LlOkheD46qJMSA8akK6OjmHVagLpKYWfCIYzaSh22XQ
         45Vg==
X-Gm-Message-State: AOAM531NvuUN6xnT3uR7rBqwlfNJe6X+vV1YqQLz/G3zfpkUfmqgV5zI
        x+5H7FLszqha1K0/1RpGoUum3A==
X-Google-Smtp-Source: ABdhPJw2bio2JVkVlIv9HMdE2+eGA5HFn/MxL3qWyHUmKoSCo8XsWpuZK9EaVElFXOgF2lpQzPonQA==
X-Received: by 2002:a05:6402:3c2:: with SMTP id t2mr71683edw.361.1592262549666;
        Mon, 15 Jun 2020 16:09:09 -0700 (PDT)
Received: from x1 ([2001:16b8:5c49:af01:5c06:6064:338b:4004])
        by smtp.gmail.com with ESMTPSA id q25sm9770461ejz.93.2020.06.15.16.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 16:09:09 -0700 (PDT)
Date:   Tue, 16 Jun 2020 01:09:06 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [RFC PATCH] pinctrl-single: parse #pinctrl-cells = 2
Message-ID: <20200615230906.GA3967771@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These changes are based on feedback from Tony [1] concerning changing
pinctrl-single to be able to handle pinctrl-cells = 2 for for the 
"pinctrl-single,pins" property.

AM33XX_PADCONF macro is modified to keep pin conf and pin mux seperate.

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.

[1] https://lore.kernel.org/linux-omap/20200609180404.GR37466@atomide.com/#t

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi   |  4 ++--
 drivers/pinctrl/pinctrl-single.c   | 14 ++++++++++++--
 include/dt-bindings/pinctrl/omap.h |  2 +-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 340ea331e54d..0b0439b53a0e 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -288,9 +288,9 @@ scm: scm@0 {
 				ranges = <0 0 0x2000>;
 
 				am33xx_pinmux: pinmux@800 {
-					compatible = "pinctrl-single";
+					compatible = "pinconf-single";
 					reg = <0x800 0x238>;
-					#pinctrl-cells = <1>;
+					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
 					pinctrl-single,function-mask = <0x7f>;
 				};
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 02f677eb1d53..080083b8b5be 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,11 +1017,21 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
 
+		pr_info("%s: args_count=%d offset=0x%x", __func__,
+				pinctrl_spec.args_count, offset);
+		pr_info("%s: args[1]=0x%x", __func__, pinctrl_spec.args[1]);
+
+		if (pinctrl_spec.args_count == 2) {
+			vals[found].val = pinctrl_spec.args[1];
+		} else if (pinctrl_spec.args_count == 3) {
+			pr_info("%s: args[2]=0x%x", __func__, pinctrl_spec.args[2]);
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+		}
+
+		pr_info("%s: vals[%d].val=0x%x", __func__, found, vals[found].val);
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
 
diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 625718042413..2d2a8c737822 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -65,7 +65,7 @@
 #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
+#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
 
 /*
  * Macros to allow using the offset from the padconf physical address
-- 
2.25.1

