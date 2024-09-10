Return-Path: <linux-omap+bounces-2162-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA773972A71
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 09:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4D31C24172
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A891417C9EB;
	Tue, 10 Sep 2024 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGenVeDF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397D17C7BD;
	Tue, 10 Sep 2024 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952687; cv=none; b=Bm6yJAH9Q+rAhep5JrK0fd4heckkrtctBPPT1a80xw6/FksLlP8pBztvadl62UHB8GyCK/jycOh3lJt42sxTLJJo+Xu+uXhhDqONMwqb/g4q4qOULSQmbTDOOj/Uu/qzHXjgwsGuBaDWWA+XpGOJiDGJ+eLQLUZDqhDwJfcTHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952687; c=relaxed/simple;
	bh=OnyMkOUZUp3mVLWHnjm3K66y8reg6sgBhI6dE1mMjYk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aeMYopslueJOyVOgEWG9KJsS5WHsehIfvP+Tpvt75kg5CC09BG83YTiNEd9VUg/34NJzpSgYuEb1R/2zNXMAXp34rubXf2DEmnnCsc4MrOkPfNHzkSJ6L8n4gBSPbNCQ1nXOosHz4ZOsPIEsRiX8vb0oGdj7YkFLt9KhrtsgU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGenVeDF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BE0C4CEC3;
	Tue, 10 Sep 2024 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725952686;
	bh=OnyMkOUZUp3mVLWHnjm3K66y8reg6sgBhI6dE1mMjYk=;
	h=From:Subject:Date:To:Cc:From;
	b=JGenVeDFkaAhwiBhE0wl3TChSfLAhJqBLTUSvjz35IZrYtVTkYoZKoqFDBjMbr3HL
	 EPv1gsURNVPR7cnsm1ydTcJnLovAqNI0CoWJftiEH69y6QqQDM7+OMw179jrQ+xESk
	 mjPxHhxeFiBMHDFEXoNwab1vuuPoOHsiuR6R/Xq3uUbr1sDnLi6Kf/NaYbFVUiGuJ9
	 RHGPiqyzd789VIslYGWeV67fnw6yht/HCoGVhWgFrxW2jHL95m4Pte6xpfqIw3JdJU
	 l7aI9/sWDWzvgIejwPNTPHRFEqZG5P3L4FFTkn8XzEyHMREAFMdETDg/x8BfPzJpCW
	 Gy9u1hJUN0FgA==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/3] net: ethernet: ti: Address some warnings
Date: Tue, 10 Sep 2024 08:17:55 +0100
Message-Id: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPy32YC/x3MQQqAIBBA0avErBtQKdCuEi3KxprNFColRHdPW
 j74/AcSRaYEQ/NApIsTH1Kh2wb8PstGyGs1GGU65bTCzHjPUXBd/OI6a03oDdT6jBS4/KcRhDI
 KlQzT+34RCdTcYwAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.14.0

Hi,

This patchset addresses some warnings flagged by Sparse, and clang-18 in
TI Ethernet drivers.

Although these changes do not alter the functionality of the code, by
addressing them real problems introduced in future which are flagged by
tooling will stand out more readily.

Compile tested only.

---
Simon Horman (3):
      net: ethernet: ti: am65-cpsw: Address __percpu Sparse warnings
      net: ethernet: ti: am65-cpsw: Use __be64 type for id_temp
      net: ethernet: ti: cpsw_ale: Remove unused accessor functions

 drivers/net/ethernet/ti/am65-cpsw-nuss.c |  8 +++-----
 drivers/net/ethernet/ti/cpsw_ale.c       | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 14 deletions(-)

base-commit: a9b1fab3b69f163bbe7a012d0c3f6b5204500c05


