Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2572681C2
	for <lists+linux-omap@lfdr.de>; Mon, 14 Sep 2020 00:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgIMWuW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Sep 2020 18:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgIMWuN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Sep 2020 18:50:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CF4C06178A
        for <linux-omap@vger.kernel.org>; Sun, 13 Sep 2020 15:50:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gr14so20592333ejb.1
        for <linux-omap@vger.kernel.org>; Sun, 13 Sep 2020 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCkqObLQ6XI/cM41eaYHVKIOntJotdMpMjm5ZTC8RoQ=;
        b=J6Lor6kkrx1LBJfAjZtlgpdUKKYWlck7lJlUbb0SSO+vOWUlMoO2P4YTFTfhf09Hb4
         tDj37UEilxmAnsrbMV4cOFaMGwNqn09aB68hQlCyVy/C4t+A2J9CtvkGeDxhWBMx9JUI
         Ntpn6Qw/QIJKrN6zScv+1HEtSYr/sm7uFxfDA7q4o6dlc8fFzyJ7LidX0/s1vPghhMug
         T+1peI892d9JzFFGOe+oiEDYfGLkj35F0RJoXGjefdZjP1MxdUjJBEiJ1S3GklsqbmSh
         BX0BWFOO2jXc7RAFjm0kHHmSKRSLXSzn5YETrxqD3uvtitRsJJM97Qzeq2xUT2e2lNTM
         /ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCkqObLQ6XI/cM41eaYHVKIOntJotdMpMjm5ZTC8RoQ=;
        b=bpJ8Y2EBb9+66ddmZAazdkSjMaaTefksBUfAe/4F/pJY71rdXgqe1VNE5mZjEBxuSP
         EGSJ+3ARleZNaqoJBnFcqGqkKpHGe/qN1oPupCMZNDNgGIieTgW2GZipDGx7X7/HcjqU
         cSkUKpXqZ5qkXlF8x7nEsGCZImS1gGgebYbLX2JUBRFGdK+z9ZCP1kCA9CKVeGfZln3w
         mlejC8fqVjGIgmh0m3tdiRYy0k6yAKkUfEE6+Do1wnirokb/5wh+CBzq5+rF94ZJCYo9
         U4LMaYO/WBBXfU5T9fVAYuE98Tc/xC1VrfqTaUssRzBSJ6qD0SNHbmINcNRtBLt3uzVa
         9ISw==
X-Gm-Message-State: AOAM5333W2RAnYl7baScH/hOoo81XfqfbOXCckrFF7Wj/dCjFXHBE97M
        Mduf3ilnXe8gQm6EcKUq4dJUPsTG8QoaKv7XwOs=
X-Google-Smtp-Source: ABdhPJycv3oM6/mxGcVmlcdaPFp/A1PlmqJxqSgM3DkeRXQ57TuHJDm1Xo9uuEhbDu0Bv1VVqWI7oQ==
X-Received: by 2002:a17:906:3913:: with SMTP id f19mr12528258eje.83.1600037410320;
        Sun, 13 Sep 2020 15:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:400:d0::26:8001])
        by smtp.gmail.com with ESMTPSA id hk14sm6171147ejb.88.2020.09.13.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 15:50:09 -0700 (PDT)
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
Subject: [PATCH] pinctrl: single: fix debug output when #pinctrl-cells = 3
Date:   Mon, 14 Sep 2020 00:47:46 +0200
Message-Id: <20200913224746.2048603-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The debug output in pcs_parse_one_pinctrl_entry() needs to be updated
to print the correct pinctrl register value when #pinctrl-cells is 3.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cbf0e55087c..f3cd7e296712 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1033,7 +1033,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
-			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
+			pinctrl_spec.np, offset, vals[found].val);
 
 		pin = pcs_get_pin_by_offset(pcs, offset);
 		if (pin < 0) {
-- 
2.25.1

