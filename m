Return-Path: <linux-omap+bounces-5541-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DAD39CF5
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A47B0300EF4C
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D0C28D830;
	Mon, 19 Jan 2026 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfqgrRkL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C7281369
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793449; cv=none; b=RFNZR/vsSOQBeR/t+HtiGq9bEjkEuAvlUPGKHHvDOCa1g+YrgOhxRXyLUdl3P2pm8mvwX42yUE556+zWUnc9GUsx0K0VO+WSyDlAelv6gOoxeREefxJ3EHFTHrWo97ig/B25q+1VIh75hoXISoapYcb8b+x5f/H5Fbv5zLMpNC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793449; c=relaxed/simple;
	bh=pi1fLBggw2w5nq+ku9XGxrPVz6Xc+gXO0i/5XkcUNq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKCVSbFxkCbEqmavdj53w27JWx0TU15887/FnW7pjOT5KsTfD84noUvuXYoVL51OZ34EwaWY2btOo2rx6DJSi0Nguo8KWkQk7ASSc83WsH9svL9dt+QpiJ32Kq8UC+WcxsFZXhqNtAuXXlHb3znbGUz8A+XcBgGmI0p1iXgIRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfqgrRkL; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6a7638f42so449965785a.2
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793446; x=1769398246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
        b=AfqgrRkLGoRNkmwLVnfl8C3uGpQtAF+rPrS+T5DRvSRev6mReTAMc4Ett9jYmZhCpF
         qdVWUEL5wRg+syA+lns13e6Wk/05wGkd7fkkvoDlNojTZ5AMFJ2nqJjV6QSztKv4iLMy
         e1ZbIlqSPutrpePnA3PZQosGNN6dinClsTSv2eKhxxFF28x1ILL6l1Xwd8Lk7aKurEeM
         vsBfP9FtuHmnttaHsvGS+E7xISe1m+tXAb4GuOnwv+xSg/Kr8KtsekanYclZZkX33BEJ
         QBv1K/iMvXBLXXl+KB+Kv+8KPrFasUK6DkA61w/hURKfTBW8NqWTogGuTymOMo/m3ELV
         Lykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793446; x=1769398246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
        b=DdW+72mivOy2+1NRZpa2klBEboXDL4pj7hqXrMbZipzzo+WxbGMoHYCJeerWEtkoDP
         HyIBLYpgbM4G8vInchg68lmB2nLp0hGWgEtIKGS52io23OmABUiqtY5VQtq6rLUlupuF
         2OCSWJqmw+1pZdjFzCjceunKL6MHdUvQJFIprG4/dqK169RK6p/HsOxzy78trOqa4ora
         qQpUjoWg9difx7UsHZN8j/agcM9QZ0Ll7N2gVsdkUoTkGd5L3ifWEUTDce10ecfhs/aj
         PNsHuX11+41V36J7GTWoimwZqEFgcA00MnvXf5jTPSifwCZrryrldlew+mV7P06JKTfW
         ZBsQ==
X-Gm-Message-State: AOJu0Yyl16cvb0wV5ZgWUD9lfC1oFyDlAxSarkFVwXjKvbUp3G06ED28
	u8Bry5QUJCUHthDK55eK1jMZwD+CsIJBttxhh/DncnN0x9Fx1lhgNNSW
X-Gm-Gg: AY/fxX4yqNVf1nmbUPrg5iRtLlMNWVXrDGVX+WGTJzF6XJqmOx6F0dLOPnexsq4Ejg4
	zapicSsSj2DsLgSgpzO5ccAckHqdFB/eTeURIdsTgYyqWW+KBxjta0Hp8lZq/mkuNQVUff5ivMQ
	lMAF5kzN+PK+wZGnJV+adSJoRNqBzDopJUo3iVpyDCv619vtzmwinn9S0CeHNlUMDadXEY9y7hh
	ud5mS4p6a614OqGmQWhGyB2n2WNrxRi5oHPOqwKOeVsGbw/S1S+MeedlzJ49llhoVe7ahWjb3rQ
	d9U5zoX2EtHrXbi0DKFTU/z+fmBnWJ/6h3q2tto857jJug45enqkAlIlUtZLjMJltNzobHycF+O
	23libdh/v7KOcTzi0b30xE3aCrCsaj5uKSB0xcFlsJH0uMLuRjkDZ5TPlwC7odmrciOwSNqyQY5
	PxrOscfYXMlu/JHLQT8yRBxireYGdanBXrSfIoAQKse3xgrmAmwXvSCaxX9ZQ32rkdbqg=
X-Received: by 2002:a05:620a:711a:b0:8c0:ddb4:2141 with SMTP id af79cd13be357-8c6a68ec47amr1370029185a.24.1768793445587;
        Sun, 18 Jan 2026 19:30:45 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:45 -0800 (PST)
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
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 02/10] dt-bindings: vendor-prefixes: Add Doestek
Date: Sun, 18 Jan 2026 22:30:27 -0500
Message-ID: <20260119033035.57538-4-bavishimithil@gmail.com>
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

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2ae..70a195fc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0


