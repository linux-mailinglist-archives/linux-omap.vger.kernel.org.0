Return-Path: <linux-omap+bounces-5150-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCABCB1F64
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 06:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98B19301D593
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 05:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28B22FC874;
	Wed, 10 Dec 2025 05:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="MQ+2QGhZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B326238166
	for <linux-omap@vger.kernel.org>; Wed, 10 Dec 2025 05:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765344270; cv=none; b=VLpONM2wMUG0s8jdaLCZM5rcwcgosT+MF4ehE7WFNfKvkF78aRXjtUzJDPkS+OBqmlp2N+E36UAOSZaVULh+1MYQneuFququkCdI3JUapAO+KKzqlXyDl4hrYi5H//qYWk4NKUutn7lTTr59djXiqFYwX6VvWZSwDuYo17hbOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765344270; c=relaxed/simple;
	bh=kmFhRlOmliGPCjl0tEXP18/laIwlZBhKOJoyLH3kkfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WEzflO2nPNXfKA8YFnc1QODGr9TayZqE0ioG4lS9uDxewh/V4pv8mB/TOEh/U1pj8wpFcjtwEameVaMal/2JHwcMYnsQYnb6E78VIytbbazmAsUzV+7oMqNcWLaKRQvUpP2R9KdBdmbJskqqYfVQh9I5lS6ZLscimMgCgELtadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=MQ+2QGhZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343684a06b2so6744831a91.1
        for <linux-omap@vger.kernel.org>; Tue, 09 Dec 2025 21:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1765344266; x=1765949066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlJtCng94VGpqjba3SuHtU+AS5mW8U5fO5+chTqevbA=;
        b=MQ+2QGhZ9NdFsXCC9+i2lQWE4Xsbf1/IEg7Hr6QjobrCzDdkDCzLwJPk3l4YxWDBFF
         2wJ6OEQXEs9hfPSiaQAZBHUP+n0aN7epVJbnE0Cebul516NtSL4kus78c3GDAhDu4VEp
         lvyvl9Cf+Dx+aeOcCtY5NE5iAHUgc5QG8inu/s6xwDBJCV/Gn8OyZjFaTD/N0h+51TGd
         FZrCz2Aid9LAtitzfz59A67fL+LVvA2pn8FI2XyAJ65AJK0GYLdMbEJXP+Wwh9Jq6Kh+
         SUOgapx5EDI+I2tLnZgBPL/JmYD7j/DR6BFL0qcUXhQ78xAVhfkQh4HuBzBAaqILZ7JU
         yNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344266; x=1765949066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlJtCng94VGpqjba3SuHtU+AS5mW8U5fO5+chTqevbA=;
        b=R2ZAr75pR+zEUqKIjci15jGiXYB+KDQmOi7AB3CTHuUfPkQuRnE0TvyHOJ4ImpXpLl
         jCeGYKMrsLM459NCm5GergMRh+tmnBCoE3O0veji7Bx8lOECmWDJ5QnJ7CVHhIKqJxXr
         P0+c8HJoyT6RZeTdCBw5LeOAK6q/kLwiCeufvXHQ8z97Oe0opYbIK8BsFjf4KIAUB/g6
         xg6dBBT/KwApXHUf9dfrqEWGBDz822SgwJfe+bg+xazOb2kO30p6OfjQ6/Nr9vYb7bFN
         9hBJFKle/RKA4RLO151aU7CeWzaynKZsPDqSKCbDHuA2yOj5LoekvTfz4DI7sNqXNe7y
         PY8A==
X-Gm-Message-State: AOJu0YzupLdlva35wQf2C6NpkM8F6ixlPMbed4Nera8TQTY6smo7SMGy
	uiCzG1cmE1g1KfaPjiG4b4R3vizFUDZOlapRmDgdwFCjzgjMPKMeU8Do4wkR3AVKzrk=
X-Gm-Gg: ASbGncvAkFyFl/iSktHWH5SxjXn1orjMnivDoh/pCQp01zoHPIKIMM/K2tLuW/UX7Gn
	+geXCSZh7jMNsOqLkT3L6LznEVeqxRWplZ7ErLsCO95epd8e8pFagUORTDwHTI77StcE8FsZes0
	x7z68CNDsjn73BGyuJl2AMMznSuNl4S7BPLEdpdg2pLc0TXiOn2+oXDYiKnyfub9vLFChNPkvcC
	HhWQMXJY9soROn/hTbbjdIeCH3j/ZnnZRWnSv+3vSbkwJzPdjh6+sLMprF9ZdYsXClxwSjVLjb/
	MZBsWrJpRZXsMyHIW8EI+FaQJaO7w5ZXdbwaYt54Ty926ViOv9plRcfVfQ5Ag4G9cBRYCb+4Ak8
	kVuA/bvh/fr1drxwte/9dvrBtnHlRt5pop6UKoIkiLIhKdfWgn/Ji/rMsRkCwdnjMUDv9FPRCs2
	lx9pTpcXF7+gzD0fP2kk7CDQ6bBggu65iyoWmBN39WBVPgv7KJlojaLb7OGC1LP3AYgv2CH9wyJ
	6WeIzePxDyBlVmQqorr1zf/95clwA==
X-Google-Smtp-Source: AGHT+IHXFz7KImUQvpjB5n4x5vp6laDwqapGFb1cbrih/2lZ6SLdPLifXhgEwnrmO1ldg9oaopj9Gg==
X-Received: by 2002:a05:7022:419:b0:11a:3483:4a87 with SMTP id a92af1059eb24-11f2967f3a2mr923201c88.13.1765344266293;
        Tue, 09 Dec 2025 21:24:26 -0800 (PST)
Received: from fedora (host40.181-14-227.telecom.net.ar. [181.14.227.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4796sm5358862c88.13.2025.12.09.21.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:24:25 -0800 (PST)
From: Fernando Coda <fcoda@frba.utn.edu.ar>
To: aaro.koskinen@iki.fi,
	jmkrzyszt@gmail.com,
	tony@atomide.com,
	vigneshr@ti.com,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Fernando Coda <fcoda@frba.utn.edu.ar>
Subject: [PATCH] i2c: omap: fix incorrect SCLH timing calculation
Date: Wed, 10 Dec 2025 02:22:54 -0300
Message-ID: <20251210052254.279899-1-fcoda@frba.utn.edu.ar>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the AM335x Technical Reference Manual, which uses the
i2c-omap driver, in the section 21.4.1.24 (clock timing parameters),
the SCL high and low periods are defined as:

    tLOW  = (SCLL + 7) * ICLK period
    tHIGH = (SCLH + 5) * ICLK period

Every other reference to SCLL and SCLH in the omap_i2c_init() function
follows the same pattern:

    SCLL = value - 7
    SCLH = value - 5

However, in this line the value of SCLH is computed subtracting 7 instead
of 5, which will produce an incorrect SCL high period. This appears to be
a copy and paste error.

Fix by using −5, consistent with both the TRM and the surrounding SCLH formula

Signed-off-by: Fernando Coda <fcoda@frba.utn.edu.ar>
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384..d0a33f5f1bb3 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -459,7 +459,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 		if (psc > 2)
 			psc = 2;
 		scll = fclk_rate / (omap->speed * 2) - 7 + psc;
-		sclh = fclk_rate / (omap->speed * 2) - 7 + psc;
+		sclh = fclk_rate / (omap->speed * 2) - 5 + psc;
 	}
 
 	omap->iestate = (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
-- 
2.52.0


