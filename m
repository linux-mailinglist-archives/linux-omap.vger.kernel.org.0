Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B75F1FF261
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jun 2020 14:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbgFRMvq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jun 2020 08:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729889AbgFRMvo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Jun 2020 08:51:44 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0077CC0613ED
        for <linux-omap@vger.kernel.org>; Thu, 18 Jun 2020 05:51:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so5080243wmh.4
        for <linux-omap@vger.kernel.org>; Thu, 18 Jun 2020 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kre93dd6hT4pYBC6xQN9FkazTNYBQtZr78iwLPfwCF4=;
        b=TRVf5p71/Ag4UNdwc/kW3lZlfblIowK80W+zyKByyru7UHXDqLeD7vCHyYGEpt4SE8
         3feY5JsWedJKgdl+5OIez+/8F1tBVDJ/4VA824OzPcsTBPPvCrjYcFFz+5R42CWGMpFk
         mlGZ12sNiwhEH5GEti9o1QKOKAO3W7nFkr8QTy+Z1+eE7pHgMptcgUtDt7tXkhGRvw4n
         cx+fObyf5nAwwcDb3tVugVuQRdrGOCmLMqYP/S8rptL6ZYej0IPNQtAirgnNgm1sqRxL
         vxooeW/Khk5NA3xdrlKD4ZmJ/mz/QX4rgry57toQ8SIDlnksSH7oTPVxq5NIWkRvVkpJ
         4NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kre93dd6hT4pYBC6xQN9FkazTNYBQtZr78iwLPfwCF4=;
        b=sxEpqG4fpbXr6JX9wjdd94LsfZA96+zQ73KWdVgJkc8ZraoiGwF70EoPolG/bxeMi+
         P1Vw6Mu/rzK5ox3w3KUa7FZabweErOC2p9Zeg2d7dGNzks6LjxPiNOaOMEP562WzMkMP
         zJR97+VY4ccWAEf2G7Ykd1kwJGbdljdvdKkMETf7K5G5n+vL2U9MTizhCx7LzpmTMuZ5
         zS5yGRlGnHVDtsb38uCgX29Tl7s7BUlTtBRDHprMld8CplrbgmMTbTbFUrKSDnlFCMr6
         VuxazxSvcxxZt4gUruFmiGcEE0wbbIL8XUXGZQmLZtQ2qLcBXNk1F6HjSBCvPUwDCALk
         Q2Tw==
X-Gm-Message-State: AOAM5310YCr4YCOqHMXJQDnBbcdCvaNX04rSqLy41GO0Ek9mAURKaB72
        bYLxbUiGDDB4HqsTE6Yjx/PNBA==
X-Google-Smtp-Source: ABdhPJx5wChPkJh3wqqQH8t9n3fY00xH6TQW/iPEoWFdYFr16TgedzvEFOTdfZ9BL2dZZbmQXlZ/4w==
X-Received: by 2002:a1c:44c3:: with SMTP id r186mr3831425wma.67.1592484702734;
        Thu, 18 Jun 2020 05:51:42 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v27sm3714151wrv.81.2020.06.18.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 05:51:41 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH 1/3] ARM: dts: change AM33XX_PADCONF macro separate conf and mux
Date:   Thu, 18 Jun 2020 14:50:55 +0200
Message-Id: <20200618125057.41252-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618125057.41252-1-drew@beagleboard.org>
References: <20200618125057.41252-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM33XX_PADCONF macro is modified to keep pin conf and pin mux separate.

This requires #pinctrl-cells = 2 in am33xx-l4.dtsi

pinctrl-single.c but also be changed to support "pinctrl-single,pins"
with 3 arguments (offset, conf, mux)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 include/dt-bindings/pinctrl/omap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 625718042413..a0974923bb1b 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -65,7 +65,7 @@
 #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
+#define AM33XX_PADCONF(pa, conf, mux)	(OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux))
 
 /*
  * Macros to allow using the offset from the padconf physical address
-- 
2.25.1

