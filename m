Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7498F3CC2E2
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jul 2021 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhGQMJ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Jul 2021 08:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhGQMJ4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Jul 2021 08:09:56 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1750DC061762;
        Sat, 17 Jul 2021 05:07:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u25so17850325ljj.11;
        Sat, 17 Jul 2021 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=OfDUQpBQf+Sdxm6FDyEI0jFpTeWeBfWmXLBIaP0uaQo5aMGCFtL6Xt02zJBLKqUktj
         FwuCBA9kipFocCnWH+gr2GQDxf9/IaU2rv82inFRESsgOGv+SgVIvOMUzg4hbVAcrHxY
         3GMnCsMM/2uF+R51zsMYwLGJVFCLeFA+PTh3D+3CQg3YQwwks9UwhPi1vQhdu8VNjuJS
         Oitpw0p1FQSTJoqlkgSOxiUkZaQzvN2WvtLUr5Ea1aGBg6J3N6LFJIHbb1EpfS+ixavy
         RNDJyJYTSbU7Eff+9D6oOvBJ0jjVfajLK0cg1F7j+9gSgIzasq8hSlgoD+x0JkzIha2N
         QilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=dy/YrlxiUit4LbvpDO58DsDr5VgnEELBFnzlpjQW5ZVT9X3U0R6M7ZODXOZG8ORIJe
         2sgJbh6UR4UwlALdvuEWb2Y6gyrMqXBQKurbtrig5+0k/1ZQAplg3XPMRM2PuJszD4GI
         yNrFrSFOHdEZo6XNYIdStooAlS/KNIHCWRd7nKDOxO2Ve0JOz9NZ2FtYwMQvgAulRdjK
         IGnOTBDYpgrvNIwasbLJc16o5FLdTWSq+zzC74XrmLOgLfAM/0UGTBiVsoL9QQSbIbqJ
         nrggP1OqiBkpYSTA3Wjw6Vao7CQVWONe10sOJtW4a0FHQO9Pqon07ZTtaC4BWjzUASSy
         stIg==
X-Gm-Message-State: AOAM533NWD4WTjTK7m+L0Epcu4xErLqL8hkf6oIrbEWUr4beXfbxN0Ej
        Rp8gsmfT7iY8GSiNjV6jEOs=
X-Google-Smtp-Source: ABdhPJwOh0e9bANU7j7bOYjuES5Pt8t8s688koPfkrAO4V/0pM1QvSGJSH8WP4/zu2+iIktPwzG/jA==
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr13244383ljq.421.1626523618490;
        Sat, 17 Jul 2021 05:06:58 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id e5sm155334ljn.72.2021.07.17.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:06:58 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hns@goldelico.com
Subject: [PATCH 1/3] ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
Date:   Sat, 17 Jul 2021 15:09:23 +0300
Message-Id: <20210717120925.24505-2-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
References: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

McASP only supports  Force-idle, No-idle and Smart-idle modes

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index a9573d441dea..8287fdaa526e 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -192,8 +192,7 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
+					<SYSC_IDLE_SMART>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.32.0

