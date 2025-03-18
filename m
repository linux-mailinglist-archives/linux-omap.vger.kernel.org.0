Return-Path: <linux-omap+bounces-3426-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793EA675E0
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 15:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CABD33A8034
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 14:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E168C20DD56;
	Tue, 18 Mar 2025 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoHP/ZBM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB51A2C0E;
	Tue, 18 Mar 2025 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306558; cv=none; b=N0tvmHgP++SJmWznQCXibyxkIsI9BsSInGkWU9Pt0TfyFjwuI8oCD20vX08+HrPAxzG1gDPIhfO6PRAePPfRVvPYUG9wcGnD5/Gi2m9J4B9DIiER8ylPI/5c0DnrB5123eVHQYT5txyl+lQeqsOiIAUNBI0MnTsZh62rkR3asZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306558; c=relaxed/simple;
	bh=5/H/RkdYCVBAtDQuOfxdiSWDTWx6gAPojS0OJOoPcU8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h2iMdFHBKJPKo5ijdQ9W26W0lFZL9E/dsXhTtwm9a8S/eFfNpAIJDc9y3Q/LCVwDtwgNOA2zX3gfOvD2zkWKkRNka6eZt+3zwocJEtngg8lJt8R6p7hNLMPGT83cHmtn8aKDXEvfUOHOpMNCqPcoN0dXK0v9Ua4kH75iDsZ53Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoHP/ZBM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22423adf751so97069165ad.2;
        Tue, 18 Mar 2025 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306556; x=1742911356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZJUD9hlXsfSxFciC6LxZ0uWYlsr5EYH2X9weMPvlrs=;
        b=PoHP/ZBMTVaddrPEMmkuA/WhRYU5HgfgrlUY8DhaGeKEZjhr7RfgUEH453MPioe+aK
         BCvDWViSI3FH9goqKcGdEwgeuUQxkawoqYhTqAnHvGf0dZSaFhFFre+9Q0wfiXSk03vk
         /ySY/2GhqH4xkeifvy65a5vAUg3rxZEGahUwd1VQXdwfYBlYYc00Rd0z5bTSFiY1Q4Vm
         E1Wf2nLTNxmgFBHImP6LYJJTtNrv5KebylYGHg+mfOVhJl5rE88+HHHcRz05ENKiamcC
         ZNesPRpxlJiivCMngORPDi2TXHFbVjXu8W8Agx6QpRGFckN5Dk82LIv8SV3O9jC9Q0It
         RY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306556; x=1742911356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZJUD9hlXsfSxFciC6LxZ0uWYlsr5EYH2X9weMPvlrs=;
        b=qjPx6fPMNyF9vJJMi0j1Rt7hm/2pClaOPEN8jkATMVO1KEQczbCgUpJLu667ZbDSE+
         hhsnXEvr4mGDz+FbWtzE+rgkwZlPBRNmZ0d7xLM7wp9NgKaAEZLE3GSsFyFSUue44iiD
         rotFGwIuOTOncwxJsMhZUuFL7szr1t4CRo2zD8+V1M0uv3uvPd41QYroSNmKKdhZ83Oy
         yhUH3UfFcw+YbEFIVBetZzOEoBadc0END7pXp2WefKxa3Kf1jLGQFQ8DcJfytATwHdrC
         R+X+ipjFwhrxrLHaYKryjfXuCXumZmjCZXz0StcdhnRFE+SVmDiTOTAFvhz5IG35H+J/
         ToPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh20IHe9dUTKTY6QZX+E92N4FcRazTjhyPK6fg9k8g/ZML8gv2c8DoTyaC/zHRZirUYyavrFCWgcWEbA==@vger.kernel.org, AJvYcCUlu3Ad/bVDrLSwovqFo5MDsnzHzqba8J7SEZBEkC+uLjvSTbnDwu4Etu8c6NJwBmcX7ospARDMLl0p@vger.kernel.org, AJvYcCXvzpsZSTrme6EgjtlDhI7v7KuVFGp4+D3HBtd18LYdnqb0xQs2a+waSL/wzmb1q8yyLwoE4+/7RkxC1W8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/OJRnVuQZjTMnpsEVj0IHBeA8z2MxWnAMLLjEnUIBX7mrlCV
	LivN9FzgMpTYjUmqyOyYQEWbh7xHD5GE+tMMEn4F+/bWEOSXfOkX
