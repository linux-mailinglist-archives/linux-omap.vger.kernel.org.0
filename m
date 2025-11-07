Return-Path: <linux-omap+bounces-4873-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC3C40488
	for <lists+linux-omap@lfdr.de>; Fri, 07 Nov 2025 15:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06223AC6B7
	for <lists+linux-omap@lfdr.de>; Fri,  7 Nov 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8744B2D660D;
	Fri,  7 Nov 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IQ3laIxc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A822B9B9
	for <linux-omap@vger.kernel.org>; Fri,  7 Nov 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525157; cv=none; b=g9x4KAslvHP2fjCd3w2ITbDe5Y/eB5Nsvq2j2Flrsv81xeQEwJosQx1SuIy7fZEculMYuET4hmWNws0eoPKitmyXuJ0raKjT66CV1Up5tJvX6d1hJqdQfp5pa7TTTCumYG4+aZzGRORs81iHhVo64UqwOGNBvie9iZVL/qm9dlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525157; c=relaxed/simple;
	bh=jCYKhr1kX0Hg4QzRhHflP6OrqpUQR4791saqDTc52U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ej6gFbwpi9pY8cZ3IZTg/BVj/k2i8Rm8bgr6NywT5/wxkNMZPZ0a8d2ZzlBl/eY45Q1nL21KmgMpFeoJ5+Gw6zP/+u3CL76PGQ5Nch4oX9mbUtCnG3tSZlz5qbeG+eBaqVbmYNncCRSYDXR/gM5bTVrdxpeNsPHX3EMVrh+yVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IQ3laIxc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47755de027eso5716495e9.0
        for <linux-omap@vger.kernel.org>; Fri, 07 Nov 2025 06:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762525153; x=1763129953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3JtYpkQpGswXvZK8VCxneoBHV3vIkWcBIrbrAdQki4=;
        b=IQ3laIxc5MDZhq0kNxa3vRaVIoo2BNVJV7HiIEQf6IW6CgHTlIudOJBCyYyqNee2Yx
         jw1QY4h0qgFxTwRAdICZyAhceCeL+f2j542b1xzVpZ6mPonG6h0IYSwKsMT5H8NE0WHn
         8aa+H5SMqaML30li5LeEjHenZVrj6Qa9uSxiPYcdWzDfFS9RaQBIyZZrw8AeAYPUgJ3q
         rxRlwQvRywBI20dl8etirb3iMrd41WMlWdh5CwGx80cKXTqVqQ1anhDDZ9EcGYHT0HP6
         tk24MlgfD3madGpzxEC06+qHgkNbGn/YsMR0yPq3D4gxnh+vLlvF9KwDNumIAlGeS6O7
         Ji/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525153; x=1763129953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3JtYpkQpGswXvZK8VCxneoBHV3vIkWcBIrbrAdQki4=;
        b=s+Yx5qEu3tWVRLC0lMS/vPIBoqs+3ahg2k1DRfo8zL2UwygER2yIQFLhmrUikct6LN
         em5VTCRvEhY8XawaAvnYlC4jsvdQegVzVcpP89WK8psoLc6fj4AZvryn3z8A4ICxQU46
         lTbT8CsbyrDmS9PsnSDo8ML1Rg/5T+3/EZ4Y9WR0MwrQ9HV2qqIWcYDKzmHxL631gmMb
         lAICIHS0WsiVpUadGzDn37aat4v5rUnopx+qt+HwzSltLSG1LJBzydKRJy2hmPGLWwyD
         /8Gxrsk5LndZj/AKPsRP1hbMHaMPcs92zJKxc+VG/A6M6RqPKrgdnWSaXlWM3OZcIOiu
         JHGw==
X-Forwarded-Encrypted: i=1; AJvYcCUq1GM23aodcRNW6D+bXMspFo9yJ/LQgnlb59hqv7xqz2Sg/KWaBp8p62sov2m3Q/xQK/x1qUAst0Ax@vger.kernel.org
X-Gm-Message-State: AOJu0YzmET44B3QvMo3GzaZWsEHI1o5daId951/dg0LGNxQsaM9u6EAD
	Xgvo9Wu4QfB5m/YkgohfqY0czBl8St/YGoRFrlXn0fk7huKST2zh1voxsr8HAeXH8uY=
X-Gm-Gg: ASbGncuWlK1+O82vUVwRCX5XZXkGmRyvGps8VNbA3HvtvDq1EShuBAw7kXGiougsowV
	MdeHsGhrXPKQayKoeqNreayxbpkxnYw4wtn2Fib/q7bR6vCvBihlnq2yG9+vyhu/3eslaIFvxX6
	S8q0rzpg6+VT2UIeowwIMrH/73Bj2se8mLLcttKHCMSNpUkorwg+C4D8PcOquHsEg/QJyfcSz4+
	76EdVxB45c0Np1gNSRvMUf+R88jeANvwMZE/N+hPzc+R6kHWu6s7tKCLZvd6uCE4FDCB+Xc6Xu+
	hrEXO9JAdPow3DLyDgTPYDNXCi7hz4BU66fuXWeiPtNw3RUYCS4Ye5/792YgDYSMD/n/fZNObjE
	fadtNBD5uZ4s93/OUr1eTAry0gMfQHEwFHPkchcRK2lYaa3q9Ab6cI6zniIAxxnXWayJHUp5jx6
	PNVSPscozBhfg89dfHjWNQU0JO
X-Google-Smtp-Source: AGHT+IH37Au8aet7V82ZM9z8/ovCarJgLYRwpuhLBnJNCo/JFhaSvNC80oCEjo8MjD+qazemNPFSbw==
X-Received: by 2002:a05:600c:1d12:b0:477:63db:283f with SMTP id 5b1f17b1804b1-4776bcc7346mr26051305e9.37.1762525153461;
        Fri, 07 Nov 2025 06:19:13 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb801sm41441845e9.11.2025.11.07.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:19:13 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] mmc: omap: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 15:19:07 +0100
Message-ID: <20251107141907.229119-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/mmc/host/omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 52ac3f128a1c..4a13111e1698 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1477,7 +1477,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	host->nr_slots = pdata->nr_slots;
 	host->reg_shift = (mmc_omap7xx() ? 1 : 2);
 
-	host->mmc_omap_wq = alloc_workqueue("mmc_omap", 0, 0);
+	host->mmc_omap_wq = alloc_workqueue("mmc_omap", WQ_PERCPU, 0);
 	if (!host->mmc_omap_wq) {
 		ret = -ENOMEM;
 		goto err_plat_cleanup;
-- 
2.51.1


