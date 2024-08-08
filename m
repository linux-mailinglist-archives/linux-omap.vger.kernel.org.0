Return-Path: <linux-omap+bounces-1876-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2A94BD2F
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 14:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA7A1F20631
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4CC154C17;
	Thu,  8 Aug 2024 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hD+Csibd"
X-Original-To: linux-omap@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-68.smtpout.orange.fr [80.12.242.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AC1487C1;
	Thu,  8 Aug 2024 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119348; cv=none; b=e68/bgkiAG3/ZDg98P+vgjIMrQctGo+ebDrSO/Y7KOUHAcsqIKa+xiK0td+yc/ltSLjNfR5WMepbcxe5lPXuL9ShPsEYPvA5vykdAe2hjU8ZRc5GeIoz/bVe7JNwlNekM6Zq4VKwVXrMi9uT4SEDZO8GLf3t+9dz/VVsCVvf6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119348; c=relaxed/simple;
	bh=Zs9GV/PpP2+HT8ueJvw8gaqWxgXPaZn9fnfCTlh3r60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jr6aAJYWzfRC8MIioi5j9pHWPgdlEXblrsp+cbaFQSVwxt+ivRbaZO34HsagjDQDsgq10opvjMcEjOv+O91K3yx5ZufjK0beH7c2uvyAkvwV4u3+WqByNzyOIGjax1lzy0eNobzQbGFj98zpmXTwpakNDodlX+Wmh0K282iYOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hD+Csibd; arc=none smtp.client-ip=80.12.242.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id c22FsjXg34i5oc22Fso0uS; Thu, 08 Aug 2024 14:14:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723119268;
	bh=TbFcLFR+Ykm8NP38Tp75wjsIr7BQ5vw52Zbiz2qPNlU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hD+CsibdhzHAo/JWY6/xhOGcKWFp4t1OqiinJJdJzzFWH8y6Jj68TkqUqU0MkjQid
	 cSW9gMb9MxcyxX7PkDNh3hUIhEJwINUAdnIhMAI9jckcidhnZ5dRwMxrmkSkmTomrx
	 tXw4lRt2hvormIgNEf7c/xqzBD5GPpbaTPHM3giGfiUCdIfp2AtZa0NhGoARpsVIb0
	 /vbtQ1VJWGc9jxWVFpuq/cPq5scIvrkGbgf5culmP0qc9Z6NIlupfgFiR8H2Y8Gf5n
	 /08GZ1Aye7xF0XOEWDB0f1/YjZhCBKPJTEVGK1NdMULEwQlFzWNesieeoQo1y7jZmC
	 KPoPygM+NBp6A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Aug 2024 14:14:28 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: omapfb: Use sysfs_emit_at() to simplify code
Date: Thu,  8 Aug 2024 14:14:22 +0200
Message-ID: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file already uses sysfs_emit(). So be consistent and also use
sysfs_emit_at().

Moreover, size is always < PAGE_SIZE because scnprintf() (and now
sysfs_emit_at()) returns the number of characters written not including the
trailing '\0'. So some tests can be removed.

This slightly simplifies the code and makes it more readable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

2 spaces are added before color_caps[i].name and color_caps[i].name, but
not ctrl_caps[i].name.
I wonder if it is done on purpose or if it could be removed as well.
---
 drivers/video/fbdev/omap/omapfb_main.c | 36 ++++++++++----------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index aa31c0d26e92..e12c6019a4d6 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1241,14 +1241,13 @@ static ssize_t omapfb_show_caps_num(struct device *dev,
 {
 	struct omapfb_device *fbdev = dev_get_drvdata(dev);
 	int plane;
-	size_t size;
+	size_t size = 0;
 	struct omapfb_caps caps;
 
 	plane = 0;
-	size = 0;
-	while (size < PAGE_SIZE && plane < OMAPFB_PLANE_NUM) {
+	while (plane < OMAPFB_PLANE_NUM) {
 		omapfb_get_caps(fbdev, plane, &caps);
-		size += scnprintf(&buf[size], PAGE_SIZE - size,
+		size += sysfs_emit_at(buf, size,
 			"plane#%d %#010x %#010x %#010x\n",
 			plane, caps.ctrl, caps.plane_color, caps.wnd_color);
 		plane++;
@@ -1263,34 +1262,27 @@ static ssize_t omapfb_show_caps_text(struct device *dev,
 	int i;
 	struct omapfb_caps caps;
 	int plane;
-	size_t size;
+	size_t size = 0;
 
 	plane = 0;
-	size = 0;
-	while (size < PAGE_SIZE && plane < OMAPFB_PLANE_NUM) {
+	while (plane < OMAPFB_PLANE_NUM) {
 		omapfb_get_caps(fbdev, plane, &caps);
-		size += scnprintf(&buf[size], PAGE_SIZE - size,
-				 "plane#%d:\n", plane);
-		for (i = 0; i < ARRAY_SIZE(ctrl_caps) &&
-		     size < PAGE_SIZE; i++) {
+		size += sysfs_emit_at(buf, size, "plane#%d:\n", plane);
+		for (i = 0; i < ARRAY_SIZE(ctrl_caps); i++) {
 			if (ctrl_caps[i].flag & caps.ctrl)
-				size += scnprintf(&buf[size], PAGE_SIZE - size,
+				size += sysfs_emit_at(buf, size,
 					" %s\n", ctrl_caps[i].name);
 		}
-		size += scnprintf(&buf[size], PAGE_SIZE - size,
-				 " plane colors:\n");
-		for (i = 0; i < ARRAY_SIZE(color_caps) &&
-		     size < PAGE_SIZE; i++) {
+		size += sysfs_emit_at(buf, size, " plane colors:\n");
+		for (i = 0; i < ARRAY_SIZE(color_caps); i++) {
 			if (color_caps[i].flag & caps.plane_color)
-				size += scnprintf(&buf[size], PAGE_SIZE - size,
+				size += sysfs_emit_at(buf, size,
 					"  %s\n", color_caps[i].name);
 		}
-		size += scnprintf(&buf[size], PAGE_SIZE - size,
-				 " window colors:\n");
-		for (i = 0; i < ARRAY_SIZE(color_caps) &&
-		     size < PAGE_SIZE; i++) {
+		size += sysfs_emit_at(buf, size, " window colors:\n");
+		for (i = 0; i < ARRAY_SIZE(color_caps); i++) {
 			if (color_caps[i].flag & caps.wnd_color)
-				size += scnprintf(&buf[size], PAGE_SIZE - size,
+				size += sysfs_emit_at(buf, size,
 					"  %s\n", color_caps[i].name);
 		}
 
-- 
2.46.0


