Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0855A2B942E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 15:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgKSOJH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 09:09:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727512AbgKSOJH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 09:09:07 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCFDC061A04
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:06 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 11so6375288ljf.2
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l9kv5ypktfFS76EMW63e64X/f0uR7ySsDU39jrAiFDI=;
        b=Sa/D7qQ86p451smntmbeF/O/U1vvSz67zs6dJpuflYXT87tA+EWJ7DRu+8R+fAl9ss
         ewikoM1Tl2B3hTjNEIEqSFcccnQylCQ7A6YcjX66LOPWnddixrGEDup/IloxkAnIPuPC
         IALd8M8rmSx37qjG0lgxeTUGn0Y5z4OWTasKrA7kaNsh611ooX182poRQBRtc3Q6Zr9X
         M4+jejvwVNO/Xzd9/uPBxOSM4VrBDvuO8B8L3+McoggEaINxRD25UE3sTJCQ6YGjyayA
         CexueqEyubduZyWRB93DEW/MStD6UseQXIILA2jnjHSHgmO29rGz2OeJpdNkXUup3l0k
         Uvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l9kv5ypktfFS76EMW63e64X/f0uR7ySsDU39jrAiFDI=;
        b=qTf56cTYq4RB983j/D0CkjF1qsAdSRWDOfkBF85qOpshKVTLRfAA9Cbh0UzKjwWxxr
         zSptN7bmFck9tfXXHp+E50bOSdy/KN0eENWchS3kiR6tKKEmc+2s9JHdaXVj6nb5R/h/
         EPW5oNq2f/vl83Yy8ghVYLkz2P9EpOBiTqQAqqJ49tk6uGQcBjb8KmFvKWDqiIu6MSuT
         waxOhH0Cw3oQEE5+6Zdg/vsQt+/RwbMvH5LAfHjScuO/qsPDbyKjLbCRaEY68NczvDp/
         nRipGtdNvl5ZOBGCjFCQAT2Ev4UP+tcHIhN06Hs/qpApSafuJPhgAt541zdQwNM1XNTy
         ffHQ==
X-Gm-Message-State: AOAM531kDGAsVeElRQo/Odxo7YYyy4C/QprkNl1tRRzw9f0AU4j5FVIK
        bhdQEhG4SpHPO7+yEULSfhMSfA==
X-Google-Smtp-Source: ABdhPJyEXcpyMIeuyfkgMLGfjBSHpgtrtIm8t7Ab6zndFUE3w8Wp+K09U6mPyXOxgO3DfD6zVZbmhw==
X-Received: by 2002:a2e:98da:: with SMTP id s26mr6324722ljj.182.1605794945193;
        Thu, 19 Nov 2020 06:09:05 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h12sm4024706lfl.74.2020.11.19.06.09.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:09:04 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v2 6/6] remoteproc/pru: Add support for various PRU cores on K3 J721E SoCs
Date:   Thu, 19 Nov 2020 15:08:50 +0100
Message-Id: <20201119140850.12268-7-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 J721E family of SoCs have a revised version of the AM65x ICSSG IP
and contains two instances of this newer ICSSG IP. Each ICSSG processor
subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called RTUs,
and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).

Enhance the existing PRU remoteproc driver to support these new PRU
and RTU cores by using specific compatibles. The cores have the same
memory copying limitations as on AM65x, so reuses the custom memcpy
function within the driver's ELF loader implementation. The initial
names for the firmware images for each PRU core are retrieved from
DT nodes, and can be adjusted through sysfs if required.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 48c1c51e0d42..96f689283a8b 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -852,6 +852,9 @@ static const struct of_device_id pru_rproc_match[] = {
 	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
 	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
 	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
+	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.29.0

