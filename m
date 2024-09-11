Return-Path: <linux-omap+bounces-2185-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1859975A59
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2024 20:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC591F25FEE
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2024 18:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D48E1B9B51;
	Wed, 11 Sep 2024 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avqJjFg4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC11B655A;
	Wed, 11 Sep 2024 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726079123; cv=none; b=NKSEOvs4PaP/0C26aa+8Il+ySOlIZm8ApJexgzojlwKSltBN9jrGUX7a5Q7alfL7AlOsv1nBmeTJ2LBnEP6QdKg0YnEWuw6audrSeN4Pra0CG/rHUiEQdrgmL7eA3hjqGO7hF9kukuMAOMVjTaadvVDJWLPGDbHxMfnWpCk71I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726079123; c=relaxed/simple;
	bh=ZFbm6RvuGzyg/OXzLGx4dFjmyQYMdMuowComNjj6Bbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuyI+Sz/Z7mBnGkHu+k1j3wZfbJQy/sff3Oknh3+gIjuDs613g5rDBM3cb9td8YKlm4uJYmQVpBvWeTZNtXbKZOeM+6lZhJzNwaeWL+BZlJEkF0gKhVcSv0suXjhpXRNQnMOZZrAfF+Wk4IwKVBIKdvHAcfpVQ2ZyUnUdYg5Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avqJjFg4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so532655e9.1;
        Wed, 11 Sep 2024 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726079121; x=1726683921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxR+vNB93ufPg0Y1ZRk8v4VwhhNXPxM1gxuKsa+d6/0=;
        b=avqJjFg4O4NdBLdgSPIBByggRc6VkPGcarvqwNd+yq2tWrnVbolb/ulrzn+dz1mlJX
         Jx36PQOFsMXZTQrTIhwHNNGPP4kfWa8CuE03mcuqxku4NN/PIVA4u/ZGNFeetZ3qJrPQ
         mqar0m0V+eDucVKdgEWVSM2nh4Tpbvapqbv/VxXGLbQS1UHGtM/UOBqIpNESvwzWheXJ
         icqSMfs4vhs8wDwDpfrKOsyolM/MDemBz06HJ2kjnp5y2x+oqvZVgG9zh3PAk4efNBZX
         9hgI3Hg9dlDjwzpkRMC1hL+xzXb0HuBEJtyV9QZLNpHVOE0BH2XOKmwVKoWaX5gAsnee
         m4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726079121; x=1726683921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxR+vNB93ufPg0Y1ZRk8v4VwhhNXPxM1gxuKsa+d6/0=;
        b=QHfsKnp3e98dSNxAK9vxN5g+HRi3foWk08iqc84aGvplbQst1WY0uTuAHlLc1iYC6l
         ehmDqJPV8XQKfEWl287idp1w+ZKTbxoqpkF5ognmko4c1YIUtVczqv8lAdzyphjTZ7WH
         QYvEMZW6Vw+88mjvSh/qXyu5uUeh2aStinHgD4BnVpfVG4ZvwLMaflbPiNW0so19uTVr
         lyn0ju7FAVRzK4fKLMnb9VYjIBW2QURQCdm6P8wVSPTBuMbRE+eD/uF2agEuySQoy9B4
         kEEj/TYFqSah98uziNRFL/6q0WtNbpqjQzlmCpwG3IWyWdRRza5exRLjuXcDdsil2ai2
         k+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUAc2fgLeU9+IgFdOsDuNweuU9SEusRkFcQtvrEwQnCim40xYCtscGQIegLh1yd6T/TSNt2hQYAKCKjrx8=@vger.kernel.org, AJvYcCVEEBDcaMv+TbkdN9DQ6lm4r/6tu3gh4ep9X1jozZEvtWDLL8imjoney8MfHDo0Q6914C4VC9isSX364sko@vger.kernel.org, AJvYcCVxV3Sl5YIhmLQJlGhARptqKggoKIwaNcNdsNlcaA4dbQ9WkjbsMEXQyVKCvScifZ8I3Gqbi0tMyGfi3bbrVMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZR+Uv8LpJcQhcHZ0d+geGPdM9Kk5ZuBTHKhB6pFTYPDBIACd5
	CekxAwAyBFXAglQg0tRzDiVXQGFnXmQ5RI+COO6KtqqrESz93bzI
X-Google-Smtp-Source: AGHT+IG6EBJS+D/O14RGqyVdq3Z1OqN0oOzz6xJGseNGrMXdlv0fn7sOAFcf/NaC2Z7Gh++8z1XETA==
X-Received: by 2002:a05:600c:45cf:b0:42c:a802:540a with SMTP id 5b1f17b1804b1-42cdb511f33mr3768055e9.7.1726079119903;
        Wed, 11 Sep 2024 11:25:19 -0700 (PDT)
Received: from void.void ([141.226.10.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb099acf6sm146736855e9.9.2024.09.11.11.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 11:25:19 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] video: fbdev: Fix a typo
Date: Wed, 11 Sep 2024 21:24:37 +0300
Message-ID: <20240911182503.3600-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
index 9a7253355f6d..cdb1dedca492 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
@@ -351,7 +351,7 @@ struct omap_hdmi {
 	bool audio_configured;
 	struct omap_dss_audio audio_config;
 
-	/* This lock should be taken when booleans bellow are touched. */
+	/* This lock should be taken when booleans below are touched. */
 	spinlock_t audio_playing_lock;
 	bool audio_playing;
 	bool display_enabled;
-- 
2.46.0


