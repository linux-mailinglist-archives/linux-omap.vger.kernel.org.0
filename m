Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95381159E22
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgBLAk2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:28 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45514 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgBLAk1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:27 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so248858lfa.12
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=brE3/g7u0N/gg2OgUxbSqylt9cNqdnoOIHKUd4Jqf/I=;
        b=aUPEiqJkISxLDvjpf3W2bPilp4oLV1bN0j7U/z/pSsTs8ADP3MhrmBZ9ZqhBLdktug
         oc5O/08eOSIqGfnJLCqBzkPj9k7pHITjd0WveqVhUx92RP4fP36iTF7SewsKAZbHo8eg
         1Rmq6GSA9P1kfN5jQ6VTjSIvgnfmVNOkM6BI0VqJn+I3sOqIMloRVorlSjOMxQpfibfF
         pzbuBM5fKGQsdrOlovubVn/nLSzXkpZ1oFL9BGEaLM2SY3BWJH3wpzH4GnVE7snPOkED
         R8WiRvn5ll2wkCPeGklOt+tv1I948ov7R1zvoia5vIftzHh25c57BrVVieqHhNwsHh77
         DYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=brE3/g7u0N/gg2OgUxbSqylt9cNqdnoOIHKUd4Jqf/I=;
        b=eytFg2RNFKWFIyTAs4emsIe0Vchw4V6gQg1zTNWVMi2ksko+VMI2iCSyMtu1SpIb3v
         Z0mp73tkTJNDRt+6DPrG1Zbqk0CL7WTXxLX1ZsyQtYXx1Frg9y6CYvRSj5wxtOKGa7BC
         U8bGnpL7H4pDFBxnlv01EVIEUJI1bIkLTinRK+U/ld9C45GwQksjKRINj+g4hCMw5U0e
         CJ3xzn4lecAN3SmPXS9fyGr3PY63ucYGZau9m7YiC4/77WbEGEZZnvSxHQkjiFAqOGD+
         U81bpBHWQHgww/tbf2ssy1FvYfAgdJSRrT6td0QQsrIAxp0OVzRtIo1acoDGrps8sJp8
         hfFQ==
X-Gm-Message-State: APjAAAVsZ1FocLy7d34LUVRhxFGEW/NVGp0WSjzJHtomHr50XBN8UjEK
        fGV9GKpsFAxAyBVEu5pFBHE=
X-Google-Smtp-Source: APXvYqywmdJL4ETEOowYVGw711/cu1ENWKG7wwEqkKKOXa2c0GrDEFSOpOtQ6O6KBhMLMU76YfQIFQ==
X-Received: by 2002:a19:740a:: with SMTP id v10mr5014210lfe.65.1581468025589;
        Tue, 11 Feb 2020 16:40:25 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:25 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 10/14] mtd: rawnand: ams-delta: Add module device tables
Date:   Wed, 12 Feb 2020 01:39:25 +0100
Message-Id: <20200212003929.6682-11-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for merging the driver with "gpio-nand", introduce
module device tables where new device models can be accommodated as
soon as respective support is added.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 0c88e94e9b71..9857ce25debf 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -370,11 +370,29 @@ static int ams_delta_cleanup(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id gpio_nand_of_id_table[] = {
+	{
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, gpio_nand_of_id_table);
+
+static const struct platform_device_id gpio_nand_plat_id_table[] = {
+	{
+		.name	= "ams-delta-nand",
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, gpio_nand_plat_id_table);
+
 static struct platform_driver ams_delta_nand_driver = {
 	.probe		= ams_delta_init,
 	.remove		= ams_delta_cleanup,
+	.id_table	= gpio_nand_plat_id_table,
 	.driver		= {
 		.name	= "ams-delta-nand",
+		.of_match_table = of_match_ptr(gpio_nand_of_id_table),
 	},
 };
 
-- 
2.24.1

