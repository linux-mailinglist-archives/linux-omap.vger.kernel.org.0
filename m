Return-Path: <linux-omap+bounces-1608-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA291A028
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2024 09:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A08285542
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2024 07:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDCC48CC7;
	Thu, 27 Jun 2024 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfQlUuQy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12547A76;
	Thu, 27 Jun 2024 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472469; cv=none; b=KkE3AYhtoLoQRbS5ioRwOv1M/NQiqqRBMB8DY2a2wFxr0ry42XCQ2RA5gAyrkTi2a/NfASxzQ9UAAHfymbYtyejAivvV2/UmUKWtKroJmbp1Trxpa5yvhhQp3NsfZSxJmvilB3QejlXAZM2ST3BLxmckiCrc6WHgzuvLfpKDiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472469; c=relaxed/simple;
	bh=Ukpmztnf7gHPfXlZ5ClJbEOf3EzmK3mshVOwXdnDOZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H+GakoZ9GFOL0205C3BnRcM96zR0Epto+pacu6fi+Iq+x3D8PFQkqOQ4C5Wk3ZeG3FxGDeOxSpkrmdSlIQeKS/HHP2V2sejrQtnDxE2gy80KoWAifrTCa96F6o4GR4jOQhivCrEX5QgyJrMODtTfJ8aKCr8JE/Cp7hsMc2cnx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfQlUuQy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7514C2BBFC;
	Thu, 27 Jun 2024 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719472469;
	bh=Ukpmztnf7gHPfXlZ5ClJbEOf3EzmK3mshVOwXdnDOZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gfQlUuQyk4lVo1c6OQ9NNpAs+LStz2XaPuk3gezHAC28yBPfzN8ngjjtgfkwmuFSJ
	 gpOAw/PdpV97gsoAtzcPpZvCZDoSyNvTf8n4bzq1HnnAJtLMwQlEoCkDmCCDcIDrOe
	 nAEUX1T9MkOgUx3K/Ul6xToHbPKakhkEEKNrLk0vD6+MLyBimy4D74n6WgElBvo01G
	 ZDMy73meflLYWP4ANXudkGAj5OgQl+t62Zlteow6CSBkXQ1I3yCFJJfP3gnI7CBCgh
	 8LeeIRn2MBCnkVw0awbK5PfR6UculhGZN/GWm/ClPtRhOjtCo6aC1C3/v6TA0eoZvu
	 Lw6w3AslrBGKA==
From: Lee Jones <lee@kernel.org>
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20240626-omap-usb-tll-counted_by-v2-1-4bedf20d1b51@gmail.com>
References: <20240626-omap-usb-tll-counted_by-v2-1-4bedf20d1b51@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: omap-usb-tll: use struct_size to
 allocate tll
Message-Id: <171947246746.2843649.11720740745426236243.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 08:14:27 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 26 Jun 2024 21:37:03 +0200, Javier Carrasco wrote:
> Commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
> changed the memory allocation of 'tll' to consolidate it into a single
> allocation, introducing an incorrect size calculation.
> 
> In particular, the allocation for the array of pointers was converted
> into a single-pointer allocation.
> 
> [...]

Applied, thanks!

[1/1] mfd: omap-usb-tll: use struct_size to allocate tll
      commit: 1938e6882b89d1d01926ed3e0bbdd8346263c317

--
Lee Jones [李琼斯]


