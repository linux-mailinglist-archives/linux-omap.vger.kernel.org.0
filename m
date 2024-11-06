Return-Path: <linux-omap+bounces-2599-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02D9BF954
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 23:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DF872836FE
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 22:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007101DE2BE;
	Wed,  6 Nov 2024 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTFp2B/n"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6E1917F3;
	Wed,  6 Nov 2024 22:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730932411; cv=none; b=AykiMEMcJWGUGlBX+XP6PAXXi81wasPp/O3FijzBQM7diRz270KzebZhOV0OJ3t7fPdpbeu2XixIWC2+DmWRE5J3ar9t0AYPk1V5PaP2uiBMjqY3sopW4CH9udLudQevVgTzRieggGF/JNffKQyYaXRAG5WBOpw4zhlHHqTAudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730932411; c=relaxed/simple;
	bh=HE6mLBEfL9/a/Tos4dsBa1PexW2n6zo9dCQ35lR2vxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xnch2+G+4g4l8FyTSc8r9aCKpTqk6m9kQgDZPvZJAXWnRSST8Nv0sBZK5+fe/CuirAaVkTPIHY0cvu1dx9BAJkxgPH5Fto8rO8v2V3QS5B7kRoiho0MiutWmCQ1XvuFG18mHy8FvmA+uLP6eV/S2PA+quq37Yol2zUFibUIJNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTFp2B/n; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ceb75f9631so324350a12.0;
        Wed, 06 Nov 2024 14:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730932408; x=1731537208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjdktaingbKjbzf7rvf5GYXibzi7dkr6hz91zrQh0oU=;
        b=BTFp2B/nwkJ6hIEQECvZOX4kFXYyClUPJQXKQU8+WdLKJOhbdmOIeXUNGzrzoYL2Bo
         3Ok53p7KUsCbgjAoVkDOPgAAmLThrrDjg4BItRwL9YQO+Z5PZmS7d01Vtt3V2Iy4BW1Y
         59G6NtXuTKzNSu2yVfcm42TF5Byx0Qm+Otp9coraDzLyenJbUAzunAKRWGR48sq3+078
         goe7L7gGD/cDZaDPn8AHq5uvngG99DmOWwi2YuserL7CrVwa9plM0bQzb5lVxGhhcDk3
         IkOFSthLf0VDGbkFHdzFc5MoKrqqXiiRPGgpbS2JSWwNv1/wrEVUMWcjgi044DMRp8Nn
         RqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730932408; x=1731537208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjdktaingbKjbzf7rvf5GYXibzi7dkr6hz91zrQh0oU=;
        b=a2NmUvrV/V2LqCo0nTVFO/3LdLWgSsL47MKmTvLbdT5+O1LlkCvo5l//noI3QIhdNk
         fq8iepU6g8XHV+A7dQ7Ov5HSG3lnUhfUFM8Nbq19UOYasmZ5gteXN7wipr6e5Yonfuq/
         3vGwtoAwlmIQ/b0bHFD48SnuTa4XzEWUaETzQZ/GZTyr1aXM2MPsmcKnsGqyadXRYS6G
         q/60HXe4tzAzaev4VsJ2hnRDWiovrtRhr8vNNENN1fSGr73y1tyNNfdGV7dUiDjsxlDv
         RG3oi6EwBCe57ykDeEy4KQ0pGwQ43PW4fYYRe/nMQ464o/MESn27S+ywX//w9lwXFl23
         MxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXYsp+bh/gV54w0qrH+PO76he72kPOkv6cfHLmq5wDG404BNbOV+vRJdtSCeN4C/wU+Vtjxa32zj96V2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcAXbF3uy0kEah0K0VHR1a1RSnYoyX9us0YmGEnv7ikUyi/gVD
	lBduiyoX266clZTIXWF1PE25HWYVBQhveh4aW8RjySIimQ5D5Gzc
X-Google-Smtp-Source: AGHT+IGvLOT/ichZgOVIzA98EEQUV1NYypdLkCudLg8tXw4KKiAwP9oQsMz7M7vMO5P05oIPeUL11w==
X-Received: by 2002:a05:6402:2114:b0:5ce:fa33:6c4c with SMTP id 4fb4d7f45d1cf-5cefa336cd2mr2075840a12.19.1730932408082;
        Wed, 06 Nov 2024 14:33:28 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe46csm3295568a12.56.2024.11.06.14.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:33:26 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	lee@kernel.org,
	karprzy7@gmail.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in usbtll_omap_probe
Date: Wed,  6 Nov 2024 23:33:24 +0100
Message-Id: <20241106223324.479341-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_prepare() is called in usbtll_omap_probe to fill clk array.
Return code is not checked, leaving possible error condition unhandled.

Added variable to hold return value from clk_prepare() and return statement
when it's not successful.

Found in coverity scan, CID 1594680

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/mfd/omap-usb-tll.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 0f7fdb99c809..28446b082c85 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 	struct device				*dev =  &pdev->dev;
 	struct usbtll_omap			*tll;
 	void __iomem				*base;
-	int					i, nch, ver;
+	int					i, nch, ver, err;
 
 	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
 
@@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 		if (IS_ERR(tll->ch_clk[i]))
 			dev_dbg(dev, "can't get clock : %s\n", clkname);
 		else
-			clk_prepare(tll->ch_clk[i]);
+			err = clk_prepare(tll->ch_clk[i]);
+			if (err) {
+				dev_err(dev, "Unable to prepare clock\n");
+				return err;
+	}
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.34.1


