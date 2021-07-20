Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8493D01AF
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 20:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhGTRrS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 13:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbhGTRqk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Jul 2021 13:46:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B745C061762
        for <linux-omap@vger.kernel.org>; Tue, 20 Jul 2021 11:27:18 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b12so239640pfv.6
        for <linux-omap@vger.kernel.org>; Tue, 20 Jul 2021 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hq/i2vXf3m6zhthn176Fg2DW/Jroc/Qu+GUHpugOqdA=;
        b=XY3Q/Uh+QedmxbjpZ6uEHIzsoDmBwo8ukoW56iYkjEA/MBCd4j9EMNjE8D6KE1uv7A
         Ulyp28Vk2AT8zfUa6JE+bJYoJV02Wjv4PzEhenNrBGX74SeuEUKk7SYcm/v06aRIfQp/
         6xNeQq9if+Tja40Jwy/UZ9OATux7SUVYewMuSTfyANpOkthpUE1HtFHNOFvcYiFO1+gV
         IqnXQUXPoiaNg1+i3L8CQmnwSY2j+bZO1Fi9HVz92MiVvMNtBH9dMwq9WkAAe1Qb2AYV
         aeLiLZBeKrFxJbWN3L05x2d0X2f3WG0oRvqxoSb3AyCURRiM0e8Q/KGSNUstXbwWqD2B
         eCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hq/i2vXf3m6zhthn176Fg2DW/Jroc/Qu+GUHpugOqdA=;
        b=KKlS05I1gtmdfihyMT4GTsKcjMYotnqvXo040/NdaOMsNcYQRdy1F1+az+yOGB0oib
         K9VbtQE99GrRYi/Mr4VcXbgbVgualoy7SycXiO1quFY4atx4wzAjXUYfvhnFygCJp7dv
         HK7xwDO4mwCWjsTQ8WArhmlILO9gzOU4yv+H7g44vXfLV+VYHNIqzIsoxh/ikIhnD/5b
         qakXNF2Ibv9D+Dks+PdS9w2xoVKKNyMXbYQInZyGWNh6g0yXUvS95KyYziGXZRTAB78J
         iGktdY8nZaYzQGCm7Xb/Lwmukbw/iX8A4ok/VLV+ooRauKwmX4jm53TKEADbUTjemCEt
         XRpg==
X-Gm-Message-State: AOAM5329XOjp9ce0my/EehdTVafSyOphrNIRckqY5EOedn30qQwekCRa
        mCr5aqjy4trC3yeSUc00D/JXvErCJmoiAQ==
X-Google-Smtp-Source: ABdhPJzKemP3fhkpt5b2ReiI1hf6UPbDsLuED7tu47DHpCTSc2NrubMrb2jXcT7xfxfTAghgKGQCFg==
X-Received: by 2002:a65:6187:: with SMTP id c7mr31729095pgv.349.1626805637535;
        Tue, 20 Jul 2021 11:27:17 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
        by smtp.gmail.com with ESMTPSA id u15sm26943643pgf.77.2021.07.20.11.27.16
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 11:27:17 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-omap@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: AM3: RNG is GP only
Date:   Tue, 20 Jul 2021 11:27:16 -0700
Message-Id: <20210720182716.13269-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Make the RNG on AM3 GP only.

Based on this patch from TI v5.4 tree which is based on hwmod data
which are now removed:

| ARM: AM43xx: hwmod: Move RNG to a GP only links table
|
| On non-GP devices the RNG is controlled by the secure-side software,
| like in DRA7xx hwmod we should not control this IP when we are not
| a GP device.
|
| Signed-off-by: Andrew F. Davis <afd@ti.com>

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
If this is merged, it should be flagged for stable v5.10+. 

 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 38cb116ed433..2587ed43ee8a 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2951,6 +2951,8 @@ static int sysc_init_soc(struct sysc *ddata)
 		case SOC_3430 ... SOC_3630:
 			sysc_add_disabled(0x48304000);	/* timer12 */
 			break;
+		case SOC_AM3:
+			sysc_add_disabled(0x48310000);  /* rng */
 		default:
 			break;
 		}
-- 
2.31.1

