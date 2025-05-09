Return-Path: <linux-omap+bounces-3686-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E609AB1179
	for <lists+linux-omap@lfdr.de>; Fri,  9 May 2025 13:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA48E1C05242
	for <lists+linux-omap@lfdr.de>; Fri,  9 May 2025 11:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B0F28F537;
	Fri,  9 May 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZsXp7D9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834A28F514
	for <linux-omap@vger.kernel.org>; Fri,  9 May 2025 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788751; cv=none; b=mTFDo9eMm7QE9+l+peOb88JRiWCF9xJ27B0DCyidFXfSwlhVS5AB1xpL+J9ZMR7D8LnFL7xN016ldCxlxL2yLngpjI5vOp4qjWbctn/y56McWxn6LNyfx0Oeo0B7VAGtulBllpxHojiA8TB5dNDnWYvSQHOShILgzhvLt79eqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788751; c=relaxed/simple;
	bh=HtlxtTe7nrbfoONlv91HljKDl3ZjJxLieMuEZGdCo1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mr3X7OrXLi0q2iq/99cd4KfVRp+mcp8EVRIhOA1ogcSFL5h1BtXhUESCvaAOzpr29G/hE3RYM+DTUyBkZC8K0aYYXFPeY0DTe0AGP0KRloEDvLYw4S3FtWWPcu3tNCcdmV5HVq+yExGxkB9MHKZ57RqDriw9TTzHqSZPOOZ/mgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZsXp7D9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso19760745e9.1
        for <linux-omap@vger.kernel.org>; Fri, 09 May 2025 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788748; x=1747393548; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irxrEhweCUXCqGm1VUjTuBVxoEJgZZgYdEdb4JaFlBI=;
        b=lZsXp7D95KXVzcde7g1yuRsj7nHKIvTgG01gyMaIZGQ2K6nMcKLoeUuZfiZg+j1PX9
         ydhisSgcbeXQFEqYkuNuYJAXmTPa8ozAEnEYC9JFNJYcnuEpdvk6m94ZF8jTuKNTlKTy
         W3X/2JS/TVfyDFGsepnHfpsxL5D0T+sC7nzBNc2tATxNCDzkWq5h36H1A5pywB2+Mi0h
         GDyU6vCQd//l2GPAJPjgDe/p+gOwPC3tZIUrxxH6SmcGyYKciIM/67UymaYAiJkFyz49
         tA2/pJj8y2bIGFfPpNf1rV5wJxcG160hOwYwXjHjDT1TJMPg14M8KJ9dgvQcOHTKf192
         UQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788748; x=1747393548;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irxrEhweCUXCqGm1VUjTuBVxoEJgZZgYdEdb4JaFlBI=;
        b=aYQ/qcGFQupb6fQ7dl9gReBOBaO62TxUFeGyJ1CryWvySt2mkVTLrzxy/kTvEcAsJn
         C9UpjNLe3uuzgh+m/Qyo1ubrP8TTh+rNuTnVg+zi+cCMPd4zelDUYCU71qXB03tr4nAg
         tAeIcsmboXPnfUhkEIV8jPPw7BkLoB4S11WqkoSsJ0QBG5g+GE0mrEEq4MNIyiKvyYER
         +3mQCEwRowJ+GwjfPAt1EEsqvqzxN+hXh10jJlpxpuOcYmA1nRiSIHaLOrDj17TNC5py
         m5UiEtCo5ngpbseyUGxWYaWnix0iVuBvhfNGehKvNEUf/+++Iw1AO0Rp/GnB8XhrF/Pf
         sf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNogxw9WTCBCDzibfL/LMk/O3CD9FYBm5tNhuPxoFFpThLzeu2P9pF2I2YSXkJouOVbxk7X1DKjEcW@vger.kernel.org
X-Gm-Message-State: AOJu0YwjESVCRS18CXvOp3KLIHgWBViaAKH4yRSLn4yzKj+WD4w6K/mi
	fBSGwhfqGYahSrJDMvMr/e4A0uuF7FVLYx1nS4RcJt7daTrPReBnUQ9EIGQGJmI=
X-Gm-Gg: ASbGncsLACaZ84wQQzrQT1Txr1FzGxzICXExwWXUzAIYcxbkO08HLpUAUNKfYsCUAOj
	jX1vdfaw5Ascg5V7AbPYFniPydyCHCmtyd/rDZ7A+S1eFRjV0CS7HercN12fk4ucEkByE2raVXk
	M+kLODfV7pPkCNLrb+oT5U4+l7S7lPDKXoGYkNHwD9COWKx6OrOBVycwYh0YXX5/R8ZyJd0WXex
	XVXd47vsXc+dfq2ACOrIwXL7E7wTmOJpnsT3bZDUX2sb5PgOCuO1rBb5OoxitYuJUOQMURF0V/+
	7I5AknHjdI7n8Rjfz8dSjlqVwWcOgPOrjkxIiSww2/JI6w==
X-Google-Smtp-Source: AGHT+IH+jBPAUs3aXz3zrzpBM/2GBSQQqn+LzvaGfSuxOybuE/QO/NbJAsghIVYoGpfZOS2NV7eWLw==
X-Received: by 2002:a05:600c:8714:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-442d6ddf58cmr18396045e9.33.1746788748089;
        Fri, 09 May 2025 04:05:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm2916601f8f.61.2025.05.09.04.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:05:47 -0700 (PDT)
Date: Fri, 9 May 2025 14:05:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] regulator: tps65219: regulator: tps65219: Fix error
 codes in probe()
Message-ID: <aB3hiEM0CB8m_X8m@stanley.mountain>
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
v2: Clean up the error message.
    Also fix a typo in the Subject

 drivers/regulator/tps65219-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b16b300d7f45..d80749cdae1d 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,9 +454,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
@@ -477,9 +477,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
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


