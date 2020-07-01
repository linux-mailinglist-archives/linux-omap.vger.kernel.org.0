Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7D2210181
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 03:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgGABdq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 21:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgGABdp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 21:33:45 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F0AC03E97B
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 18:33:45 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w6so22728518ejq.6
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mnbu3qm+zpGqCdgLq1LzvBpQasplZUpyniv6lrFeAbQ=;
        b=CJjrDxZ7Cz1QNTQqL8MOg6VBc3Yg0ZKhY422wSXa1+uBaEdDlLPV+O/bqJ/5RwRTXt
         CPlm1YF+VdX2/JajN3LKNWhf/0F10bFOsIybXgExM91NYoUobbLS3EgPxQlFc0jQbLFj
         vVubGY7sgQ7WWNbuw1xzqmd5KAQ336FannKADPbuMpMXUoObSUVXhm2y3T7M13VF9kvw
         F6UyANrxSn7V4H4orYoWtbxhwsLKSJDuc0LCGCNO6EkWWXpZdKnmdIgJzlnp/fRptucC
         RyEQg7vhuLdbAycLGE7DGxaDC6c6UA1ryV5wouRXNmXRvmBfNU3J1MdKzrHgfW3nlb2Z
         6Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mnbu3qm+zpGqCdgLq1LzvBpQasplZUpyniv6lrFeAbQ=;
        b=HKJlvQrQ0bryABUyqKFQwc5rN0MrgBGwW7LuPIyqjYEwn/bXLlxijMKzyY7Oumm5z0
         wLWr/3fOZxrmPhh8DTixWALsRB6rOn6kv7AWTFO0l+9zurVnfkLZwByLqHsdTLHjrTO9
         LDaldj9mSZ+aSFF3XvMxllnN7NqUYV3WSsbCEkoLVsukvBjV0GdJ/SjZ7FSqAtIhtppk
         6pe1RacZBbDu+1KexOSe75hTI81s2MDtJyxMEDScg+1yHT6ap8IUYEiVRyzsh8Q+/YDx
         pb7EqTWbOhYdJc0tUITSAtx9JgAM/9Qmjh1bEhLF99IrQWZOzt6yY0PVrn5zYtjI/muJ
         el/Q==
X-Gm-Message-State: AOAM532IWUO2SE4M/1R9tHKHlV9d5wX1VlUXXwXDfBapYC+0+7R8djUJ
        wPyIwBqfMFViOZMPRYnsWmVpVg==
X-Google-Smtp-Source: ABdhPJykzEY+Jb7MlBrIGhdhlIJ9UwHGhfxGZE8WU0x1mILqV0xifIohr3K1AX6OK6qpp9AgnokthA==
X-Received: by 2002:a17:906:d79c:: with SMTP id pj28mr19792225ejb.397.1593567223865;
        Tue, 30 Jun 2020 18:33:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id d23sm3348571eja.27.2020.06.30.18.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 18:33:42 -0700 (PDT)
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
Subject: [PATCH v4 1/2] pinctrl: single: parse #pinctrl-cells = 2
Date:   Wed,  1 Jul 2020 03:33:19 +0200
Message-Id: <20200701013320.130441-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
References: <20200701013320.130441-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux), then
pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
get the value to store in the register.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f3a8a465d27e..a436ed7762cc 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,10 +1017,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
+
+		switch (pinctrl_spec.args_count) {
+		case 2:
+			vals[found].val = pinctrl_spec.args[1];
+			break;
+		case 3:
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+			break;
+		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
-- 
2.25.1

