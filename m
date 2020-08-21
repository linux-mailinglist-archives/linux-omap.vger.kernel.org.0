Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D181924D79F
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgHUOpW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgHUOoi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:38 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55F8C061574
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:37 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x64so93361lff.0
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dCxd2Q4l5lkrNLliGFJQWYHxizvRKPbrS09MX/RoHLM=;
        b=GmKcGM6UHhTOSrzyGoon8fimsUsJsoCmfRi2IX7drBYlygMYxMH+UN27VCNCU1t3AG
         C6uS7uOwqapSy69YRq29pHHahyG3Z+49HchV+3KC25FAyTZasPEnxRLa1PdHVU0WJ0Gq
         mm25ZZImCfybEp8lRAcrSSJ5lEoxK9ctEzOKnJirmpymflqtczwRXdrIlNPawPiSb30n
         OGdx7u9DWqzbahDTGzZdXsXrvGScFStGCRT/0+COD3hX8YlG3C3msC8Us3RoQYrROPCY
         Ked5yYkGMsOAXVN/IFfl8JrXSg5XwrYlEXFQV6Cxcg2VnqycEwfx5+61IBjaOG1Fyhvm
         Z0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dCxd2Q4l5lkrNLliGFJQWYHxizvRKPbrS09MX/RoHLM=;
        b=ba+AzIOzNalh5sPjEADr8AAvgEQt4sckEqGV3LrPnnAEump1QKQcjHTUOBhX/VqUij
         J6Jgbt1DUk41A5NOCmrH0rzpT4Gx9jTyiqGtfYrd1BJRHCSQic8R30y6Ln8sWEo5vNwM
         51AIa9bc0i+OmiwVe+QBqDToExIQDRIAfVBOCG1XLqjQ0o0gI2NLLpevHpElq1V+5KVS
         X9JQ3te2LLpyYKgjsVJbu5TFFRHKy+08Ij0dogPJYLZBdVaEPxcTw5stpA8cS4vpNN8d
         nNmD42tSHKMJL3wnOjRh5QThohCOvgm2u6WP6n9QKZfhqhcorhSmo7SGNWMNpa154BFJ
         MCpQ==
X-Gm-Message-State: AOAM533fCHgkiSAMcDlEd5/qC92egMtybqrjsPJTGh9OptMoCCahOjEM
        vLU8lbwr7qVYz3sdJe4HRPQURA==
X-Google-Smtp-Source: ABdhPJy+O9TCor1YYjDT1vPpSOc3rLR+SybCootz5q6qINXbs623zAq/NPoBXcSDtFn6O6eD3oRHSQ==
X-Received: by 2002:ac2:4881:: with SMTP id x1mr1621731lfc.162.1598021075745;
        Fri, 21 Aug 2020 07:44:35 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:35 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 7/7] soc: ti: pruss: Enable support for ICSSG subsystems on K3 J721E SoCs
Date:   Fri, 21 Aug 2020 16:42:44 +0200
Message-Id: <1598020964-29877-8-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 J721E family of SoCs have a revised version of the PRU-ICSS (ICSSG)
processor subsystem present on K3 AM65x SoCs. These SoCs contain typically
two ICSSG instances named ICSSG0 and ICSSG1. The two ICSSGs are identical
to each other for the most part with minor SoC integration differences and
capabilities. The ICSSG1 supports slightly enhanced features like SGMII
mode Ethernet, while the ICSSG0 instance is limited to MII mode only.

There is no change in the Interrupt Controller w.r.t AM65x. All other
integration aspects are very similar to the ICSSGs on AM65x SoCs.

The existing pruss platform driver has been updated to support these new
ICSSG instances through new J721E specific compatibles.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
 - New patch which was not present in v1.
---
 drivers/soc/ti/pruss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index ccc9783..37df543 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -164,6 +164,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am5728-pruss" },
 	{ .compatible = "ti,k2g-pruss" },
 	{ .compatible = "ti,am654-icssg" },
+	{ .compatible = "ti,j721e-icssg" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

