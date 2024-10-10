Return-Path: <linux-omap+bounces-2376-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6E99845E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2AE1F254AD
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6B1C2335;
	Thu, 10 Oct 2024 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eg4e+wro"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3322E1BD50C;
	Thu, 10 Oct 2024 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558261; cv=none; b=XpE8vYoqB/r4WyIWZCmZDwkBkTFiTun6yH8vCoa1ePIxrm9EsJCljI+0n7sjmhtakl8Mzdo9cKRhejd2nDLEXnibv1GQLO3K0f4YZnhuxX5UkN1znQOGQyBvB6iBDjgttrmRIY56dvUvzHlXETp+yJdeA5dc76iiKtxqOpCB4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558261; c=relaxed/simple;
	bh=zf4nv8qFcn8j81wt7ScsTawq3mZ4ntDzcjIGAkTRTHA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pI2rhzciz3JNyJj/SMJIUyn4RMLT80RIb1LoiQe8LZHv3P1IJ80YNXdhT+tNrALf8fYEKDfL2b9Yn+yESOqqmahciPjlClFZ9wVCcY0aK5ibAnkVgodrfH/Ks7h+cJ9lRnN4Cvt8U5w/Brcono/uWCbx5CCveuUnMgVesRTrdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eg4e+wro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2DEC4CEC5;
	Thu, 10 Oct 2024 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558259;
	bh=zf4nv8qFcn8j81wt7ScsTawq3mZ4ntDzcjIGAkTRTHA=;
	h=From:Subject:Date:To:Cc:From;
	b=eg4e+wrorUQ0mot9ojJqURiCZlB2izm+fUL0Q1X5gKXMHMNCLFLUdyymqxlSPQXZb
	 zQXaKmY123IEVo+kso85uULT4KFP6vwt6m1vg+S1KkCCef5zOtUV/uB1lXPSaohMnS
	 hSQGhKEK0VxHWMCqwO1/XILHu+DuHq6Ns98cEzmufx326516O8hye3YYGTgv4iLfNL
	 oaHOF4hPQWUo9wxR1c883B23Vl0l17NrX8bnLQcHCe4b8JYsgYMLByYuO0EsDkTxpr
	 wg2OwFA9uITygJ0xhl9EdAqhBCAsndyi3w1vlAEyRHNfMh/D4+MSVOBRFuRnxWRQ/7
	 K6KV97PTAPdFA==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v2 0/3] net: ethernet: ti: Address some warnings
Date: Thu, 10 Oct 2024 12:04:09 +0100
Message-Id: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKm0B2cC/2WNQQqDMBBFryKz7pQkpKBd9R7FRaITHVpimQS1i
 HdvyLbLx/u8f0AiYUpwbw4QWjnxEguYSwPD7OJEyGNhMMpY1WmFmXFzEnH0g+9s25pwM1DWH6H
 Aey09IVLGSHuGvpiZU17kWy9WXf1fbdWo0IVRk1XWeU+PF0mk93WRCfrzPH+9OI43qQAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.14.0

Hi,

This patchset addresses some warnings flagged by Sparse, and clang-18 in
TI Ethernet drivers.

Although these changes do not alter the functionality of the code, by
addressing them real problems introduced in future which are flagged by
tooling will stand out more readily.

Compile tested only.

---
Changes in v2:
- Dropped patch to directly address __percpu Sparse warnings and, instead
- Add patch to use tstats
- Added tags
- Thanks to all for the review of v1
- Link to v1: https://lore.kernel.org/r/20240910-ti-warn-v1-0-afd1e404abbe@kernel.org

---
Simon Horman (3):
      net: ethernet: ti: am65-cpsw: Use __be64 type for id_temp
      net: ethernet: ti: am65-cpsw: Use tstats instead of open coded version
      net: ethernet: ti: cpsw_ale: Remove unused accessor functions

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 94 +++-----------------------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  9 ---
 drivers/net/ethernet/ti/cpsw_ale.c       | 30 +++++++---
 3 files changed, 30 insertions(+), 103 deletions(-)

base-commit: 09cf85ef183a5603db49d542264ddbece3258e55


