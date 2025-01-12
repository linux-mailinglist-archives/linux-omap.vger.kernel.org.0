Return-Path: <linux-omap+bounces-3094-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D08A0A9D1
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 14:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD02E3A522D
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 13:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198781B87CF;
	Sun, 12 Jan 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onCmsdFc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9F1B3930
	for <linux-omap@vger.kernel.org>; Sun, 12 Jan 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689603; cv=none; b=UeW/DBF6b4+kyibP8Mbbl60pHFWu+Z+whxrGQpEos1UVpqfs6l29UpjsVwPfpPz7lgVk92sHUeIIUP25Zpj/iXTucs8GQbJh1wriqxVLVBvAD1VDs8xoKEuWkI7MvaT5sfMOpw4wc4nWfeZFSI2XnLOyJ7Z+38T/hhAEG5O6y18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689603; c=relaxed/simple;
	bh=8pRfnhU2tsCyFb8/DqJSYRFJG2u8l2yOS3mqK+F8O6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2bt8S9P9xdwmXneagDJOcgYU22f25M31UEGnsj0KMr/ND5rabvRHTg3ZFR7rvR3md7elD53jFJ30ZFw6U9HprCj3Cx7JIfuxfozUxTj72mLESimjT3k2XWGcftL4G317H7ihgTgp71ryYAVMDcJVWA0Z2CHBBeXDMVKJ/SxccQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onCmsdFc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0ac3be718so622551a12.1
        for <linux-omap@vger.kernel.org>; Sun, 12 Jan 2025 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689600; x=1737294400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17mfEUKLFobncZ1DtZDYZ0xDKM3wSv4g9CH5hL4TNJo=;
        b=onCmsdFckaPBqaS9or/r1TG4IOqK7G5fBI6t7FnSYaLaa0HqLyGCu80Jr0tRYraUhd
         zyDRA847MMDPCDKUeaPlXOC/vGnfuMoP+1R8+Umqtai4Mg3lf/uCl0MbVr0rr7aMGW2v
         u71GV1g+1tZBjpAwDfuzLU5SNAp/qnyB6yks8mIb/PkGL/Gc3dSa9tzTYzcfuRbpXJPi
         BKK54Jblr5l1/2sz5kCkZzxpP5SJpJBqbW3Wyg+yLnd/vimpGlf2jm7uWzV4BIepw252
         mwmvydthPIr8wUAljT0Nt9xq0fcjbWxB/6YeZDA1Lc3wGLABxoRKR+TRbIkrRpbC1DUr
         4QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689600; x=1737294400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17mfEUKLFobncZ1DtZDYZ0xDKM3wSv4g9CH5hL4TNJo=;
        b=aY4FKgeu/X/DF69WTwlKWhEa9t9QjSjwj5Jwz4YUsYNfTJV/DiRhZcqJo+noHgkIsH
         jvaZnU0rw01/y3L5fpDn5GUYlrBANyNkQXyihvXdHo6bDKbxdmgBSlRxD3r/ugBLJZYl
         SCeZfyg1AG+PSsAR6wXpU5vIMmgqck58YCKNsgW93pL9mk3fotMQZYYIFbNdQx+Zbd/e
         ZyhSOhdhv0jAHRyDoERCKdjAs63pGh8DYxa6VV4HteEohccVfY1JZpP+2BkmoK1hXw21
         NSyBI9lTct8nK0WKZ9QvImoTK7EJ/TLfLvTqvZuESX5Kr9L2XYPqbhYNM9GPtWWzOzMV
         o9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUyvWK+P8Kmn4m6/N6vNHhiD2YOYrGZwLQERPZf014nO2aF3shslZ0/ViN4dn9V6zhVjYKyIciugQVY@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdHm2GjmuXA3nEa7H/DI5AYLpiDKpBfXHr3CY6Mqo+O+4r2ni
	pZRCQnelN8OWJRKDPN4gDMgIR16jx2RxD6xvVzE7Qvtow6RsO1ILsuuHFciePhE=
X-Gm-Gg: ASbGncsxUnnogyXAVyO+H/0GBRe5hGCRM/MVKtmNzMhfEL8mbvfozkff+AiCp8eI459
	g6F23GFNwtKmWLfRt+x0BFW6ijEI0MIfKL5fVcovQqd+VZMDzRP7NbBxd78qldlktp6XkBshvu1
	s9wTkfKpWRGRcOtJt5Cn3iTq51HOyBdk1ZLRZT5QE4vGxDrthtp5wVP0raLxEySW78jKSZYUKMt
	3Mi7Ucim59NeFfEhTP1wBojOFZ13XwCvq263UF75d3fVXZl2rjMlc8ZXIt6co/aPayYik0=
X-Google-Smtp-Source: AGHT+IGek+mcaMq6Bx12/YzpJyPJOeOrjQQOfVQjcgfD7uU+pEIuD+vivjLmYHe/XC44J0Mh/I2d6g==
X-Received: by 2002:a17:907:6d20:b0:aa5:46ee:9545 with SMTP id a640c23a62f3a-ab2ab571e20mr567188866b.5.1736689600270;
        Sun, 12 Jan 2025 05:46:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90638acsm371051266b.20.2025.01.12.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:46:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Helge Deller <deller@gmx.de>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] fbdev: omapfb: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:46:34 +0100
Message-ID: <20250112134634.45991-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
References: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 7010544e02e1..ccb96a5be07e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -3934,17 +3934,12 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	if (np && of_property_present(np, "syscon-pol")) {
-		dispc.syscon_pol = syscon_regmap_lookup_by_phandle(np, "syscon-pol");
+		dispc.syscon_pol = syscon_regmap_lookup_by_phandle_args(np, "syscon-pol",
+									1, &dispc.syscon_pol_offset);
 		if (IS_ERR(dispc.syscon_pol)) {
 			dev_err(&pdev->dev, "failed to get syscon-pol regmap\n");
 			return PTR_ERR(dispc.syscon_pol);
 		}
-
-		if (of_property_read_u32_index(np, "syscon-pol", 1,
-				&dispc.syscon_pol_offset)) {
-			dev_err(&pdev->dev, "failed to get syscon-pol offset\n");
-			return -EINVAL;
-		}
 	}
 
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0


