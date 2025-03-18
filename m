Return-Path: <linux-omap+bounces-3428-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA9A67BD7
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 19:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D6B189D5D7
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 18:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD67212D9D;
	Tue, 18 Mar 2025 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnjHB4Oh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B7212B02;
	Tue, 18 Mar 2025 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322028; cv=none; b=MfontpEml0+Z7ai0W4h8XrSasEznKwqTude3n7zoMkPF1dJ48LIsIeTgCyQoJ7fgKaVDSF6m8br4DDjAPhOgCFdKHSkU2R3anaTSvnYUFC5VP327TmqvjDUCZAIAd78aegsIq2mFbwNLUGD4yt5nXCd8R9HF9FAc/Rp3LgukqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322028; c=relaxed/simple;
	bh=jss1s2FOO3n8jyBKQIYkFjfvYgm5HPBVc+/jud4Rfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+Y/njU7ycGbz5ELyvm7eRq81BAiAI1nfns/VZUlZj/FmcldYaTpkSwOXcHaFpaJlqQjM6A0hp6sLRaWC2bPKZalMZVMS3/ZUa1X/FZRj8BzVoUSQCoiFzAkHDa9GMo/YTSIKZCeFU0HRpOV58W1J6NBh39GHEuOPP0qhD/XEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnjHB4Oh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54943bb8006so5413572e87.0;
        Tue, 18 Mar 2025 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742322021; x=1742926821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7OecC4DAg+MsM1VQ20M8byz+5h2pRm2mp88QPs7J7o=;
        b=gnjHB4Ohw680w8c7Lnby7pxWFSdEGuW8AHCO89tjlmx3glZcgVYfFqvIpF7/5k17Gj
         LdsDZtRbkk87eihhr27FGqtI1RlVMmTqIb/zbdeBQrm7Hfwz6N4T+inGdTOt5Z9Y2hkz
         zsO9j1y9hHtk/Gs8dL9DbzahlM3Lg5YChzcLNux3an1m4/oc3OgMapFrfjRDOVyPIy/D
         9IbMXcYRS6qj93PcO2MZt/WYv6ZrPcPw/ZstRDvsow25wjm8WfxuetDJrj7rdBctniZr
         6HLWCbiJ/4RSVdba01Ilkc7cEOrrva+I+I1Nj/A87k2wMX7NHDTQ2xIITuDbQSGLRyFn
         NoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742322021; x=1742926821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7OecC4DAg+MsM1VQ20M8byz+5h2pRm2mp88QPs7J7o=;
        b=BNwsaRWk9n/bXdSV0aNksy7jz/ewCO2haEsj8ACzTwSHDDT19W5XGSJHT1d8pn3dTo
         ugwGuKyfIDT4HbTvL0uV8GG27VrfIjBrMoNVA556Z/4aOisRdILGJt1kTzz/0R/GHiOv
         +L0Qpxr9LsgV+irintIYTF/nTkc51EIaPkNm3vHAaIfZhOC6zznu2bI9OgXX6cs7bXAb
         go91DYgswdUkIiny/M4SRS4/1PBgTZBgbTNdY5c2OGoXbwefuz+XKWHGxGO97KZineTw
         mT4KQbq33+3YEbN4Hf56PlGcli24AVTIsPsiDOAsHx22jEYAtTGRmwOxfH8PZRePtPUr
         SqNA==
X-Forwarded-Encrypted: i=1; AJvYcCUC5CAWNUX70dVLkFQGJS4/zfbHrlPOGAIFvsRU15hooqu6E4RaPsnFtLyWym96bOMhIqOaCAvWFeMStQ==@vger.kernel.org, AJvYcCUH2X5soBxM16iH3CP7/whdDgA1O2NZJDaPPnM69Xa1ipKGKHc7cZHjGp4FkUXY4b/vJJQrztqyjPDXt7jZ@vger.kernel.org, AJvYcCXgupOPLVevGVlkMPzfpmZxcsmSgBLLwdngUXRZaL41tpISzR169+S3vn5DWXfqGRHqnN+eQi5Ul6Y5Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZC7Xzp6kEa3ss5e3iqO/DAWkPqDPXnqj4O6TeBw5cDGAx5rdp
	6cbyURHMriUNWq8jXuYg6/neXPJWCudl+7dcLEf59eugmU9i6Qwam3z+uXMNDlWB+Q==
X-Gm-Gg: ASbGncs6kp5q8+zUtDH37XK3gCaDMvw4DU2fhMHBc7KApVyfx20kb4qCl+/C8R1TCvj
	YWLo5b5VUtAIhJ0o44WuLgva8DE1M+r/qZDHx/tG3SKZ4y3hfX3vr9j00S+4idH5O2IiMIZWyuF
	Fg1+zs9ZSEhdGTHcF3uH8rl4ZZKlenUqFbEUNRvESFzfiaFIrQk1kgqq0vN8fdA/2TDenfdjydq
	RbqnaZPx3lpYLYfFu+RXR7XhgxhN8RoorcHgBqp5sz0g6t0oIwpk9r+Xf2KF6g05jDp/oRLlhlH
	Lt7MfdmfLIi3PRnIDZqFH0JWnWxngnvTaOxeei6VtlEodg==
X-Google-Smtp-Source: AGHT+IHPX6HT7hSFxyVpA0b9mgdNwPC79Sanp/rYFaB6q9h9RNj2SkgKzH41KR42nto49Hx5XubV4A==
X-Received: by 2002:a05:6512:e97:b0:549:8fc0:bc1c with SMTP id 2adb3069b0e04-54ac9cc3733mr33583e87.53.1742322020710;
        Tue, 18 Mar 2025 11:20:20 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a84desm1780577e87.46.2025.03.18.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:20:19 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 1/2] fbdev: omapfb: Remove writeback deadcode
Date: Tue, 18 Mar 2025 21:19:51 +0000
Message-ID: <20250318211959.8557-1-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Value of enum parameter 'plane' is initialized in dss_init_overlays and
cannot take the value OMAP_DSS_WB. Function dispc_ovl_setup_common could
be called with this value of parameter only from dispc_wb_setup, which has
never been used and has been removed in commit 4f55bb03801a
("omapfb: Remove unused writeback code"). The code in the if-branch is
unreachable.

Remove unreachable branch.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index ccb96a5be07e..8db074862824 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2659,13 +2659,8 @@ static int dispc_ovl_setup_common(enum omap_plane plane,
 	row_inc = 0;
 	pix_inc = 0;
 
-	if (plane == OMAP_DSS_WB) {
-		frame_width = out_width;
-		frame_height = out_height;
-	} else {
-		frame_width = in_width;
-		frame_height = height;
-	}
+	frame_width = in_width;
+	frame_height = height;
 
 	if (rotation_type == OMAP_DSS_ROT_TILER)
 		calc_tiler_rotation_offset(screen_width, frame_width,
-- 
2.45.2


