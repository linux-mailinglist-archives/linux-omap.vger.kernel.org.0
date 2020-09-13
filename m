Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE6626815F
	for <lists+linux-omap@lfdr.de>; Sun, 13 Sep 2020 23:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgIMVSG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Sep 2020 17:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgIMVRu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Sep 2020 17:17:50 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46811C06178A
        for <linux-omap@vger.kernel.org>; Sun, 13 Sep 2020 14:17:49 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z22so20376436ejl.7
        for <linux-omap@vger.kernel.org>; Sun, 13 Sep 2020 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OnBB2DvrjzYcd2Xdjt97x0iAp2/ezTLDUs0RIs9ctY4=;
        b=anMv6v5bdZAYEnkPr+2lsuP8+5lMUf/p8cStq7v1B4plciXq+6TtFHW8QzpKKOhTCq
         S/ipULt16qgmNsz82+0Ka6apn7BUvnlyhjPklRW3PpewTvP64wBy4a24YGb3PGZcFY0P
         bH60+5as3PU1yc1jL1JgKNhVxKD9OdRRQQn+Yowgil3qiQ0i1y0dQafzssROTbpYg02P
         0Leir4WZOwlRGbDPEY4WEXMlXL021iZtufx+pPPX6lNpZ6W/1i1DYEWUej5BGVbjmPUj
         9rFD4aBhyUZH9M34lHZSVgsEQb0t4UyDvmZ2f9yJj+1RJ1FwdtYmV2CVaT7eIUuvm2H2
         m28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OnBB2DvrjzYcd2Xdjt97x0iAp2/ezTLDUs0RIs9ctY4=;
        b=fmDiL1q6BWlU6AeJjvbgJ+iynrouggd2s5NJz8he5JyfRnHNul+q7f4EPVpx/sRd18
         F7rEWzpcMgJhB2K6XikXFTa94b9/os0bY6beveP5CKlMlvmF9m5X4Yjj4RPwUHU1zros
         R9MSpP7V2ESYLmUejIzjiGsMxBFBdiVT8l4NCCuPYDXlSgWyh53h+mfXudr6SIqX+KoT
         LhmjnIaxHgFMWHgxrgWnQXiMjOOltMLUaiAmywQ4my2FRIaVahqxlz0k3g5BrnSxMX4a
         J+Ghj+JtMWNwHutemBjvJuHkGouW1IHMld/YayoON1EopICn9r7OnMrZ9TsgO4aSUATI
         Tzog==
X-Gm-Message-State: AOAM5308rSgCQSwfNPc0Ol9REH/M1Sk559sibz3v5yGFds+Z+UcYWyJR
        FGMAJ+3cD/vGCDLp4+OYau0Kbg==
X-Google-Smtp-Source: ABdhPJx/fPh48IU+8lLHz64Qb1MQH+b7UmWjSssDB+euFBrzvDr8kAd930lroS4LaVAWxXdwq0JsIg==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr11285979ejo.33.1600031868331;
        Sun, 13 Sep 2020 14:17:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5cf8:e601:5f2:8f03:4748:2bc6])
        by smtp.gmail.com with ESMTPSA id cw9sm7782989edb.13.2020.09.13.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 14:17:47 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: single: check if #pinctrl-cells exceeds 3
Date:   Sun, 13 Sep 2020 23:08:25 +0200
Message-Id: <20200913210825.2022552-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The property #pinctrl-cells can either be 2 or 3.  There is currently
only a check to make sure that #pinctrl-cells is 2 or greater.  This
patch adds a check to make sure it is not greater than 3.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index efe41abc5d47..5cbf0e55087c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1014,7 +1014,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		if (res)
 			return res;
 
-		if (pinctrl_spec.args_count < 2) {
+		if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
 			dev_err(pcs->dev, "invalid args_count for spec: %i\n",
 				pinctrl_spec.args_count);
 			break;
-- 
2.25.1

