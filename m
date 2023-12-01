Return-Path: <linux-omap+bounces-86-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B48009F1
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 12:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 439DA1C209DA
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 11:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6638A21378;
	Fri,  1 Dec 2023 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lh3bIljP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA321367
	for <linux-omap@vger.kernel.org>; Fri,  1 Dec 2023 11:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5FCC433C7;
	Fri,  1 Dec 2023 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701430244;
	bh=R0BURlPt9pn7cRC1T122gXwCEky0SoXm6oQC0WCEAMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lh3bIljPxWvK4HWlXXuZhft4O1gsvmFCJas4m+URgesbPamef/9vB5SEeEo++OMBI
	 AR3ksc5WwZEfKEwUmtQ1HF8E+P95TJgsF1rj373Ybe2ho1tJxcM9r6hltLz8fZNo7q
	 QRVUZCr3+r/vjQYnpvwAOIlteyV4igT0SOgFvHom3zigqxb2IBJDMGv5Hch63U+Kfl
	 0FU5bdW0cnjoOGWu4H3BB1N1rHsg48xDL4xgodrCBN+StoxNr3d4+unTrJ2pLa6k3c
	 qoaeWonVTDmtsVL93XxwbtwgDyDu9d9x3iO4EA4PVKCBtu40L+MNxBd5kvWfwsPdFu
	 LipZ/RuhiVgaw==
From: Lee Jones <lee@kernel.org>
To: tony@atomide.com, lee@kernel.org, robh@kernel.org, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: wens@csie.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231029114843.15553-1-peter.ujfalusi@gmail.com>
References: <20231029114843.15553-1-peter.ujfalusi@gmail.com>
Subject: Re: (subset) [PATCH] mfd: twl6030-irq: Revert to use
 of_match_device()
Message-Id: <170143024270.3373744.599680244503281704.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 11:30:42 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sun, 29 Oct 2023 13:48:43 +0200, Peter Ujfalusi wrote:
> The core twl chip is probed via i2c and the dev->driver->of_match_table is
> NULL, causing the driver to fail to probe.
> 
> This partially reverts commit 1e0c866887f4.
> 
> 

Applied, thanks!

[1/1] mfd: twl6030-irq: Revert to use of_match_device()
      commit: 6caa120c47c6f8ccb94c4a1d47e44c17de04057a

--
Lee Jones [李琼斯]