X-Gm-Gg: ASbGncsrBVcdvzajJq7DnYGfEKIw/JL28mERukcaRGaixynwIfT+1y9/iNa8mqsFOdm
	rAmSr/IqbI1yOlbDJ9pbNaoI+3HVU2YndI2r7zo+SFW9IuDqavK2Pw7xOOnuRbjE9M5HFOmP6j3
	ODSlKEdklAjf3TxyVPz11LfrFbxqtdW5nKg+Fqn8gZuBP6gr/ZnssYVV/wwOetdoBJhZrHuftUc
	u15dzGboEbNUr14rq9bbHn67ZXJh6lIuDGraTztBGwZ2SwaB8dCaG0m7JQ6qhl/PMCOUPesi506
	Mx+OvbT6d6sJ8sa3vxcYGNgqnsJr1AcUHL7il3OLhAHCv6qPxIap7d0Qh+lkm2JRNKA4
X-Google-Smtp-Source: AGHT+IFBMrJUOeX6rBVBtMeZCzWcnrPnjlWcpCe5GLKn61z7Cz4IG3HfxXUVA8uXqfUqXzbnDgPFsQ==
X-Received: by 2002:a17:903:3c50:b0:224:1579:5e8e with SMTP id d9443c01a7336-225e0a3635emr228282065ad.1.1742306556109;
        Tue, 18 Mar 2025 07:02:36 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-225c6bd547asm93998755ad.248.2025.03.18.07.02.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 07:02:35 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aubin Constans <aubin.constans@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-omap@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] mmc: omap: Fix memory leak in mmc_omap_new_slot
Date: Tue, 18 Mar 2025 22:02:25 +0800
Message-Id: <20250318140226.19650-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add err_free_host label to properly pair mmc_alloc_host() with
mmc_free_host() in GPIO error paths. The allocated host memory was
leaked when GPIO lookups failed.

Fixes: e519f0bb64ef ("ARM/mmc: Convert old mmci-omap to GPIO descriptors")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mmc/host/omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 62252ad4e20d..3cdb2fc44965 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1272,19 +1272,25 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 	/* Check for some optional GPIO controls */
 	slot->vsd = devm_gpiod_get_index_optional(host->dev, "vsd",
 						  id, GPIOD_OUT_LOW);
-	if (IS_ERR(slot->vsd))
-		return dev_err_probe(host->dev, PTR_ERR(slot->vsd),
+	if (IS_ERR(slot->vsd)) {
+		r = dev_err_probe(host->dev, PTR_ERR(slot->vsd),
 				     "error looking up VSD GPIO\n");
+		goto err_free_host;
+	}
 	slot->vio = devm_gpiod_get_index_optional(host->dev, "vio",
 						  id, GPIOD_OUT_LOW);
-	if (IS_ERR(slot->vio))
-		return dev_err_probe(host->dev, PTR_ERR(slot->vio),
+	if (IS_ERR(slot->vio)) {
+		r = dev_err_probe(host->dev, PTR_ERR(slot->vio),
 				     "error looking up VIO GPIO\n");
+		goto err_free_host;
+	}
 	slot->cover = devm_gpiod_get_index_optional(host->dev, "cover",
 						    id, GPIOD_IN);
-	if (IS_ERR(slot->cover))
-		return dev_err_probe(host->dev, PTR_ERR(slot->cover),
+	if (IS_ERR(slot->cover)) {
+		r = dev_err_probe(host->dev, PTR_ERR(slot->cover),
 				     "error looking up cover switch GPIO\n");
+		goto err_free_host;
+	}
 
 	host->slots[id] = slot;
 
@@ -1344,6 +1350,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 		device_remove_file(&mmc->class_dev, &dev_attr_slot_name);
 err_remove_host:
 	mmc_remove_host(mmc);
+err_free_host:
 	mmc_free_host(mmc);
 	return r;
 }
-- 
2.39.5 (Apple Git-154)


