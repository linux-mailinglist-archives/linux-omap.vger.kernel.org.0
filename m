Return-Path: <linux-omap+bounces-187-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CF81BBA0
	for <lists+linux-omap@lfdr.de>; Thu, 21 Dec 2023 17:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346F828DA9D
	for <lists+linux-omap@lfdr.de>; Thu, 21 Dec 2023 16:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA4158216;
	Thu, 21 Dec 2023 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/esCMHH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF858215
	for <linux-omap@vger.kernel.org>; Thu, 21 Dec 2023 16:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA70C433C7;
	Thu, 21 Dec 2023 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703175113;
	bh=Mqv/l5DIMYcxoDgr5BwzIoe7pvYZJ1a3hwU60g4U7Dk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P/esCMHH/vnuNjexaUeb4hUN5kb5V+3VKAWTXp1VZ5PtaXxVAa5NbwMv/DIxT9jB4
	 b6NWrgQi/f4FpbUQdDwvinMODLIHqnvLeXvmrwoxkW2F2c1VRYP46/OhbhOtzsgCFe
	 7K+jyIASyuKyh1fiClm+FU7eMNeMR4k0SC/KbVLcTWmgrgRtCYig/eZnG2/LCJ2Pw3
	 JrXqC7bLGO5L3z9WhAQx9wdIygYgBIm0R0HmDyw/o/PRy+joVyBxUBAnQhpbr+eJJ8
	 MjIDWFMa4l1LyDQUIguTQQBlCTdmyh9oeeyduYDL6KiK1VfWQhC2ZwBd8M69kLZkkQ
	 y6uK/1N6qnALw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20231220155643.445849-1-pbrobinson@gmail.com>
References: <20231220155643.445849-1-pbrobinson@gmail.com>
Subject: Re: (subset) [PATCH] mfd: ti_am335x_tscadc: Fix TI SoC
 dependencies
Message-Id: <170317511203.648767.11706110106024240818.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 16:11:52 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 20 Dec 2023 15:56:39 +0000, Peter Robinson wrote:
> The ti_am335x_tscadc is specific to some TI SoCs, update
> the dependencies for those SoCs and compile testing.
> 
> 

Applied, thanks!

[1/1] mfd: ti_am335x_tscadc: Fix TI SoC dependencies
      commit: 835e69774333833221aa1c3cbc621cec8cbc79fc

--
Lee Jones [李琼斯]


