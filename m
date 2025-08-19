Return-Path: <linux-omap+bounces-4258-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C02B2BDA3
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24BD416EAA9
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF198311962;
	Tue, 19 Aug 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBLFkH2l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E026C39B
	for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596453; cv=none; b=D9m3hMATlf4vGTdbTSxNHBdx+Ny+Je/xjO3OMXTyDzrcFZDPprAF9Z+waebAd9ilUvXVXtkRWgBTDw481opoP6aXCFgpigPwZ4MFbBYyeksJKioRvYsYTM/lqRf8b79JbmN1YRFvMORMuyGgKyKAxkInSkQY/552tvtMHdhdDf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596453; c=relaxed/simple;
	bh=vDQ6sv4CI1XEeY6KKn5PmWXhWFLpuy/IbsCbzwNKGoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/tYC2AhZJPTXw67KADOcaNmRxMCH4HVWtW8aqvtxrFG2io9W79WrRiRpdqHf9mlICiGTLeTUmke5lVxXaWchQjJPx1a+9G55op+5+RpBC3XpSarDNT0tFDHNvsT4zU4tepABcb+0JUuVb58V3M+pWY8BVEwnIMf3HbbkSvsxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBLFkH2l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so38138655e9.1
        for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596450; x=1756201250; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYrVte0dUC6jFntJ2Z5yq1u0byPHu3c4Sgjim0w6WbU=;
        b=jBLFkH2lncK0oYLdiz+zkvISWkebxbuxkA9l6O1B8gh032j0FX8EZ7WnQLXcGpQOFH
         GDDSfv85MSSkcvRVabFi+VQ70740qn7me1T0jqDg/1lrPoLqgB6k7yDH4rJxHDVy2z0L
         96iy+k6oc2AJzYmwwWvI4zqVY4NE+dMwmfUF06w0lioJTWPcVfx98oI2QxPu35/bPhu8
         mgD48tlzcPfsnNxxINwE2ZLDA+MAOmQMD2lnsWPxfOs1RLGmgTRSjZycf/1Y59z6QGB3
         6sNHpRFLhETmQZ9DcStGjeXShX1DZ8yLQj2UIiltR+WDbXCmSwKWznvSGI+Fq2hERDQC
         3TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596450; x=1756201250;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYrVte0dUC6jFntJ2Z5yq1u0byPHu3c4Sgjim0w6WbU=;
        b=i2J2V2Wk9Z4/3yZJEiOc+AC2nluGzRJW6YAQmPOcHVXG7QBUvx8Nugh6YjDms637wX
         fF2Kt67eA7hrWPpJnCF4nui2SnYXRIvke6qc+Y3gjXj1KrOxGicGV+yPrOZ7AVyD54Xd
         CZM9Cp+jFNjH6ysBNEaeqaui8SN44L+SZAkBGv8uQM72HsAbVGPsSLn//rJL/o3iyPrh
         3bcLOKpMInWinAXAAUFkwyEVwYcFJx6khrxeqQcrL91OuHtGU/6v2IC29cqITiPH2TwE
         V13/kxlTw/ych6bj0JvMfqEC2T6rWeVjkCQ1+tvXFrXu3VsXXuVE8XR2H3eoP19EHgUK
         L85A==
X-Forwarded-Encrypted: i=1; AJvYcCVA+KbpcCE3zvj1KfS5zJ+2HL3sXnJ5yF82c5pnB0B3M0Xe5ok3NCiG9XhEYIphuHzeSItUtL1ri7Ig@vger.kernel.org
X-Gm-Message-State: AOJu0YxINL+I+u+hFs5dJifzlbp2Tnse/aL0mzcc1OOiuqP47V4LDwpG
	QzHcGXUAUn1mxd1QWbhUXVxUSIfrTdCYDAXfYLM2yrN95FGoaJVLTCRWcEg+QNb1mrs=
X-Gm-Gg: ASbGncsrXD3Wv9tdgOK7r4OBvQupkYp1LMcE7jfM7reZKV+W8AYcUqHGqY1cPiriCbg
	/7Of+IWAAlFYja5h8Q3koJY8DFo7bK3XatZRcdO5VaI3uzDi/ejDYZUz0HbKn/PK4eRlbrkK34h
	DtkFRsh164fVEsQr2ebPC7kl4lZL5QdYKzwfTieF0nDxoxx9SRgM5GQASxWn35SKPcBupu8gEsc
	2KFvkXA0emF/aLw+z8wuXlb6CO3hnWHShuZJcLhfO6rSxR/Uy2D6H7xx+iWpjmZjUuNlcDzySIM
	mQr1oUmXlFqfWnghn6cjXiw5mYgiJa0z/hmtUR/JOnug9hLjvHaLtklH93VriAJc1E5/8uWETnu
	ewBGTxTpz7jYyybClMjxs/UFG1PA=
X-Google-Smtp-Source: AGHT+IFeIOC78J3eSW8tZNbbpFmELZjsM5rbvzIym6l834NalJLewkysKiN5BeWd7Q9DHgnPdSL+tg==
X-Received: by 2002:a05:600c:c0d2:20b0:459:dfde:3324 with SMTP id 5b1f17b1804b1-45b442bf27emr8207155e9.29.1755596445141;
        Tue, 19 Aug 2025 02:40:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm201653985e9.1.2025.08.19.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:40:44 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:40:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: tps65219: regulator: tps65219: Fix error codes in
 probe()
Message-ID: <aKRGmVdbvT1HBvm8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
instead of "error".  The "rdev" pointer is valid at this point.

Also there is no need to print the error code in the error message
because dev_err_probe() already prints that.  So clean up the error
message a bit.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is a rebase of a patch I sent earlier:
https://lore.kernel.org/all/aB3hiEM0CB8m_X8m@stanley.mountain/
---
 drivers/regulator/tps65219-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 5e67fdc88f49..d77ca486879f 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,9 +454,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  irq_data);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	for (i = 0; i < pmic->dev_irq_size; ++i) {
@@ -477,9 +477,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  irq_data);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	return 0;
-- 
2.47.2


