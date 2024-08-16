Return-Path: <linux-omap+bounces-1916-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3195437F
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 09:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2771C21942
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 07:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C747BAF4;
	Fri, 16 Aug 2024 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XS8p9N88"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99F770FB
	for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2024 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794858; cv=none; b=u07aDlEgbzhsgCW7QtwcJfnDcQ9YFFI3Qxjme4MyBcuWLSTlRuJOrZUvobYD3uORGAkjzI3pRoYFWIHA7l1hvlKAq6TOONENgU2aoacQ9czPlpkHu14+7ROY5cWn+j94lPqXIxEIUVSbuVwfXwpDsFZJU9LeN1mlQY4mnIRdaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794858; c=relaxed/simple;
	bh=29i/Me7OBdCQHNsyp4wD7LL65eIiAwGoh7GQQszBp8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fmjrt3g/Y5mkPtiW7Ziditb83BcncJQsp7auL6fJcYV6i4WZCMUQC8UsIsPwZXklqbuTjCUx7J5kgvw0cwRaYYElKFgAcFCP7HRRpGdLc2nP/LpDzUsR08h7JYtWedZ2YZEYT1DElgkG8rUn/2drtlj7eYwYtmCwLsaKjc7CSz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XS8p9N88; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37182eee02dso819848f8f.1
        for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2024 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794854; x=1724399654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tU3SngOTRZWMK6BN/xX+yu9LBZ/E3yGuMgZAtpkguzo=;
        b=XS8p9N88nYpSpafKR5VNkJ0KlCs6bRKE/hBOKuOLVyQjFvNJlgzaWjmswgblf6g9Mn
         JEiVtG9E3Z2qDEHodkiikVQEsp95q91FY5mynueEeiGKnJPlJrOsUL2Vo8x8mf+KCD5+
         2rpQ/i+kw9f/67tynsFEt9KCP2GVBpRWsFxFO6yh1HfwZXq+FtR+72VPIrTKrO7sKx05
         b2wDBnDgKyuLPy/Ry2C9WesGAQD/JLjjOzXVi7iwq4bOITnm6joGDv+iZp2BdQrQ/u1V
         QsjZPD48A7zz5RPYkPMYmbgbxKS+dgz7HogGOmDQH+IoiMGC132iacY15t5to+VMBK9S
         0DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794854; x=1724399654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU3SngOTRZWMK6BN/xX+yu9LBZ/E3yGuMgZAtpkguzo=;
        b=HfGrN/X+M9w+WW4aYOljSnyghJPMw0j4TAiQKVfiub52W4mv3SjGFyn38q5FxnsNUV
         5gdSRKEZk3zAadDy/x+F8fQanCSrKyhyaWdOTYdMoAtuUz/+isaiVgwK2e5BCkRw7RTE
         wXSCD0718p+gjCPvEDPMEmLt2W2CGp1VnOQuqfmeaB1SY634k1Oc8bqGSh/+akvTl+/C
         cGgS8aUCDZVg6BipUbMWllVNaDP8KyGHTO5zX6oqP4juWA9NuziwrrdWRWwN4CDg8iH9
         l2tWYmQHmnKCs31g0gq6RtqXZmTadAqak395UUvYciTouzVRZw8wXtVvvpLPONySnKEW
         M8xA==
X-Forwarded-Encrypted: i=1; AJvYcCVND24qOEcWVTAVyF7oiNwHJ6tDX0ySPGbBQrKBSmYtdDHs0vREz2zAyLqeat2sUH3B/Lqd1nTYTJIr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoby4nmT4Fsk0jXzxR8j3+gw4XZEm1H5IM5sWn41uQEa+evBWg
	q5R6RqF0JvZZFzGAIsYUNHuUmb4sBokGvg7zj4tvEAOeN9xiJKCxPj315U2OfF0=
X-Google-Smtp-Source: AGHT+IEqEG4Bzu7IHX7pi9rFGKS2JnZDvCN4JyxP3fZbBWB8dkTAP9Pd/d8ezaB2qKeYO7fLJBnoqg==
X-Received: by 2002:adf:f9ce:0:b0:371:939e:9855 with SMTP id ffacd0b85a97d-37194bf6970mr1133066f8f.21.1723794853685;
        Fri, 16 Aug 2024 00:54:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189863109sm3049587f8f.65.2024.08.16.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:54:13 -0700 (PDT)
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
Subject: [PATCH v2 1/2] usb: dwc3: omap: add missing depopulate in probe error path
Date: Fri, 16 Aug 2024 09:54:08 +0200
Message-ID: <20240816075409.23080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depopulate device in probe error paths to fix leak of children
resources.

Fixes: ee249b455494 ("usb: dwc3: omap: remove IRQ_NOAUTOEN used with shared irq")
Cc: stable@vger.kernel.org
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Ack
---
 drivers/usb/dwc3/dwc3-omap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index d5c77db4daa9..2a11fc0ee84f 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -522,11 +522,13 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to request IRQ #%d --> %d\n",
 			omap->irq, ret);
-		goto err1;
+		goto err2;
 	}
 	dwc3_omap_enable_irqs(omap);
 	return 0;
 
+err2:
+	of_platform_depopulate(dev);
 err1:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-- 
2.43.0


