Return-Path: <linux-omap+bounces-2016-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F0B95F53D
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 17:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67F9FB21704
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 15:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67884193061;
	Mon, 26 Aug 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R2z2VeFX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6903C17
	for <linux-omap@vger.kernel.org>; Mon, 26 Aug 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686582; cv=none; b=bpxiQJIT/PfJTrvGBxJLbDsM+cYZdOxhMTuPFocsMsBlDL78SbRwoquAccc/JLkHR14GCDjirs2Mt2QeluqgUZdcEA1tgJnQZKHf21YJSM5AFCOUIXKC0RR19PSiUQL3vezoCxKRQoXgiWDHYz0BUnC7KQpMtqyABRErVhf7Yms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686582; c=relaxed/simple;
	bh=H/wPKvUXk3R2KA9yNeUxfOeqIe9r87SxPUQbHN9UFq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=btTq4HxzXkDkbOITJj4oVZb2t5Uay/L2Tpbk2jjqgqAyk4PzPSdEJqi+WQDz2itO01Qx6BTsqTDfOs3fyteFZ/WZgYa1KGGpufGWlfauhunjxPixU8DXLrkb5jcgM4dXGbwvGMobUdp0pUFUyvSlx7I/VIVGyHqrYL0HRaz9DpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R2z2VeFX; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2704b6a6fe6so3278425fac.1
        for <linux-omap@vger.kernel.org>; Mon, 26 Aug 2024 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724686578; x=1725291378; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8paq11lau0AGq3N4ibielyErO1Qy9yYsKM6UQc5T7m0=;
        b=R2z2VeFXHpH1ukQ1HaPFyQS5uG7kGP8VFNfd8nA2BH9ze5lsoYaQCet8//OUeJa2aL
         6tciTOxK+48Rpgu5HVsAMkldfYwx4BU5h8EWFkb+XHLHj5AtEcRI5CWlIzQR7NwisH5c
         AYsoshMw3vz7AvP4yL2BirKVDuBwYwB1yTNHywX3Af9p59PfdyEKAQm+IuuxHMgUQde/
         88IXsk+z8dpQ/vbDsk38pRzUhrn0Gqtcy+/agGmmmDGMiz1rgjHNFSlSWI+qOPlCrWNa
         XtT2LMva26mPZYNDDrMO4zBd+/vGumR3ivLWn+u0tJhrR+gw4JGFxa8o8q/4wnXn/e7y
         Miyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686578; x=1725291378;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8paq11lau0AGq3N4ibielyErO1Qy9yYsKM6UQc5T7m0=;
        b=RF7MH8PaUPxZp8KwIoLRarhe0othz/YkFexo1pPLVNGQTbLB2S1xkxQ0AMMM+TRejG
         y8Ntva+zvKPDZFQvgfOJrPG4HB59D3/wObsGyi42emapi9wyL9ttK+uGXtTfkd8RVD2q
         M4B2NqaeWmOH0OKbpcq2vx1Di7a+MVJAKcr3CaiU9FGZF6i7apr+mzH2LjVY6puDpUSZ
         6Sul78qR0PVpbaEFD41Gha2dbYE1nm46ZwkHg5G3Wv7YuhxoOyHzh1jvoS0Qzaa2I68R
         HWQhZDR9hBte8x21RSgC992IlhlhjJ9riWV6nLMkEa9cW/eWFox3lQZDgVpbLR0RWxrm
         hxyA==
X-Forwarded-Encrypted: i=1; AJvYcCVpuX11AK59jxkN+WsqKWMxDDpges5NCw/BJnYIrdyI5L9Yq77wkRLpcSJiU6tj24/x9os2aM/vUFO5@vger.kernel.org
X-Gm-Message-State: AOJu0YzzV0CzDaIUcm6d3gfKv99sIUAH0/Q7OdtyIGnMG/fo0GbmnsGW
	AEihlvttGlBjzBH5s63pLyVvQWRXqyHgsIDgMunO8XTJaTs1frkkChqNJQLZt0Q=
X-Google-Smtp-Source: AGHT+IELakByaVIpYO50hKRKe3IJ2sU7ak5lAEs6hF++oVE7ipTq0I7RvmMG1/ES4KMrEw4rGLjx1A==
X-Received: by 2002:a05:6871:547:b0:261:908:5899 with SMTP id 586e51a60fabf-27759d110a1mr36958fac.10.1724686578558;
        Mon, 26 Aug 2024 08:36:18 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-273ce9969besm2514690fac.7.2024.08.26.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:36:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 26 Aug 2024 10:35:29 -0500
Subject: [PATCH] clk: ti: dra7-atl: fix leak of of_nodes
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-clk-fix-leak-v1-1-f55418a13aa6@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMCgzGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMz3eScbN20zArdnNTEbN0kUxPzZAtzYyPDRCMloJaColSgHNi46Nj
 aWgBllqWIXgAAAA==
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.1

This fix leaking the of_node references in of_dra7_atl_clk_probe().

The docs for of_parse_phandle_with_args() say that the caller must call
of_node_put() on the returned node. This adds the missing of_node_put()
to fix the leak.

Fixes: 9ac33b0ce81f ("CLK: TI: Driver for DRA7 ATL (Audio Tracking Logic)")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/clk/ti/clk-dra7-atl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index d964e3affd42..0eab7f3e2eab 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -240,6 +240,7 @@ static int of_dra7_atl_clk_probe(struct platform_device *pdev)
 		}
 
 		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to get atl clock %d from provider\n",
 			       __func__, i);

---
base-commit: 1ca4237ad9ce29b0c66fe87862f1da54ac56a1e8
change-id: 20240826-clk-fix-leak-b547c87321a2

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


