Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26F12D77E5
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 15:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406251AbgLKOcJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 09:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406246AbgLKOcE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 09:32:04 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65609C061257
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:47 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y22so11075012ljn.9
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9s2KpvaYSw4t1bCR1j0Xjb/I6S5cN8m0t3IpN4+bDAo=;
        b=kJPwUO5UuwXNyW/ebEs5EvhbjUqSE88TXvhu4eiG8sLKbdu7OKM74z1RwuRjjeHkii
         qavyLXpEpZKdIcu70f4Qfh0M0ctJAaM2Er8ozd93xT7AbXsYrCIlID+8Bk9nI/5zVHQe
         D9e/6zcvjh27WV20GIAIP0a9PQVVyTo5v6udkGqE2v9GN+JqUgFS0+lAZlTr8qZO7Mnw
         eAXID3uJk+ncUCJ3iBAjVfZ3qlcT8OfOpVnXyEGlwDV52a2ztWeIcAle96h387AUQDmj
         zSVoLQLspaeJZc48LdZFKWGXrOy/1jwTK6I7vfAO0/pJ4PoQCMuQ/IdsTdeKD/v9Gf2g
         u/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9s2KpvaYSw4t1bCR1j0Xjb/I6S5cN8m0t3IpN4+bDAo=;
        b=T/4WgRfhXcDN6WYiz/YA8rV4JyJu1cYZp3tHAP0fhDIwG4vfksU4hNPEZgm+LsFu/W
         RsZv4/zFaRldAfW6V1axN4ILvyNoGrpkT1PWktnUfO2+dCI+czHLKbAJcWpjYbEDZnWr
         4prAnPRz5qftvQssKfVKvvIbgyuHhDRWTXwLf6fxP/wFU6XaCgS4lCg4r9Xog0zZ79gw
         O4F1YiX52vMSE3a93xRdbgpKmJXnxQzM976QRQpfbc+xtbX+zKvrowjjPDZKYp89Kahg
         1xCjbWFAQCRHyNbMz43V2TNu+c9oDxtJjUav6fznxwoC731y9tYnetrzoFG7NMhUb7Pf
         Q3aw==
X-Gm-Message-State: AOAM532/wXZLL4qLde8gjOowntmc4NWiAajUkVUDEAqBnviPQ6a0o/Sv
        JeahVPpYoi7Ylmp77rUo2kW7aA==
X-Google-Smtp-Source: ABdhPJxu2ieL2UMJe+yZjK0vuMFzKjPzYa/gKjQZ3NQtKKKDAMdQw0BwL0n2azu5GmmNfDNZBs1c7w==
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr5454185ljk.358.1607697045950;
        Fri, 11 Dec 2020 06:30:45 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:45 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 3/5] remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots
Date:   Fri, 11 Dec 2020 15:29:31 +0100
Message-Id: <20201211142933.25784-4-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRU remoteproc driver is not configured for 'auto-boot' by default,
and allows to be booted either by in-kernel PRU client drivers or by
userspace using the generic remoteproc sysfs interfaces. The sysfs
interfaces should not be permitted to change the remoteproc firmwares
or states when a PRU is being managed by an in-kernel client driver.
Use the newly introduced remoteproc generic 'deny_sysfs_ops' flag to
provide these restrictions by setting and clearing it appropriately
during the PRU acquire and release steps.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index cc2e585778b1..bfb53967edda 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -228,6 +228,7 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	}
 
 	pru->client_np = np;
+	rproc->deny_sysfs_ops = true;
 
 	mutex_unlock(&pru->lock);
 
@@ -258,6 +259,7 @@ void pru_rproc_put(struct rproc *rproc)
 
 	mutex_lock(&pru->lock);
 	pru->client_np = NULL;
+	rproc->deny_sysfs_ops = false;
 	mutex_unlock(&pru->lock);
 
 	put_device(&rproc->dev);
-- 
2.29.0

