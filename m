Return-Path: <linux-omap+bounces-2529-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656BC9B6D05
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B311C20E85
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FA82141C2;
	Wed, 30 Oct 2024 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpMz8o+m"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5031213142;
	Wed, 30 Oct 2024 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317331; cv=none; b=YcR8l+9Q5he5OyHR0MZ4vfExPy9+WLydRFeAuHvkWsk6wRpSkaEH7EfnoheFRoHQ3+BWkWSjMYgLnrntFeQXryJ/tVUbVv9FoFbMXGi1IVSbNJLgfWnuqUrsVYFZPEf2PoRMHGk5fJZJQXsrFdUqTVQoygL4+K86cRbzJSpHAe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317331; c=relaxed/simple;
	bh=m5pUQ5ivEEcNKjB/OrQ2lDZtF6LrqcIYY/T5jvwBeBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzThdYLIM2f6elSt2BRA9B23YY/dukJ+GwX/vIOphcHtIr0uzt7gydsPSY6woc0jY1bAn0CLUIj0MmuUelbVCmiSD72BUOVdtQfE9z0C18IIwko3jyEHa5VFRUyKuUXOApFIGoH5SWjlSxTwkDoNQs8DJFREwrPnLTMdTM4+UEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpMz8o+m; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7edb3f93369so201260a12.1;
        Wed, 30 Oct 2024 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317329; x=1730922129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meKprjNgORMafpImZWoEVxdWNvHCKm3QrcNIoUh2puo=;
        b=jpMz8o+mnv6sYeMoV+l4bkE+Kj5mQBm88bK1dhKZjaERdVMMRaQXGS1YBUQmolUxxM
         ycSgpW0yu6OLNUBJB9EjcoWJvJ9Xn0kkZkCveGHkYBDAuDI/l3sPUYIlggRdRVR25QV7
         wrdmfomMfLVeMRX46J60tKML24oODNr30WX+KhlmxTvcLmmE9WK+llkgav66q/htU6Xx
         5pgSO8HaB4e4LYnugcCkd6k4oN8BnHq0XR6vAjoxIwZEriqBKy7ksSsn4H60lgcaiIsO
         U8ZAqp33qGrhR1UQATgXwuYYnmyuYw2WlTzSQZkxp8TGFAMpFVF30wqncKPvx6B90cVz
         IEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317329; x=1730922129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meKprjNgORMafpImZWoEVxdWNvHCKm3QrcNIoUh2puo=;
        b=lFc9f4sJBtMe2bHvBWUzn1HBKnZ/r9HbI7OAA/mIGt1KkTTg8JhkdP71gO8ndD+veK
         00vU/sEncFe5pbPQrb56/c1tlaYCsrCT2livQzKTXjV+58jujBfo846CY42RthxBPF+v
         93jecIdpd7T7cO2e+Md5NYFysBLxtpfSiwod8/ZIM6SJqvD6VTB7A45iFe/wps6HpGtH
         BZyD80HfCWBx1+DDIIKNOr0wEboruAcPssuoPR2Rd0Wogu9V8Fz7LoDK5wrOiLp2BYf4
         kYzDieQL6BykzCGslRUsGb0Q5ZpWWhsEkjVq92SAahIKe57Z5R4CLkekrqoFIJB7rp4L
         YM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyCBh9qQpgKtTlGUb4YYSvu+U0Z3OnK7M9qEN3NKvT+O11p1BMTvQA0mjqmQL5UcZc088dTOb5QmUq@vger.kernel.org, AJvYcCX+b3I8vxfYMzGqP7AUUwE7W+nq3tJrKoqunLDtTpSLrShkW4Bh6ndaSawJPxvoUJXU9aicgz3us1BDBFC+ZRQM@vger.kernel.org, AJvYcCXkD7q7LAmoqa0+6HeDHwfCJ46t+eCAVpf/B94ZrHH6bhU7RHoNopq/C6fcY+oRd8C3b3kEE8G62q43t9CT@vger.kernel.org
X-Gm-Message-State: AOJu0YxdO6K2j+BTjutt9n6rv4Q8o054iHE0lqDfPBxkXHmvmBr6JQGE
	lnTmZh7vVxMBVEj0nzgMG+HZydoR+FXyhCyFvg9vixqWR+4Y6OjlE7UBxRSbcxk=
X-Google-Smtp-Source: AGHT+IGOawjYjqhCgq7Mdg4rn1rYfrhIwxDWsgfL2J5gUzBZmlQSyy32EYkTUGvAuDTBgt665i4otg==
X-Received: by 2002:a05:6a21:2d87:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1d9a83a6a48mr23285701637.5.1730317328944;
        Wed, 30 Oct 2024 12:42:08 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:42:08 -0700 (PDT)
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
Subject: [PATCH v1 5/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 10.1
Date: Wed, 30 Oct 2024 19:41:35 +0000
Message-ID: <20241030194136.297648-6-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030194136.297648-1-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
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


