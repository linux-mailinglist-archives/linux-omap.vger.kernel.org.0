Return-Path: <linux-omap+bounces-5398-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B7D05F5C
	for <lists+linux-omap@lfdr.de>; Thu, 08 Jan 2026 21:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACC61301C903
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jan 2026 20:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A911032A3C3;
	Thu,  8 Jan 2026 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1rGkU88"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13223BCFF
	for <linux-omap@vger.kernel.org>; Thu,  8 Jan 2026 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902463; cv=none; b=remc/zP8xbZ9YsfSi7qm7rFxfU5SD5/jEQhubGeoR5pN48KDrgVPlxWgvIqvJy5nl/jIiz7obvHsXj42hBt25JQl2mx6Fgx09jv86P5JIZElO1v/yalphnPf/eMJYog9EgoC0JVq2HiIVzUlKWm4Hdvh2DvEInelJvK3s/mFQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902463; c=relaxed/simple;
	bh=DE6Sp1xOrVBNsH6sK2fuRAlXsqjZwLxh07gWzBcBmtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKaFTmswdfEBFwhM0psviB+PX5CaIjHPbRnKdSsPN6TDIE9TMmK/MnuTJua0YyqRNYBI5kc6968oYgy2pw8S+Dtj9/QtW8SOBhIrIFdOEl+6Dj77hq1LoRZgX8QzmFspUahbwZ4d2aecPD7gdlmOnGqpiX+ZL4bDADi8Ytcsnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1rGkU88; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so2860095f8f.2
        for <linux-omap@vger.kernel.org>; Thu, 08 Jan 2026 12:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902460; x=1768507260; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
        b=Y1rGkU88DBRDx2fqYoyOlsxxs3rrpmhY1BfRnda5oPhYQRfxp4ctXH3jIXEVX43lN+
         MHpT7EsALTnyHg+IDnR1CITsEpi1FeXp2nxJ+tePwcWa3a8xtmli3JqFv/I7KCAMuO+w
         tSYKxXhTdYhtLRYOZSvHWpdGMQ8I8vYqGSI5deKdediM+/3BneYNf3Uv5UZZqZMTOH8j
         /hZXl3HHS91FZ/JhMSgKKqsYVCG+CLgpDYhoI0zqlmMPyjmZ+RwVqjCxKWV6/h9cSA3s
         f854u6tN7dBLjX2z6hCXdGF7hGijrxENL5XNa5WJa1mq0RQmFIuQqsKUGOO3zobvi/3y
         ZloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902460; x=1768507260;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
        b=CFNZOb8Ar81PNmTorkIxe9Wumfiy2CLlbMyJCT0sEUAzETEUv55czAkeFi200Lwsw9
         +WLrwqKUKM4vQKVBIZqEdBBrGjiQlvrTUZstg7BNjhJj6RhB0J6rnaNpKDacek3FMYci
         mP7ajWvl6exZNuvrPdVvd+jJUEVbPwi1F4xUP8KQt9XoBcyAj5TBzjc0EiUMrozg/e4M
         u1fl4r/VZ7ffN+LbJBAuuz/JiW02vvXKnDUQKBtMlqAU8FkN+55HIvYsS59Jw/ZBNHTA
         SdBtQItNnD6UAXSyx8hjaN6UexvBwEeU5CdMKVMI4vPyd2J3oCg06Egup45jci2GIwaB
         r+dg==
X-Forwarded-Encrypted: i=1; AJvYcCVBedN2sOju6WIJUAsMAZhuCaqoB0rgRpi74HO0eXKWCIQhZeQ78k9BubL5mt5Cjbs5YtmsXw44ffGh@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvB6mRQD1Z6AbYmuaJeA5BCmf+F8eu9OpfjeJycmEW/2jHCuE
	VbkGl3qcmW/9Q2R7cJ/3kiwG1Zbf8oxMOLR+M39MGoJCvO234C/77tK09GnRN4oNbMY=
X-Gm-Gg: AY/fxX4wFGSjX7FgWqJyUQZoqkLJ/MMbwjx31MuucFWqqBJyDr3zrooUPMqFEMti1El
	9C3ac1urz67aA9n44usIYr70xrYQ17EBNwiPceL+U5E6qxDLPPzSZx9T1CId/hrLNuVPY1m2FC+
	u/HBPdTuOScfla5D2INXHQMYLNBuhS6NBYiepn3BGyXg2PWa54/rOp437dK6bH3p4SfGLg5ql2a
	EZ7mjJYctG6gX1qyXGLlxv77PJPRyaQWp3MoQPEeO9l0dbpcDREQ1nqMxLT9/wbdtpjveiuoEpb
	KEBfu+wKewpzlTiuzYMgmoZ1xTEWDyixb+bAV4ZWbJYtTxw+GicRnkCy6zbZ1d4Ykgbh69IhfeK
	DekXx/eVmrJo7SQBNRbJMxBYtASulZV0D961EZZEBofb51U6VlMgfnLeUuJMJk+tcxvNG30lsQK
	I8t2Von3KKfSltG7m/
X-Google-Smtp-Source: AGHT+IE0npwunWACAYL+5K87C4JawJUGa/VvYRBjPWPZGKZYwiEeVeAPHCRJ0OWPGNFKQWH85CyAbg==
X-Received: by 2002:a05:6000:4287:b0:430:f494:6aad with SMTP id ffacd0b85a97d-432c378a7dfmr8823298f8f.2.1767902460211;
        Thu, 08 Jan 2026 12:01:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm17838263f8f.30.2026.01.08.12.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:00:59 -0800 (PST)
Date: Thu, 8 Jan 2026 23:00:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: remove duplicate check in omapfb_setup_mem()
Message-ID: <aWAM-SZArPSRNaNK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We know "size" is non-zero because it is checked on the line before.
Delete the duplicate check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 106d21e74738..a8740213e891 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -846,12 +846,10 @@ static int omapfb_setup_mem(struct fb_info *fbi, struct omapfb_mem_info *mi)
 		 * be reenabled unless its size is > 0.
 		 */
 		if (old_size != size && size) {
-			if (size) {
-				memcpy(new_var, &fbi->var, sizeof(*new_var));
-				r = set_fb_var(fbi, new_var);
-				if (r < 0)
-					goto out;
-			}
+			memcpy(new_var, &fbi->var, sizeof(*new_var));
+			r = set_fb_var(fbi, new_var);
+			if (r < 0)
+				goto out;
 		}
 
 		if (fbdev->ctrl->sync)
-- 
2.51.0


