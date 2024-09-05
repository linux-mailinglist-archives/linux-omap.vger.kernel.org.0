Return-Path: <linux-omap+bounces-2112-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747E96CB90
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 02:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367222824F4
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 00:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D6D621;
	Thu,  5 Sep 2024 00:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v7+sQM/3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B423AD
	for <linux-omap@vger.kernel.org>; Thu,  5 Sep 2024 00:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725495043; cv=none; b=PznjObTjHIR9Ws/+1mYLr4C52Is1ifax93W0AnEgpdOVKCQPBByxBzNKWbY/XRZq4qvQ+SB8J4XPChXE7VESVwEyiZcKR4/PqOtOisFmZkWStYv4WoNFBgDY2uzg+6FqAA7/eYhmsyBR17eYEkAok7HCjlhvapJJ/bypdfxNbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725495043; c=relaxed/simple;
	bh=8Vmg9RN5VOBvnglKmUcfGhCZHlroD/vCNrAXbdg7Ebc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AMomCOucs79T9RbU6q8R/W4l4RIJ2HkRtyH4T/BCf8eaX2Zf93BvfG0qZuiJbdUSVctZO9AjnlWGmeJCq/Xw1k2sB8qjJHSWTt5nr6GwLRRLbZ8RiKuiuTL8v50WTsjhvmV5irIEATWag9fGdnA5hopl+B6q5yETAFFASR3jEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v7+sQM/3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-715cc93694fso177165b3a.2
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2024 17:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495039; x=1726099839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/J+m7xtAiLQbYPxO7KC9XqOGseWC15fR3u3v8pH/Qo=;
        b=v7+sQM/37WcmA6z2h5XNcRA4dAz9kesf1TSvynAue8wEbUNGLA1Y5COAxqaM+ujuZd
         g50TxaIpU6XN16Rj92TZcKI/Hs7rVZSjQxGs2HBi8UdoQqhYrQB9KCvZsa6rkuxZch9E
         +EzawykrFuShTBX5NNOkoPuPQjf4V5rxmf+VIAaaoKFVPsjJJblIoxfc8HUTtOWo2MvX
         vn96nwTMuJvYeXVorgk2k4QmgDGuA1U1/6sYCTPnasogziDfeEiWWPAOyaXp9IUKH2LG
         Ug1ud75rRIat0DuMp2j7sWFCZ/WyCtOjM3vFp+7GCxDw9KfHur88rOV+ZPVS6N2kQ0m5
         yGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495039; x=1726099839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/J+m7xtAiLQbYPxO7KC9XqOGseWC15fR3u3v8pH/Qo=;
        b=YKD6tC5muIOosLCs4bkvIxz+rWuhEN1x8BG5semN4GYeILUkXglXZMasZGs51CpiOv
         W88/FFm/dDVYcAwPIqgBKOztHRBDY8ui85viSExcp5YpncLCps9RhPNreqBGaUPwjImc
         hVJES39QdhUACRIU1Kcqn731zynLyWYkIZEzDKyoiL7zUADKwJn4j7qOxNKEP1Y5U+th
         PkLo84uS74by0O684pUbEDDep6oksIuqfip6ICkCuTRZeReffCwvE1mYkvFmTd3YGZxe
         IryIZNh61sGpWdV9HV/CHbSZaj+y5ZBt0G8L91f0ekTdpdi9nC973855DrgPVLF0U21T
         1lgg==
X-Gm-Message-State: AOJu0YxVKQN/iSkVwex8YQ9fmW3iGWgwqS1Iqf8mQouY5SjugWLLXuKh
	vRH3EvskcEoq6/BafSK/q9EHtP/BnS11uNMFS9LFACqL5mMSkdtbuHWLgl8I41dLCyXtt1CJMqb
	1
X-Google-Smtp-Source: AGHT+IFr8ZgCjKP12FAginmMBgyBrcf86BKu8ZxaYyiTyrv9SpdDyLEWBNbAAE5ds/o79vsyYkzA3g==
X-Received: by 2002:a05:6a00:cd6:b0:710:6f54:bcac with SMTP id d2e1a72fcca58-7173c1e0fa1mr15844982b3a.1.1725495038993;
        Wed, 04 Sep 2024 17:10:38 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d501dde269sm1170670a12.88.2024.09.04.17.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:10:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: dts: ti: mix am335x cleanups for v6.12
Date: Wed, 04 Sep 2024 17:10:38 -0700
Message-ID: <7hh6avark1.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags=
/omap-for-v6.12/dt-signed

for you to fetch changes up to 22644cc0443550258f8710bd1613d483f82e8196:

  ARM: dts: ti: omap: am335x-wega: Fix audio clock provider (2024-07-30 15:=
19:13 -0700)

----------------------------------------------------------------
ARM: dts: ti: mix am335x cleanups for v6.12

----------------------------------------------------------------
Colin Foster (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert time

Dominik Haller (1):
      ARM: dts: ti: omap: am335x-wega: Fix audio clock provider

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: omap: am335x-bone: convert NVMEM content to layout syntax

Steffen Hemer (1):
      ARM: dts: ti: omap: am335x-regor: Fix RS485 settings

 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 66 +++++++++++++++++++=
++++++++++++++++++++++++++---------------------
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts     | 12 ++++++++----
 arch/arm/boot/dts/ti/omap/am335x-regor.dtsi       | 10 +++++++++-
 arch/arm/boot/dts/ti/omap/am335x-wega.dtsi        |  7 +++----
 4 files changed, 65 insertions(+), 30 deletions(-)

