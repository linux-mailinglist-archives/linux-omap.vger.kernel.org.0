Return-Path: <linux-omap+bounces-5529-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A4D38CDC
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 07:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F42F30321DF
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 06:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B79632BF3A;
	Sat, 17 Jan 2026 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdnYvbjv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AA307AE3
	for <linux-omap@vger.kernel.org>; Sat, 17 Jan 2026 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631303; cv=none; b=jmouVQg86vAPwxJ0ZsGZ4F3Gqn7qyw1K8mi6kPcXAI/jVMvdxWUH2XA2Z3jw96ctFpJSa/fO8B3CtYTpeR78SPqfOZ8EBXK/yM6XlG70UeQiA5kIUpxMpltgnR5AauWt9UUhNjoaRSlVz9oTdm9Ja7CmFBoWI0YShRb94jWsmhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631303; c=relaxed/simple;
	bh=M38UZrYYRaTPEGzZ/Y7eDYLQg4w1JxPNyj8pheltCPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIsPzYtpYrJz/zSWqKq1G8CrOVdorBF6s3CphAGZ3gA17dqpVlBDHN2aLnVD3CWr4OvSq4BZiwZVH4E9dxBUXu+ALk0iWcQ+dtBMsEdCA5wWXy1959nVLUdwe+g5rsIEIfIqhqg2gOSYGwfzFmJ/fkzq1gyaGBB/lLZn39x8dKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdnYvbjv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f4e136481so1299605b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 22:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768631301; x=1769236101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXNZ8DQ6tAU6IX0W5rGA92ANtuqk4OHiR9iWzAZEaeQ=;
        b=cdnYvbjvb2GFAev4rv0NUr6Uu61RJslyYGAuDlA6/DVMPTUOQBFvX46sFbrw3oGTcj
         n1Et4iBSvCh6+D5JX8belrH92c7sKt4IMkip4QN8yBBKCc7Yy730WWBV8bIzM2+fxZyk
         3omXX3D8h9/2h59rlcWO9sCmiH6c9p0G7d/WbrjBXJfndB2vhKfDS6EMVJiTaGT73vU8
         QeEmMOpo2+XPYg2k8zi0mBQ66CwqwrB0VB2fVK2Citc5eQyfAl5I39luWuCEAC0J2HFT
         E/06v1d/RjshQ0SPaBQbACts/N8SirRHS33S5X4iXdKLOhnHtMBJDFk5QQEkmIqUmTJa
         nCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631301; x=1769236101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXNZ8DQ6tAU6IX0W5rGA92ANtuqk4OHiR9iWzAZEaeQ=;
        b=TH2Kwlj4c+rtbgPVHJZK26iWm5q8+vSEFhiqyWyp0/r3PvAzBXsOTwk23ZKCu6Q7VP
         tPZUCqSEYTr6tYzGDJt7piy9gqy0qIqqwqYe+mCwdx0pYxvKskEUULHa5wOpWzu6MM69
         vsDPRc1jDQtMgQCJd0atKjEvr/RFaHcQdrGQEHBvuIzzGCApDOxaBzWNxtrJK6Mlh1Zp
         jYw8TF+5g+O8a4Tk3dSn0hl85wAoZgvwyOsJVDVPGXHn5t8ZpmdH83Y6Y56/NzScTzUd
         RFW3B4qIufoRmBZvF3LG5aYdycHIwbr5Kmmv11LEnJGR/RUiyf6zwq1I8XnPpLseLyYQ
         vx6w==
X-Gm-Message-State: AOJu0YwtLqItIGmXflNckxlEJW0SwUrZ1pCFqc/I52TEH3p5sP6JTL5s
	jP5+7XTN85J7pzGkpeFCUiq2OTRVBMCvkZpBp6sTgSJ+rIgECCW20w8T
X-Gm-Gg: AY/fxX6pNwTTaJB8s4BjehC8mZEIgOwAcBMX7wRaiiYOyV4x67whMPaQHNAtauP9+kF
	gwdvNGHUfaVdSinxAs+RGLfsOqVALrOlhAQFL4DAlDgPSDRWCnwVXM2s3oDRrTB5B7KVvV7Ulo2
	7XSypuglmCSin5rrltyd8f11a6ec8m5V/jNgDA7jOxAU4GjWeyY896XqObHbs4PEFTOVSjeEFga
	Knqsr8vDNBud89Jr9yzIk4/oCNTZIlaGs4ezrGXdGFjrNbwYb8vJvo5qA4biOKsUEPzvXR4AYAw
	J4EcKarUi2VwsR97uYhmR7aeMtXF35A8EiOerF5AHjeAIl7Jx9ugqUxznFK9jcYVF/gjrin/e0Y
	2gWIC9C62uxQbX1/ZxgklI+yBe2LtHv2qdxwoNmb7rVgTZSDrC7UnN6d6mMuz50+qR/K/OBrpdW
	fp7n1vEhutCmaii75UuQAB1JUiyYxpMVBHe9z+y/ZQJI6jB4j557zp9REaUINByzlsRcwQRM90b
	KqKmB2AheCPt4P9v7HxfxZauxhMTGs6JtWpJxVxhm/kpAHUgbcj2aRB4w==
X-Received: by 2002:a05:6a21:6d88:b0:364:783:8c0f with SMTP id adf61e73a8af0-38e00c42ea3mr5018596637.33.1768631301315;
        Fri, 16 Jan 2026 22:28:21 -0800 (PST)
Received: from c8971f1abf06.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf232f00sm3603396a12.2.2026.01.16.22.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:28:20 -0800 (PST)
From: Weigang He <geoffreyhe2@gmail.com>
To: tony@atomide.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: fix reference count leak on module unload
Date: Sat, 17 Jan 2026 06:28:14 +0000
Message-Id: <20260117062814.440540-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stdout_path static variable holds a reference to a device_node
obtained from of_find_node_by_path(). When the ti-sysc module is
unloaded, this reference is never released, causing a reference count
leak.

Add of_node_put(stdout_path) in sysc_exit() to properly release the
device_node reference when the module is unloaded.

Fixes: 3bb37c8e6e6a ("bus: ti-sysc: Handle stdout-path for debug console")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/bus/ti-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index fd631a9889c1e..822b9b1b2f6fa 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3338,6 +3338,9 @@ module_init(sysc_init);
 
 static void __exit sysc_exit(void)
 {
+	if (!IS_ERR_OR_NULL(stdout_path))
+		of_node_put(stdout_path);
+
 	bus_unregister_notifier(&platform_bus_type, &sysc_nb);
 	platform_driver_unregister(&sysc_driver);
 	sysc_cleanup_static_data();
-- 
2.34.1


