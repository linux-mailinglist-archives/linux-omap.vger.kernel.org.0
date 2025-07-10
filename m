Return-Path: <linux-omap+bounces-4079-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3706B007B0
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D01A61891821
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 15:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C5E27511A;
	Thu, 10 Jul 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q2O/qW+k"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA193274FDF
	for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162643; cv=none; b=R88RoRbCvLJWiVfyLP5OCloOA6ReslwGYmFPq05V4hVUQa//mK6kOzBsARrJYqCupvKg1uJQ/3rMy6rPgzhrEvxU4HSXgANvyyyL1K2KAQixrJ5LUDEBux1rYEjKdSCzP8zm1Hk7vUrZOnA33w68PyA5UBBKWqdADFHIq4ab3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162643; c=relaxed/simple;
	bh=TE3e5FsAUhJEBT92C10WueG0f7MngB2CVy4WNOoUKW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uqt4WT5jpXawmHoU12fvW2FLtXYfG2s7Jge5XYRQf+S672mY3Pk35AJfvH4RGfZLuk97NI9GAlGJllCbmUlGpi8U3bujDJROA5AqeDACcpj19O+bTkJ71JLUti2M63k3TUnp/LEigYAsjpEPiVCsB4SyVbyUtx/uh0ortQYCjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q2O/qW+k; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-23aeac7d77aso11419585ad.3
        for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162641; x=1752767441; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=Q2O/qW+kbPmb+wdVRu54EcD8ahSi1e+pIz37efSIcrhbVQOLWMsaxlj7iC/Mt2cjwO
         KC7/AWvAXAV3RlHtJcfioJv3RwUkhqPuWQA/9bTjdXO2iJ0T7gFrcAnnu7PbzFGY4cby
         7rRv/WWDbEoui2xzkKnVoTJ25Tg37bz2pGTYpwWBT4SyVN2xdvZA/FjhcVbwtM2XV6Hb
         O04tVl3chu/Lod54UwjQ3Pk3KJbkfmTgBh3JKIZ/WNKhHubZkfV8xUEkV78auIfxn1zC
         9NBPMXlveLmRT3+pvKYubxvjHiamkdvWuwG5Y3TnLxONHxADvsL5QaLd3QKogSgMlPsW
         YrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162641; x=1752767441;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=d2gz2IjXOYdpzXEo6TLOzOogCUXXk9HEKG1a3ELOLVtYr0Zy/Fld9T4AVwGawBWxWm
         VK++swfxLTskzPDh7hqmc26DAH1WON9MEe+C/YKnXWPE6h4j9ke87K/UxWKC7TUZybFi
         O7yI1RGGVT3GmL0v5Ba+hTxPK9qM97wE0+8CMCl2tzG2At31S2hrMlY9zFxUfqv7ne4/
         LcJj6AsiwMc+xrYU7ZTlUI6nP9+Xeqxp9Oovc9DhYE8XMDP9z8UgrkHjvjOVKXjqrxnV
         QCF+yOmuLv8117nR0QCoRe1RAEEEiLHYtKkBUBwbbMFi5yW8BDBFdArV/wGFiP5/KMx3
         IDWg==
X-Gm-Message-State: AOJu0YwCQZrXOXy2omLwbCo4xmI/2Rx+VFJ37Ic8S4HkKXhGVA/EiEbp
	9ED8bq9KARNT7nMo8bhio1aFc368yYHyV/9mL2h7Ggh5XoN8OUcLAoDQE5ph8YeXSGFD3a78uFK
	Xt0oH638ncA==
X-Gm-Gg: ASbGnctkMWCtCs/jqnCOpALhiIusU3hLr0taPb6V7hq7kK5Nl2Oh1aeRKZnartq9Fgf
	DUpQUDfScSm8JGW/OTtSehQI7fw9OYjz/dAxFu+5XpsoesJYV4+oiqgCgBPHHIXd9adUMkdLRIu
	gZjrDj2bLat9pW47Ug8WPtjDp7oxULigCPAtDfdMgZmQyPwSGzs31QO7YJSPGZazYxz/hZTbUXR
	1MTGF8Mfr8nAE8Wysh965OfJ4/+2mhVe510Xfjn0XSCLWIIBEar1YnnHvqslFkmJ+kQojw8gVmt
	118DKuqRFWZCFr+24d3l/KozOBpnme5uTUCp9AznJM2e2cbM4n9cTXClqc+AVs+4a0mWsX8=
X-Google-Smtp-Source: AGHT+IElU/0L8KxnCYNK56yG6cNhASLXsy7y2GFyTBpCgYpyDu8yUDmzKCFyTB8rlNo1biXYsiwnZw==
X-Received: by 2002:a17:902:ea07:b0:234:a66d:ccf5 with SMTP id d9443c01a7336-23ddb31593emr119964355ad.49.1752162640915;
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284898sm24954395ad.24.2025.07.10.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:50:40 -0700
Message-ID: <7h34b4xcxb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.17/soc-signed

for you to fetch changes up to 0711a8dcea2a928a54bfb40b064d6cab4b327edb:

  bus: del unnecessary init var (2025-07-07 14:17:51 -0700)

----------------------------------------------------------------
soc: OMAP updates for v6.17

----------------------------------------------------------------
Kory Maincent (2):
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

Li Jun (1):
      bus: del unnecessary init var

 arch/arm/configs/multi_v7_defconfig  | 3 +++
 arch/arm/configs/omap2plus_defconfig | 3 +++
 drivers/bus/ti-sysc.c                | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)


