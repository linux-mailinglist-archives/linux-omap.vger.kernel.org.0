Return-Path: <linux-omap+bounces-3093-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18394A0A9CF
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 14:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C903A2989
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B611957FF;
	Sun, 12 Jan 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vw1H9StP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8781DFCB
	for <linux-omap@vger.kernel.org>; Sun, 12 Jan 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689602; cv=none; b=Od1dRtV+X0+5B2S04u5JkevMQp0r75J95Nb4JBi0u7fWtV08fpU8KmDWAi+ZeLwRPJvZs1ZTPLfUafl3VnSgZq4VZdaMHQX5hf9NMunejgiqfh1/hMItngqdUfoKYVyADyw3VHZBPYUnkgdCiaxoUDP1Ps2oUCWD6ZnYVwuxjPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689602; c=relaxed/simple;
	bh=e/bFAP1b+US7EIx5pCvXpBa7AB0HDN63nHuUpToIvz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSh9tljpM24X6nFO2Cwjzs9flCwdHQzQ289X4EKitIaYw+xJDumMt7IJUwLi7o+T0gnzsGukMCfwi0dGUug+eMAWapj1RDxzIyAytouGCe8x4K94w5PUnMQciG7QaLIazyHPOOUavhfn7AF0wdWYiw3i2I+pVuEYzMJBpQxLBC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vw1H9StP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68f1bso506799a12.3
        for <linux-omap@vger.kernel.org>; Sun, 12 Jan 2025 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689599; x=1737294399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdPpMH3EB/gIvZxidNjtZ/XKsVJM/FqerzgsImOH6b0=;
        b=vw1H9StP2dZC0Un1CFlBTEKUUhhzpwRaXDsl7a1epd2AOzCgsQO7nPkoT++YNAGtHO
         OOQaUMAgZJwqbj5IxTJhH4Z8u+KtLyXW9IWa7nBDTQq0hx/hldQobpA5VuzVUoJ9f1HP
         3S/p2QQ78Sx2L1CsP5vJuJebdHEOsVT3GPUdl6CAe5V7Ae3cDAMv0uzapU3bPmmGq5xM
         AfdsaPQoOhbA7Mgci24Il3+FXA98oOFlm+ehIB3C2D98LujnS09Qq4GtupwKOCXe9r73
         uo7ey5bQAjdRD3xf6nUN7/CONYdqXl2qlrJBXiEZUMEKwn/rTtGkavQ1BV3pOCm9r7GD
         Rx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689599; x=1737294399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdPpMH3EB/gIvZxidNjtZ/XKsVJM/FqerzgsImOH6b0=;
        b=go4I085MEW1XXqo0R5UDKOtn3RDbeWi4Q9pgNoCG8FJbFk47F2eEIWNF4Hr78vFpi2
         if3rzpjcMhJ1kNZtvRChGxGBJacMMmkbuCQ9mMy4nyOROxsajXvFqOGoTUvNw37vNSBR
         cIEwPKbVL+fUHwCdCoAJt8IqjHpfArZSA/jJWZOzGAemTLJk0siaGQcwUejMD4a7oItc
         ptruIP+XzHN6T/FNA6SPGY7qYMIHJXYjL8LZRl82ABOQ+rFSxI2MuCgXhtOzXkUjDSOr
         jva6xbd1UNZtxg4kUNMKMUXDZHWFtP2xp58T7B11DOUjsovR9qgAxyKGuVwsFmqB3S7H
         lAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMXxZTwgfRIX8NLDHDVY0cNcgu0hrlbNExv6KudBRvqtJSdyL6Ef3b0PvJ45sQZ6eVZQMQkQa6U6iW@vger.kernel.org
X-Gm-Message-State: AOJu0YxvN5GvPOyYjIbgaJWAG/+l07FJp2xpTXuMiUor9NM9ZnPjJc9s
	aqmTI0zVjHb5XfBr3g9n94w6U7YWph/b2lya8IRHAlqXOzSdj6jDGN2D4xo/w7Y=
X-Gm-Gg: ASbGnctVUlo08ksmdFKKH6A04Lb72cg7csg8auChwxtfbO0Z+dYfK9hhUIMfksd9nFU
	obdalNhtB3aiHhhvdh+8T96CJOZ7W5WI9jKgAjWTzgbilSBYV7mJgZpyYdBN7wWhYfOaPT8WqKr
	bAzDq9rDiS+2/C8iqeGuRrn2ZivqBT8+cahsI1/k1b+aKhFRewuQc6X32JBIvsgVz5RCw40fS/x
	3S4QhZvvTuk8k5YYYz94PO3ID6Jb00gJSGsDZtGx7UGfBmztXHS1uJWtgC6jH5ZWbtY1YY=
X-Google-Smtp-Source: AGHT+IGMaMySK+AzczYWaado8bQXerWOI16nG+e9W1R3XECS4GCbYRudIN5tZNNHFbXoJHhLI8HzVg==
X-Received: by 2002:a17:907:1b05:b0:aa5:3e81:5abc with SMTP id a640c23a62f3a-ab2ab643defmr680650766b.1.1736689598955;
        Sun, 12 Jan 2025 05:46:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90638acsm371051266b.20.2025.01.12.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:46:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Helge Deller <deller@gmx.de>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] fbdev: omapfb: Use of_property_present() to test existence of DT property
Date: Sun, 12 Jan 2025 14:46:33 +0100
Message-ID: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_property_read_bool() should be used only on boolean properties.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index c3329c8b4c16..7010544e02e1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -3933,7 +3933,7 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	if (np && of_property_read_bool(np, "syscon-pol")) {
+	if (np && of_property_present(np, "syscon-pol")) {
 		dispc.syscon_pol = syscon_regmap_lookup_by_phandle(np, "syscon-pol");
 		if (IS_ERR(dispc.syscon_pol)) {
 			dev_err(&pdev->dev, "failed to get syscon-pol regmap\n");
-- 
2.43.0


