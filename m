Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A029210185
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 03:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgGABdz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 21:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgGABdy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 21:33:54 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0975C03E97B
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 18:33:53 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n26so8774220ejx.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJ22qdC4RvZHdtMxJ8YYWILYunoa4ADbCDBJhh+M35c=;
        b=Ze5edmszHxmHc+eoA3XPuNrJory3gisovndE6X2LIUGAgs7R+rm/wiwrUx+/NZ4nDv
         MlW9lobaAbeZfQDHOVVeHB6gGZr3XIpDhsJDzU8ZKuSNl4P520bybbN+UVOBJq5cKfrT
         2W4YyqS7MChAYDWrygjxus6SVOnqHtgSUKO8qHbQtIy9RFh2IvcUAw1HT+uS3xE8AuEX
         TGtbH1+dlihzi4qyO2pJQgZU3FztFCbk10RLDxiwT7oUPaJYOLabSbf+l3JLPupZyvFj
         od+0TgOoXJR3YH9kaH8tek0LF9MMhMEbSDVyvbZd/F5/WG1yz9e1YNHiWXwkZafTdX7R
         hOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJ22qdC4RvZHdtMxJ8YYWILYunoa4ADbCDBJhh+M35c=;
        b=J8MbyaoXw6l2GymLFxbrApw99jYIoW3iTWyanO+ad06pCjA/PnG3isSUGpkjF20uWk
         yyQKrU11yyuy38F7pZnq9AKCHsJS5s0ZJFPFwNZOuSW7Adx9I2St0oFubJYjz6CCEhJs
         1QH+NTL5EAfSclFL5SHK876Z6aeozyFklnKuKiek9XzRn1Z5y+Q883v7LbIHa3DpgbAx
         n8HaQwiMQUjXIAN3Ju8g3wlAVQMvsVWAh+jbzmK+zGQ0trY/j+jEzwIbku85I7zFoe4o
         HyCyi1on4I1o39RaPHHe/F5qm5gym6RBlpVgetmlalz5ULAscVUn5CGej/4ImoT8g+C1
         Llaw==
X-Gm-Message-State: AOAM530Xd4CbEfg3kBoh/0c//Y5pmFcsn5htbjV8Zs8OfVFrhddWye7S
        poZ4Q0bDyeR+ljFoCFvQAwehkw==
X-Google-Smtp-Source: ABdhPJxI0WQk14+Ivo5cdeI8jHa73I3z+K18yjH+Q4Lpumd9g0c4kuF6XkdkxR7cidzvTjndU+H8pg==
X-Received: by 2002:a17:906:b354:: with SMTP id cd20mr18663123ejb.296.1593567232608;
        Tue, 30 Jun 2020 18:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id d23sm3348571eja.27.2020.06.30.18.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 18:33:51 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v4 2/2] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Wed,  1 Jul 2020 03:33:20 +0200
Message-Id: <20200701013320.130441-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
References: <20200701013320.130441-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Increase #pinctrl-cells to 2 so that mux and conf be kept separate. This
requires the AM33XX_PADCONF macro in omap.h to also be modified to keep pin
conf and pin mux values separate.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
 include/dt-bindings/pinctrl/omap.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index a9cbefc80c0c..3141590e5889 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -278,7 +278,7 @@ scm: scm@0 {
 				am33xx_pinmux: pinmux@800 {
 					compatible = "pinctrl-single";
 					reg = <0x800 0x238>;
-					#pinctrl-cells = <1>;
+					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
 					pinctrl-single,function-mask = <0x7f>;
 				};
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

