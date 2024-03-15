Return-Path: <linux-omap+bounces-896-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BF87D762
	for <lists+linux-omap@lfdr.de>; Sat, 16 Mar 2024 00:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67C01C2142E
	for <lists+linux-omap@lfdr.de>; Fri, 15 Mar 2024 23:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17EA5A799;
	Fri, 15 Mar 2024 23:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="QNZZoOmg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABB5A0E7
	for <linux-omap@vger.kernel.org>; Fri, 15 Mar 2024 23:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710546293; cv=none; b=TIAXndpa+5F1fWcYLcHX3lVPSq+6JJdMODjYnfm+byHeZMkx5VQbmI17wHcp1SP1/2lYLMJPegrFh5xSj+9/L3tlroym9GksTU6FRClagcKmRAnmfA2biYsO9JXtrS35u3oE9ft8gSHUzCtELeOwqBbZjLbmhdQ68SPnR1YTw8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710546293; c=relaxed/simple;
	bh=MmM47lInEbxUE+Xs0ZvIBvo1dAR3CChJVvovySqI22A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6V5O+6nbEoteO93BKIy7kv0MAKoWSHkiSriLQ/9rZaApp+J6819oo2SXGbtHJntLqnjZXDPXTtEIkDmfP1Sw8RG7tIzECBJd6CfxJ/HCu3Ak7I8MXgwFbB17Cg1taacvm0VELHGUAjH9HWIltstwGsoPvYr16+TfV0vCnh40+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=QNZZoOmg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-414006a0115so11964925e9.3
        for <linux-omap@vger.kernel.org>; Fri, 15 Mar 2024 16:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710546288; x=1711151088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVmxbXF18KhLtCJxujdzruV9hT1pxQUGaGhkgdeENs8=;
        b=QNZZoOmgrapgf1HRw7TXhzcO9xw3ByQWqR51q+soT6BqR4G1Xpx0qOtk8y/owJcRQs
         XaMpD3+mz4XRA3UW7fcMlIuLeYjz3joNaC93xMuFAsuL8AYu4zWT35LKWsCDmWPsoJYj
         oK/wvSjJKerVgge6oLFHcVNL9UbqN55w1s5r+FuFb50tZdJAUMhDYeEg6MTXFAMkNQTR
         NsDFkhODAmRH8G5Km1dnzU0eHxEhQjHqxZFe7wctLzzWzcJtpY7tCYIUDgxNi7LYd9Ag
         FwGoRiCdDpyXnfB+ZVx6kmes3SLfr2Mx6K6mOr1LYHPegv54pyTymiWaHqTeRqyg32Yq
         hp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710546288; x=1711151088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVmxbXF18KhLtCJxujdzruV9hT1pxQUGaGhkgdeENs8=;
        b=JRiMmi6UcohJL9fK3OB+wzAU/OnJ4Gmto+v/BQbsl8AV+bfdWWmbzt1Z8+tNP89aoA
         HB3awQNW5/vecFqIz60Xy4ko9QqGo3KiYgI4vmjd3uR6vFsLL4d43TctFMYATD/aP5rs
         g2Vvs95fJ0idBR1lyN0HzFmsTsIU2qfEQlULhjQAAvhnTY4hzzHOhBy9d9U+cy8nS0Jq
         xTKK0RPTGiLlBGzcxaxap151hPwpxNsnXZKr19Tl7mj6LgCJaLcXuWvnr8TxxQ0dDlTb
         ikVAhBbBsY6FzFdINep5O2ZtvLttOR1tRuMJVADleqXcW754sdmSj7r2+YWGU4hjyYd7
         6WsQ==
X-Gm-Message-State: AOJu0YxitpJpAcY0gqUNfacbPZNTxOY3KwD4aWMxP3Cod6ER7aa6j2GE
	+zxQ2lk1QqRxQtaNSZJu4LtBdvgaaE6JMiD5h1sWzj9efFSdiicQvj+XWVJJcpaaWA/lc+gGV3L
	5
X-Google-Smtp-Source: AGHT+IGkUKbH9dcDV0TFp+qGZCLNv8sEMp/V5fl/wA3PdB+ddlfhzVfSdudzvyJlDhc2N493tjsIOw==
X-Received: by 2002:a05:600c:458f:b0:412:e59e:da2c with SMTP id r15-20020a05600c458f00b00412e59eda2cmr412790wmo.37.1710546287986;
        Fri, 15 Mar 2024 16:44:47 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id by1-20020a056000098100b0033e18421618sm556093wrb.17.2024.03.15.16.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 16:44:47 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org
Cc: vigneshr@ti.com,
	adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org,
	tony@atomide.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH] mmc: sdhci-omap: re-tuning is needed after a pm transition to support emmc HS200 mode
Date: Sat, 16 Mar 2024 00:44:44 +0100
Message-ID: <20240315234444.816978-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

"PM runtime functions" has been added in sdhci-omap driver in 5.16
f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions") along
with "card power off and enable aggressive PM" 3edf588e7fe0
("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM").

Since then, the sdhci-omap driver doesn't work using mmc-hs200 mode
due to the tuning values being lost during a pm transition.
See the report on the linux-omap mailing list [1].

As for the sdhci_am654 driver, request a new tuning sequence before
suspend (sdhci_omap_runtime_suspend()), othwerwise the device will
thigger cache flush errors:

  mmc1: cache flush error -110 (ETIMEDOUT)
  mmc1: error -110 doing aggressive suspend

followed by I/O errors produced by fdisk -l /dev/mmcblk1boot1:

  I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
  prio class 2
  I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
  prio class 2
  I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
  prio class 2
  Buffer I/O error on dev mmcblk1boot1, logical block 8048, async page read
  I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
  prio class 2
  Buffer I/O error on dev mmcblk1boot0, logical block 8048, async page read

Don't re-tune if auto retuning is supported in HW (when SDHCI_TUNING_MODE_3
is available).

[1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr

Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 drivers/mmc/host/sdhci-omap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index e78faef67d7a..94076b095571 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1439,6 +1439,9 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
+	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
+		mmc_retune_needed(host->mmc);
+
 	if (omap_host->con != -EINVAL)
 		sdhci_runtime_suspend_host(host);
 
-- 
2.43.2


