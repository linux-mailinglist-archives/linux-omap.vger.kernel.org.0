Return-Path: <linux-omap+bounces-3917-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E43AE050D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 14:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AE4E171B6B
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 12:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111D12472BE;
	Thu, 19 Jun 2025 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmYtYljV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F321FF4E;
	Thu, 19 Jun 2025 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334624; cv=none; b=QVKhbGGSD2fr5Ny9WCYcYyfAilaPKZSlHCvYSncKKMd+TRyke0OLasPbm/dG8Sl/xo2lnjOY1SL6WmLtx80g+SiRelJH5lAUeDikvvvnTc+JVVqQW2183CEpYwhDI+C4FVb5y7j5QpICaImVkO/TjLtbDyetaFEtxSkBT7IyY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334624; c=relaxed/simple;
	bh=032EOE3JfPpptoyB/kdOX7ovRnOD3oMGpL43P9g44pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ako25OcEkmHCxbgYc+w/8xLP/Eya174SzEXxI7vFK7Wxw6u2Ih5OTLj22xDEUhcFKc4R5r0osrMuG0XeQlWIqipIlPYgptahlF+XGI9P5Fj2d4bYoda8k1BxT1g7VJA1yc5AVCp4gz2871L9eaZfDkKEBEAdMsork+DKzT/0AVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmYtYljV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23694cec0feso6903885ad.2;
        Thu, 19 Jun 2025 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750334622; x=1750939422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN05iZ9JjCWlPcMkETDxHecu9RgOSJlmZglV/hDkh9A=;
        b=CmYtYljV6t4/NqJ8rYocV9UtcSHzFOejW+UkawLYBFLcrYaaB4B9i7KcGosICJZWfN
         U74qMT2NADYuJFwpqQkgG71B6PN2re8WvWJwyvkdJdOGcrMM3Gsa3uwA5/4+nzrgsYrm
         WldFFjf7FY8ApD59qrI+C3qTLgIK/4WvN1A+JxSgyjkWEKh1CGP97ATTsp7Ut6UUUzI3
         ROA3Hnj7doDs3wMkgHn+urslGKUmOKdu3N2LUmPlwRWToQAvfIzlCUYuF9zZSDNG9Trh
         +EBgpU/WPPX7oPBYHNni/ZvWEQj30geljMTiabr/opxbYG2PdkY6ynCE9qARYgUaeEb+
         FWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334622; x=1750939422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN05iZ9JjCWlPcMkETDxHecu9RgOSJlmZglV/hDkh9A=;
        b=RhbJOvGEMm5qqKL8/aQSg185Bpmth+kuy6ytuUiRWL/jsuFY8adzeB/e7idluChgf3
         2nGla4Q6ckh3+gG6FL4PcY4bQOBj7qJV+iFa9pzbiy6A2nd16ZKfB9ZZIwvO+V4krrRh
         Z2y3dZIIQ1A7Z1qLykH29z6IRVTd1fssaQ9fw2Fcvm9+bbl3xMQSXVMsuG/TuxnCemfl
         ijCll8tFxc49i+gaLR8zeyEdOwuewMkZAsQMabDdfKJsQnB00B1TfPhjtluwE7vGRP3U
         qRpgoDO2Lcgf47F50bjJJBIIxSRGmtrsr8WjXWjeWnv/H7nmoQEuMadBkoUZLxNA6ePl
         mwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrrJxww6OfrkNgyWef078Mbo4xfvRbM/XD15/W2BXQx3Xi96twhakdnAHrwsyybLhv9m1jCAXEGwjLfJo=@vger.kernel.org, AJvYcCXKj6btDvXN8gqtouYeWTCDXEfji2IrgJ0Bl5JSh3ezf3j1INRGakAMgWRJyLM0vUF708o0qlpY5WaJKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxei4GHGxMe7t74aYHLFab/4NET9op2iyPzZzIpXbJNj9wRM+WE
	Lk1SaeVB5qyDer3X2FEpKVvYw32fRQoOsvlbTAZ83nJjub5xlGqZh3Tbtzs3PIyz
X-Gm-Gg: ASbGncvq4o9d2EE4YY9ZePkP7UzfkIoI3Wjoukl9oSrS6+RnPQx2G5PIriktRALm8dJ
	n7qGYzIeXRXLG9dBD1SYqCdrTWiU7q8k9aNqCfWLkHlcV/XB+wVP18tDc+I7xdYlCmfIN0bluzj
	L8RQV79qYfQWvo3tdb7TXCGl9gY9rAmd9Egh4aBAtMrEs270/++JTUCp/g7lrLZU2+YG1opGoLr
	rI6V73lg/llpZvA3j8oFqlJSLVtjAdPjxTmdC66/L9kCY67F+F0/prf5Q+JHTJkJUprmATnJWmQ
	9OiSQJnQtyWtS37/QGpwlAyleq2k2VbFkitmF0IvYrnRUTWk1D+JoWx3eQgeVdg1rzh4ioDfMsx
	B4j1Kr/HJZdqep6sqEe0j
X-Google-Smtp-Source: AGHT+IFVMPL4iOLl0fq0NP8WifVvbMjfb/4BmsQnkmDJ80I1T4gI1rIgBo0OxdZUiQ7xi32ZHB+pmg==
X-Received: by 2002:a17:902:fcc3:b0:235:6aa:1675 with SMTP id d9443c01a7336-2366b14d39cmr215385935ad.52.1750334622471;
        Thu, 19 Jun 2025 05:03:42 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88e2:4433:2a7d:bb88:9d3c:be74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23699a73732sm46079105ad.145.2025.06.19.05.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:03:42 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: lee@kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH v2] mfd: twl4030-irq: remove redundant 'node' variable
Date: Thu, 19 Jun 2025 17:33:15 +0530
Message-ID: <20250619120315.125620-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable 'node' was used only once to retrieve dev->of_node
in a call to irq_domain_create_legacy(). This patch inlines the usage
and removes the redundant variable, improving code clarity.

No functional change intended.

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>

---
v2 : Corrected the author Name
I am sorry for that .
---
 drivers/mfd/twl4030-irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..a2ab5deef9e2 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -691,7 +690,7 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+	irq_domain_create_legacy(of_fwnode_handle(dev->of_node), nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.43.0


