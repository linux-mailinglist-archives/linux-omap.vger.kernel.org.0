Return-Path: <linux-omap+bounces-2670-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B79C7D83
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2024 22:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B5F1F219A5
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2024 21:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168CC2076A3;
	Wed, 13 Nov 2024 21:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNBNOuj/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC0374C4;
	Wed, 13 Nov 2024 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532580; cv=none; b=fxa/N6MkW5ZnsGmppLKBwY0M4pt5XbLvpneJbyj2QV8OYEhqBF+TugYfkDdItUTS2EM99rZQTNeStTs0Z+qyMs9f8Ko9f5iB2rUpe4z/SNcv5vMnIlYjAYhD1yean1TnzHUVYBUQDhvPRsAQYsn6QvzQ7oxXqQqnqL/PzBf19ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532580; c=relaxed/simple;
	bh=gf8J2pA2eYT2YjDKQIEt+Cv++CziWT6clDVZXZmj0GU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ltjwDxZwj6EmItGZtn4Azrym5Fx0henFDtcUA6En2QZejhbWJ+RGB4QQfeLgfI/vC5lG70W/8rTnvffpZvBxfqlFnYdPO50WV0IZk4HRZk9l8G1JbHL3XtsO8/Hy8rhDKl+S0PSRQG6nCQMhmpASFRu+xXIf7qdjKrdO9eILKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNBNOuj/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso8819320a12.2;
        Wed, 13 Nov 2024 13:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731532577; x=1732137377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3xdS0O9sMiz99WKMU3vVWEf0PF+apGQVim/eQPE9Qc=;
        b=PNBNOuj/0xxop7c8MyQwKYWoBweZbD0Y1B1IS4+YqSxV6/WBcRB5WpiGU9cGwSA893
         jeg7So3nxQT6meazHnJqgVIQAN5iKHNhNWW0iOefUQJNGRxxopUa5RmTAGRKmBS3cL+a
         10fmxlbBMwwDit7yMxBpzZFr3H1D3SV+q5h0pnGGggwt7WLHElA3/HbJZPQG9yxQVpHV
         XDP5gegA9FuG5NaEfpARrX+90vtknnBxWwUu4ceIpImjtod5gEdL/u8hdwS4W715hr+H
         KYcXjNWahD/6fg6H/5VDH44hOmbrP7eli0Ox+xKub+d7UQYNllar/kMSbmt0A5c2npK1
         w2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731532577; x=1732137377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3xdS0O9sMiz99WKMU3vVWEf0PF+apGQVim/eQPE9Qc=;
        b=AmmpBg8htrN1SRdfDaF2pbm1KDzKOVETkCXs4eoqwnfhLEem7HZL6m6CmpIsCDaTsb
         qhobfXY/rItEvdVCIHqddy0pHZWIxkjAzatVrQMf0nI+p2OOVZVGT1vcWAWVJmCvVREZ
         HXRqkOUqb+e8lMl0IJymJwJup4Xft0L/Ei2uModXYVy72E4+G63rn/Bw9GRJgMehiyfh
         J/T8nF6BXcBqvojR4KDtMVVyZ+i+N3f3lbydI8HhXLE05v44bWjMe0DGeb3HX4kwHJJ2
         LUNgScArHuuI6yTmIaA6Q3xb+ypJP3xAEfS6HKKgCTtgkxewLo6SXJ7wGNC+dXFrOTIS
         RG4g==
X-Forwarded-Encrypted: i=1; AJvYcCXL1Uy5iSmYZxXjp3cznIT18GCPLKaZ8Bb9jJLwk/ySW5Kk1DNsKJLzAV36S6puun+RX6uifzJjc8wLuGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPILl+eiEClqepvXXqPS+KoQo6tAx29sq3gDkjBNE58NdtPaBa
	5vfHwsXOvKhsNRWhXyouzcnwSG9+F6hXD7cFKB+LNJbvz7qUwKie/4CInw2X
X-Google-Smtp-Source: AGHT+IFFpNfDLeJuShCYAumWcZsy/6ClCwzDPCKCTx6qNdLBT3ddJoimUy2p3cd7P/b0YbGAXaRbfA==
X-Received: by 2002:a05:6402:1d56:b0:5cf:60f8:4cf7 with SMTP id 4fb4d7f45d1cf-5cf60f84d30mr4407682a12.27.1731532577074;
        Wed, 13 Nov 2024 13:16:17 -0800 (PST)
Received: from C-KP-LP15v.consult.red ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb6a2fsm7900221a12.40.2024.11.13.13.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 13:16:16 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	lee@kernel.org,
	karprzy7@gmail.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
Date: Wed, 13 Nov 2024 22:16:14 +0100
Message-Id: <20241113211614.518439-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_prepare() is called in usbtll_omap_probe to fill clk array.
Return code is not checked, leaving possible error condition unhandled.

Added variable to hold return value from clk_prepare() and dev_dbg statement
when it's not successful.

Found in coverity scan, CID 1594680

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/mfd/omap-usb-tll.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 0f7fdb99c809..2e9319ee1b74 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 	struct device				*dev =  &pdev->dev;
 	struct usbtll_omap			*tll;
 	void __iomem				*base;
-	int					i, nch, ver;
+	int					i, nch, ver, err;
 
 	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
 
@@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 					"usb_tll_hs_usb_ch%d_clk", i);
 		tll->ch_clk[i] = clk_get(dev, clkname);
 
-		if (IS_ERR(tll->ch_clk[i]))
+		if (IS_ERR(tll->ch_clk[i])) {
 			dev_dbg(dev, "can't get clock : %s\n", clkname);
-		else
-			clk_prepare(tll->ch_clk[i]);
+		} else {
+			err = clk_prepare(tll->ch_clk[i]);
+			if (err)
+				dev_dbg(dev, "clock prepare error for: %s\n", clkname);
+		}
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.34.1


