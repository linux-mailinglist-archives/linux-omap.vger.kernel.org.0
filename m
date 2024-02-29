Return-Path: <linux-omap+bounces-763-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78286C33D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 09:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD691C211EC
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CF6482F4;
	Thu, 29 Feb 2024 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="je2ARkix"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDF46B9F
	for <linux-omap@vger.kernel.org>; Thu, 29 Feb 2024 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709194467; cv=none; b=KGkkyJFQ9p9rfyRzYgsSm/z+ILsZAF0WQ9atlLc/9xverPVarW6jnUf6cIGqTo5gswRVv/De4j8PZT58FiZ3xMsI0IrBbWXrQFCsY4S+151xnOiY8acf/mOIcP9mP9gOMTN5c3o/lwWHpqvg7qQFwuv5j6/cZBN3kjN48lx0I90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709194467; c=relaxed/simple;
	bh=ppvuhnrUpK5zFoCfAJnSwRpPqxTqpOnOlV+dZsZUDrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ML5ReN6c8J98OHVdsLwHOCh87fP4NB+fmJEQZGN8mZqa7YkWhkmBCFr02aA+4abGzado06UFotTpMWNWFpwdGT+sO/sZP6WrP5KQam0NJilBywsFKzskMDWgqyAHGhn+sOERaJgcx+b+mnkXUg0RsPAvO9KghUYTcFUy7NBXOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=je2ARkix; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C0BB0603C4;
	Thu, 29 Feb 2024 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194465;
	bh=ppvuhnrUpK5zFoCfAJnSwRpPqxTqpOnOlV+dZsZUDrg=;
	h=From:To:Cc:Subject:Date:From;
	b=je2ARkixgy1ROZW69C/RtHAHYzdMgMuxYlszEP1Xonu6oiaYiLmo/bwRa3fU5EpBH
	 8GcPR1CTaXqA2g+lTTHM/fVGzvym2fDb2I0c1wgZ/4mpZ/U0FljN1E1AQNSoLYP5N3
	 UWq1Bwdmjw2MlY0SMZRF1jUW1Y3J8e9ycLulg5nDM+bnpdFpOjuvFti/WcVL4Ze9O5
	 vkgOpjgcubpFSSXV3GYSiBXgDckWS9YaxESjnSb4yLzHSryqOtIoDQWFIYRVjDDldH
	 3CuaO4JlSufAkIBCdJxRd4kYp1GXIxD31oaJejYLsvEhTPTMcMteQiaTLSodjIUV7S
	 crzImmCh5i99g==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Kconfig change for omap1
Date: Thu, 29 Feb 2024 10:14:08 +0200
Message-ID: <pull-1709194435-723888@atomide.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/omap1-signed

for you to fetch changes up to bd69d2c7312a210129b3c840dd5a7c970a64e0c8:

  ARM: omap1: remove duplicated 'select ARCH_OMAP' (2024-02-28 09:27:20 +0200)

----------------------------------------------------------------
Kconfig change for omap1

Just one change to drop a duplicate select ARCH_OMAP.

----------------------------------------------------------------
Masahiro Yamada (1):
      ARM: omap1: remove duplicated 'select ARCH_OMAP'

 arch/arm/mach-omap1/Kconfig | 1 -
 1 file changed, 1 deletion(-)

