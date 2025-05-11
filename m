Return-Path: <linux-omap+bounces-3689-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3DAB299D
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAADA174AEC
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 16:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC9D25C824;
	Sun, 11 May 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AZJraOf4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F9259C9A
	for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981518; cv=none; b=qe2n5hE5zWsKHZxx8Os3nWqHCmLEbgOcSgcSm4bVDD9N0+TGllZ2+/P57ESiz192GNAymYshJp477MY6VHwTxvu2LCIyT23A0EbTGB56cIvXBzoa1lHM0G8c1TSZwjgjoopI8dH1snbg2xobk+cr6OR8/QkH6un0kt5KBu5VMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981518; c=relaxed/simple;
	bh=b7A3g+7FnjZX3AlWNAwMCgAvb5XivPBGGZzWPE/YAA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V0VEuoUzXiQXwfVXeC2SdJaUBp975hmn+FvRde8Ft8RDWVF9dCE/7mflrPru5Z2PfsHiItiVaGICM28jUI8LgFhG+8IM8ISh4PJNjMbu5qt9gV2pZEOzn57Y9Vw7hRuXnt70mwepLs23Dll9/HrlN3KyL7GDpfWG18Q6FXm4DOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AZJraOf4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso5065726b3a.2
        for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981515; x=1747586315; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=AZJraOf4YLPFoauqie2CvFbM+vJpH82LqrFMOUO8s30qF0kYqNDuYcuSqOO2bGjFgh
         ihg9nxv+qpPhVryFF1KTqbJBUXo1wtjas+lF7QV8ILz3J59H0jzymMm9IL1qD0Djtnxi
         Sc1kCg5MgWtJ0qTHwcOHT+lDIDEseiYf+csfRxS8pNR3bZLWvPAtaIArSU8Vbb2yICSD
         D4FgH7hD9t0hGV10DGp1DTTs+gV9lzlkefkjfLjgNTIi1HstDF4p1Mn3zYSyYMtnnFLl
         VSaRsMUSm10hmxDzAWORVIGs4hM1YL31CLl+40K/oaW4rIhSkO1f6MSrp7SJ3C+DONxZ
         laNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981515; x=1747586315;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=idB3h6TInh5dcCfl77qbcomEzLHamQZPZbX4oavDnPabHxvX6snogkads03/mxTubN
         IQ5xv1Qrs1g1IIYizlXQR8d1eKpmVrPYpF8fFFglRgK91Eipi+6z/YVBd+B2LVHjFWnY
         5hbdqh0TGinN4z4Lfg3FEUEMIJ8dtHaPWq1Ssqfp17Bls/WCy/fxKgjMfJHd3RHHyzI3
         mph0ZSOcEp+pIQZDFxQXDZjhSxLlK5sA4xtcEj5GADwpwXBsa4hH7f3pAv2naJctDQXz
         uXJfOqMk9RTbu4IXUplJ99RcURTt36Sw6avls+rf78oa4ViB8vqxK2agkZfXPS2Snh7u
         wPoA==
X-Gm-Message-State: AOJu0Yz51iHQdQVOZC1zHwHfDxG8k176wt4NkgQFZ/TGwBIl1RGoCuGV
	Sjb3Aw43pvoopPa77bTGHepiqg89ngXk5wkaSgaZAy4nYbN5byCW4iquOg/3gVY=
X-Gm-Gg: ASbGnctbHZZrpPxOv9fTslFvAYsP/H3tMFPVEhmDzaj0We9snqW1qeGGgNdjaE91iC8
	JR2euV3gSQmVL+ujJRatnnYAkhpca/F9Qrv/MeOudelIOleMcVa2olZXB//hdVmfNqUY974GV94
	+24UmGsA2U3+d4N7dRXrvupO58dQ8DxUO917MIzVEsm+mUOlQLBvbY2vldkXD634cY0K0tj3tQT
	zbXs/TY5/Vmp+o15QY/RMowduhCyKiiWFFjE6MqvEiLXcvl0fUXdT9zojqSce5u3/w60fQWvifU
	heVypWVnP4Pr+8UcRHx2KdxoLcO6Rnb/jsumXprXL87iAVZJnw==
X-Google-Smtp-Source: AGHT+IENxnkeTCU2mQLGBVkl8Moj68KA+2IRRcGPD6paLo/iLVGUVJ6hgM0VpDWjUGKVZhQfNHz1FA==
X-Received: by 2002:a05:6a00:2789:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7423bc0d8dcmr14402736b3a.7.1746981515436;
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736d51sm4776797b3a.65.2025.05.11.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP SoC updates for v6.16
Date: Sun, 11 May 2025 09:38:34 -0700
Message-ID: <7ha57jrtkl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/soc-signed

for you to fetch changes up to 47fe74098f3dadba2f9cc1e507d813a4aa93f5f3:

  ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY (2025-05-08 06:15:09 -0700)

----------------------------------------------------------------
OMAP SoC updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable I2C devices of GTA04
      ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4

Parvathi Pudi (1):
      bus: ti-sysc: PRUSS OCP configuration

Sukrut Bellary (1):
      ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY

 arch/arm/configs/omap2plus_defconfig        |  8 ++++++++
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 arch/arm/mach-omap2/pmic-cpcap.c            |  6 +++++-
 drivers/bus/ti-sysc.c                       | 19 ++++++++++++++++++-
 6 files changed, 46 insertions(+), 4 deletions(-)

