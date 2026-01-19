Return-Path: <linux-omap+bounces-5543-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D037DD39CFB
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0905301C0BD
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCA029BDBF;
	Mon, 19 Jan 2026 03:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0ivzO53"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6EA23EAB7
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793451; cv=none; b=omSTx0zUle0YPGiFq3MCSJ3wY2/+FMzKPt03Xeg+rS7zRCafC60gR9F1+7souuUfUQaXdgJqGTyhfRRWI6b0LIz81SZHtMs18zbIv1bRxsMF/KtN/hMw0jUiehqCKe0/s7o4avl3RePFvdtYiMDiOztusQGdFc+u497A/4W5Cyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793451; c=relaxed/simple;
	bh=QtehmTlxVE2ImMqTMUlN+wssHL5rLi9pMI7VHV6x+J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLDsnx7N6btaZGeMpLu7u+Cg4XFcqsL1DylnrtkNzY4P5sFQp5GdsSnRhznpipMe6Mkl05kNEG9pxPYF7ZFcytHgyH2/z4aGXomfUr3zHXdzzVXc9WmEF2uk8fGx6m3cEjteKH8aTAmDlzmkK6sRCO0QfKRTdo8VXKRbJZrKZaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0ivzO53; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8888546d570so54006706d6.2
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793447; x=1769398247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
        b=N0ivzO53nkFxHh3yaSkbLQjkCtKfFOof09VTSNOigXmKAr6xgRNE2linhP6dP/rIaS
         e1A1S2wwPCmkRpj78eoI5Awt47QjbDK74xig07J6iGnGAGrhV1MN3b21qTv2e6WfOaFB
         F6TODsoql6wPQFTmlt76QpS8Iky19GWZiJ+8n8RjPrFqJAjdwW5mn3kJBf3mefFENAC5
         +Edsbc/BhFeiqS3XimIs48iy8m/p/DzEyPnRDdUy2lREVnu0vXI0qE4bkoS2ZjyvV2hk
         buulq28P6VcJtn6Lj3oUk5O64dEskSuz7BH4rHpYFWqw5fxiaT4Z3+abwPrS3u/BDM2v
         Dpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793447; x=1769398247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
        b=bLvf58pRtkl/1bse6SpusTfjJJhE8gWzHXnhB9Mr6jw+qbIkPhllYD+lC1997b+s0I
         90GAhgjJF/cgvPWksevkTiDGImXx2oacdWk3UDFMEHG7VEsrRNL4IUSdXmMK49+/fd2f
         Kmm6EKrFTIKYKotnz69UzJcUh2EDi5oMmgzeEuPoeAy1HEjn9hEvjbsAyLzJFcFmQsmv
         J3U2nX/dmGgmb5RSIw882rWweAnxKS6Ejzc8pHqooNObTaMQ4hL7bgN75CoNbDJj09Ei
         cT1fBx43H0ez1224+hZCrkaxlKISRqUkXRE7mXHDZDFbJQ2WPN0NnnicsBn+rgdcDNqH
         LaXQ==
X-Gm-Message-State: AOJu0Yxz+HBvJUNtniQr0rfRwkxUZ18EH1bBNcW1Khzt9ZK/XvTbC9rE
	oeO8GD5qBdXx965mF3x7WWd8ZQO/y3EE2JMKJ/qYaPNIGr+LiQmaZquF
X-Gm-Gg: AY/fxX5xxjwX3/L7+vdf5Rq8+KgJ/T0xi94uHUxPGevdRjQZIkM8N6M2B+kobrezBy/
	njSl25oDfQURIKI2Qb5kWNZBva031JEqTXPnqedpn7y8NBTxi+caTzLGHmURErOSSYkm4C/msx3
	zD05fr7umxigabw28JOKr+KqyGarCw6TfWI60KuNYslYp19SXDmD41GqqoW64sZdedTGxBim2vI
	YnPWrrBjU2REXQNvvhBP59IPcAHQuH/G5av7UwqgpxVxAS6pfoC9PCeJVBhQSfrggxYcbaKuzCZ
	yxTNwJeRIGl+lzA5cqmTCBvoH5ktKC/Db037t7eVC9ZkPy4mmMB7ustvsRUX5U2n8uP0UktyhYK
	kdb2V6TT+hk4g0Z7pvyLuq0hh3uabTzK1QyiyJjZbgSCKhtjdbByoIuUZ1FyK7jcrF8DMrzfbxS
	R/oPmFdAngjUYWPN4SqAtuF+np58rNaezd2BmGkxO04Y6kQSPGfdlWAsxzfZ0UeP3C/bs=
X-Received: by 2002:a0c:e008:0:b0:894:565c:98bf with SMTP id 6a1803df08f44-894565c9997mr6435226d6.13.1768793446858;
        Sun, 18 Jan 2026 19:30:46 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:46 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com,
	bavishimithil@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/10] dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
Date: Sun, 18 Jan 2026 22:30:28 -0500
Message-ID: <20260119033035.57538-5-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f7d3e9cf..3ad01645c 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0


