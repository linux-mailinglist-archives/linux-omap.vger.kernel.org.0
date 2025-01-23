Return-Path: <linux-omap+bounces-3193-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED5A1A33E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 12:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A8316A15B
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 11:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A51B213E97;
	Thu, 23 Jan 2025 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYxmbj96"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E542139DC
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632333; cv=none; b=X15NQu5t0DDv6PJ9Bhrh7VCSfKs60okJkSuw5nJI4DUL4ulz2NbH7y+8WnOmaNVABe3jhrlaDakdQlYeas3gWtzx64aZP+OkoxTh6ln5Oqe9yLQA8geUS+pf2K+BYhwZQyyptv3KBmlkxztadh9JMQ7eKMIoHs2wGeDAKKvnaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632333; c=relaxed/simple;
	bh=igX5ZUgBwCdDAnj7x2Moq6k+WA2yw2v+2BGH2OQnJUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iESJRM01ITQafD4qW/veV3m46VXbSpiEguExWhGrnRFFPgx2MECmIi3n9P/BsucanobIuheLdeHqVcpDmPSpm8oPVqYh8nj3AOiAR0XeWjtBrV639A4XugwVkPHudy0BSGaXkWCaiiXlogbptdSreeFhUjgGlQFA2+sGnb5UTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYxmbj96; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21661be2c2dso12520045ad.1
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632332; x=1738237132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQgNBAFe49xaXae+rYQPhtfMBBIQd9+kyHPZESGBA0=;
        b=EYxmbj96rmhMrbBc29uqC9oECp7T0xnQfCLeAycuWyned002/xy37+bzKaWAxgqKQn
         gXifJkSeoWK8hDRE0zh80AEBL1a/fatR+mnaVv1JaZa+n/ybNxfI9am6zSho35MrD2n/
         qn/tMQMWrSG/rQYkvyU0X9sO+d3bh4DKjLYS+9FMXbjHxgejC1/1ixyGQODVvctKg3M1
         /BuPXxU0x+lm50ebnfzxvsJ5u917sE//PuqCZsVzuua8qmVnMrUvVBQj3+vXauAFjAIw
         An0Y/CfVntlCdHyYc7pF4a7ywFDRgn1gD2y6C4sym6i5hmHC19kdkwFRevh0qJAl8PSq
         xfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632332; x=1738237132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjQgNBAFe49xaXae+rYQPhtfMBBIQd9+kyHPZESGBA0=;
        b=n1YXMJzl7vkLBdlFhNWhzGW4qm0+Y5RaxKW1ivhGn/xyFma7DMqAoQd4tQkQ2Lyqem
         vhbPiFm/hKuq4VzKhYXY0bojvozQCr+XQZjzfC5ovvAbRQ5soUyOSY8lb8fecWcOOoEU
         v4W5Ajm4khMP7KajlnZSRbZ2NKJT4EL+Au0fVTOd0LAC22Kfwbz9H4/pbhcVQTqJqSbT
         WRUzFVTlxpLRvxwut5woGDHDBjN2POUuDIPIIXSTxhd5B9yuB6KGgIb4ztWD96jZFFBk
         ijCTMXnMDxIvZwfLNOdG/RatzAj8oRcvleL7sepTBD0ehKKFsPXa1NseKmFjlOB3xx0w
         v1gA==
X-Forwarded-Encrypted: i=1; AJvYcCWFRxBzVF9T03Ex1aMWHg4xGK4tas0HEPvEO1QHupdWr0MIXyUNID/GQ97CgH7sHRU2MuAHT2cdtrbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8xngdJgT4TmZmFKKwdz86zIx0LMrQSJ4e0PHZBO6GdGqH2df
	JxJB8WyaC5/sH+Yi7tEYinMurvofs3cbL8TD8zkvlYvD++tgORxv+nwhhkCmIkg=
X-Gm-Gg: ASbGncv90FdHJoJgLeREG7LM7c6JzhhVfD/Wu7ucwCPqZpSZYVq+x+adYxTzqf7dSF7
	JwrYNl5zIdQ4trjac5qW+Rgh928WZOIn9Dj0B9tSJ1U0VlBQb4w4bG2w9qvhlyR3ltUTqLD0d3+
	Dtq8PiwlIjP1Rnz72cHUS/Nv+yMgJfCFMKcw7cpO5Dl9WavQZ0GUJ+/+HjocFRkE23HBn/aTlSO
	9J0/j/Le9HsY5Mt/Sf+4HO6tI3G7pdm4gDIawVKRUkD+mCJ5zDbXEDDGqqlSGvBqRnOCfTorp9j
	U0hqoFM=
X-Google-Smtp-Source: AGHT+IFmHslrORl8iCSfMyQPeWS7T03UGbsvKy3s6/N5wWrGhzpF0qVtjOGI5Dkz5XcIfMQH+4A4Wg==
X-Received: by 2002:a05:6a20:432a:b0:1e1:dbfd:582b with SMTP id adf61e73a8af0-1eb21498454mr34159462637.15.1737632331808;
        Thu, 23 Jan 2025 03:38:51 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48cd0sm13058058b3a.131.2025.01.23.03.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:51 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/33] cpufreq: omap: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:51 +0530
Message-Id: <f5921d2d24bf616e16acfe7a47a0ea5be9e3c8ef.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/omap-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 106220c0fd11..bbb01d93b54b 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -147,7 +147,6 @@ static struct cpufreq_driver omap_driver = {
 	.exit		= omap_cpu_exit,
 	.register_em	= cpufreq_register_em_with_opp,
 	.name		= "omap",
-	.attr		= cpufreq_generic_attr,
 };
 
 static int omap_cpufreq_probe(struct platform_device *pdev)
-- 
2.31.1.272.g89b43f80a514


