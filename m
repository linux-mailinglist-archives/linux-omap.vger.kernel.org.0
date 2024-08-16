Return-Path: <linux-omap+bounces-1917-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDAD954385
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 09:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F66B2822C6
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 07:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F10712E1CA;
	Fri, 16 Aug 2024 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mQsA+kPI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0684E1E
	for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2024 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794859; cv=none; b=ToFjL4C+muyghchZwk0n0S3XvthBvKXpzyJEJ8nBF+XYEEDtbJ/QlTgibbUSY9dE4tykFzfTzmyx4B6grjmhU2Y7xpg8kZ2o8+C3zhco+oVycaScQdERp8Z8/uS6eON7Vwt6Y852puFSUIzG1Ft94wxF4vfRoCWk/6QEZrzxiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794859; c=relaxed/simple;
	bh=fRFrl2xxLajW7BRlASDFQqs8x0H30DLVpH4SEKpcKME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtUspJLIE2t47lM8mBjCvv3Act7F0neRZ13ylgSN349XmYzL2bMk3KvUP4+Z0JIpUPg+p6QNai7hgKbWI4EkoYnst5p9EBXzPXwlZTbahWkkkz49pVZMt0zcH2JNSG3+l0MyjmUvZQUw9MtdU+p/popNVn0SGRS63TO/SDUw5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mQsA+kPI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37196c68073so144806f8f.0
        for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2024 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794855; x=1724399655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3rfqVHruVOGC2FYVz0rFlsxOciO54KGc2d/kghQsw0=;
        b=mQsA+kPI13RKBFLvR2K94Sea9cG9BePP8h6T3TdgDXuqxAi100wlm4+ixEsEkpk/cf
         l/zUU+JSnKgOtn15WiFfNQ6F0u6ZPZx4csdoWnSPAMwVg5UFI9eLpl1L6y49ZuBdV/zp
         iTMGkXzRhOHMcS2Rx1mwX9zy4TaoCRV4f1Z/UysAkt+fRmPTbrBDznOTCv/Isz5mWpwC
         cBpyswdLOlakwPJ+aZ/fI6yCb/cA2wMHnFqVm5CDaVwlIeRZFi42m94oWT8Bn+3Ihb0+
         JIzHNiUEqiX4U7Xfvo0jsqIDvZSyKV+4Xi3BW2bV2rKI2oL6I7vvi6K2GR5Cm8pL3UXN
         hkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794855; x=1724399655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3rfqVHruVOGC2FYVz0rFlsxOciO54KGc2d/kghQsw0=;
        b=UvB0AIL8VxMIRNif1fQiDov7mUqPKrkAPoIQFcth2oVKOxW3PnNMg8g+sUMHGTEGAC
         xex0pviv8jXn9GO2h4BRospRZ2Av+y2+zGxFaJnRouEWiS3kf2nZ5KAXTRKFvl+bmvVg
         govAYbWK+LkeyYn8rkhHXB3iVud7UhMVIfAx/aJS+pEpWDMxV8uE5syM+BLOzfmUqqC2
         tk8/i8muCcC+3kQcYbwBQr0z7AnV0Jo+w+ET7p8Owp4EDrqa7qFF3n6AZ/tSOM72l/R7
         AVU0/Z9X1PVAlMV9KvkUpNZjfnzmcQbR5db5uhdtg9hxITq8G7HIdgPld3Rl8GBSMqXw
         hLIw==
X-Forwarded-Encrypted: i=1; AJvYcCU8016xOWagTsFhfy5vFzWCvz3a5m5XR4Mx/zS1SywCOMDcZBaWmnK5510+0XyNbwSHSInXW71C4Vx0LySwRhtcqDDkyIDwPJuzMw==
X-Gm-Message-State: AOJu0YyijIoiSMugSTEoO9gCim5oZJZ2//Dh6etowkQiSbgrzyEVYamx
	pRVc7LPqiM78EdQgAufiMBJCGMPB82RMsi9P8RfgGEhKukZwg9VRePDTQ9e6wu0=
X-Google-Smtp-Source: AGHT+IELJsEIdJrzfxRlYTFmph//NPsFzW/KOkCn+6qANqNPjCBjFgoONw7BALUdqn6MkGE37+0afA==
X-Received: by 2002:a05:6000:dc4:b0:364:6c08:b9b2 with SMTP id ffacd0b85a97d-371946a3dabmr1036836f8f.45.1723794855161;
        Fri, 16 Aug 2024 00:54:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189863109sm3049587f8f.65.2024.08.16.00.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Vignesh R <vigneshr@ti.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: xilinx: add missing depopulate in probe error path
Date: Fri, 16 Aug 2024 09:54:09 +0200
Message-ID: <20240816075409.23080-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816075409.23080-1-krzysztof.kozlowski@linaro.org>
References: <20240816075409.23080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depopulate device in probe error paths to fix leak of children
resources.

Fixes: 53b5ff83d893 ("usb: dwc3: xilinx: improve error handling for PM APIs")
Cc: stable@vger.kernel.org
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add goto also on pm_runtime_resume_and_get() failure (Thinh)
2. Add Rb tag.
---
 drivers/usb/dwc3/dwc3-xilinx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index bb4d894c16e9..f1298b1b4f84 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -327,9 +327,14 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 		goto err_pm_set_suspended;
 
 	pm_suspend_ignore_children(dev, false);
-	return pm_runtime_resume_and_get(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err_pm_set_suspended;
+
+	return 0;
 
 err_pm_set_suspended:
+	of_platform_depopulate(dev);
 	pm_runtime_set_suspended(dev);
 
 err_clk_put:
-- 
2.43.0


