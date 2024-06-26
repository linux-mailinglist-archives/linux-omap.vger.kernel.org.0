Return-Path: <linux-omap+bounces-1607-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F431919853
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 21:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 729831C21205
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 19:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB281922FB;
	Wed, 26 Jun 2024 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/MrA51o"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C961922CB;
	Wed, 26 Jun 2024 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430630; cv=none; b=CUcW1seiSv5/e5pvFE4g1YXokQGoVIg5Zm650vnqSKcUAMrwA9tihWMeK8VFhKoEtzKH9WgnXl7lfMYfVDXlClPLp2tjKKn0A7CL+FIqjoYz0kQ2IyXG7sr7ByNhC6ANsZBqPxAtjm0USCw3iKvbdh83BzKkIk1wmzS6IsBFrss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430630; c=relaxed/simple;
	bh=FWb/8xwgSmkYewGCNK0QCu9voPf3FKtacJJHxV+3mDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r7+Jv0Pm8+mOPmco5y/CO+eNKlLGtxDY6SoBbhQUDJXg+tn/bsOI8KGM2Ax/xf9Wyh1A3PtfuXYSFDGplpvr4Q9TgFBT/AmEfftgm85fH4xqxoD6e/ydbD1VYzQzWx8vK5fSCJbB0V+if+8YbtnWcpIfB2iIFaSUEo9JoJQ03nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/MrA51o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4247f36f689so49451605e9.1;
        Wed, 26 Jun 2024 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719430627; x=1720035427; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOjQ/R1GedZK24w3z78seoJ2dMf2SdqwKnQMmA2vypc=;
        b=R/MrA51oVFsaBGzIi8PDdXri9gp2lHNKHW01DojFWC6Z6H0WZGTPLEP9oAN9htkyth
         PhS7Dlbfp/rtfSt/Fxt0/Y5L8w9sA7iuPWt1YdwZ2aXvWY5ZXMCPsl/ozqvkG3IU0XuO
         h2kPhlUWf6hmcMsNuQYgtG28gt1ASzdtk2GOm6L4obxeXm5JOK/KUvHQLZjLtfIQc/jr
         1nyD4jejliW8qP+t6N5mGdmAHa4fK206Ru8EMsZs6jpBnWhZ5zu1r5bqx2W2ExK+m47J
         xg0oUDfQW3pPBo1KHnCHwpY6GXbSwAE6IVbuCbS4owIysZSnTLsQ2S9jb5wpzHJzGF+L
         ciAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430627; x=1720035427;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOjQ/R1GedZK24w3z78seoJ2dMf2SdqwKnQMmA2vypc=;
        b=NQbQ36zfn7qG3P1IzBMF6jbZeFIMgUL5FDbb4dwmNdOJQNT5uqrhXEaBkwNRq0cOH0
         Yy5ei4TFIHniwt0xqgbFDE0WSWP1viPaZ5qLh+2ygRdtC+Qj2NGjYqABP5ympCZ4poP9
         cVhOdA4mDfjj1lmMcV4EzCPP/0nMZTB/Aegx2Y7BFZjbWF4D3XsAYy/sE8V9e4VcD+jH
         G44ckEcPqVphSnmyDJqtCtpYGH7q5lUHIWncS+UUDXwfcMQT/QA9+98KIAWGofeyXWMW
         rtM4uaZFiiTjDNdAbWE6jzTNfWAiUn0uiMoaFUie/4ndvHA8LxGl9/L4HKv+1qr87vsi
         yMpA==
X-Forwarded-Encrypted: i=1; AJvYcCWDItr3xLe+9lqN+FVDHU75x6rklFMiqAA3bxYEWu7fFYBCbIuD9FKR3upa9fEtY0g5RkrwiCF79AchNmtCL1OmuixX2B6n+LiiHncddNJU4hSgBI7mO0NKmdYOAVH8Bo0BWIr2XmkB5nZTYpnb
X-Gm-Message-State: AOJu0Yw5uZuk9647F1Hx/jKOi0OfLVkEgBFqSbRe307Hw3dKteLoNsG+
	m1HdKQvVVFDcboPTXoUoj9xEJVCnh0V9K44PMYkS5yYG7v6Q71hpFfqHYowh
X-Google-Smtp-Source: AGHT+IFEeO9IN3qQwaY5ejmvgyRqZUMYeBxB/Up+ILOb0nQGa0nc1/xQG/pPsB0YhldmxZffa5E7/A==
X-Received: by 2002:a05:600c:5d5:b0:424:a779:b5bf with SMTP id 5b1f17b1804b1-424a779b679mr30728705e9.20.1719430627129;
        Wed, 26 Jun 2024 12:37:07 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8468613sm36476445e9.39.2024.06.26.12.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:37:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 26 Jun 2024 21:37:03 +0200
Subject: [PATCH v2] mfd: omap-usb-tll: use struct_size to allocate tll
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-omap-usb-tll-counted_by-v2-1-4bedf20d1b51@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN5tfGYC/4WNQQqDMBBFryKz7pQk2kZd9R5FShJTHdBEEpWKe
 PemXqDL9+C/v0O0gWyEOtsh2JUieZdAXDIwvXKdRWoTg2CiYHfB0I9qwiVqnIcBjV/cbNuX3lA
 pc5OGy5zxEtJ6CvZNn7P8bBL3FGcftvNo5T/7v7lyZCilrGSZF1pX6tGNioar8SM0x3F8Ae+iB
 nG+AAAA
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719430625; l=2401;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=FWb/8xwgSmkYewGCNK0QCu9voPf3FKtacJJHxV+3mDY=;
 b=eu0R35PRz0mZwtrpzv1RIROon4BFs/WttTciMHNUd/G+DZs6vZu955Q7VERWlf6lgtqK6mc1j
 ozzoEgAC/jgCNSw7Fkiuse6pHq8/Xh2FVwNW7zxcbstqoGru0pLcMsT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
changed the memory allocation of 'tll' to consolidate it into a single
allocation, introducing an incorrect size calculation.

In particular, the allocation for the array of pointers was converted
into a single-pointer allocation.

The memory allocation used to occur in two steps:

tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
                           GFP_KERNEL);

And it turned that into the following allocation:

tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
                   GFP_KERNEL);

sizeof(tll->ch_clk[nch]) returns the size of a single pointer instead of
the expected nch pointers.

This bug went unnoticed because the allocation size was small enough to
fit within the minimum size of a memory allocation for this particular
case [1].

The complete allocation can still be done at once with the struct_size
macro, which comes in handy for structures with a trailing flexible
array.

Fix the memory allocation to obtain the original size again.

Link: https://lore.kernel.org/all/202406261121.2FFD65647@keescook/ [1]
Fixes: 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Patch 1/2: drop (applied).
- Patch 2/2: turn into fix.
- Link to v1: https://lore.kernel.org/r/20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com
---
 drivers/mfd/omap-usb-tll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index b6303ddb013b..f68dd0281463 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 		break;
 	}
 
-	tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
-			   GFP_KERNEL);
+	tll = devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERNEL);
 	if (!tll) {
 		pm_runtime_put_sync(dev);
 		pm_runtime_disable(dev);

---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240620-omap-usb-tll-counted_by-aac57c173018

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


