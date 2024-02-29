Return-Path: <linux-omap+bounces-765-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEAB86C344
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 09:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 945F128876D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 08:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FBC4CDE5;
	Thu, 29 Feb 2024 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="WbnD9vuw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60734481AC
	for <linux-omap@vger.kernel.org>; Thu, 29 Feb 2024 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709194535; cv=none; b=FKpYEKowrqgQq4D7G+igwGTj1Suazl91IxNwj/UIADCjuryq/9L/f0KMWcdeDeN4xdhQnvZE+wtZeiKV7rnD6kqJzs+/4i6MUWiwuMDsOmsyD9LJuqVP4UW1VpmJJFV8TC5pl1O9xdpNdpfA87nlOhF4fW9bQz5+h6BA3nKkZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709194535; c=relaxed/simple;
	bh=n4d+nnPAUyFRIJLb2MKkCdcLXzJ7KJKIQqoLf3sxOOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HQtdDsqF6EdRMao84gNG109YMSXyolxGj76lOryFMNLrT0pdBd0K3Uxt1nNNC0T1uRz+iLQamb6qgPVN+ySNWlKiUP6YV+t2J9/DvStttj4SVIBQD4f1AMb20wcwpCHy5Bs0+/omCKmlOjejCXITBrnr85bJwzw+Ngt822yBq5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=WbnD9vuw; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E127C603C4;
	Thu, 29 Feb 2024 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194533;
	bh=n4d+nnPAUyFRIJLb2MKkCdcLXzJ7KJKIQqoLf3sxOOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WbnD9vuwgspKzINXBRqsLhTT3RJLWMpgLMlalcpXXMfH1RzVYugh7s7YnyN1+43V3
	 /4aa2tBTopfDJU13BK9AePg6IbnpES9qioKT8oxvrNLVTxhSpOCYxd04M5nlvhJjes
	 JAW35huhM84N+2v5mL+sdsRweS9kOyiOHQ+sQnDWEynBkZqWpwQAchKtH195pE25Fa
	 IuPYmnNqgymw2cuJm6vPUF2GOIwHKlk1uTXUC8y2ZPtvfsYuv2tDgjCgM78hn+EBU2
	 KPUQlIRweDuXtOIahYUsaD+rHteZmt8P1b/REP1hDAwnzI8sfdSocDSRsYV5vl7nZb
	 80cicRL8TFsrQ==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Few more SoC changes for omaps
Date: Thu, 29 Feb 2024 10:15:19 +0200
Message-ID: <pull-1709194504-639032@atomide.com>
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

The following changes since commit c6e33edb02292059a06ce8fdc4249a5db86a6114:

  ARM: OMAP2+: fix kernel-doc warnings (2024-01-26 10:28:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/soc-part2-signed

for you to fetch changes up to 6521f6a195c70e16cab375ca1c4d23b6fd3d76b4:

  ARM: AM33xx: PRM: Implement REBOOT_COLD (2024-02-28 09:33:03 +0200)

----------------------------------------------------------------
Few more SoC changes for omaps

Two changes to implement REBOOT_COLD for am335x.

----------------------------------------------------------------
Alexander Sverdlin (2):
      ARM: AM33xx: PRM: Remove redundand defines
      ARM: AM33xx: PRM: Implement REBOOT_COLD

 arch/arm/mach-omap2/am33xx-restart.c   |  3 ++-
 arch/arm/mach-omap2/board-generic.c    |  6 ++++++
 arch/arm/mach-omap2/prm-regbits-33xx.h |  1 +
 arch/arm/mach-omap2/prm.h              |  1 +
 arch/arm/mach-omap2/prm33xx.c          | 22 ++++++++++++++--------
 arch/arm/mach-omap2/prm_common.c       |  6 ++++++
 6 files changed, 30 insertions(+), 9 deletions(-)

