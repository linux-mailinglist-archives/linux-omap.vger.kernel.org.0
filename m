Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A9C159E1D
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgBLAkV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:21 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44400 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgBLAkU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so239979ljj.11
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ttJW9peokq5rUpFOQPvSx+wLa406veCgVEoVyR6YAV8=;
        b=SHcDvUlKTDjrSUyYrLPEjMYJTvRDrw/kwd1X2ZFXrBSCah3TbdHcdOnpB/sdh+Cjbf
         Z3+loashg/BSX7zm1xHB0W+YgWvQ3iA8VQTogN73YaMluPA97Gg7d6wYVOck+f+5YRxH
         01YZjhYwC49vPTcoHoTD8EYcXq/wj63Cb5C+5Xt+tlu/gSN+Y85OCic5r1bRg51TsnW3
         05BudZ7Mt9kohFXmGNF74A3ZGE+mh3Mj3lT3rGJVhIbUdLGjVlDON2Hfgnls//ISsp8B
         3TAh/IExYhEiGEwLHODItVelxBWh230DfJp9RNLFRZsWMqdnoFX+L3KJ3Ag8VTHxzlpM
         4x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ttJW9peokq5rUpFOQPvSx+wLa406veCgVEoVyR6YAV8=;
        b=aLXXkkWJ7zwiTiWdYsneHEKqA3pjJY1jqb8nIefLyHiQdp/M5izBBieCz3CHeDcJYe
         hyopmETY3aShQNaebL2tjEAqmymx3GsAZyS7j+CvOS3HKrNxlZh3EA5VAspp9Mws35IY
         YlfS3O5GlsjH4pfwfEE47/moe8CiWEXEz7nVUA3zVPTBYQg0oCyvQ3G+uMXxpZ7pJwhH
         cVzdzqtGAXSiryRj21Gz2y/Sf7ndqGZPA6hdsG5LxxWlopts1oaeOnHDp8W3nPis+UJj
         XWp5cBiP4hp/jufYUJHfxAm0DUPT5+jHjeWDeWJIne6KR315X2RVTwzLo6RwpuBpCrIr
         4t/g==
X-Gm-Message-State: APjAAAXniTsF7Rs06EV1UgMZDgI480C/NmmQhDFKCVK2eriOQYDnVsNf
        kzR2lu9XbRolZs0OiuIlAYQ=
X-Google-Smtp-Source: APXvYqwnNi3Y4kZzLlTAlPxy+jEgL87XZNvOHJv/JSD1vBuRqr4PxxEZvgCLUMMsg5LNGxXQvOlRpg==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr6242730ljm.20.1581468018867;
        Tue, 11 Feb 2020 16:40:18 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:18 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 05/14] mtd: rawnand: ams-delta: Enable OF partition info support
Date:   Wed, 12 Feb 2020 01:39:20 +0100
Message-Id: <20200212003929.6682-6-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Provide MTD layer with device OF node info required by OF partition
parser.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 25f121adea6f..fb96f6a3b0b3 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -222,6 +222,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	nand_set_controller_data(this, priv);
+	nand_set_flash_node(this, pdev->dev.of_node);
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
-- 
2.24.1

