Return-Path: <linux-omap+bounces-4412-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA2FB3CFB2
	for <lists+linux-omap@lfdr.de>; Sun, 31 Aug 2025 00:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12DF5E3432
	for <lists+linux-omap@lfdr.de>; Sat, 30 Aug 2025 22:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DF32571C5;
	Sat, 30 Aug 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUMz72mQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9C1AA7A6;
	Sat, 30 Aug 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756591244; cv=none; b=gsb+ARwfhc2tIjVW7tCb6ZZhY6qhGa9jPcfpWCypGdJR0h86A0KltQDSzpKXI8ajRdul/QE1JKdGuHXXb/hJ/GeJG1cwpLzVHIek6HRMy+nUk7dIb4tJ4umG+U67T81sgnUJjMb2gCPg/hiCFbog4rV89mn1vjkLOxrXFEJxUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756591244; c=relaxed/simple;
	bh=nAB6LEZueakEVzPxQwTu5mscsF9D4yS7uK9HPeecuJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QshibIA3vqdxyqOpFKcUtswCTPWTnIj5Kg4oowdXi+BiYHyULNyCH7mCnbKHNJ4FCAS97B93Sh00/Z79CY41GWWpcw9YdBJ0dWzMSQNtgDHZEG6Z4vLStc9jRFC9ZHVB3KD4R91v0eCSHFpSg/SBoO58vMZdZYZl4vNHE/dK2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUMz72mQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7f8ea864d63so315765885a.0;
        Sat, 30 Aug 2025 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756591242; x=1757196042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VBdpteMs7U9MIP94cCFTa1pDDiQfM2f/G157H7iQG4=;
        b=bUMz72mQrM4wJR1aHBQABtCWNXd9ILDMBqLWgqFligcxlq9J02Ej4f9STpQ/WBFhDE
         dOko4Fsdtk8dlU4As3ClA1qVFldEGQIAPhcUDNp6NIFCDJvRJwU9skwVKPEtbhn/SyQu
         80M+FTEoi6O8a2hSg5xZJ0yiHZuR8icW7tpOTItkcg88V/HTI94PNntKROsQNjryraTi
         b5KMo+PzLW6NvAioeeexh3kUwH+nxoNquZjS1pp/49Osl7y1RurF+fmuHyIrEQdfNy51
         46YUZKbbfjvNZjeFpNiCwEx+2p2caz5dpXjsRpHHtLKa1loFkOUTWSCyXRrum9jiID2H
         jZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756591242; x=1757196042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VBdpteMs7U9MIP94cCFTa1pDDiQfM2f/G157H7iQG4=;
        b=wNWgITfoKi9fvgX4u23xnbwFAK+2f4j2fy8kgd2FW9rk7bmhKDUXcwy6wpf+RcGydW
         hD6DPZdJGZUiQvKKEr7vqbJDevmdVK3nfJ857pQrkEgVTG6ybTcbU9vQnFG/BAeRYTOu
         PBR8hTrcrxqIljbGZP1RX2BMd7Ehmj25FwV59lvgdnzxCunApG7Ekkc29IE3gtjNBZKK
         sGpnTvLE4KcmXwcISepaTQGVUQya2NAAeHaHQxA7KbwKKdZK5A3IPvCzjMEwZJZUhzC4
         e15aoIxbV4+O9CPlhItyGbqh1tiw9NBa5EtmLg1/Yt5lt8JX8cduoZqJyV9wz2UVucFp
         Ywlw==
X-Forwarded-Encrypted: i=1; AJvYcCXSqeNGnzZgnbqg2QDA05Bgi80k7coNVyUzeuyOEdFwphFloTRxfF0wGhY1I9JrspG0ChlgTnw//6V1@vger.kernel.org, AJvYcCXaX90Wo1McrxMqNnjN6qv6q9QSCi4JkfInS9isRFAwLD07XVY27CJUig2wf/Q6yuhDXzSneICixJpQNK3Q@vger.kernel.org, AJvYcCXgMb8mhevWRNjdCo6rPDVIUUfmcrPnmw/SEDy5YBekI1e9pkzPzijlz1BdBIriaVZlxX5gc5g6mY44yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH281fGBFCE3NMK/h2qRvRr38j1kK4x74xgLjvTCLWauOVXZgQ
	hY9jxTXBjvjpBXI/EQ46YfIhYRTXUGyhDkJvurTF1CvyoWc7cQA5Oao=
X-Gm-Gg: ASbGncvlqJVf3U0L7+dQaVSWGXTNDNcx2JMlKoeBRuacoHGApdslZYuVhqpbU2qjZZI
	xc9xdsH7cpPyE5+fJKkHGulrVYYIh8r0Q6X9tyqREOCiswQ8qG+HoDhqlmMHZbFcELMAkL3vGOA
	+td/r25l8MofhnUNMCm3CsFIOs9Y9udRVtYNY7iy0alc3EBkCIlCt1gzipwnuReQfxiEzW4ACVi
	/QWfHCfb6d/4Lj3ZSbFC9i9eCfgtj8Py1wNnRVbA2iNaoOdorba7gezfS4KsuTKtkbXCU5WvLbn
	+YgAGtBvp7RayUmEqyyE88JGSftaNpEArZGYcNHIKkvLlWUinnfZdNkJfwjGe+10eA3vl53tEzQ
	9cw5FacFEBwXDaknLf6Vth60RZu9xUTwrhOSpI8wpPEYBtSklND2hYBFy
X-Google-Smtp-Source: AGHT+IHzGtCaxvJ/JvP2YwIhp9GD92z1hO7NN8MsMB+bENsjEt5g/P1jzGsqxnL/5uw5ru5XZpCceg==
X-Received: by 2002:a05:620a:199d:b0:7fe:a33d:a205 with SMTP id af79cd13be357-7ff27b1f7femr352026485a.27.1756591241879;
        Sat, 30 Aug 2025 15:00:41 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:68e:c28d:1818:9595:da56:53b9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc16341f1asm420896085a.65.2025.08.30.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:00:41 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: tony@atomide.com,
	robh@kernel.org
Cc: uri.mashiach@compulab.co.il,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property
Date: Sat, 30 Aug 2025 23:59:57 +0200
Message-Id: <20250830215957.285694-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dtbs_check validation for am335x-cm-t335.dtb flags an error
for an unevaluated 'num-serializer' property in the mcasp0 node.

This property is obsolete; it is not defined in the davinci-mcasp-audio
schema and is not used by the corresponding (or any) driver.

Remove this unused property to fix the schema validation warning.

Fixes: 48ab364478e77 ("ARM: dts: cm-t335: add audio support")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts b/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
index 06767ea164b..ece7f7854f6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
@@ -483,8 +483,6 @@ &mcasp1 {
 
 		op-mode = <0>;          /* MCASP_IIS_MODE */
 		tdm-slots = <2>;
-		/* 16 serializers */
-		num-serializer = <16>;
 		serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
 			0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0
 		>;
-- 
2.39.5


