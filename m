Return-Path: <linux-omap+bounces-2538-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED59B6EAE
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67F50B22188
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331E6217657;
	Wed, 30 Oct 2024 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mil2IFkQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D46217644;
	Wed, 30 Oct 2024 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323154; cv=none; b=jMU6bM+1Dj98tgj8PDPxbiLbBgEFhGO4cX55QyoY+/Cnu26wzIcKiyZmaC7NLuKzzALh/1eRm4XRXKUey5zFAs+tXCt+t1DaUNoGDt4FCwR+L/jBZ2ddEfRcDDGQn8XcWIesVWNzo9Ahxl0dqpk0qxEp02g/WvrE0kxF5VFHJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323154; c=relaxed/simple;
	bh=m5pUQ5ivEEcNKjB/OrQ2lDZtF6LrqcIYY/T5jvwBeBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxLLOZ9rYSbfu5647yy1sUGFJoKoK7Q2t8K0kogiqn/4f+YYLUCbC6805ERWM7RWKxst/3T78BheNGZDnWGGdDm4Y00wyMeVJ4X8SAu37G2qQMp33A2jQEli0hy7aiPlSol+8yVnH+1dTAloo3wzummOvNUZUGDyfeJ9bsjV420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mil2IFkQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso289751a12.2;
        Wed, 30 Oct 2024 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730323152; x=1730927952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meKprjNgORMafpImZWoEVxdWNvHCKm3QrcNIoUh2puo=;
        b=mil2IFkQLocfljGqUX9C+mFmLTqJh2cd3LTtclzy/XLwCXMFSqfVk19O7B0fPwC0o9
         J/GvwQfWqH32iwcDT6SuJTLjOR9MpLq+xasAOVAI75Mmt9TgQ3NKem1/ZFvvXUx4X2+2
         CWwVtKRbr7aX7830aKk/0cdF/icKetrHgpWlWLGQBjURkaPJtHGuYGZitwpydvl3rZNQ
         HoC0TYYK5SrfxZfz8e0h5KludXmow+L1y49IYoexD9aGUGMjkgDy1IgvS3vIb+DoQV0L
         pU+m1bJiofGBzqh3pSJYI8zgjBvBG7n4WCFbrec85ojDlM06Tp3chDK1Dcc+znTsE5oA
         OWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323152; x=1730927952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meKprjNgORMafpImZWoEVxdWNvHCKm3QrcNIoUh2puo=;
        b=fQZS9D9phAX0GOU6zCpBBFToT8J645a074qq11ZuRM6qB2fFbHHaRMp+01gprD2l/S
         sTXo8bFySOwHR5rvJv11KfQbvCIkfBFRt8jfo5wGJ93lGJCc9eqNGQCReyXaVZ2/nRJQ
         o8wDYEB1RStmMy0Lrbw/fYmYnTnH+lpL+1cvINv4PUbnX/lyQpxVjrYMcKrSiDabFXLi
         8OZnFqCj4xh/gS7py1XhctWAqrXjEaoCbXgwPCsSAUjoqg57k4opgTb/W94+Mraq8TiQ
         XHLnB5BzgcKXwHTXc57Y/8FbQJWDEtQF1Acdzhc0AwVlF7bYD76C76omETjJP6rYNCn/
         K/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUNvdVfNIgqArzIUdt5Y8ngSNn22SSHnzmUOOmP+GdtZMpxPY6vcyKEgvhAziWFKgsh7zeoNZT4j0rJ@vger.kernel.org, AJvYcCVSF1fINzKGJue7dA4qM/tQ7Mp98EqfYveuXqjEsfxnqfUqBUv+TSIpFAos1g0+Hr4VgGhAOl46VSLafeaF@vger.kernel.org, AJvYcCXNTB0Cwi0Yw7RXmOmSA+Qvr8dImXlJ01tqhyZv9/sd432g5QGMSOuyjpRNmMxYj3teyI1JoSh43Annjdnp07bT@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+HCVGysWc96IxEDLrbhTGSjFBNn5emFvz6oi5u17pLeFd+ac
	8u0eMvGTB/IeuTx6X8IWNR5k6AehdKPcmo7S5qZYhggu1GpLnyIL
X-Google-Smtp-Source: AGHT+IFFjPjWN7WRU54Ca15aO3wHOj+oLzYyGg2qjVuMtdmNBjBdAUJ0Y9uz/AvLxvwl/4UlkBg1IA==
X-Received: by 2002:a05:6a20:43a0:b0:1cf:476f:2d10 with SMTP id adf61e73a8af0-1d9a853b55amr21921154637.49.1730323152277;
        Wed, 30 Oct 2024 14:19:12 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b9daesm78938b3a.10.2024.10.30.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:19:11 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 10.1
Date: Wed, 30 Oct 2024 21:18:45 +0000
Message-ID: <20241030211847.413-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030211847.413-1-bavishimithil@gmail.com>
References: <20241030211847.413-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3d09ec1ad..2d39de677 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -137,6 +137,7 @@ properties:
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
               - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0


