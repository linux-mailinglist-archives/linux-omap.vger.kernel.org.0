Return-Path: <linux-omap+bounces-3024-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE770A04D6E
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 00:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A953A3AF9
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 23:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEA81E8837;
	Tue,  7 Jan 2025 23:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TB2oQAM+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFE21E5716
	for <linux-omap@vger.kernel.org>; Tue,  7 Jan 2025 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292257; cv=none; b=l+56xPmn8h14aHsbQ3p5jjdYHSgSckdwT8DwO/T8p8cWrW92OnvmE0S1mdaWJOd2W+paMOQHtGQQKNhSxXCmjAjyVT03WqtMxco29d7e5Kr+RL2Q2jseXTq9W5Ata1+CpbETiG2iFh8xJSiexlAI/cFAeM74O9mLDEqdD6GxKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292257; c=relaxed/simple;
	bh=XtvxspD2p1BDn3Hn4iJ/jDDqx3/ZuS/4tIxXuQUrgIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NopNRpEKqvwRH2L8At1DV/WgajBiwxgfny/g4Y2CnPpSjOot3D9QjW/2nZv/ip1dLHfIBCWt3CjO5AI93PZWkVWnP10TlAjjHqxub0JcMfgpNG9kxOKpuFufdxJm0SvEOgWDNwrwbgZDxC8gnhrI883JkUo8MHP1UjV5jdrsIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TB2oQAM+; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so459901a91.0
        for <linux-omap@vger.kernel.org>; Tue, 07 Jan 2025 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292254; x=1736897054; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=TB2oQAM+kpuqTbh+jnuQRig3OrXBBmvfTs6xhaj4YYriDI5+ggsEkP1lPRLQ/RaJQQ
         4XG7VAtD8aqPqkyBXgFz3nn0nTfYMYn5wN1bD8IUj6qPrX1mBEQrJKklFMDl8onPtRBz
         rR8QjsoA/tUFbEpCxMSMjfURV9AmCmRo7nn8rVWiNdDKzcK1gf475SRXA8U0NZPx88sS
         VTynhgYMa+7V+e1hZ2K22WJwcm1nLDq6neFg7WfR00sNEsZYTTDG9rijigyjj3phURo7
         0Vpn8akOYd6W78F3IkCsPFSD6+hJ/KGNQzj+84INLYp2YF+tleInMqxc9bc+eySp3WtG
         k+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292254; x=1736897054;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=X/6RAzd0EVUxRoxFRcGrbWCnxwyymppsUOvvQvcICaDmoyFM3TRWjj7D7q48LOq2p8
         Vj03nTESGQqdlUgxCXsYwE6j9jwxRx7eJouD2PYTITE3uTQ0Wae/yod06VthoMlx/HIT
         vThjFJTHV9R+uYbN9EiPjSg9PmC977KOpygfVk6m5gXI7JIzGuuMTauje8qwT25LPn3Q
         Mh7gctOYsC1MYZsxKL4NMMSHyFnsLx/F4zd004VHFgFschGGn+tZcV9M3T4WrjwumG/4
         JP9txzfF0JTvcMOM/LcJwxWcSSCsldidP/zK9cbMt+4Kt1aaGeop/tTlNiGGXuBOgd/N
         2z1g==
X-Gm-Message-State: AOJu0YydhYiNgdkje4xwe7fzymC0u0B0vsxJS150FGxhCNFU+TzwMakx
	U7kNlgZItLdndLaBAR8gPEB5iGnZG+7+Y6j3VV3xNbr1pJoqSWf2uXm57BuLghliMw629jD6m4F
	H
X-Gm-Gg: ASbGncttqHFcc/xb2PjX8vnNkpeJrR+AB5Dl0YWwN+8lEPuTNyBUWBAC2jdsAMYmBdw
	7uD1b54C6h8zsLaaT7xTGPQobkpy02tDalvy6sY3TwA5Y1s6pDhZfVyj73L3DEDnRMxA7OagC1q
	PEhV1zBt5yseL7lMm33VdbVBrtpk5y3rjt1D8O63DRkC8x1h6/mVPzSl6n72R54DRIaM6SF8jE8
	/3tLky2gbdBzFcPPaLp+5fgzvjqmn2u/RPbJMqwimPY9wPptrJapQs=
X-Google-Smtp-Source: AGHT+IFk3tx493nN+dN4Z7Nw7T6E/L7ddLbTtmpOE9XcEH2hMlTKjR1Fee5FPSBt78FPKRQiKwWsog==
X-Received: by 2002:a05:6a00:a81:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72d102a8059mr8370201b3a.0.1736292254620;
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81617csm33872826b3a.39.2025.01.07.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti/omap/dra7: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:24:13 -0800
Message-ID: <7hmsg2b42q.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/dt-signed

for you to fetch changes up to dd504db5cd4a4bb48e8b96159e23ece89bb54d90:

  ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties (2025-01-07 14:59:51 -0800)

----------------------------------------------------------------
ARM: dts: ti/omap/dra7: minor updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
      ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Judith Mendez (1):
      ARM: dts: ti: am437x-l4: remove autoidle for UART

Romain Naour (1):
      ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus

 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi   | 18 ++++++------------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi     |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 16 ++++++++++++++--
 3 files changed, 22 insertions(+), 14 deletions(-)

