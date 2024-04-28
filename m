Return-Path: <linux-omap+bounces-1300-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A47828B49DA
	for <lists+linux-omap@lfdr.de>; Sun, 28 Apr 2024 07:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD841C209C0
	for <lists+linux-omap@lfdr.de>; Sun, 28 Apr 2024 05:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038EE539A;
	Sun, 28 Apr 2024 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="SbBNKWID"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9301321D
	for <linux-omap@vger.kernel.org>; Sun, 28 Apr 2024 05:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714283261; cv=none; b=KtOw3RUxqfMGii42MD9LyvlSNhoX1Lr/elwXT8bPmyM5tMcLdW1qlelgT48zAt5CsBQo2U6DCBiFadR8QFhtoUmOyvML74rzCNGxa2ImugGEhfOSPo2XwussdQClKmh97Mg/S15LK4wxXFOlKsEVU/Mylfhi89XTn/i5oIqm2FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714283261; c=relaxed/simple;
	bh=9BqlwdBd+mwk4vWYBKbMPMvVOURywSUpi/q+Ly1EeUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jP8lNBI60ZKxgv57SBNu9XNiKR3iPDONfnrRanVK5dMgc0pLNn4/vRIvqOdNUF8ABc1pViwsik/0uE+5YfQOQ2edXxT86EFiRuACrIuZkx7iL6umJGJXAEQsW647QKjm43ySGqa3NxKs3AM//309Qde/fPi8Lh78bAvOMJwkZzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=SbBNKWID; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3F4E8604E8;
	Sun, 28 Apr 2024 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1714283253;
	bh=9BqlwdBd+mwk4vWYBKbMPMvVOURywSUpi/q+Ly1EeUc=;
	h=From:To:Cc:Subject:Date:From;
	b=SbBNKWIDY2UCMWo/+TKoffWmnweSPjgyR9d3PyU/iy1NuEJzK+silnbcweryBFnl/
	 6oXQaYmigvJ9Ul0W1xHjxPzgpJ+3dBvlbJcCGqU1Vz0q8/tsYmOsmBsIW3gineravF
	 /yHyjl7EuaU13Epy3XRlJonuIzMRImnX2HJEpdR5MR2EU4dE0Ilj4rQituWZeBXHCS
	 hGPzbgo21zxlvrftcwv0qdIkYQEmPXFUrNOxGR+xisHkY5fQCNJ4pmSDxPGqWYSSIh
	 IM7zGc5htUuAEwCe95q3hvuu/VI7H0FF+2BWUH76XiwoFe2xKTDiB2fiXD9lneMuhA
	 nXAdiICzeFyvw==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver changes for ti-sysc for v6.10
Date: Sun, 28 Apr 2024 08:47:11 +0300
Message-ID: <pull-1714283210-549557@atomide.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/drivers-ti-sysc-for-v6.10-signed

for you to fetch changes up to 4bcc2e91b9e77644ee04b290bfd2c1410d7c402e:

  bus: ti-sysc: Drop legacy idle quirk handling (2024-04-25 07:29:41 +0300)

----------------------------------------------------------------
Driver updates for ti-sysc

A change to update the handling of no-reset-on-init quirk to make it init
time only like it should be. And a change to add the missing copyrights.

Also a series of changes to simplify the driver by dropping the old unused
handling for interconnect targets tagged pm_runtime_irq_safe().

These are all non-urgent changes and can be queued whenever suitable.

----------------------------------------------------------------
Tony Lindgren (5):
      bus: ti-sysc: Move check for no-reset-on-init
      bus: ti-sysc: Add a description and copyrights
      bus: ti-sysc: Drop legacy quirk handling for uarts
      bus: ti-sysc: Drop legacy quirk handling for smartreflex
      bus: ti-sysc: Drop legacy idle quirk handling

 drivers/bus/ti-sysc.c                 | 165 +++++++---------------------------
 include/linux/platform_data/ti-sysc.h |   1 -
 2 files changed, 34 insertions(+), 132 deletions(-)

