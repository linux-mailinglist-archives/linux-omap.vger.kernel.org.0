Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2004DAA88C
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 18:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbfIEQTa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 12:19:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44093 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388164AbfIEQSM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Sep 2019 12:18:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so2054383pfn.11
        for <linux-omap@vger.kernel.org>; Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
        b=Esj7f4QN25ld+Ovd4UPXhi2gSS9+Lzc1VVLMSaLedss00TUu/574n7510/KARXCZI3
         7W6vE5cd7uARf9ipf0Ags1oPwG3CFAYVMe29Tybo5a64c/5svbgUNtDOdTUTjtzJgzsk
         BBVG0AUZqbY2eMEesm9XN02filAWjn0hrxTZtIA6mzGsPfn9CVvXwJMErc9ztNrFDZlQ
         hSJdg6l4K5XNAYyr1Od0KnturBe85nLy/GTao8rjSvtfT1nPC/0vFWd+7bbID+jHlLNF
         uVWRzrdTujIrO+oTLdms5SAw0eB7uKDL1CNjQPdxf+8SUROE+hX1TvIpDFBHgWNZSiuB
         ++TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
        b=W/82bCYowM68h/0+Q5OWpSHKKSyoZqPMT1SU5PD3DAtARAVULA2f+jnAeWbtYesuWe
         FljWeQ8BYnxSKQvSe1qEyWWyl+k+upEj7edV/I0yTJYJ/r/jfQXF3hSixEE1R2XmivnX
         NONTDzcefcDgJVmGwsVVFkWxYl/NUVNSp+GN8uf7LLjc+G9fuP8GAjr2eiuCiMNCriWc
         fy8qm8MopXsmL5Fgax4J2G9v7wDXZ/Eo0Q6F2Sj7Jld6IM0cjg+FEeNBwXQXud4pwh4O
         6eLmCiVRKEOcnL4RdjTf020RC6Eb/ta92dDW+ekAeZWd2B7/ac3Hm/OJycptfhNC19YH
         jdNg==
X-Gm-Message-State: APjAAAWp4XX6sy98J+VVLaXTVQZ4HoLliIyCt7KxrmWVlcuhrnBlPgrh
        SqKagXuMd8MWNonX97UVilAAQA==
X-Google-Smtp-Source: APXvYqxNw7e1zU8HXSUIIVJJi/ZzjnAKR5k1wwrrYFe2F5hAHe78MAzfLAz3iUKxFfZDzG3VAqGKEA==
X-Received: by 2002:a63:5f01:: with SMTP id t1mr3605020pgb.200.1567700292199;
        Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:11 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 09/18] misc: pci_endpoint_test: Prevent some integer overflows
Date:   Thu,  5 Sep 2019 10:17:50 -0600
Message-Id: <20190905161759.28036-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

commit 378f79cab12b669928f3a4037f023837ead2ce0c upstream

"size + max" can have an arithmetic overflow when we're allocating:

	orig_src_addr = dma_alloc_coherent(dev, size + alignment, ...

I've added a few checks to prevent that.

Fixes: 13107c60681f ("misc: pci_endpoint_test: Add support to provide aligned buffer addresses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/misc/pci_endpoint_test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 9849bf183299..504fa680825d 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -226,6 +226,9 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	u32 src_crc32;
 	u32 dst_crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_src_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_src_phys_addr, GFP_KERNEL);
 	if (!orig_src_addr) {
@@ -311,6 +314,9 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test, size_t size)
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
@@ -369,6 +375,9 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test, size_t size)
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-- 
2.17.1

