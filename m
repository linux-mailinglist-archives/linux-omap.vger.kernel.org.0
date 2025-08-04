Return-Path: <linux-omap+bounces-4167-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F86B1A0D1
	for <lists+linux-omap@lfdr.de>; Mon,  4 Aug 2025 14:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E513A74D0
	for <lists+linux-omap@lfdr.de>; Mon,  4 Aug 2025 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A93244662;
	Mon,  4 Aug 2025 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co5FkmZN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D37B15C0;
	Mon,  4 Aug 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754309054; cv=none; b=QUO9S+KTAxgaWb0DAJnvNC2LcNTOi6w9N1T7zfwKouipGeVd6kQLFcQNMnRk2HkvFLyl+wG/j9jufenKrVz7a6WzR64IngxfHR8gtag8uHoXiyx8IAy555f5TVpJ6vkqYl1ZzBWekvJpzz1pMsKwYaFWI1XhbiOIZuozkjo7TZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754309054; c=relaxed/simple;
	bh=K9OP5Ce3BveyGm5J7nKzieV7VKCpnajkBYBy1q/LiVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CtXmfhLAX/wJQa9nm/yUwXTototSFGj4G2Krgu44/DwMJ/QWpITISoVqflmq9dzDgX3rDpQanQVXOeFiQUyzTKZ5RvOkurHS95I3U1oAJ7WnZyYsjinwAo82NJLcE3kf2mWCIpuHm9sRiIqn/f5TmjHSWL7bLtNSA8VFnZJcARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co5FkmZN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so3488792a91.2;
        Mon, 04 Aug 2025 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754309052; x=1754913852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26b/9qnmqoaTIMROPBhDyNWuHOe0gLMekSlP8n81tZ4=;
        b=co5FkmZN94SZQ8K6cfiFYC31tAK9HOoINPFdYlAu7d9qj2U55VCBUU1Ox4BHQCZ5mg
         5vCldCNPhXtAKzoXZWiU0LSb21S41jjnUyhPPAruDb540Kaq9BOqJnGTPuPDE3Tq+0Gm
         tv4YLx0fURMsDo7B6KzGnoqL1iyehIm/xScTl++2npg0ni3IMhBbLP2pH/ojxemGAwXj
         6jkKAYiSxMoeQOtPQhG3SClcXmN0lmU9+l8A1vDk259NyPpqRadR4re5oeqmAgkNtGOU
         7E19s7THM/JMAVvvADKVDH710FxYZXsJyBAw2Gl5JFoW3Mne3t/jkkFDGkDbYYdX+KGN
         p7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754309052; x=1754913852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26b/9qnmqoaTIMROPBhDyNWuHOe0gLMekSlP8n81tZ4=;
        b=JLJZ4gG0E8btX8rYPLduJEic2QBnVH8HyaeA3lTDhJiCLF6pBSXfg+KdqMgrU+S9OJ
         F0WhjjtkbPNCu1VEJSYdR+mB5DxM0AdZM5Ijsdc3japcsUj+nf8OJehWOm8ZMgtqySBH
         QbN/nYi9nBq9CH90cUow5jDa0Oas1ixyeNEOymGmsv/KEj69ofkY51T5uzRp0VQYm3r6
         c9VxstDfvi2q6ydZNYda0vV0ogJUbm4mLh0PIXm1tMtjUR/HsdxE15KZvtvDGhIg+1nj
         IPd67UjxLCAPMv03kfDCS/HOU8i51e12AYxXE/G/QnBecg0Rskt4RlfyLZOIG7PAT8ZH
         kJZg==
X-Forwarded-Encrypted: i=1; AJvYcCWs9pE8UZr5R9jdYyX18CjqcCP+HKlnD7mPzr64QshfulWsZfvsnB7+OwBhPLCIhkc4GvZO4DIOLO/FLw==@vger.kernel.org, AJvYcCXm27em7zUncCDtPvlPsezT7Zb4c1UTACBlRa8EU6AlLcS4I7eEp2Xo3WIa6Jn6OCB3CS4JJiROHyvhfjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVlcZ/0ZcnLNNryfA1/fq6H73nex0jRBZ7Vo6dYLxWqi66yRj
	i5inxzyi+pFJsyPLq79mQq3xmbPSgou2M0znOrFKqm8Fue8tZJRZef640/gWYfe+JbanoQ==
X-Gm-Gg: ASbGncs4SJQsK5sZRvQI5CTpXuNpL+fOke3UUHOgpqXEVw5w574VsBD2IRQExmQ7emf
	kGsAL/ffSj1XYhADarhgS2MoUOX02iTpX02Y2DEQ0mTvgKuMocJdJVQMSecwhJwBhdsrEENFe9b
	XZZOZjc6ljSMhQbXfAYPS3OfD4v3tQUuscMXOpM0PbGViZtY5nkpeCHTyjzwBvSesbPYxt+Bc/2
	kKf970SlpDEQDGpMWx1M/622oniPmiF5Ztcg3ijbs6fjiCvRW6tWm89N0GUwBcA5bsHRje43Ui1
	eoCJ7ihhwzsKw5lcAUZPPSf3lK+LR/dn0s8mYqTZByNVzjmdycYIWQQJJz0PpIXerajJuVrEN1D
	wZLzgvp2xtBKI0oj3EjvPaVRg9mDNeqZHVgqEMEKUXzQg0i710W/Zazt2O30IS9JkakoOibFSB3
	uY8D2O2wo8Le+80YEfP5fMUM4=
X-Google-Smtp-Source: AGHT+IGKhsUL8aFVrHDpanP0ClvwXqgzKV7JcdKY7FnQ5ZR6o5l+qtLq+7RB8VhCTFS4YLvc+k2pOg==
X-Received: by 2002:a17:90b:33cd:b0:31f:42cd:690d with SMTP id 98e67ed59e1d1-321161f21d0mr12154208a91.13.1754309052080;
        Mon, 04 Aug 2025 05:04:12 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.162])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422b785696sm8648504a12.9.2025.08.04.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:04:11 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] bus: ti-sysc: Fix potential double free in sysc_add_named_clock_from_child()
Date: Mon,  4 Aug 2025 20:04:03 +0800
Message-Id: <20250804120403.97959-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_get_clk_from_child() function uses device-managed resources
that are automatically cleaned up. The clk_put() call after
devm_get_clk_from_child() is redundant and
may lead to double-free issues.

Fixes: a54275f4ab20 ("bus: ti-sysc: Add quirk handling for external optional functional clock")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/bus/ti-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9f624e5da991..5441b0739faa 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -362,7 +362,6 @@ static int sysc_add_named_clock_from_child(struct sysc *ddata,
 	cl->clk = clock;
 	clkdev_add(cl);
 
-	clk_put(clock);
 
 	return 0;
 }
-- 
2.35.1


