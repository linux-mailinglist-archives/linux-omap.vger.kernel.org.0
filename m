Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5848E4F013C
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 13:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243884AbiDBLp7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 07:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbiDBLp7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 07:45:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C3310240E;
        Sat,  2 Apr 2022 04:44:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id g24so7028765lja.7;
        Sat, 02 Apr 2022 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK+bAzchihkNx5o6wUd4ePW64qHQoy1M/7fPsyxS4r8=;
        b=ZSxaog/aSPOhLkEsbBwZz2yfw4oGtMjs7gS7d+cWr9E9BOyBR1CmcctL7KVnKhPAu/
         pBmPBDlI824079KSeOzcZMzGu0h+5G0CYyiHVNfBsHhXqWoTUBQtyZgJdd0K9NUTMy69
         2W7MkYMQSGULiiEMAOgJqsTGPJUXc/OpbNqC0ID7n09Wu9RibfempUMfwlt70DtU4Rcf
         zxk7vuTSMDwY/orrDSF+Cxqf9mQF11biQyTwtyyGFFvookm8xh/ggYsWmQzylZuSTdxJ
         L4IzGP33V8GOp79XgGG40u2G9xCLvZqpIxb6JNlZGyWCyMLr9+kjUvSRGSGiyRRAu8Ns
         w6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK+bAzchihkNx5o6wUd4ePW64qHQoy1M/7fPsyxS4r8=;
        b=1u6nTqAMhBVzir5Qr1Ur+dnX0VgFaMr747z6Q1AcWxprzqIs2m6ygWgOlZFZTTh6Oj
         grIjTBovmIL5wcugXKY9v2JHiBmckYZUuwae/xPe7UXuMoYM290liIR+dgoNqj+7TlVr
         JY/jWwGRwlflwwUnoU+awKewDj2nb0rrNMQycunVFAcMZdlqTzc3ooOpwRkJ45Jmn3/1
         c0XjJqMQMztUTDFZvyXQKnbXKJSuAmqoRba4BuqKZEvWRIvelvYxy2kCtzZngRZFnH+5
         gWpMi+38JxfLaFsQtxCe/qLSsXMPRMZeQzL4dNpYo5Boq+kySqTtEbL4d9PTeWHk8uhT
         Odww==
X-Gm-Message-State: AOAM531yq91TEl7BycPbKaXLH60cacOqRs5GnMYzD3PgKKTwrV6/s2tx
        CYGX7kuiph3MsStp6uDgmGY=
X-Google-Smtp-Source: ABdhPJyHo1/LhYBh09lbzxjQKqqdsvlO52BgPOarHxuh3Kpp86TNk6ZkFt6WDZBQLewskcaMgr0mEA==
X-Received: by 2002:a2e:a554:0:b0:249:8dd1:9da9 with SMTP id e20-20020a2ea554000000b002498dd19da9mr15976073ljn.341.1648899845810;
        Sat, 02 Apr 2022 04:44:05 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id h21-20020a0565123c9500b0044a34642bf4sm505947lfv.7.2022.04.02.04.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:44:05 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] usb: host: ohci-omap: Make it CCF clk API compatible
Date:   Sat,  2 Apr 2022 13:43:53 +0200
Message-Id: <20220402114353.130775-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/usb/host/ohci-omap.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 45dcf8292072..2ab2e089a2b7 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -281,6 +281,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		goto err_put_hcd;
 	}
 
+	retval = clk_prepare(priv->usb_host_ck);
+	if (retval)
+		goto err_put_host_ck;
+
 	if (!cpu_is_omap15xx())
 		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
 	else
@@ -288,13 +292,17 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 
 	if (IS_ERR(priv->usb_dc_ck)) {
 		retval = PTR_ERR(priv->usb_dc_ck);
-		goto err_put_host_ck;
+		goto err_unprepare_host_ck;
 	}
 
+	retval = clk_prepare(priv->usb_dc_ck);
+	if (retval)
+		goto err_put_dc_ck;
+
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		retval = -EBUSY;
-		goto err_put_dc_ck;
+		goto err_unprepare_dc_ck;
 	}
 
 	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
@@ -319,8 +327,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	iounmap(hcd->regs);
 err2:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+err_unprepare_dc_ck:
+	clk_unprepare(priv->usb_dc_ck);
 err_put_dc_ck:
 	clk_put(priv->usb_dc_ck);
+err_unprepare_host_ck:
+	clk_unprepare(priv->usb_host_ck);
 err_put_host_ck:
 	clk_put(priv->usb_host_ck);
 err_put_hcd:
@@ -355,7 +367,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 	}
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+	clk_unprepare(priv->usb_dc_ck);
 	clk_put(priv->usb_dc_ck);
+	clk_unprepare(priv->usb_host_ck);
 	clk_put(priv->usb_host_ck);
 	usb_put_hcd(hcd);
 	return 0;
-- 
2.35.1

