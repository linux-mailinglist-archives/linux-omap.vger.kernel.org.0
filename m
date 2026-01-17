Return-Path: <linux-omap+bounces-5528-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FCD38CD7
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 07:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 877E93038047
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 06:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7803B32BF58;
	Sat, 17 Jan 2026 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD0Fz8SA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BF279907
	for <linux-omap@vger.kernel.org>; Sat, 17 Jan 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768630965; cv=none; b=XzFifd+VuC/uqHJH+XzNY66wcs41Zva/WdFfyRTBZIEWeKHuDL4QYUho2o+U+pFczy5Ytkg7KXWAzr13lG/oZt5D7+XeAMhsej101ecRIar/IsgetTjT8ZC9iswkK/bG66MhnhSk9mutJGCv2aB/SSRa8+KzNXw3F38PyD+OCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768630965; c=relaxed/simple;
	bh=3FMUpbSyvaBsSjWl7wNChTOpAPhfLU+5WdVXV+kFTVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hvJRsXKYbewPj8eOV1kJ8M8vuku5isrVvoJ3ULOF6DkSVxl3w2sKdrD+VaolV1awS5AaDdwB9M0QBMBiSgZbM6WiguVcK+8psjdmmogc0eW7VxeUYyjI/pdvzKfG4Ezgy8e5+bWY2Axsy27Heh55RD7BaYb63auXxNBkYgO8s7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD0Fz8SA; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1176288b3a.1
        for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 22:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768630962; x=1769235762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzgEeF9hpKbrY/SjLzdTBS2moZ5Wv1qjh67NLpQv99c=;
        b=nD0Fz8SACqM+KcdyuQfHhV7QKLkw6LTcvjsB1L3oUdhUauq7PgLpSkcBr02Nc8P1Wd
         slEo86vgmixhNwIy9PN2lDry+4erz75LM3tjEHerVRN/7O9KRfbpKmFkCCLcR5M7clFI
         77WlCaXYwFjVITYOVRNoJW9Sbh6dVjc6rYQFORB2EjzKASk7C8dDVn/5aqGqeslyC+UP
         gwoFAk5M0gHe9ddVB+mP8kGPOnASycs6menNKgGIP9OATL7COZmLmfYR/ynhEjXI0G7F
         XpQgoetW1Gu3oDsoaizZ1BFuCUkElPvWIRHnENZRqijCRhJBl4h6ADlOMk6GNyBliu0O
         AtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768630962; x=1769235762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzgEeF9hpKbrY/SjLzdTBS2moZ5Wv1qjh67NLpQv99c=;
        b=f6iAASjdfH8CtTjnWLbXERyLVSZgUU02AGBe3MKQE/2RLFF6wwMNTI80rfCu5DnfDr
         M/koparNjNAooW9NUS76ebmfxH57zcOH1rTfEdjOe1mDIdH0tOFS335O8CLOIduIVLXL
         J9DmrvyJUYxi6Sipq6wtpGly4o+ig5WwD7tqvQ73C7W25K3s8omA1XxYbZvZpQwquSD2
         pixDfSqWbsT/UcLst7lXxpLe7WIijo1PXqrLK4+hY2jJvFsdyic6jB807T0/1pT5kbgO
         P/t/UourVZ2aeS/KlW+1kOF+J3Bn+LnuSeNaSuK0SSx+0zEVG25GUDkrxHk+Y9D1xduz
         EXqg==
X-Gm-Message-State: AOJu0YylYeRz53ENu4uUhqMc0ZOmHOSwxNPyvL6iKcZ+nUbBXepWWVak
	ZJfEsxHsOqqiwuihC91oOWVAyK/JzNNMOOQ/sSlas1PHhJEQsElKX2nJ
X-Gm-Gg: AY/fxX7i3nzO+UeowDxYRyLx0ZJ5DOahjoD/6/zv3mKTpGodrX77Enn1YVs9/Yanag4
	REjCfl8ZsWH+iWP7KjJh6VaNxX1mtCNdR2muOAXavga5sawxbG4abFBnU/LyfS9jv6Q+KgmzMlw
	hN+c6a+7RxQvItGDynB3CmqenVPk+G7RlceLEAHDyIVODTQm6amEddW0Y4lQB+D0x+jWN2cI4na
	QF3LvVfElflhRdSYshqsU72xYeHCx1YCciF/G9jKgNR4dF6eQx3l8EBYa5lQzs7O5VgnZtQdk0z
	nl9gXqjdnP9QQbtdJlR26c5n/1PNGxLbM0J7Qi9N6ciu2qOA4Itum7jLJ708N+qbU49X3WP/WUn
	/Pwrqk1IzkbFUPjmcc9o+oLh3onsSDlsKiVqZT6flef822hTOY4YhrS9Ac7JEaNtg4L7nhSZyyO
	EPdbxzpf0zLc6ilYg1R8dvVH1ETGJ/E//Q68hdb3kpb7RrXSRp0C9+z00G1aFLhYSX7Qz4/6GAb
	VoNuB+Zwh0vfOyIZmH3I93tYEFq/hz0FOxDZWatDTU+I4KWfV0zJBunGg==
X-Received: by 2002:a05:6a20:12c9:b0:38d:e87c:48b3 with SMTP id adf61e73a8af0-38e00bbfd6cmr5718140637.2.1768630962577;
        Fri, 16 Jan 2026 22:22:42 -0800 (PST)
Received: from c8971f1abf06.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm3507131a12.19.2026.01.16.22.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:22:42 -0800 (PST)
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
Subject: [PATCH] bus: ti-sysc: fix reference count leak in sysc_init_static_data()
Date: Sat, 17 Jan 2026 06:22:35 +0000
Message-Id: <20260117062235.435174-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_node_by_path() returns a device_node with refcount incremented.
The reference to the "/ocp" node is acquired for a WARN_ONCE check but
is never released with of_node_put(), causing a reference count leak.

Add of_node_put(np) after the WARN_ONCE check to properly release the
"/ocp" node reference.

Fixes: 5f7259a578e9 ("bus: ti-sysc: Check for old incomplete dtb")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/bus/ti-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 610354ce7f8f0..fd631a9889c1e 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3014,6 +3014,7 @@ static int sysc_init_static_data(struct sysc *ddata)
 		np = of_find_node_by_path("/ocp");
 		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
 			  "ti-sysc: Incomplete old dtb, please update\n");
+		of_node_put(np);
 		break;
 	default:
 		break;
-- 
2.34.1


